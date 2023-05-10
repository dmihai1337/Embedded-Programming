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

package mygame_pkg is

	constant DISPLAY_WIDTH : integer := 320;
	constant DISPLAY_HEIGHT : integer := 240;
	
	constant PLAYER_WIDTH : integer := 13;
	constant PLAYER_SPEED : integer := 2;
	
	constant PLAYER_SHOT_SPEED : integer := 4;
	constant SPACE_INVADER_WIDTHS : integer_vector(0 to 3) := (
		12, 8, 12, 16
	);

	constant COLOR_LIME : std_logic_vector(7 downto 0) := "01011100";

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
		DRAW_SHOTS, DRAW_SHOT_WAIT, CHECK_SI_FIELD, WAIT_SI_CHECK, UPDATE_SI_FIELD,
		DRAW_SIS_MOVE_GP, DRAW_SIS_MOVE_GP_X, DRAW_SIS_MOVE_GP_Y, DRAW_SIS_WAIT_INIT, DRAW_SIS_FIELD,
		DELETE_SPACE_INVADER, CHECK_COLLISION_TYPE, GET_DEAD_INVADER_X, GET_DEAD_INVADER_Y,
		DRAW_LINE_MOVE_GP, DRAW_LINE_MOVE_GP_X, DRAW_LINE_MOVE_GP_Y, DRAW_LINE, DRAW_HLINE_DX,
		DRAW_SCORE_DIGITS, DRAW_SCORE_WAIT, DRAW_TEXT_MOVE_GP, DRAW_TEXT_MOVE_GP_X, DRAW_TEXT_MOVE_GP_Y, 
		INIT_TEXT, DRAW_TEXT, DRAW_TEXT_BB_EFFECT,
		DRAW_SPECIAL_MOVE_GP, DRAW_SPECIAL_MOVE_GP_X, DRAW_SPECIAL_MOVE_GP_Y, DRAW_SPECIAL_SET_BB_EFFECT,
		DRAW_SPECIAL_BB_CHAR, DRAW_SPECIAL_BB_CHAR_ARG,
		DRAW_SPECIAL_RESET_BB_EFFECT, MOVE_SPECIAL_INVADER, INIT_PAUSE, PAUSED, INIT_GAME_OVER, GAME_OVER,
		DRAW_SCORE_GAME_OVER_WAIT, DRAW_SCORE_GAME_OVER, MOVE_SI_SHOTS, CHECK_SI_SHOT, RESET_SI_WAIT,
		CHOOSE_SI_SHOOTER, CHOOSE_SI_SHOOTER_CHECK, FIND_FREE_IDX, CHOOSE_SCREEN, DRAW_BUNKERS_MOVE_GP,
		DRAW_BUNKERS_MOVE_GP_X, DRAW_BUNKERS_MOVE_GP_Y, DRAW_BUNKERS_BB_FULL, DRAW_BUNKERS_SET_BB_EFFECT,
		DRAW_BUNKER_DAMAGE_MOVE_GP, DRAW_BUNKER_DAMAGE_MOVE_GP_X, DRAW_BUNKER_DAMAGE_MOVE_GP_Y,
		DRAW_BUNKER_DAMAGE_BB_EFFECT, DRAW_BUNKER_DAMAGE_BB_CHAR_ARG, DRAW_BUNKER_DAMAGE,
		DRAW_BUNKER_DAMAGE_ACTIVATE_BITMAP, DRAW_BUNKER_DAMAGE_DEACTIVATE_BITMAP
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
		shots : shot_vector_t(5 downto 0);
		shots_idx : integer;
		shots_free_idx : integer;
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
		si_shooter : sifield_location_t;
		rumble_active : std_logic;
		rumble_counter : std_logic_vector(26 downto 0); -- count to 50.000.000 (1 sec vibration)
		vibrated_on_game_over : std_logic;
		sound_high_active : std_logic;
		sound_low_active : std_logic;
		sound_counter : std_logic_vector(24 downto 0); -- count to 12.500.000 (0.25 sec tone)
		played_tone_on_game_over : std_logic;
		play_successive_sounds : std_logic;
	end record;

	constant RESET_STATE : state_t := (
		fsm_state => RESET,
		last_controller_state => DUALSHOCK_RST,
		frame_buffer_selector => '0',
		shots => (others => SHOT_RESET),
		shots_idx => 0,
		shots_free_idx => 0,
		special_invader_active => '0',
		si_bmpidx => "011",
		si_dir => '0',
		txt_cmd_idx => 0,
		count_dead_invader => 0,
		dead_invader_loc => (others => (others=>'0')),
		si_shooter => (others => (others=>'0')),
		paused => '0',
		game_over => '0',
		y_reached => '0',
		rumble_active => '0',
		vibrated_on_game_over => '0',
		sound_high_active => '0',
		sound_low_active => '0',
		played_tone_on_game_over => '0',
		play_successive_sounds => '0',
		others => (others=>'0')
	);

	impure function get_random_location(prng_value : std_logic_vector) return sifield_location_t;
	function build_array_game(l : integer) return std_logic_vector;
	function build_array_game_over return std_logic_vector;
	function build_array_paused return std_logic_vector;
	
end package;

package body mygame_pkg is

	impure function get_random_location (prng_value : std_logic_vector) return sifield_location_t is
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

	function build_array_paused return std_logic_vector is
		variable count : integer := 0;
		variable arr : std_logic_vector(545 downto 0) := (others => '0');
	begin
		arr(count + 15 downto count) :=	create_gfx_instr(opcode => OPCODE_MOVE_GP);
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
		arr(count + 15 downto count) :=	create_gfx_instr(opcode => OPCODE_MOVE_GP);
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

		arr(count + 15 downto count) :=	create_gfx_instr(opcode => OPCODE_MOVE_GP);
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

		arr(count + 15 downto count) :=	create_gfx_instr(opcode => OPCODE_MOVE_GP);
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

		arr(count + 15 downto count) :=	create_gfx_instr(opcode => OPCODE_MOVE_GP);
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
	
end package body;

