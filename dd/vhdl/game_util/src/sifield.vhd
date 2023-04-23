library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gfx_cmd_pkg.all;
use work.math_pkg.all;
use work.mem_pkg.all;
use work.game_util_pkg.all;

entity sifield is
	port (
		clk : std_logic;
		res_n : std_logic;
		
		gfx_cmd        : out std_logic_vector(15 downto 0);
		gfx_cmd_wr     : out std_logic;
		gfx_cmd_full   : in std_logic;
		
		init : in std_logic;
		draw : in std_logic;
		check : in std_logic;
		busy : out std_logic;

		check_result : out sifield_info_t;

		draw_offset_x : in std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		draw_offset_y : in std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		draw_bmpidx : in std_logic_vector(WIDTH_BMPIDX-1 downto 0);

		rd : in std_logic;
		rd_location : in sifield_location_t;
		rd_data : out std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0);

		wr : in std_logic;
		wr_location : in sifield_location_t;
		wr_data : in std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0)
	);
end entity;

architecture arch of sifield is
	constant SIFIELD_ADDR_WIDTH : integer := log2c(SIFIELD_WIDTH)+log2c(SIFIELD_HEIGHT);
	
	type fsm_state_t is (
		IDLE,
		CHECK_DATA, CHECK_READ,
		INIT_LINE_0, INIT_LINE_12, INIT_LINE_34, INIT_REMAINING_LINES,
		DRAW_INC_GP_RESET_X, DRAW_INC_GP_NEXT_LINE,
		DRAW_CHECK_POSITION,
		DRAW_MOVE_GP, DRAW_MOVE_GP_X, DRAW_MOVE_GP_Y, DRAW_READ_MEMORY, DRAW_CHECK_DATA, DRAW_BB_CHAR, DRAW_BB_CHAR_ARG
	);
	
	type state_t is record
		fsm_state : fsm_state_t;
		location : sifield_location_t;
		info : sifield_info_t;
	end record;
	
	signal state, state_nxt : state_t;
	signal rd_addr, wr_addr : std_logic_vector(SIFIELD_ADDR_WIDTH-1 downto 0);
	
	signal wr_int, rd_int : std_logic;
	signal wr_data_ram : std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0);
	signal wr_data_int, rd_data_int : std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0);
	
	type color_vector_t is array(natural range<>) of std_logic_vector(7 downto 0);
	constant SI_COLORS : color_vector_t(0 to 3) := (COLOR_RED, COLOR_BLUE, COLOR_YELLOW, COLOR_MAGENTA);
begin
	rd_data_int <= rd_data;
	check_result <= state.info;
	
	dp_ram_1c1r1w_inst : dp_ram_1c1r1w
	generic map (
		ADDR_WIDTH => SIFIELD_ADDR_WIDTH,
		DATA_WIDTH => SIFIELD_DATA_WIDTH
	)
	port map (
		clk      => clk,
		rd1_addr => rd_addr,
		rd1_data => rd_data,
		rd1      => rd_int or rd,
		wr2_addr => wr_addr,
		wr2_data => wr_data_ram,
		wr2      => wr_int or wr
	);
	
	access_mux : process(all)
	begin
		rd_addr <= state.location.x & state.location.y;
		wr_addr <= state.location.x & state.location.y;
		wr_data_ram <= wr_data_int;
		
		if (wr = '1') then
			wr_addr <= wr_location.x & wr_location.y;
			wr_data_ram <= wr_data;
		end if;
		
		if (rd = '1') then
			rd_addr <= rd_location.x & rd_location.y;
		end if;
	end process;
	
	state_register : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= (
				fsm_state=>IDLE,
				location=>(others=>(others=>'0')),
				info=>(others=>(others=>'0'))
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
		rd_int <= '0';
		
		wr_int <= '0';
		wr_data_int <= (others=>'0');
		busy <= '1';
		
		gfx_cmd <= (others=>'0');
		gfx_cmd_wr <= '0';
		
		case state.fsm_state is
			when IDLE =>
				busy <= '0';
				state_nxt.location <= (others=>(others=>'0'));
				if (init = '1') then
					state_nxt.fsm_state <= INIT_LINE_0;
				end if;
				if (draw = '1') then
					state_nxt.fsm_state <= DRAW_MOVE_GP;
				end if;
				if (check = '1') then
					state_nxt.fsm_state <= CHECK_READ;
					state_nxt.info <= (
						count => (others=>'0'),
						l =>  std_logic_vector(to_unsigned(SIFIELD_WIDTH-1, log2c(SIFIELD_WIDTH))),
						r => (others=>'0'),
						b => (others=>'0')
					);
				end if;
			
			when CHECK_DATA =>
				state_nxt.fsm_state <= CHECK_READ;
				if (rd_data /= "11") then
					if (state.location.x < state.info.l) then
						state_nxt.info.l <= state.location.x;
					end if;
					if (state.location.x > state.info.r) then
						state_nxt.info.r <= state.location.x;
					end if;
					if (state.location.y > state.info.b) then
						state_nxt.info.b <= state.location.y;
					end if;
					state_nxt.info.count <= std_logic_vector(unsigned(state.info.count) + 1);
				end if;
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.x <= (others=>'0');
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					if (unsigned(state.location.y) = SIFIELD_HEIGHT-1) then
						state_nxt.fsm_state <= IDLE;
					end if;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
				end if;
			
			when CHECK_READ =>
				rd_int <= '1';
				state_nxt.fsm_state <= CHECK_DATA;
			
			when INIT_LINE_0 =>
				wr_data_int <= "01";
				wr_int <= '1';
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.x <= (others=>'0');
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					state_nxt.fsm_state <= INIT_LINE_12;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
				end if;
			
			when INIT_LINE_12 =>
				wr_data_int <= "10";
				wr_int <= '1';
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.x <= (others=>'0');
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					if (unsigned(state.location.y) = 2) then
						state_nxt.fsm_state <= INIT_LINE_34;
					end if;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
				end if;
			
			when INIT_LINE_34 =>
				wr_data_int <= "00";
				wr_int <= '1';
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.x <= (others=>'0');
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					if (unsigned(state.location.y) = 4) then
						state_nxt.fsm_state <= INIT_REMAINING_LINES;
					end if;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
				end if;
			
			when INIT_REMAINING_LINES =>
				wr_data_int <= "11";
				wr_int <= '1';
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.x <= (others=>'0');
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					if (unsigned(state.location.y) = 2**log2c(SIFIELD_HEIGHT)-1) then
						state_nxt.fsm_state <= IDLE;
					end if;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
				end if;
			
			when DRAW_MOVE_GP =>
				write_cmd(create_gfx_instr(opcode=>OPCODE_MOVE_GP), DRAW_MOVE_GP_X);
			
			when DRAW_MOVE_GP_X =>
				write_cmd(draw_offset_x, DRAW_MOVE_GP_Y);
				
			when DRAW_MOVE_GP_Y =>
				write_cmd(draw_offset_y, DRAW_READ_MEMORY);
			
			when DRAW_READ_MEMORY =>
				rd_int <= '1';
				state_nxt.fsm_state <= DRAW_CHECK_DATA;
			
			when DRAW_INC_GP_RESET_X => 
				write_cmd(create_gfx_instr(
					opcode => OPCODE_INC_GP,
					dir => DIR_X,
					incvalue => std_logic_vector(to_signed(-16*SIFIELD_WIDTH, WIDTH_INCVALUE))
				), DRAW_INC_GP_NEXT_LINE);
			
			when DRAW_INC_GP_NEXT_LINE =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_INC_GP,
					dir => DIR_Y,
					incvalue => std_logic_vector(to_unsigned(16, WIDTH_INCVALUE))
				), DRAW_CHECK_DATA);
				rd_int <= '1';
			
			when DRAW_CHECK_DATA =>
				if (rd_data = "11") then
					write_cmd(create_gfx_instr(
						opcode => OPCODE_INC_GP,
						dir => DIR_X,
						incvalue => std_logic_vector(to_unsigned(16, WIDTH_INCVALUE))
					), DRAW_CHECK_POSITION);
				else
					write_cmd(create_gfx_instr(
						opcode => OPCODE_SET_BB_EFFECT,
						maskop => MASKOP_XOR,
						mask => SI_COLORS(to_integer(unsigned(rd_data_int)))
					), DRAW_BB_CHAR);
				end if;
			
			when DRAW_BB_CHAR =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_BB_CHAR,
					bmpidx => draw_bmpidx,
					am => '1',
					mx => '1'
				), DRAW_BB_CHAR_ARG);
			
			when DRAW_BB_CHAR_ARG =>
				write_cmd(
					"0000" & rd_data & "0000" & std_logic_vector(to_unsigned(16, 6)), DRAW_CHECK_POSITION
				);
			
			when DRAW_CHECK_POSITION =>
				if (unsigned(state.location.x) = SIFIELD_WIDTH-1) then
					state_nxt.location.y <= std_logic_vector(unsigned(state.location.y) + 1);
					state_nxt.location.x <= (others=>'0');
					if (unsigned(state_nxt.location.y) = 5) then
						state_nxt.fsm_state <= IDLE;
					else
						state_nxt.fsm_state <= DRAW_INC_GP_RESET_X;
					end if;
				else
					state_nxt.location.x <= std_logic_vector(unsigned(state.location.x) + 1);
					state_nxt.fsm_state <= DRAW_READ_MEMORY;
				end if;
		end case;
	end process;
end architecture;
