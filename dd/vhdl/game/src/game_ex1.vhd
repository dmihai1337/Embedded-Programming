library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gfx_cmd_pkg.all;
use work.math_pkg.all;
use work.dualshock_pkg.all;
use work.audio_ctrl_pkg.all;
use work.mem_pkg.all;
use work.gfx_init_pkg.all;
use work.game_util_pkg.all;

architecture ex1 of game is

	constant DISPLAY_WIDTH : integer := 320;
	constant DISPLAY_HEIGHT : integer := 240;
	
	constant PLAYER_WIDTH : integer := 13;
	constant PLAYER_SPEED : integer := 2;
	
	constant PLAYER_SHOT_SPEED : integer := 4;
	constant SPACE_INVADER_WIDTHS : integer_vector(0 to 3) := (
		12, 8, 12, 16
	);

	type fsm_state_t is (
		RESET, WAIT_INIT,
		DO_FRAME_SYNC, WAIT_FRAME_SYNC, SWTICH_FRAME_BUFFER,
		CLEAR_SCREEN,
		MOVE_PLAYER, PLAYER_WALL_COLLISION,
		MOVE_SPACE_INVADER,
		MOVE_PLAYER_SHOT,
		CHECK_SHOT_COLLISION_MOVE_GP, CHECK_SHOT_COLLISION_MOVE_GP_X, CHECK_SHOT_COLLISION_MOVE_GP_Y,
		CHECK_SHOT_COLLISION_MOVE_GET_PIXEL, CHECK_SHOT_COLLISION_WAIT_RESPONSE,
		DRAW_PLAYER_MOVE_GP, DRAW_PLAYER_MOVE_GP_X, DRAW_PLAYER_MOVE_GP_Y,
		DRAW_PLAYER_INC_GP, DRAW_PLAYER_BB_CHAR, DRAW_PLAYER_BB_CHAR_ARG,
		DRAW_PLAYER_SHOT_MOVE_GP, DRAW_PLAYER_SHOT_MOVE_GP_X, DRAW_PLAYER_SHOT_MOVE_GP_Y,
		DRAW_PLAYER_SHOT_SET_PIXEL,
		DRAW_SI_MOVE_GP, DRAW_SI_MOVE_GP_X, DRAW_SI_MOVE_GP_Y, DRAW_SI_SET_BB_EFFECT,
		DRAW_SI_BB_CHAR, DRAW_SI_BB_CHAR_ARG,
		DRAW_SI_RESET_BB_EFFECT
	);
	
	-- pseudo states
	constant DRAW_PLAYER : fsm_state_t := DRAW_PLAYER_MOVE_GP;
	constant DRAW_PLAYER_SHOT : fsm_state_t := DRAW_PLAYER_SHOT_MOVE_GP;
	constant DRAW_SPACE_INVADER : fsm_state_t := DRAW_SI_MOVE_GP;

	type state_t is record
		fsm_state : fsm_state_t;
		last_controller_state : dualshock_t;
		frame_buffer_selector : std_logic;
		player_x : std_logic_vector(log2c(DISPLAY_WIDTH)-1 downto 0); -- the center coordinate of the player
		player_y : std_logic_vector(log2c(DISPLAY_HEIGHT)-1 downto 0);
		player_shot : shot_t;
		space_invader_x : std_logic_vector(log2c(DISPLAY_WIDTH)-1 downto 0);
		space_invader_y : std_logic_vector(log2c(DISPLAY_HEIGHT)-1 downto 0);
		space_invader_type : std_logic_vector(1 downto 0);
		space_invader_dir : std_logic;
	end record;
	
	signal state, state_nxt : state_t;
	
	signal gfx_initializer_start, gfx_initializer_busy : std_logic;
	signal gfx_initializer_cmd : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
	signal gfx_initializer_cmd_wr : std_logic;
	
	signal prng_value : std_logic_vector(14 downto 0);
	
	impure function get_random_location return sifield_location_t is
		variable return_value : sifield_location_t := (others=>(others=>'0'));
	begin
		return_value.x := prng_value(prng_value'length-1 downto prng_value'length-4);
		for i in 0 to prng_value(prng_value'length-5 downto 0)'length/3-1 loop
			if ( unsigned(prng_value((i+1)*3-1 downto i*3)) < 5) then
				return_value.y := prng_value((i+1)*3-1 downto i*3);
				exit;
			end if;
		end loop;
		
		return return_value;
	end function;
begin

	rumble <= ctrl_data.ls_y when ctrl_data.r3 else x"00";

	sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= (
				fsm_state => RESET,
				last_controller_state => DUALSHOCK_RST,
				frame_buffer_selector => '0',
				player_shot => SHOT_RESET,
				space_invader_dir => '0',
				others => (others=>'0')
			);
		elsif (rising_edge(clk)) then
			state <= state_nxt;
		end if;
	end process;

	next_state_logic : process(all)
		procedure write_cmd(instr : std_logic_vector(gfx_cmd_WIDTH-1 downto 0); next_state : fsm_state_t) is
		begin
			if (gfx_cmd_full = '0') then
				gfx_cmd_wr <= '1';
				gfx_cmd <= instr;
				state_nxt.fsm_state <= next_state;
			end if;
		end procedure;
	
		function unsigned_operand(operand : std_logic_vector) return std_logic_vector is
			variable cmd : std_logic_vector(15 downto 0);
		begin
			cmd := (others=>'0');
			cmd(operand'range) := operand;
			return cmd;
		end function;
		
		function unsigned_operand(operand : natural) return std_logic_vector is
			variable cmd : std_logic_vector(15 downto 0);
		begin
			cmd := std_logic_vector(to_unsigned(operand, GFX_CMD_WIDTH));
			return cmd;
		end function;

		function signed_operand(operand : integer) return std_logic_vector is
			variable cmd : std_logic_vector(15 downto 0);
		begin
			cmd := std_logic_vector(to_signed(operand, GFX_CMD_WIDTH));
			return cmd;
		end function;
		
		variable player_shot_y : std_logic_vector(state.player_shot.y'range);
	begin
		state_nxt <= state;
		
		gfx_initializer_start <= '0';

		gfx_cmd_wr <= '0';
		gfx_cmd <= (others=>'0');

		player_shot_y := state.player_shot.y;

		case state.fsm_state is
			when RESET =>
				state_nxt.fsm_state <= WAIT_INIT;
				gfx_initializer_start <= '1';
				gfx_cmd <= gfx_initializer_cmd;
				gfx_cmd_wr <= gfx_initializer_cmd_wr;
				
				state_nxt.player_x <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/2,
							state.player_x'length));
				state_nxt.player_y <= std_logic_vector(to_unsigned(DISPLAY_HEIGHT-20,
							state.player_y'length));
				
				state_nxt.space_invader_x <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/3,
							state.space_invader_x'length));
				state_nxt.space_invader_y <= std_logic_vector(to_unsigned(20,
							state.space_invader_y'length));
				
				state_nxt.space_invader_type <= (others=>'1');
				
			when WAIT_INIT =>
				gfx_cmd <= gfx_initializer_cmd;
				gfx_cmd_wr <= gfx_initializer_cmd_wr;
				if (gfx_initializer_busy = '0') then
					state_nxt.fsm_state <= DO_FRAME_SYNC;
				end if;
			
			when DO_FRAME_SYNC =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_DISPLAY_BMP,
						fs => '1',
						bmpidx => (2 downto 1 => '0', 0=>state.frame_buffer_selector)
					), WAIT_FRAME_SYNC
				);
			
			when WAIT_FRAME_SYNC =>
				if (gfx_frame_sync = '1') then
					state_nxt.fsm_state <= SWTICH_FRAME_BUFFER;
					state_nxt.frame_buffer_selector <= not state.frame_buffer_selector;
				end if;
			
			when SWTICH_FRAME_BUFFER =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_ACTIVATE_BMP,
						bmpidx => (2 downto 1 => '0', 0=>state.frame_buffer_selector)
					), CLEAR_SCREEN
				);
			
			when CLEAR_SCREEN =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_CLEAR,
						cs => CS_SECONDARY
					), MOVE_PLAYER
				);

			when MOVE_PLAYER =>
				if (ctrl_data.left = '1') then
					state_nxt.player_x <= std_logic_vector(unsigned(state.player_x) -
								PLAYER_SPEED);
				elsif (ctrl_data.right = '1') then
					state_nxt.player_x <= std_logic_vector(unsigned(state.player_x) +
								PLAYER_SPEED);
				end if;
				
				state_nxt.fsm_state <= PLAYER_WALL_COLLISION;
			
			when PLAYER_WALL_COLLISION =>
				if (unsigned(state.player_x) < PLAYER_WIDTH/2+1) then
					state_nxt.player_x <= std_logic_vector(to_unsigned(PLAYER_WIDTH/2,
								state.player_x'length));
				end if;
				if (unsigned(state.player_x) > DISPLAY_WIDTH-PLAYER_WIDTH/2-1) then
					state_nxt.player_x <= std_logic_vector(to_unsigned(
						DISPLAY_WIDTH-PLAYER_WIDTH/2-1, state.player_x'length));
				end if;
				
				state_nxt.fsm_state <= MOVE_SPACE_INVADER;
			
			when MOVE_SPACE_INVADER =>
				if (state.space_invader_dir = '1') then
					if (unsigned(state.space_invader_x) = 0) then
						state_nxt.space_invader_dir <= '0';
					else
						state_nxt.space_invader_x <=
						std_logic_vector(unsigned(state.space_invader_x) - 1);
					end if;
				else
					if (unsigned(state.space_invader_x) >= 
					DISPLAY_WIDTH-SPACE_INVADER_WIDTHS(to_integer(
					unsigned(state.space_invader_type)))-1) then
						state_nxt.space_invader_dir <= '1';
					else
						state_nxt.space_invader_x <=
						std_logic_vector(unsigned(state.space_invader_x) + 1);
					end if;
				end if;
				state_nxt.fsm_state <= DRAW_PLAYER;
			
			when MOVE_PLAYER_SHOT =>
				state_nxt.last_controller_state <= ctrl_data;
				if (state.player_shot.active = '1') then
					state_nxt.fsm_state <= CHECK_SHOT_COLLISION_MOVE_GP;
					player_shot_y := 
						std_logic_vector(signed(state.player_shot.y) - PLAYER_SHOT_SPEED);
					state_nxt.player_shot.y <= player_shot_y;
					if (unsigned(player_shot_y) > DISPLAY_HEIGHT) then
						state_nxt.player_shot.active <= '0';
						state_nxt.fsm_state <= DRAW_PLAYER_SHOT;
					end if;
				else
					state_nxt.fsm_state <= DO_FRAME_SYNC;
					if (state.last_controller_state.cross = '0' and ctrl_data.cross = '1') then
						report "game: firing shot";
						state_nxt.player_shot.active <= '1';
						state_nxt.player_shot.x <= 
							std_logic_vector(resize(unsigned(state.player_x),
							state.player_shot.x'length));
						state_nxt.player_shot.y <=
							std_logic_vector(resize(unsigned(state.player_y), 
							state.player_shot.y'length));
						state_nxt.fsm_state <= DRAW_PLAYER_SHOT;
					end if;
				end if;
			
			when CHECK_SHOT_COLLISION_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), CHECK_SHOT_COLLISION_MOVE_GP_X
				);
			when CHECK_SHOT_COLLISION_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.player_shot.x), CHECK_SHOT_COLLISION_MOVE_GP_Y);
			when CHECK_SHOT_COLLISION_MOVE_GP_Y =>
				write_cmd(unsigned_operand(state.player_shot.y), CHECK_SHOT_COLLISION_MOVE_GET_PIXEL);
			when CHECK_SHOT_COLLISION_MOVE_GET_PIXEL =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_GET_PIXEL
					), CHECK_SHOT_COLLISION_WAIT_RESPONSE
				);
			when CHECK_SHOT_COLLISION_WAIT_RESPONSE =>
				if gfx_rd_valid = '1' then
					state_nxt.fsm_state <= DRAW_PLAYER_SHOT;
					if gfx_rd_data(7 downto 0) = x"0e" then
						report "game: collision detected ";
						state_nxt.player_shot.active <= '0';
						state_nxt.fsm_state <= DO_FRAME_SYNC;
						state_nxt.space_invader_type <= prng_value(1 downto 0);
					end if;
				end if;
			
			--███████╗██╗  ██╗ ██████╗ ████████╗
			--██╔════╝██║  ██║██╔═══██╗╚══██╔══╝
			--███████╗███████║██║   ██║   ██║   
			--╚════██║██╔══██║██║   ██║   ██║   
			--███████║██║  ██║╚██████╔╝   ██║   
			--╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
			when DRAW_PLAYER_SHOT_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_PLAYER_SHOT_MOVE_GP_X
				);
			when DRAW_PLAYER_SHOT_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.player_shot.x), DRAW_PLAYER_SHOT_MOVE_GP_Y);
			when DRAW_PLAYER_SHOT_MOVE_GP_Y =>
				write_cmd(unsigned_operand(state.player_shot.y), DRAW_PLAYER_SHOT_SET_PIXEL);
			when DRAW_PLAYER_SHOT_SET_PIXEL =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_SET_PIXEL
					), DO_FRAME_SYNC
				);
			
			--██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗ 
			--██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
			--██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝
			--██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗
			--██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║
			--╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
			when DRAW_PLAYER_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_PLAYER_MOVE_GP_X
				);
			when DRAW_PLAYER_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.player_x), DRAW_PLAYER_MOVE_GP_Y);
			when DRAW_PLAYER_MOVE_GP_Y =>
				write_cmd(unsigned_operand(state.player_y), DRAW_PLAYER_INC_GP);
			when DRAW_PLAYER_INC_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_INC_GP,
						dir => DIR_X,
						incvalue => std_logic_vector(to_signed(-PLAYER_WIDTH/2, 
								WIDTH_INCVALUE))
					), DRAW_PLAYER_BB_CHAR
				);
			when DRAW_PLAYER_BB_CHAR =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "011",
						am => '1'
					), DRAW_PLAYER_BB_CHAR_ARG
				);
			when DRAW_PLAYER_BB_CHAR_ARG =>
				write_cmd(
					std_logic_vector(to_unsigned(64, 10)) & 
					std_logic_vector(to_unsigned(PLAYER_WIDTH, 6)), DRAW_SPACE_INVADER
				);

			--██╗███╗   ██╗██╗   ██╗ █████╗ ██████╗ ███████╗██████╗ 
			--██║████╗  ██║██║   ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗
			--██║██╔██╗ ██║██║   ██║███████║██║  ██║█████╗  ██████╔╝
			--██║██║╚██╗██║╚██╗ ██╔╝██╔══██║██║  ██║██╔══╝  ██╔══██╗
			--██║██║ ╚████║ ╚████╔╝ ██║  ██║██████╔╝███████╗██║  ██║
			--╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
			when DRAW_SI_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_SI_MOVE_GP_X
				);
			when DRAW_SI_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.space_invader_x), DRAW_SI_MOVE_GP_Y);
			when DRAW_SI_MOVE_GP_Y =>
				write_cmd(unsigned_operand(state.space_invader_y), DRAW_SI_SET_BB_EFFECT);
			when DRAW_SI_SET_BB_EFFECT =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_SET_BB_EFFECT,
						maskop => MASKOP_XOR,
						mask => x"0e"
					), DRAW_SI_BB_CHAR
				);
			when DRAW_SI_BB_CHAR =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "011",
						am => '1'
					), DRAW_SI_BB_CHAR_ARG
				);
			when DRAW_SI_BB_CHAR_ARG =>
				write_cmd(
					"0000" & state.space_invader_type & "0000" & std_logic_vector(to_unsigned(16, 
					6)), DRAW_SI_RESET_BB_EFFECT
				);
			when DRAW_SI_RESET_BB_EFFECT =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_SET_BB_EFFECT,
						maskop => MASKOP_NOP
					), MOVE_PLAYER_SHOT
				);
		end case;
	end process;

	synth_ctrl(0).high_time <= x"30";
	synth_ctrl(0).low_time <= x"30"; 
	synth_ctrl(0).play <= ctrl_data.left;
	synth_ctrl(1).high_time <= x"22";
	synth_ctrl(1).low_time <= x"22"; 
	synth_ctrl(1).play <=  ctrl_data.right;

	prng : block
		signal lfsr : std_logic_vector(14 downto 0); --15 bit
	begin
		sync : process(clk, res_n)
		begin
			if (res_n = '0') then
				lfsr <= std_logic_vector(to_unsigned(1234,lfsr'length));
				prng_value <= (others=>'0');
			elsif (rising_edge(clk)) then
				lfsr(lfsr'length-1 downto 1) <= lfsr(lfsr'length-2 downto 0);
				lfsr(0) <= lfsr(14) xor lfsr(13);
				
				prng_value <= lfsr(prng_value'range);
			end if;
		end process;
	end block;

	gfx_initializer : block 
		signal instr_cnt : integer := 0;
		signal instr_cnt_nxt : integer := 0;
	
		signal gfx_initializer_cmd_nxt : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		signal instr_busy, instr_busy_nxt : std_logic;
		signal running, running_nxt : std_logic;
	begin
		gfx_initializer_busy <= running;
	
		sync : process(clk, res_n)
		begin
			if (res_n = '0') then
				instr_cnt <= 0;
				gfx_initializer_cmd <= (others=>'0');
				running <= '0';
			elsif (rising_edge(clk)) then
				gfx_initializer_cmd <= gfx_initializer_cmd_nxt;
				instr_cnt <= instr_cnt_nxt;
				running <= running_nxt;
			end if;
		end process;
		
		next_state : process(all)
		begin
			gfx_initializer_cmd_wr <= '0';
			
			instr_cnt_nxt <= instr_cnt;
			gfx_initializer_cmd_nxt <= gfx_initializer_cmd;
			running_nxt <= running;
			
			if (gfx_initializer_start = '1') then
				instr_cnt_nxt <= 1;
				running_nxt <= '1';
				gfx_initializer_cmd_nxt <= GFX_INIT_CMDS(0);
			end if;
	
			if (running = '1') then
				if (gfx_cmd_full = '0') then
					gfx_initializer_cmd_wr <= '1';
					
					if (instr_cnt = 0) then
						running_nxt <= '0';
					elsif (instr_cnt = GFX_INIT_CMDS'length-1) then
						instr_cnt_nxt <= 0;
						gfx_initializer_cmd_nxt <= GFX_INIT_CMDS(instr_cnt);
					else
						gfx_initializer_cmd_nxt <= GFX_INIT_CMDS(instr_cnt);
						instr_cnt_nxt <= instr_cnt + 1;
					end if;
				end if;
			end if;
		end process;
	end block;

end architecture;
