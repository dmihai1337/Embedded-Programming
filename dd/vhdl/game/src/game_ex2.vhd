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
use work.decimal_printer_pkg.all;

architecture ex2 of game is

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
		MOVE_SPACE_INVADERS,
		MOVE_PLAYER_SHOT,
		CHECK_SHOT_WAIT,
		DRAW_PLAYER_MOVE_GP, DRAW_PLAYER_MOVE_GP_X, DRAW_PLAYER_MOVE_GP_Y,
		DRAW_PLAYER_INC_GP, DRAW_PLAYER_SET_COLOR, DRAW_PLAYER_BB_CHAR, DRAW_PLAYER_BB_CHAR_ARG,
		DRAW_PLAYER_SHOT, DRAW_PLAYER_SHOT_WAIT, CHECK_SI_FIELD, WAIT_SI_CHECK, UPDATE_SI_FIELD,
		DRAW_SIS_MOVE_GP, DRAW_SIS_MOVE_GP_X, DRAW_SIS_MOVE_GP_Y, DRAW_SIS_WAIT_INIT, DRAW_SIS_FIELD,
		DELETE_SPACE_INVADER, CHECK_COLLISION_TYPE, GET_DEAD_INVADER_X, GET_DEAD_INVADER_Y,
		DRAW_LINE_MOVE_GP, DRAW_LINE_MOVE_GP_X, DRAW_LINE_MOVE_GP_Y, DRAW_LINE, DRAW_HLINE_DX,
		DRAW_SCORE_DIGITS, DRAW_SCORE_WAIT, DRAW_TEXT_MOVE_GP, DRAW_TEXT_MOVE_GP_X, DRAW_TEXT_MOVE_GP_Y, 
		INIT_TEXT, DRAW_TEXT, DRAW_TEXT_BB_EFFECT,
		DRAW_SPECIAL_MOVE_GP, DRAW_SPECIAL_MOVE_GP_X, DRAW_SPECIAL_MOVE_GP_Y, DRAW_SPECIAL_SET_BB_EFFECT,
		DRAW_SPECIAL_BB_CHAR, DRAW_SPECIAL_BB_CHAR_ARG,
		DRAW_SPECIAL_RESET_BB_EFFECT, MOVE_SPECIAL_INVADER, INIT_PAUSE, PAUSED, INIT_GAME_OVER, GAME_OVER,
		DRAW_SCORE_GAME_OVER_WAIT, DRAW_SCORE_GAME_OVER
	);
	
	-- pseudo states
	constant DRAW_PLAYER : fsm_state_t := DRAW_PLAYER_MOVE_GP;
	constant DRAW_SPACE_INVADERS : fsm_state_t := DRAW_SIS_MOVE_GP;

	type state_t is record
		fsm_state : fsm_state_t;
		last_controller_state : dualshock_t;
		frame_buffer_selector : std_logic;
		player_x : std_logic_vector(log2c(DISPLAY_WIDTH)-1 downto 0); -- the center coordinate of the player
		player_y : std_logic_vector(log2c(DISPLAY_HEIGHT)-1 downto 0);
		player_shot : shot_t;
		si_dir : std_logic;
		si_xoff : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		si_yoff : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		special_invader_offset : std_logic_vector(log2c(DISPLAY_WIDTH)-1 downto 0);
		special_invader_active : std_logic;
		si_bmpidx : std_logic_vector(WIDTH_BMPIDX-1 downto 0);
		si_mvmt : std_logic_vector(15 downto 0);
		frames_count : std_logic_vector(15 downto 0);
		score : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
		lives : std_logic_vector(2 downto 0);
		txt_cmd_idx : integer;
		txt_cmds : std_logic_vector(545 downto 0);
		count_dead_invader : integer;
		paused : std_logic;
		game_over : std_logic;
		dead_invader_loc : sifield_location_t;
		y_reached : std_logic;
		no_invaders : std_logic;
	end record;
	
	signal state, state_nxt : state_t;
	
	signal gfx_initializer_start, gfx_initializer_busy : std_logic;
	signal gfx_initializer_cmd : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
	signal gfx_initializer_cmd_wr : std_logic;
	
	signal prng_value : std_logic_vector(14 downto 0);

	signal si_info : sifield_info_t;
	signal si_busy : std_logic;
	signal si_init, si_draw, si_check : std_logic := '0';
	signal si_rd, si_wr : std_logic := '0';
	signal si_rd_loc : sifield_location_t;
	signal si_wr_loc : sifield_location_t := (others=>(others=>'0'));
	signal si_rd_data, si_wr_data : std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0);
	signal si_gfx_cmd : std_logic_vector(15 downto 0);
	signal si_gfx_cmd_wr : std_logic;

	signal sc_gfx_cmd : std_logic_vector(15 downto 0);
	signal sc_gfx_cmd_wr : std_logic;
	signal sc_busy : std_logic;
	signal sc_draw, sc_check : std_logic := '0';
	signal sc_info : collision_info_t;

	signal dp_gfx_cmd : std_logic_vector(15 downto 0);
	signal dp_gfx_cmd_wr : std_logic;
	signal dp_busy : std_logic;
	signal dp_start: std_logic := '0';
	signal dp_number : std_logic_vector(15 downto 0);
	
	impure function get_random_location return sifield_location_t is
		variable return_value : sifield_location_t := (others=>(others=>'0'));
	begin
		return_value.x := prng_value(prng_value'length-1 downto prng_value'length-4);
		for i in 0 to prng_value(prng_value'length-5 downto 0)'length/3-1 loop
			if (unsigned(prng_value((i+1)*3-1 downto i*3)) < 5) then
				return_value.y := prng_value((i+1)*3-1 downto i*3);
				exit;
			end if;
		end loop;
		
		return return_value;
	end function;

begin

	rumble <= ctrl_data.ls_y when ctrl_data.r3 else x"00";

	shot_ctrl : entity work.shot_ctrl(arch)
	port map (
		clk => clk,
		res_n => res_n,

		gfx_cmd => sc_gfx_cmd,
		gfx_cmd_wr => sc_gfx_cmd_wr,
		gfx_cmd_full => gfx_cmd_full,
		gfx_rd_data => gfx_rd_data,
		gfx_rd_valid => gfx_rd_valid,

		shot => state.player_shot,
		draw => sc_draw,
		check => sc_check,
		busy => sc_busy,

		check_result => sc_info
	);

	sifield : entity work.sifield(arch)
	port map (
		clk => clk,
		res_n => res_n,

		gfx_cmd => si_gfx_cmd,
		gfx_cmd_wr => si_gfx_cmd_wr,
		gfx_cmd_full => gfx_cmd_full,

		init => si_init,
		draw => si_draw,
		check => si_check,
		busy => si_busy,

		check_result => si_info,

		draw_offset_x => state.si_xoff,
		draw_offset_y => state.si_yoff,
		draw_bmpidx => state.si_bmpidx,

		rd => si_rd,
		rd_location => si_rd_loc,
		rd_data => si_rd_data,

		wr => si_wr,
		wr_location => si_wr_loc,
		wr_data => si_wr_data
	);

	decimal_printer_inst : decimal_printer
	port map (
		clk => clk,
		res_n => res_n,

		gfx_cmd => dp_gfx_cmd,
		gfx_cmd_wr => dp_gfx_cmd_wr,
		gfx_cmd_full => gfx_cmd_full,

		start => dp_start,
		busy => dp_busy,

		number => state.score,
		bmpidx => "010"
	);

	sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= (
				fsm_state => RESET,
				last_controller_state => DUALSHOCK_RST,
				frame_buffer_selector => '0',
				player_shot => SHOT_RESET,
				special_invader_active => '0',
				si_bmpidx => "011",
				si_dir => '0',
				txt_cmd_idx => 0,
				count_dead_invader => 0,
				dead_invader_loc => (others => (others=>'0')),
				paused => '0',
				game_over => '0',
				y_reached => '0',
				no_invaders => '0',
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
		
		function build_array_paused return std_logic_vector is
			variable count : integer := 0;
			variable arr : std_logic_vector(545 downto 0) := (others => '0');
		begin
			arr(count + 15 downto count) :=	create_gfx_instr(
																	opcode => OPCODE_MOVE_GP
																);
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(135, 16));
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(110, 16));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0100000000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010001000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0100101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;	
			
			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0100011000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;
			
			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010100000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;
			
			arr(count + 15 downto count) := (others=>'0');

			return arr;
		end function;

		function build_array_game_over return std_logic_vector is
			variable count : integer := 0;
			variable arr : std_logic_vector(545 downto 0) := (others => '0');
		begin
			arr(count + 15 downto count) :=	create_gfx_instr(
																	opcode => OPCODE_MOVE_GP
																);
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(120, 16));
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(110, 16));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010111000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010001000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0011101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;	
			
			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;	

			arr(count + 15 downto count) :=	create_gfx_instr(
																	opcode => OPCODE_MOVE_GP
																);
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(160, 16));
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(110, 16));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0011111000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0100110000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0010101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0100010000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) :=	create_gfx_instr(
																	opcode => OPCODE_MOVE_GP
																);
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(136, 16));
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(120, 16));
			count := count + 16;
			
			arr(count + 15 downto count) := (others=>'0');

			return arr;
		end function;

		function build_array_game(l : integer) return std_logic_vector is
			variable count : integer := 0;
			variable arr : std_logic_vector(545 downto 0) := (others => '0');
			variable lives : integer := l;
		begin
			arr(count + 15 downto count) := create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "010",
						am => '1',
						mx => '1'
					);
			count := count + 16;

			arr(count + 15 downto count) := "0011100000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0011001000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0100110000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0010101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0100011000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0001010000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			if (lives - 1 > 0) then
				arr(count + 15 downto count) := create_gfx_instr(
																	opcode => OPCODE_BB_CHAR,
																	bmpidx => "011",
																	am => '1',
																	mx => '1'
																);
				count := count + 16;

				arr(count + 15 downto count) := "0001000000" & std_logic_vector(to_unsigned(16, 6));
				count := count + 16;
			end if;
			lives := lives - 1;

			if (lives - 1 > 0) then
				arr(count + 15 downto count) := create_gfx_instr(
																	opcode => OPCODE_BB_CHAR,
																	bmpidx => "011",
																	am => '1',
																	mx => '1'
																);
				count := count + 16;

				arr(count + 15 downto count) := "0001000000" & std_logic_vector(to_unsigned(16, 6));
				count := count + 16;
			end if;
			lives := lives - 1;
			
			if (lives - 1 > 0) then
				arr(count + 15 downto count) := create_gfx_instr(
																	opcode => OPCODE_BB_CHAR,
																	bmpidx => "011",
																	am => '1',
																	mx => '1'
																);
				count := count + 16;

				arr(count + 15 downto count) := "0001000000" & std_logic_vector(to_unsigned(16, 6));
				count := count + 16;
			end if;
			lives := lives - 1;

			arr(count + 15 downto count) :=	create_gfx_instr(
																	opcode => OPCODE_MOVE_GP
																);
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(160, 16));
			count := count + 16;

			arr(count + 15 downto count) := std_logic_vector(to_unsigned(232, 16));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0100011000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0010011000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0011111000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0100010000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0010101000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;

			arr(count + 15 downto count) := create_gfx_instr(
																opcode => OPCODE_BB_CHAR,
																bmpidx => "010",
																am => '1',
																mx => '1'
															);
			count := count + 16;

			arr(count + 15 downto count) := "0001010000" & std_logic_vector(to_unsigned(8, 6));
			count := count + 16;
			
			arr(count + 15 downto count) := (others=>'0');

			return arr;
		end function;
	
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

		si_init <= '0';
		si_draw <= '0';
		si_check <= '0';
		si_rd <= '0';
		si_wr <= '0';
		si_wr_data <= "00";
		si_wr_loc <= (others => (others => '0'));
		si_rd_loc <= (others => (others => '0'));

		sc_draw <= '0';
		sc_check <= '0';

		dp_start <= '0';

		state_nxt <= state;
		
		gfx_initializer_start <= '0';

		gfx_cmd_wr <= '0';
		gfx_cmd <= (others=>'0');

		player_shot_y := state.player_shot.y;

		if (state.last_controller_state.start = '0' and ctrl_data.start = '1') then
			state_nxt.paused <= not state.paused;
		end if;
		state_nxt.last_controller_state.start <= ctrl_data.start;

		if ((state.lives = "100") or (state.y_reached = '1') or (state.no_invaders = '1')) then
			state_nxt.game_over <= '1';
		else
			state_nxt.game_over <= '0';
		end if;

		case state.fsm_state is
			when RESET =>
				state_nxt.fsm_state <= WAIT_INIT;
				gfx_initializer_start <= '1';
				gfx_cmd <= gfx_initializer_cmd;
				gfx_cmd_wr <= gfx_initializer_cmd_wr;
				
				state_nxt.player_x <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/2,
							state.player_x'length));
				state_nxt.player_y <= std_logic_vector(to_unsigned(DISPLAY_HEIGHT-25,
							state.player_y'length));
				
				state_nxt.si_xoff <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/6,
							state.si_xoff'length));
				state_nxt.si_yoff <= std_logic_vector(to_unsigned(40,
							state.si_yoff'length));
				si_init <= '1';
				
			when WAIT_INIT =>
				gfx_cmd <= gfx_initializer_cmd;
				gfx_cmd_wr <= gfx_initializer_cmd_wr;
				if (gfx_initializer_busy = '0') then
					state_nxt.fsm_state <= DRAW_SIS_WAIT_INIT;
				end if;

			when DRAW_SIS_WAIT_INIT =>
				if (si_busy = '0') then
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
						cs => CS_PRIMARY
					), DRAW_LINE_MOVE_GP
				);
				if (gfx_cmd_full = '0') then
					if (state.paused = '1' xor state.game_over = '1') then
						state_nxt.fsm_state <= DRAW_TEXT_BB_EFFECT;
					elsif (state.paused = '1' and state.game_over = '1') then
						state_nxt <= (
							fsm_state => RESET,
							last_controller_state => state.last_controller_state,
							frame_buffer_selector => '0',
							player_shot => SHOT_RESET,
							special_invader_active => '0',
							si_bmpidx => "011",
							si_dir => '0',
							txt_cmd_idx => 0,
							count_dead_invader => 0,
							dead_invader_loc => (others => (others=>'0')),
							paused => '0',
							game_over => '0',
							y_reached => '0',
							no_invaders => '0',
							others => (others=>'0')
						);
					end if; 
				end if;

			when INIT_GAME_OVER => 
				state_nxt.txt_cmds <= build_array_game_over;
				state_nxt.fsm_state <= GAME_OVER;

			when GAME_OVER => 
				if (state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx) = "0000000000000000") then
					state_nxt.fsm_state <= DRAW_SCORE_GAME_OVER;
					state_nxt.txt_cmd_idx <= 0;
					state_nxt.txt_cmds <= (others => '0');
				else
					write_cmd(state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx), GAME_OVER);
					if (gfx_cmd_full = '0') then
						state_nxt.txt_cmd_idx <= state.txt_cmd_idx + 16;
					end if;
				end if;

			when DRAW_SCORE_GAME_OVER =>
				dp_start <= '1';
				state_nxt.fsm_state <= DRAW_SCORE_GAME_OVER_WAIT;

			when DRAW_SCORE_GAME_OVER_WAIT =>
				gfx_cmd_wr <= dp_gfx_cmd_wr;
				gfx_cmd <= dp_gfx_cmd;

				if (dp_busy = '0') then
					state_nxt.fsm_state <= DO_FRAME_SYNC;
				end if;

			when INIT_PAUSE =>
				state_nxt.txt_cmds <= build_array_paused;
				state_nxt.fsm_state <= PAUSED;

			when PAUSED => 
				if (state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx) = "0000000000000000") then
					state_nxt.fsm_state <= DO_FRAME_SYNC;
					state_nxt.txt_cmd_idx <= 0;
					state_nxt.txt_cmds <= (others => '0');
				else
					write_cmd(state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx), PAUSED);
					if (gfx_cmd_full = '0') then
						state_nxt.txt_cmd_idx <= state.txt_cmd_idx + 16;
					end if;
				end if;

			when DRAW_LINE_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_LINE_MOVE_GP_X
				);

			when DRAW_LINE_MOVE_GP_X =>
				write_cmd(std_logic_vector(to_unsigned(0, 16)), DRAW_LINE_MOVE_GP_Y);

			when DRAW_LINE_MOVE_GP_Y =>
				write_cmd(std_logic_vector(to_unsigned(230, 16)), DRAW_LINE);

			when DRAW_LINE =>
				write_cmd(create_gfx_instr(opcode=>OPCODE_DRAW_HLINE, cs=>CS_SECONDARY), DRAW_HLINE_DX);

			when DRAW_HLINE_DX =>
				write_cmd(std_logic_vector(to_unsigned(320, 16)), DRAW_TEXT_BB_EFFECT);

			when DRAW_TEXT_BB_EFFECT =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_SET_BB_EFFECT,
					maskop => MASKOP_XOR,
					mask => "11111111"
				), DRAW_TEXT_MOVE_GP);

				if (gfx_cmd_full = '0') then
					if (state.paused = '1') then
						state_nxt.fsm_state <= INIT_PAUSE;
					elsif (state.game_over = '1') then
						state_nxt.fsm_state <= INIT_GAME_OVER;
					end if;
				end if;

			when DRAW_TEXT_MOVE_GP => 
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_TEXT_MOVE_GP_X
				);

			when DRAW_TEXT_MOVE_GP_X =>
				write_cmd(std_logic_vector(to_unsigned(15, 16)), DRAW_TEXT_MOVE_GP_Y);

			when DRAW_TEXT_MOVE_GP_Y =>
				write_cmd(std_logic_vector(to_unsigned(232, 16)), INIT_TEXT);

			when INIT_TEXT =>
				state_nxt.txt_cmds <= build_array_game(4 - to_integer(unsigned(state.lives)));
				state_nxt.fsm_state <= DRAW_TEXT;

			when DRAW_TEXT =>
				if (state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx) = "0000000000000000") then
					state_nxt.fsm_state <= DRAW_SCORE_DIGITS;
					state_nxt.txt_cmd_idx <= 0;
					state_nxt.txt_cmds <= (others => '0');
				else
					write_cmd(state.txt_cmds((state.txt_cmd_idx + 15) downto state.txt_cmd_idx), DRAW_TEXT);
					if (gfx_cmd_full = '0') then
						state_nxt.txt_cmd_idx <= state.txt_cmd_idx + 16;
					end if;
				end if;

			when DRAW_SCORE_DIGITS =>
				dp_start <= '1';
				state_nxt.fsm_state <= DRAW_SCORE_WAIT;

			when DRAW_SCORE_WAIT =>
				gfx_cmd_wr <= dp_gfx_cmd_wr;
				gfx_cmd <= dp_gfx_cmd;

				if (dp_busy = '0') then
					state_nxt.fsm_state <= CHECK_SI_FIELD;
				end if;

			when CHECK_SI_FIELD =>
				si_check <= '1';
				state_nxt.frames_count <= std_logic_vector(unsigned(state.frames_count) + 1);

				state_nxt.fsm_state <= WAIT_SI_CHECK;

			when WAIT_SI_CHECK =>
				if (si_busy = '0') then
					state_nxt.fsm_state <= UPDATE_SI_FIELD;
				end if;
			
			when UPDATE_SI_FIELD =>

				state_nxt.si_mvmt <= std_logic_vector(resize((shift_right(unsigned(si_info.count), 2)) + 10, 16));
				if (si_info.count = std_logic_vector(to_unsigned(0, si_info.count'length))) then
					state_nxt.no_invaders <= '1';
				end if;
				state_nxt.fsm_state <= MOVE_PLAYER;

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
				
				state_nxt.fsm_state <= MOVE_SPACE_INVADERS;
			
			when MOVE_SPACE_INVADERS =>
				if (unsigned(state.frames_count) = unsigned(state.si_mvmt) - 1) then

					if (state.si_bmpidx = "011") then
						state_nxt.si_bmpidx <= "100";
					else
						state_nxt.si_bmpidx <= "011";
					end if;
					
					if (state.si_dir = '1') then
						if (unsigned(state.si_xoff) = 0) then
							state_nxt.si_dir <= '0';
							state_nxt.si_yoff <= std_logic_vector(unsigned(state.si_yoff) + 8);
						else
							state_nxt.si_xoff <=
							std_logic_vector(unsigned(state.si_xoff) - 1);
						end if;
					else
						if (to_integer(unsigned(state.si_xoff)) >= DISPLAY_WIDTH - SIFIELD_WIDTH * 16) then
							state_nxt.si_dir <= '1';
							state_nxt.si_yoff <= std_logic_vector(unsigned(state.si_yoff) + 8);
						else
							state_nxt.si_xoff <=
							std_logic_vector(unsigned(state.si_xoff) + 1);
						end if;
					end if;

					if (to_integer(unsigned(state.si_yoff)) > 110) then
						state_nxt.y_reached <= '1';
					end if;

					if (state.special_invader_active = '0' and prng_value(5 downto 0) = "000000") then
						state_nxt.special_invader_active <= '1';
					end if;

					state_nxt.frames_count <= std_logic_vector(to_unsigned(0, 16));
				end if;

				state_nxt.fsm_state <= MOVE_SPECIAL_INVADER;

			when MOVE_SPECIAL_INVADER =>
				
				if (state.special_invader_active = '1') then
					if (to_integer(unsigned(state.si_xoff)) >= DISPLAY_WIDTH) then
						state_nxt.special_invader_active <= '0';
						state_nxt.special_invader_offset <= std_logic_vector(to_unsigned(0, 9));
					else
						state_nxt.special_invader_offset <=
						std_logic_vector(unsigned(state.special_invader_offset) + 1);
					end if;
				end if;
					
				state_nxt.fsm_state <= DRAW_PLAYER;
			
			when MOVE_PLAYER_SHOT =>
				state_nxt.last_controller_state <= ctrl_data;
				if (state.player_shot.active = '1') then
					sc_check <= '1';
					state_nxt.fsm_state <= CHECK_SHOT_WAIT;
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
			
			when CHECK_SHOT_WAIT =>
				gfx_cmd_wr <= sc_gfx_cmd_wr;
				gfx_cmd <= sc_gfx_cmd;

				if (sc_busy = '0') then
					state_nxt.fsm_state <= DRAW_PLAYER_SHOT;
					if (sc_info.color /= "00000000") then
						report "game: collision detected ";
						state_nxt.fsm_state <= CHECK_COLLISION_TYPE;
					end if;
				end if;

			when CHECK_COLLISION_TYPE =>

				if (sc_info.color = COLOR_MAGENTA) then
					state_nxt.score <= std_logic_vector(unsigned(state.score) + 10);
					state_nxt.special_invader_active <= '0';
					state_nxt.fsm_state <= DO_FRAME_SYNC;
				else
					if (sc_info.color = COLOR_RED) then
						state_nxt.score <= std_logic_vector(unsigned(state.score) + 1);
					elsif (sc_info.color = COLOR_YELLOW) then
						state_nxt.score <= std_logic_vector(unsigned(state.score) + 2);
					elsif (sc_info.color = COLOR_BLUE) then
						state_nxt.score <= std_logic_vector(unsigned(state.score) + 4);
					end if;

					state_nxt.fsm_state <= GET_DEAD_INVADER_X;
				end if;

				state_nxt.player_shot.active <= '0';

			when GET_DEAD_INVADER_X =>
				if (signed(state.player_shot.x) > signed(state.si_xoff)) then
					state_nxt.player_shot.x <= std_logic_vector(signed(state.player_shot.x) - 16);
					state_nxt.count_dead_invader <= state.count_dead_invader + 1;
					state_nxt.fsm_state <= GET_DEAD_INVADER_X;
				else
					state_nxt.dead_invader_loc.x <= std_logic_vector(to_unsigned(state.count_dead_invader - 1, log2c(SIFIELD_WIDTH)));
					state_nxt.count_dead_invader <= 0;
					state_nxt.fsm_state <= GET_DEAD_INVADER_Y;
				end if;

			when GET_DEAD_INVADER_Y =>
				if (signed(state.player_shot.y) > signed(state.si_yoff)) then
					state_nxt.player_shot.y <= std_logic_vector(signed(state.player_shot.y) - 16);
					state_nxt.count_dead_invader <= state.count_dead_invader + 1;
					state_nxt.fsm_state <= GET_DEAD_INVADER_Y;
				else
					state_nxt.dead_invader_loc.y <= std_logic_vector(to_unsigned(state.count_dead_invader - 1, log2c(SIFIELD_HEIGHT)));
					state_nxt.count_dead_invader <= 0;
					state_nxt.fsm_state <= DELETE_SPACE_INVADER;
				end if;

			when DELETE_SPACE_INVADER =>
				si_wr <= '1';
				si_wr_data <= "11";
				si_wr_loc <= state.dead_invader_loc;

				state_nxt.fsm_state <= DO_FRAME_SYNC;
				
			
			--███████╗██╗  ██╗ ██████╗ ████████╗
			--██╔════╝██║  ██║██╔═══██╗╚══██╔══╝
			--███████╗███████║██║   ██║   ██║   
			--╚════██║██╔══██║██║   ██║   ██║   
			--███████║██║  ██║╚██████╔╝   ██║   
			--╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   
			
			when DRAW_PLAYER_SHOT =>
				sc_draw <= '1';
				state_nxt.fsm_state <= DRAW_PLAYER_SHOT_WAIT;

			when DRAW_PLAYER_SHOT_WAIT =>
				gfx_cmd_wr <= sc_gfx_cmd_wr;
				gfx_cmd <= sc_gfx_cmd;

				if (sc_busy = '0') then
					state_nxt.fsm_state <= DO_FRAME_SYNC;
				end if;
			
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
					), DRAW_PLAYER_SET_COLOR
				);

			when DRAW_PLAYER_SET_COLOR =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_SET_BB_EFFECT,
					maskop => MASKOP_XOR,
					mask => "01011100"
				), DRAW_PLAYER_BB_CHAR);

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
					std_logic_vector(to_unsigned(PLAYER_WIDTH, 6)), DRAW_SPACE_INVADERS
				);

			--██╗███╗   ██╗██╗   ██╗ █████╗ ██████╗ ███████╗██████╗ ███████╗
			--██║████╗  ██║██║   ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝
			--██║██╔██╗ ██║██║   ██║███████║██║  ██║█████╗  ██████╔╝███████╗
			--██║██║╚██╗██║╚██╗ ██╔╝██╔══██║██║  ██║██╔══╝  ██╔══██╗╚════██║
			--██║██║ ╚████║ ╚████╔╝ ██║  ██║██████╔╝███████╗██║  ██║███████║
			--╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝

			when DRAW_SIS_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_SIS_MOVE_GP_X
				);

			when DRAW_SIS_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.si_xoff), DRAW_SIS_MOVE_GP_Y);

			when DRAW_SIS_MOVE_GP_Y =>
				write_cmd(unsigned_operand(state.si_yoff), DRAW_SIS_FIELD);
				si_draw <= '1';

			when DRAW_SIS_FIELD =>
				gfx_cmd_wr <= si_gfx_cmd_wr;
				gfx_cmd <= si_gfx_cmd;

				if (si_busy = '0') then
					if (state.special_invader_active = '0') then
						state_nxt.fsm_state <= MOVE_PLAYER_SHOT;
					else 
						state_nxt.fsm_state <= DRAW_SPECIAL_MOVE_GP;
					end if;
				end if;

			when DRAW_SPECIAL_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_SPECIAL_MOVE_GP_X
				);
			
			when DRAW_SPECIAL_MOVE_GP_X =>
				write_cmd(unsigned_operand(state.special_invader_offset), DRAW_SPECIAL_MOVE_GP_Y);

			when DRAW_SPECIAL_MOVE_GP_Y =>
				write_cmd(std_logic_vector(to_unsigned(10, 16)), DRAW_SPECIAL_SET_BB_EFFECT);

			when DRAW_SPECIAL_SET_BB_EFFECT =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_SET_BB_EFFECT,
						maskop => MASKOP_XOR,
						mask => COLOR_MAGENTA
					), DRAW_SPECIAL_BB_CHAR
				);

			when DRAW_SPECIAL_BB_CHAR =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "011",
						am => '1'
					), DRAW_SPECIAL_BB_CHAR_ARG
				);

			when DRAW_SPECIAL_BB_CHAR_ARG =>
				write_cmd(
					"0000" & "11" & "0000" & std_logic_vector(to_unsigned(16, 6)), DRAW_SPECIAL_RESET_BB_EFFECT
				);

			when DRAW_SPECIAL_RESET_BB_EFFECT =>
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
