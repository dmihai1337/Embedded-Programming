library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gfx_cmd_pkg.all;
use work.math_pkg.all;
use work.dualshock_pkg.all;
use work.audio_ctrl_pkg.all;
use work.mem_pkg.all;
use work.vram_pkg.all;
use work.gfx_init_pkg.all;
use work.interpreter_pkg.all;

entity game_tb is
end entity;

architecture bench of game_tb is

	constant OUTPUT_DIR : string := "./";
	signal res_n : std_logic;
	signal clk : std_logic;
	signal gfx_cmd : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
	signal gfx_cmd_wr : std_logic;
	signal gfx_frame_sync : std_logic;
	signal gfx_rd_data : std_logic_vector(15 downto 0);
	signal gfx_rd_valid : std_logic;
	
	--connection to the dualshock controller
	signal ds : dualshock_t;
	signal rumble : std_logic_vector(7 downto 0);
		
	--connection to the audio controller
	signal synth_ctrl : synth_ctrl_vec_t(0 to 1);

	constant CLK_PERIOD : time := 20 ns;
	signal stop_clock : boolean := false;
	
	signal N : integer := 0;

begin

	game : entity work.game(ex2)
	port map (
		clk 		=> clk,
		res_n		=> res_n,
		
		--connection to the VGA graphics controller
		gfx_cmd        	=> gfx_cmd,
		gfx_cmd_wr     	=> gfx_cmd_wr,
		gfx_rd_data    	=> gfx_rd_data,
		gfx_rd_valid   	=> gfx_rd_valid,
		gfx_frame_sync 	=> gfx_frame_sync,
		gfx_cmd_full   	=> '0',
		
		--connection to the dualshock controller
		ctrl_data 	=> ds,
		rumble 		=> rumble,
		
		--connection to the audio controller
		synth_ctrl => synth_ctrl
	);
	
	gfx_cmd_interpreter_inst : entity work.gfx_cmd_interpreter
	generic map (
		OUTPUT_DIR 	=> OUTPUT_DIR
	)
	port map (
		clk   		=> clk,

		gfx_cmd        	=> gfx_cmd,
		gfx_cmd_wr     	=> gfx_cmd_wr,
		gfx_rd_data    	=> gfx_rd_data,
		gfx_rd_valid   	=> gfx_rd_valid,
		gfx_frame_sync 	=> gfx_frame_sync
	);

	-- add your testcode here
	stimulus : process
	begin	

		res_n <= '0';
		
		wait until rising_edge(clk);	
		wait until rising_edge(clk);

		res_n <= '1';

		wait until rising_edge(clk);	
		wait until rising_edge(clk);
		wait until rising_edge(clk);	
		wait until rising_edge(clk);
		
		-- fire a shot
		ds.cross <= '1';
		
		wait until N = 2;

		ds.cross <= '0';
		-- move right
		ds.right <= '1';

		wait until N = 5;
		ds.start <= '0';

		ds.right <= '0';

		stop_clock <= true;
		report "simulation done";
		wait;
	end process;

	update : process
	begin
		while not stop_clock loop
			if (get_opcode(gfx_cmd) = OPCODE_DISPLAY_BMP) then
				N <= N + 1;
			end if;
			wait for CLK_PERIOD;
		end loop;	
		wait;
	end process;

	generate_clk : process
	begin
		while not stop_clock loop
			clk <= '0', '1' after CLK_PERIOD / 2;
			wait for CLK_PERIOD;
		end loop;
		wait;
	end process;

end architecture;

