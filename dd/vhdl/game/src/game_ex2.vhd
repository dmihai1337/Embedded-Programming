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
use work.mygame_pkg.all;

architecture ex2 of game is
	
	signal state, state_nxt : state_t := RESET_STATE;
	
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

begin

	shot_ctrl : entity work.shot_ctrl(arch)
	port map (
		clk => clk,
		res_n => res_n,

		gfx_cmd => sc_gfx_cmd,
		gfx_cmd_wr => sc_gfx_cmd_wr,
		gfx_cmd_full => gfx_cmd_full,
		gfx_rd_data => gfx_rd_data,
		gfx_rd_valid => gfx_rd_valid,

		shot => state.shots(state.shots_idx),
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
			state <= RESET_STATE;
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

		type shots_y_t is array(4 downto 0) of std_logic_vector(state.shots(0).y'range);
		
		variable shots_y : shots_y_t;
		variable curr_si_shooter : sifield_location_t;
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

		for i in 0 to 4 loop
			shots_y(i) := state.shots(i).y;
		end loop;
		curr_si_shooter := state.si_shooter;

		-- PAUSE / UNPAUSE

		if (state.last_controller_state.start = '0' and ctrl_data.start = '1') then
			state_nxt.paused <= not state.paused;
		end if;
		state_nxt.last_controller_state.start <= ctrl_data.start;

		-- GAME OVER

		if ((state.lives = "100") or (state.y_reached = '1')) then

			if (state.vibrated_on_game_over = '0') then
				state_nxt.vibrated_on_game_over <= '1';
				state_nxt.rumble_counter <= (others => '0');
				state_nxt.rumble_active <= '1';
			end if;

			if (state.played_tone_on_game_over = '0') then
				state_nxt.played_tone_on_game_over <= '1';
				state_nxt.sound_low_active <= '1';
				state_nxt.sound_counter <= (others => '0');
				state_nxt.play_successive_sounds <= '1';
			end if;

			state_nxt.game_over <= '1';
		else
			state_nxt.game_over <= state.game_over;
		end if;

		-- RUMBLE DRIVER

		if (state.rumble_active = '0') then
			rumble <= x"00";
		else
			if (to_integer(unsigned(state.rumble_counter)) = 50_000_000) then
				rumble <= x"00";
				state_nxt.rumble_counter <= (others => '0');
				state_nxt.rumble_active <= '0';
			else
				rumble <= x"80";
				state_nxt.rumble_counter <= std_logic_vector(unsigned(state.rumble_counter) + 1);
			end if;
		end if;

		-- SOUND DRIVER

		if (state.sound_low_active = '0') then
			synth_ctrl(0).play <= '0';
		else
			if (to_integer(unsigned(state.sound_counter)) = 12_500_000) then
				synth_ctrl(0).play <= '0';
				state_nxt.sound_counter <= (others => '0');
				state_nxt.sound_low_active <= '0';

				if (state.play_successive_sounds = '1') then
					state_nxt.sound_high_active <= '1';
					state_nxt.play_successive_sounds <= '0';
				end if;
			else
				synth_ctrl(0).play <= '1';
				state_nxt.sound_counter <= std_logic_vector(unsigned(state.sound_counter) + 1);
			end if;
		end if;

		if (state.sound_high_active = '0') then
			synth_ctrl(1).play <= '0';
		else
			if (to_integer(unsigned(state.sound_counter)) = 12_500_000) then
				synth_ctrl(1).play <= '0';
				state_nxt.sound_counter <= (others => '0');
				state_nxt.sound_high_active <= '0';
			else
				synth_ctrl(1).play <= '1';
				state_nxt.sound_counter <= std_logic_vector(unsigned(state.sound_counter) + 1);
			end if;
		end if;

		case state.fsm_state is

			-- ██╗███╗   ██╗██╗████████╗
			-- ██║████╗  ██║██║╚══██╔══╝
			-- ██║██╔██╗ ██║██║   ██║   
			-- ██║██║╚██╗██║██║   ██║   
			-- ██║██║ ╚████║██║   ██║   
			-- ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝   
			--      

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
				state_nxt.fsm_state <= MOVE_PLAYER;


			-- ███╗   ███╗ ██████╗ ██╗   ██╗███████╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
			-- ████╗ ████║██╔═══██╗██║   ██║██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
			-- ██╔████╔██║██║   ██║██║   ██║█████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗
			-- ██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
			-- ██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║
			-- ╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
			--            

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
				
				state_nxt.fsm_state <= CHOOSE_SI_SHOOTER;

			when CHOOSE_SI_SHOOTER =>
				curr_si_shooter := get_random_location(prng_value);
				si_rd_loc <= curr_si_shooter;
				si_rd <= '1';
				state_nxt.si_shooter <= curr_si_shooter;

				state_nxt.fsm_state <= CHOOSE_SI_SHOOTER_CHECK;

			when CHOOSE_SI_SHOOTER_CHECK =>
				if (si_rd_data = "11") then
					state_nxt.fsm_state <= CHOOSE_SI_SHOOTER;
				else
					state_nxt.shots_free_idx <= 0;
					state_nxt.fsm_state <= FIND_FREE_IDX;
				end if;

			when FIND_FREE_IDX =>
				if ((state.shots(state.shots_free_idx).active = '0' and state.shots_free_idx /= 0) or state.shots_free_idx = 5) then
					state_nxt.fsm_state <= MOVE_SPACE_INVADERS;
				else
					state_nxt.shots_free_idx <= state.shots_free_idx + 1;
				end if;
			
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

					if (prng_value(0) = '1') then
						if (state.shots_free_idx <= 4) then
							state_nxt.shots(state.shots_free_idx).active <= '1';
							state_nxt.shots(state.shots_free_idx).x <= 
								std_logic_vector(resize(unsigned(state.si_xoff) + 
									shift_left(to_unsigned(to_integer(unsigned(state.si_shooter.x)), 10), 4) + 7, 
									state.shots(0).x'length));
							state_nxt.shots(state.shots_free_idx).y <=
								std_logic_vector(resize(unsigned(state.si_yoff) + 
									shift_left(to_unsigned(to_integer(unsigned(state.si_shooter.y)), 10), 4) + 7, 
									state.shots(0).y'length));
						end if;
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
					
				state_nxt.fsm_state <= CHOOSE_SCREEN;

			when CHOOSE_SCREEN =>
				if ((state.paused = '1') xor (state.game_over = '1')) then
					state_nxt.fsm_state <= DRAW_TEXT_BB_EFFECT;
				elsif ((state.paused = '1') and (state.game_over = '1')) then
					state_nxt <= RESET_STATE;
					state_nxt.last_controller_state <= state.last_controller_state;
					state_nxt.rumble_active <= state.rumble_active;
					state_nxt.rumble_counter <= state.rumble_counter;
				else 
					state_nxt.fsm_state <= DRAW_LINE_MOVE_GP;
				end if;
			
			when MOVE_PLAYER_SHOT =>
				state_nxt.last_controller_state <= ctrl_data;
				if (state.shots(0).active = '1') then
					sc_check <= '1';
					state_nxt.fsm_state <= CHECK_SHOT_WAIT;
					shots_y(0) := 
						std_logic_vector(signed(state.shots(0).y) - PLAYER_SHOT_SPEED);
					state_nxt.shots(0).y <= shots_y(0);
					if (unsigned(shots_y(0)) > DISPLAY_HEIGHT) then
						state_nxt.shots(0).active <= '0';
						state_nxt.fsm_state <= MOVE_SI_SHOTS;
					end if;
				else
					state_nxt.fsm_state <= MOVE_SI_SHOTS;
					if (state.last_controller_state.cross = '0' and ctrl_data.cross = '1') then
						report "game: firing shot";
						state_nxt.shots(0).active <= '1';
						state_nxt.shots(0).x <= 
							std_logic_vector(resize(unsigned(state.player_x),
							state.shots(0).x'length));
						state_nxt.shots(0).y <=
							std_logic_vector(resize(unsigned(state.player_y), 
							state.shots(0).y'length));
						state_nxt.fsm_state <= MOVE_SI_SHOTS;
					end if;
				end if;
			
			when CHECK_SHOT_WAIT =>
				gfx_cmd_wr <= sc_gfx_cmd_wr;
				gfx_cmd <= sc_gfx_cmd;

				if (sc_busy = '0') then
					state_nxt.fsm_state <= MOVE_SI_SHOTS;
					if (sc_info.color /= "00000000") then
						report "game: collision detected ";
						state_nxt.fsm_state <= CHECK_COLLISION_TYPE;
					end if;
				end if;

			when CHECK_COLLISION_TYPE =>

				if (sc_info.color = COLOR_MAGENTA) then
					state_nxt.score <= std_logic_vector(unsigned(state.score) + 10);
					state_nxt.special_invader_active <= '0';
					state_nxt.fsm_state <= MOVE_SI_SHOTS;
				elsif (sc_info.color = COLOR_WHITE) then
					state_nxt.fsm_state <= MOVE_SI_SHOTS;
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

				if (sc_info.color /= COLOR_WHITE) then
					state_nxt.sound_counter <= (others => '0');
					state_nxt.sound_high_active <= '1';
				end if;

				state_nxt.shots(0).active <= '0';

			when GET_DEAD_INVADER_X =>
				if (signed(state.shots(0).x) > signed(state.si_xoff)) then
					state_nxt.shots(0).x <= std_logic_vector(signed(state.shots(0).x) - 16);
					state_nxt.count_dead_invader <= state.count_dead_invader + 1;
					state_nxt.fsm_state <= GET_DEAD_INVADER_X;
				else
					state_nxt.dead_invader_loc.x <= std_logic_vector(to_unsigned(state.count_dead_invader - 1, log2c(SIFIELD_WIDTH)));
					state_nxt.count_dead_invader <= 0;
					state_nxt.fsm_state <= GET_DEAD_INVADER_Y;
				end if;

			when GET_DEAD_INVADER_Y =>
				if (signed(state.shots(0).y) > signed(state.si_yoff)) then
					state_nxt.shots(0).y <= std_logic_vector(signed(state.shots(0).y) - 16);
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

				state_nxt.fsm_state <= MOVE_SI_SHOTS;

			when MOVE_SI_SHOTS =>
				
				if (state.shots_idx <= 4) then
					if (state.shots(state.shots_idx).active = '1' and state.shots_idx /= 0) then
						sc_check <= '1';
						state_nxt.fsm_state <= CHECK_SI_SHOT;
						shots_y(state.shots_idx) := 
							std_logic_vector(signed(state.shots(state.shots_idx).y) + PLAYER_SHOT_SPEED);
						state_nxt.shots(state.shots_idx).y <= shots_y(state.shots_idx);
						if (to_integer(unsigned(shots_y(state.shots_idx))) > 225) then
							state_nxt.shots(state.shots_idx).active <= '0';
							state_nxt.fsm_state <= MOVE_SI_SHOTS;
						end if;
					else
						state_nxt.shots_idx <= state.shots_idx + 1;
					end if;
				else
					state_nxt.fsm_state <= DRAW_SHOTS;
					state_nxt.shots_idx <= 0;
				end if;

			when CHECK_SI_SHOT =>
				
				gfx_cmd_wr <= sc_gfx_cmd_wr;
				gfx_cmd <= sc_gfx_cmd;

				if (sc_busy = '0') then
					if (sc_info.color = COLOR_WHITE) then 
						state_nxt.fsm_state <= DRAW_BUNKER_DAMAGE_ACTIVATE_BITMAP;
						state_nxt.shots(state.shots_idx).active <= '0';

						state_nxt.sound_counter <= (others => '0');
						state_nxt.sound_low_active <= '1';
					else
						if (sc_info.color = COLOR_LIME) then
							state_nxt.rumble_counter <= (others => '0');
							state_nxt.rumble_active <= '1';
							state_nxt.lives <= std_logic_vector(unsigned(state.lives) + 1);
							state_nxt.player_x <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/2,
								state.player_x'length));
								state_nxt.shots(state.shots_idx).active <= '0';

							
							state_nxt.sound_counter <= (others => '0');
							state_nxt.sound_low_active <= '1';
							state_nxt.play_successive_sounds <= '1';
						end if;
						state_nxt.fsm_state <= MOVE_SI_SHOTS;
					end if;
					state_nxt.shots_idx <= state.shots_idx + 1;
				end if;

			-- ████████╗███████╗██╗  ██╗████████╗
			-- ╚══██╔══╝██╔════╝╚██╗██╔╝╚══██╔══╝
			--    ██║   █████╗   ╚███╔╝    ██║   
			--    ██║   ██╔══╝   ██╔██╗    ██║   
			--    ██║   ███████╗██╔╝ ██╗   ██║   
			--    ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝   

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
					mask => COLOR_WHITE
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
					si_init <= '1';
					state_nxt.si_xoff <= std_logic_vector(to_unsigned(DISPLAY_WIDTH/6,
					state.si_xoff'length));
					state_nxt.si_yoff <= std_logic_vector(to_unsigned(40,
					state.si_yoff'length));
					state_nxt.si_bmpidx <= "011";
				end if;
				state_nxt.fsm_state <= RESET_SI_WAIT;

			when RESET_SI_WAIT =>
				if (si_busy = '0') then
					state_nxt.fsm_state <= DRAW_BUNKERS_SET_BB_EFFECT;
				end if;


			-- ██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗███████╗██████╗ ███████╗
			-- ██╔══██╗██║   ██║████╗  ██║██║ ██╔╝██╔════╝██╔══██╗██╔════╝
			-- ██████╔╝██║   ██║██╔██╗ ██║█████╔╝ █████╗  ██████╔╝███████╗
			-- ██╔══██╗██║   ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██╔══██╗╚════██║
			-- ██████╔╝╚██████╔╝██║ ╚████║██║  ██╗███████╗██║  ██║███████║
			-- ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
			--              
			when DRAW_BUNKER_DAMAGE_ACTIVATE_BITMAP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_ACTIVATE_BMP,
						bmpidx => "101"
					), DRAW_BUNKER_DAMAGE_MOVE_GP
				);

			when DRAW_BUNKER_DAMAGE_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_BUNKER_DAMAGE_MOVE_GP_X
				);
			
			when DRAW_BUNKER_DAMAGE_MOVE_GP_X =>
				write_cmd(std_logic_vector(resize(signed(state.shots(state.shots_idx - 1).x) - 2, 16)),
					DRAW_BUNKER_DAMAGE_MOVE_GP_Y);

			when DRAW_BUNKER_DAMAGE_MOVE_GP_Y =>
				write_cmd(std_logic_vector(resize(signed(state.shots(state.shots_idx - 1).y) - 190 - 2, 16)),
					DRAW_BUNKER_DAMAGE_BB_EFFECT);

			when DRAW_BUNKER_DAMAGE_BB_EFFECT =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_SET_BB_EFFECT,
					maskop => MASKOP_NOP
				), DRAW_BUNKER_DAMAGE);

			when DRAW_BUNKER_DAMAGE =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_BB_CHAR,
						bmpidx => "011",
						rot => prng_value(1 downto 0),
						am => '1'
					), DRAW_BUNKER_DAMAGE_BB_CHAR_ARG
				);

			when DRAW_BUNKER_DAMAGE_BB_CHAR_ARG =>
				if (prng_value(2) = '0') then
					write_cmd(
						std_logic_vector(to_unsigned(80, 10)) & 
						std_logic_vector(to_unsigned(8, 6)), DRAW_BUNKER_DAMAGE_DEACTIVATE_BITMAP
					);
				else
					write_cmd(
						std_logic_vector(to_unsigned(88, 10)) & 
						std_logic_vector(to_unsigned(8, 6)), DRAW_BUNKER_DAMAGE_DEACTIVATE_BITMAP
					);
				end if;

			when DRAW_BUNKER_DAMAGE_DEACTIVATE_BITMAP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_ACTIVATE_BMP,
						bmpidx => (2 downto 1 => '0', 0=>state.frame_buffer_selector)
					), MOVE_SI_SHOTS
				);

			when DRAW_BUNKERS_SET_BB_EFFECT =>
				write_cmd(create_gfx_instr(
					opcode => OPCODE_SET_BB_EFFECT,
					maskop => MASKOP_NOP
				), DRAW_BUNKERS_MOVE_GP);

			when DRAW_BUNKERS_MOVE_GP =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_MOVE_GP
					), DRAW_BUNKERS_MOVE_GP_X
				);

			when DRAW_BUNKERS_MOVE_GP_X =>
				write_cmd(std_logic_vector(to_unsigned(0, 16)), DRAW_BUNKERS_MOVE_GP_Y);

			when DRAW_BUNKERS_MOVE_GP_Y =>
				write_cmd(std_logic_vector(to_unsigned(190, 16)), DRAW_BUNKERS_BB_FULL);
			
			when DRAW_BUNKERS_BB_FULL =>
				write_cmd(
					create_gfx_instr(
						opcode => OPCODE_BB_FULL,
						bmpidx => "101"
					), DRAW_PLAYER
				);


			--███████╗██╗  ██╗ ██████╗ ████████╗███████╗
			--██╔════╝██║  ██║██╔═══██╗╚══██╔══╝██╔════╝
			--███████╗███████║██║   ██║   ██║   ███████╗
			--╚════██║██╔══██║██║   ██║   ██║   ╚════██║
			--███████║██║  ██║╚██████╔╝   ██║   ███████║
			--╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝
			
			when DRAW_SHOTS =>
				if (state.shots_idx <= 4) then
					
					if (state.shots(state.shots_idx).active = '1') then
						sc_draw <= '1';
						state_nxt.fsm_state <= DRAW_SHOT_WAIT;
					else
						state_nxt.shots_idx <= state.shots_idx + 1;
					end if;
				else
					state_nxt.fsm_state <= DO_FRAME_SYNC;
					state_nxt.shots_idx <= 0;
				end if;

			when DRAW_SHOT_WAIT =>
				gfx_cmd_wr <= sc_gfx_cmd_wr;
				gfx_cmd <= sc_gfx_cmd;

				if (sc_busy = '0') then
					state_nxt.fsm_state <= DRAW_SHOTS;
					state_nxt.shots_idx <= state.shots_idx + 1;
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
					mask => COLOR_LIME
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
	synth_ctrl(1).high_time <= x"22";
	synth_ctrl(1).low_time <= x"22"; 

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
