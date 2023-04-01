

library ieee;
use ieee.std_logic_1164.all;

-- import all required packages
use work.sync_pkg.all;
use work.audio_ctrl_pkg.all;
use work.dualshock_pkg.all;
use work.vga_gfx_ctrl_pkg.all;


entity top is
	port (
		--50 MHz clock input
		clk : in  std_logic;

		-- push buttons and switches
		keys     : in std_logic_vector(3 downto 0);
		switches : in std_logic_vector(17 downto 0);

		--Seven segment displays
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		hex4 : out std_logic_vector(6 downto 0);
		hex5 : out std_logic_vector(6 downto 0);
		hex6 : out std_logic_vector(6 downto 0);
		hex7 : out std_logic_vector(6 downto 0);

		-- the LEDs (green and red)
		ledg : out std_logic_vector(8 downto 0);
		ledr : out std_logic_vector(17 downto 0);

		-- UART (used by the dbg_port)
		rx : in std_logic;
		tx : out std_logic;

		-- dualshock controller
		ds_clk  : out std_logic;
		ds_cmd : out std_logic;
		ds_data  : in  std_logic;
		ds_att : out std_logic;
		ds_ack  : in std_logic;

		-- emulated dualshock controller
		emulated_ds_clk : in std_logic;
		emulated_ds_cmd : in std_logic;
		emulated_ds_data : out std_logic;
		emulated_ds_att : in std_logic;
		emulated_ds_ack : out std_logic;

		--interface to SRAM
		sram_dq : inout std_logic_vector(15 downto 0);
		sram_addr : out std_logic_vector(19 downto 0);
		sram_ub_n : out std_logic;
		sram_lb_n : out std_logic;
		sram_we_n : out std_logic;
		sram_ce_n : out std_logic;
		sram_oe_n : out std_logic;

		-- audio interface
		wm8731_xck     : out std_logic;
		wm8731_sdat : inout std_logic;
		wm8731_sclk : inout std_logic;
		wm8731_dacdat  : out std_logic;
		wm8731_daclrck : out std_logic;
		wm8731_bclk    : out std_logic;

		--some auxilary output for performing measurements
		aux : out std_logic_vector(15 downto 0);

		-- interface to ADV7123 and VGA connector
		vga_dac_r : out std_logic_vector(7 downto 0);
		vga_dac_g : out std_logic_vector(7 downto 0);
		vga_dac_b : out std_logic_vector(7 downto 0);
		vga_dac_clk : out std_logic;
		vga_dac_sync_n : out std_logic;
		vga_dac_blank_n : out std_logic;
		vga_hsync : out std_logic;
		vga_vsync : out std_logic
	);
end entity;


architecture arch of top is

	function to_segs(value : in std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		case value is
			when x"0" => return "1000000";
			when x"1" => return "1111001";
			when x"2" => return "0100100";
			when x"3" => return "0110000";
			when x"4" => return "0011001";
			when x"5" => return "0010010";
			when x"6" => return "0000010";
			when x"7" => return "1111000";
			when x"8" => return "0000000";
			when x"9" => return "0010000";
			when x"A" => return "0001000";
			when x"B" => return "0000011";
			when x"C" => return "1000110";
			when x"D" => return "0100001";
			when x"E" => return "0000110";
			when x"F" => return "0001110";
			when others => return "1111111";
		end case;
	end function;

	constant SYNC_STAGES : integer := 2;
	
	-- internal clock and reset signals
	signal audio_clk : std_logic;
	signal display_clk : std_logic;

	signal sw_reset : std_logic;
	signal system_res_n : std_logic;
	signal res_n : std_logic;
	signal audio_res_n : std_logic;
	signal display_res_n : std_logic;

	-- we use these signals instead of the port signals keys and switches
	signal switches_int : std_logic_vector(17 downto 0);
	signal keys_int : std_logic_vector(3 downto 0);
	
	--signal between the game module and the audio_ctrl
	signal synth_ctrl : synth_ctrl_vec_t(0 to 1);

	-- gfx instruction related signals
	signal gcsc : std_logic; --graphics instruction source control
	
	signal gfx_cmd : std_logic_vector(15 downto 0);
	signal gfx_cmd_wr : std_logic;
	signal gfx_cmd_full : std_logic;
	signal gfx_rd_valid : std_logic;
	signal gfx_rd_data : std_logic_vector(15 downto 0);
	signal gfx_frame_sync : std_logic;
	
	signal game_gfx_cmd : std_logic_vector(15 downto 0);
	signal game_gfx_cmd_wr : std_logic;
	
	signal dbg_gfx_cmd : std_logic_vector(15 downto 0);
	signal dbg_gfx_cmd_wr : std_logic;
	
	signal rumble : std_logic_vector(7 downto 0);
	
	signal ssd_res_n, sw_enable, sw_stick_selector, sw_axis_selector, btn_change_sign_mode_n : std_logic;
	
	signal ds : dualshock_t;
begin
	--add your PLL instance here

	myPLL : entity work.myPLL
	port map (
		inclk0 => clk,
		c0		 => audio_clk,
		c1		 => display_clk
	);

	system_res_n <= keys_int(0) and sw_reset;
	
	ssd_reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => ssd_res_n
	);
	
	ssd_sw_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => switches_int(0),
		data_out => sw_enable
	);
	
	ssd_stick_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => switches_int(1),
		data_out => sw_stick_selector
	);
	
	ssd_axis_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => switches_int(2),
		data_out => sw_axis_selector
	);
	
	ssd_btn_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => keys_int(3),
		data_out => btn_change_sign_mode_n
	);

	ssd_ctrl : entity work.ssd_ctrl
	port map (
		clk				=> clk,
		res_n				=> ssd_res_n,
		ctrl_data 			=> ds,
		sw_enable			=> sw_enable,
		sw_stick_selector		=> sw_stick_selector,
		sw_axis_selector		=> sw_axis_selector,
		btn_change_sign_mode_n		=> btn_change_sign_mode_n,
		hex0				=> hex0,
		hex1				=> hex1,
		hex2				=> hex2,
		hex3				=> hex3,
		hex4				=> hex4,
		hex5				=> hex5,
		hex6				=> hex6,
		hex7				=> hex7
	);

	reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => res_n
	);

	audio_reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => audio_clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => audio_res_n
	);

	display_reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => display_clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => display_res_n
	);

	audio_ctrl_2s_inst : audio_ctrl_2s
	port map (
		clk            => audio_clk,
		res_n          => audio_res_n,
		wm8731_sdat    => wm8731_sdat,
		wm8731_sclk    => wm8731_sclk,
		wm8731_xck     => wm8731_xck,
		wm8731_dacdat  => wm8731_dacdat,
		wm8731_daclrck => wm8731_daclrck,
		wm8731_bclk    => wm8731_bclk,
		synth_ctrl     => synth_ctrl
	);

	game_inst : entity work.game(ex1)
	port map (
		clk              => clk,
		res_n            => res_n,
		gfx_cmd          => game_gfx_cmd,
		gfx_cmd_wr       => game_gfx_cmd_wr,
		gfx_cmd_full     => gfx_cmd_full,
		gfx_rd_data      => gfx_rd_data,
		gfx_rd_valid     => gfx_rd_valid and not gcsc,
		gfx_frame_sync   => gfx_frame_sync,
		ctrl_data        => ds,
		rumble           => rumble,
		synth_ctrl       => synth_ctrl
	);

	dualshock_ctrl_inst : precompiled_dualshock_ctrl
	port map (
		clk         => clk,
		res_n       => res_n,
		ds_clk      => ds_clk, -- blue
		ds_cmd      => ds_cmd, -- orange
		ds_data     => ds_data, -- brown
		ds_att      => ds_att, -- yellow
		ds_ack      => ds_ack, -- green
		ctrl_data   => ds,
		big_motor   => rumble,
		small_motor => ds.l3
	);

	vga_gfx_ctrl_inst : vga_gfx_ctrl
	port map (
		clk             => clk,
		res_n           => res_n,
		display_clk     => display_clk,
		display_res_n   => display_res_n,
		gfx_cmd         => gfx_cmd,
		gfx_cmd_wr      => gfx_cmd_wr,
		gfx_cmd_full    => gfx_cmd_full,
		gfx_rd_data     => gfx_rd_data,
		gfx_rd_valid    => gfx_rd_valid,
		gfx_frame_sync  => gfx_frame_sync,
		sram_dq         => sram_dq,
		sram_addr       => sram_addr,
		sram_ub_n       => sram_ub_n,
		sram_lb_n       => sram_lb_n,
		sram_we_n       => sram_we_n,
		sram_ce_n       => sram_ce_n,
		sram_oe_n       => sram_oe_n,
		vga_hsync       => vga_hsync,
		vga_vsync       => vga_vsync,
		vga_dac_clk     => vga_dac_clk,
		vga_dac_blank_n => vga_dac_blank_n,
		vga_dac_sync_n  => vga_dac_sync_n,
		vga_dac_r       => vga_dac_r,
		vga_dac_g       => vga_dac_g,
		vga_dac_b       => vga_dac_b
	);

	gfx_mux : process(all)
	begin
		if (gcsc = '1') then
			gfx_cmd <= dbg_gfx_cmd;
			gfx_cmd_wr <= dbg_gfx_cmd_wr;
		else
			gfx_cmd <= game_gfx_cmd;
			gfx_cmd_wr <= game_gfx_cmd_wr;
		end if;
	end process;

	ledg(0) <= ds.triangle;
	ledg(1) <= ds.square;
	ledg(2) <= ds.cross;
	ledg(3) <= ds.circle;
	ledg(4) <= ds.up;
	ledg(5) <= ds.down;
	ledg(6) <= ds.left;
	ledg(7) <= ds.right;
	ledg(8) <= gcsc;
	
	ledr(0) <= ds.l1;
	ledr(1) <= ds.l2;
	ledr(2) <= ds.l3;
	ledr(3) <= ds.r1;
	ledr(4) <= ds.r2;
	ledr(5) <= ds.r3;
	ledr(6) <= ds.start;
	ledr(7) <= ds.sel;
	ledr(17 downto 8) <= switches_int(17 downto 8);

	aux <= switches_int(15 downto 0);

------------------------------------------------------------------------------
--    ██████╗ ██████╗  ██████╗        ██████╗  ██████╗ ██████╗ ████████╗    --
--    ██╔══██╗██╔══██╗██╔════╝        ██╔══██╗██╔═══██╗██╔══██╗╚══██╔══╝    --
--    ██║  ██║██████╔╝██║  ███╗       ██████╔╝██║   ██║██████╔╝   ██║       --
--    ██║  ██║██╔══██╗██║   ██║       ██╔═══╝ ██║   ██║██╔══██╗   ██║       --
--    ██████╔╝██████╔╝╚██████╔╝██████╗██║     ╚██████╔╝██║  ██║   ██║       --
--    ╚═════╝ ╚═════╝  ╚═════╝ ╚═════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝   ╚═╝       --
------------------------------------------------------------------------------
	dbg: block
		signal dbg_ledr : std_logic_vector(ledr'range);
		signal dbg_ledg : std_logic_vector(ledg'range);

		signal dbg_hex0 : std_logic_vector(6 downto 0);
		signal dbg_hex1 : std_logic_vector(6 downto 0);
		signal dbg_hex2 : std_logic_vector(6 downto 0);
		signal dbg_hex3 : std_logic_vector(6 downto 0);
		signal dbg_hex4 : std_logic_vector(6 downto 0);
		signal dbg_hex5 : std_logic_vector(6 downto 0);
		signal dbg_hex6 : std_logic_vector(6 downto 0);
		signal dbg_hex7 : std_logic_vector(6 downto 0);
	begin

		dbg_ledr <= ledr;
		dbg_ledg <= ledg;

		dbg_hex0 <= hex0;
		dbg_hex1 <= hex1;
		dbg_hex2 <= hex2;
		dbg_hex3 <= hex3;
		dbg_hex4 <= hex4;
		dbg_hex5 <= hex5;
		dbg_hex6 <= hex6;
		dbg_hex7 <= hex7;

		dbg_port_inst : entity work.dbg_port
		port map (
			clk                 => clk,
			res_n               => keys(0),
			rx                  => rx,
			tx                  => tx,
			hw_switches         => switches,
			hw_keys             => keys,
			switches            => switches_int,
			keys                => keys_int,
			ledr                => dbg_ledr,
			ledg                => dbg_ledg,
			gfx_cmd => dbg_gfx_cmd,
			gfx_cmd_wr => dbg_gfx_cmd_wr,
			gfx_cmd_full => gfx_cmd_full,
			gfx_rd_data => gfx_rd_data,
			gfx_rd_valid => gfx_rd_valid and gcsc,
			emulated_ds_state => open,
			emulated_ds_data  => emulated_ds_data,
			emulated_ds_cmd   => emulated_ds_cmd,
			emulated_ds_att   => emulated_ds_att,
			emulated_ds_ack   => emulated_ds_ack,
			emulated_ds_clk   => emulated_ds_clk,
			hex0 => dbg_hex0,
			hex1 => dbg_hex1,
			hex2 => dbg_hex2,
			hex3 => dbg_hex3,
			hex4 => dbg_hex4,
			hex5 => dbg_hex5,
			hex6 => dbg_hex6,
			hex7 => dbg_hex7,
			gcsc => gcsc,
			sw_reset => sw_reset
		);
	end block;
end architecture;
