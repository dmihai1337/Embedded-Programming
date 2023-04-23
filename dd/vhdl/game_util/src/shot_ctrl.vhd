library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gfx_cmd_pkg.all;
use work.math_pkg.all;
use work.game_util_pkg.all;

entity shot_ctrl is
	port (
		clk : std_logic;
		res_n : std_logic;
		
		gfx_cmd        : out std_logic_vector(15 downto 0);
		gfx_cmd_wr     : out std_logic;
		gfx_cmd_full   : in std_logic;
		gfx_rd_data    : in std_logic_vector(15 downto 0);
		gfx_rd_valid   : in std_logic;
		
		shot : in shot_t;
		
		draw  : in std_logic;
		check : in std_logic;
		busy : out std_logic;

		check_result : out collision_info_t
	);
end entity;

architecture arch of shot_ctrl is 
	type fsm_state_t is (
		IDLE,
		DRAW_CHECK_ACTIVE,
		DRAW_MOVE_GP, DRAW_MOVE_GP_X, DRAW_MOVE_GP_Y,
		DRAW_VLINE, DRAW_VLINE_DY,
		CHECK_SHOT_COLLISION_CHECK_ACTIVE,
		CHECK_SHOT_COLLISION_MOVE_GP, CHECK_SHOT_COLLISION_MOVE_GP_X, CHECK_SHOT_COLLISION_MOVE_GP_Y,
		CHECK_SHOT_COLLISION_GET_PIXEL, CHECK_SHOT_COLLISION_WAIT_RESPONSE,
		CHECK_SHOT_COLLISION_LOOP_CHECK,
		MOVE_BACK_TO_LAST_COLLISION_PIXEL_1,
		MOVE_BACK_TO_LAST_COLLISION_PIXEL_2
	);
	
	type state_t is record
		fsm_state : fsm_state_t;
		ci : collision_info_t;
		collision_detected : std_logic;
		pixel_cnt : integer range 0 to SHOT_LENGTH;
	end record;
	
	signal state, state_nxt : state_t;
begin
	check_result <= state.ci;

	state_register : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= (
				fsm_state=>IDLE,
				ci=>COLLISION_INFO_RESET,
				collision_detected=>'0',
				pixel_cnt=>0
			);
		elsif (rising_edge(clk)) then
			state <= state_nxt;
		end if;
	end process;

	next_state_logic : process(all)
		procedure write_cmd(instr : std_logic_vector(GFX_CMD_WIDTH-1 downto 0); next_state : fsm_state_t) is
		begin
			if (gfx_cmd_full = '0') then
				gfx_cmd_wr <= '1';
				gfx_cmd <= instr;
				state_nxt.fsm_state <= next_state;
			end if;
		end procedure;
	begin
		state_nxt <= state;
		
		busy <= '1';
		gfx_cmd <= (others=>'0');
		gfx_cmd_wr <= '0';
		
		case state.fsm_state is
			when IDLE =>
				busy <= '0';
				if (draw = '1') then
					state_nxt.fsm_state <= DRAW_CHECK_ACTIVE;
				end if;
				if (check = '1') then
					state_nxt.pixel_cnt <= SHOT_LENGTH;
					state_nxt.ci.oob <= '0';
					state_nxt.ci.color <= (others=>'0');
					state_nxt.fsm_state <= CHECK_SHOT_COLLISION_CHECK_ACTIVE;
					state_nxt.collision_detected <= '0';
				end if;
			
			--██████╗ ██████╗  █████╗ ██╗    ██╗
			--██╔══██╗██╔══██╗██╔══██╗██║    ██║
			--██║  ██║██████╔╝███████║██║ █╗ ██║
			--██║  ██║██╔══██╗██╔══██║██║███╗██║
			--██████╔╝██║  ██║██║  ██║╚███╔███╔╝
			--╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ 
			when DRAW_CHECK_ACTIVE =>
				if (shot.active = '0') then
					report "shot not active";
					state_nxt.fsm_state <= IDLE;
				else
					state_nxt.fsm_state <= DRAW_MOVE_GP;
				end if;
				
			when DRAW_MOVE_GP =>
				write_cmd(create_gfx_instr(opcode=>OPCODE_MOVE_GP), DRAW_MOVE_GP_X);
			
			when DRAW_MOVE_GP_X =>
				write_cmd(std_logic_vector(resize(signed(shot.x), 16)), DRAW_MOVE_GP_Y);
			
			when DRAW_MOVE_GP_Y =>
				write_cmd(std_logic_vector(resize(signed(shot.y), 16)), DRAW_VLINE);
			
			when DRAW_VLINE =>
				write_cmd(create_gfx_instr(opcode=>OPCODE_DRAW_VLINE, cs=>CS_SECONDARY), DRAW_VLINE_DY);
			
			when DRAW_VLINE_DY =>
				write_cmd(std_logic_vector(to_unsigned(4, 16)), IDLE);
			
			-- ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗
			--██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝
			--██║     ███████║█████╗  ██║     █████╔╝ 
			--██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ 
			--╚██████╗██║  ██║███████╗╚██████╗██║  ██╗
			-- ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝
			when CHECK_SHOT_COLLISION_CHECK_ACTIVE =>
				if (shot.active = '0') then
					-- shot not active --> return to IDLE immediately
					state_nxt.fsm_state <= IDLE;
				else
					state_nxt.fsm_state <= CHECK_SHOT_COLLISION_MOVE_GP;
				end if;
			
			when CHECK_SHOT_COLLISION_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), CHECK_SHOT_COLLISION_MOVE_GP_X
				);
			
			when CHECK_SHOT_COLLISION_MOVE_GP_X =>
				write_cmd(std_logic_vector(resize(signed(shot.x), 16)), CHECK_SHOT_COLLISION_MOVE_GP_Y);
			
			when CHECK_SHOT_COLLISION_MOVE_GP_Y =>
				write_cmd(std_logic_vector(resize(signed(shot.y), 16)), CHECK_SHOT_COLLISION_GET_PIXEL);
			
			when CHECK_SHOT_COLLISION_GET_PIXEL =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_GET_PIXEL,
						my=>'1'
					), CHECK_SHOT_COLLISION_WAIT_RESPONSE
				);
			
			when CHECK_SHOT_COLLISION_WAIT_RESPONSE =>
				if gfx_rd_valid = '1' then
					state_nxt.fsm_state <= CHECK_SHOT_COLLISION_LOOP_CHECK;
					if gfx_rd_data(15 downto 0) = x"ffff" then
						state_nxt.ci.oob <= '1';
						state_nxt.fsm_state <= IDLE;
					elsif gfx_rd_data(7 downto 0) /= x"00" then
						-- collision detected
						state_nxt.ci.color <= gfx_rd_data(7 downto 0);
						state_nxt.collision_detected <= '1';
						if(shot.movement_direction = DOWNWARDS) then
							state_nxt.fsm_state <= MOVE_BACK_TO_LAST_COLLISION_PIXEL_1;
						end if;
					end if;
					
					if (state.collision_detected = '1' and gfx_rd_data(15 downto 0) = x"0000") then
						state_nxt.fsm_state <= MOVE_BACK_TO_LAST_COLLISION_PIXEL_2;
					end if;
				end if;
			
			when CHECK_SHOT_COLLISION_LOOP_CHECK =>
				if (state.pixel_cnt = 0) then
					state_nxt.fsm_state <= MOVE_BACK_TO_LAST_COLLISION_PIXEL_1;
				else
					state_nxt.pixel_cnt <= state.pixel_cnt - 1;
					state_nxt.fsm_state <= CHECK_SHOT_COLLISION_GET_PIXEL;
				end if;
			
			when MOVE_BACK_TO_LAST_COLLISION_PIXEL_1 =>
				write_cmd(
					create_gfx_instr(
						opcode=>OPCODE_INC_GP,
						dir=>DIR_Y,
						incvalue=>std_logic_vector(to_signed(-1, WIDTH_INCVALUE))
					), IDLE
				);
			
			when MOVE_BACK_TO_LAST_COLLISION_PIXEL_2 =>
				write_cmd(
					create_gfx_instr(
						opcode=>OPCODE_INC_GP,
						dir=>DIR_Y,
						incvalue=>std_logic_vector(to_signed(-2, WIDTH_INCVALUE))
					), IDLE
				);
		end case;
	end process;
end architecture;

