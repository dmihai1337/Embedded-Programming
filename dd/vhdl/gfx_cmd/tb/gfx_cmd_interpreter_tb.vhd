library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.gfx_cmd_pkg.all;

entity gfx_cmd_interpreter_tb is
end entity;

architecture bench of gfx_cmd_interpreter_tb is

	constant OUTPUT_DIR : string := "./";
	signal clk : std_logic;
	signal gfx_cmd : std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
	signal gfx_cmd_wr : std_logic;
	signal gfx_frame_sync : std_logic;
	signal gfx_rd_data : std_logic_vector(15 downto 0);
	signal gfx_rd_valid : std_logic;

<<<<<<< HEAD
	constant CLK_PERIOD : time := 20 ns;
	signal stop_clock : boolean := false;

=======
>>>>>>> 6165a0b0644cb146ab1d4d2568a71b21bf33eb2e
begin

	uut : entity work.gfx_cmd_interpreter
	generic map (
		OUTPUT_DIR => OUTPUT_DIR
	)
	port map (
		clk            => clk,
		gfx_cmd        => gfx_cmd,
		gfx_cmd_wr     => gfx_cmd_wr,
		gfx_frame_sync => gfx_frame_sync,
		gfx_rd_data    => gfx_rd_data,
		gfx_rd_valid   => gfx_rd_valid
	);
	
	-- add your testcode here
<<<<<<< HEAD
	stimulus : process
	begin	
		---------- TEST MEMORY COMMANDS ----------

		-- VRAM_WRITE --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0110100000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "1111111111111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- VRAM_READ TO CHECK VRAM_WRITE --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0110000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		assert gfx_rd_data = "0000000011111111" report "Error on test #1" severity error;
		
		-- VRAM_WRITE_INIT --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0111100000000001";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000001";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "1111111111111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- VRAM_READ TO CHECK VRAM_WRITE_INIT --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0110000000000001";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';
		
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		assert gfx_rd_data = "1111111111111111" report "Error on test #2" severity error;
		
		-- VRAM_WRITE_SEQ --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0111000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000010";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
	
		-- VRAM_READ TO CHECK VRAM_WRITE_SEQ --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0110000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0110000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000001";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';
		
		wait until rising_edge(clk);
		wait until rising_edge(clk);

		assert gfx_rd_data = "0000000000000000" report "Error on test #3" severity error;
		

		---------- TEST DRAWING COMMANDS (DRAW A CROSS WITH A WHITE INTERSECTION POINT) ----------

		-- DEFINE_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1001000000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- ACTIVATE_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1001100000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- SET_COLOR --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1000000011111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- CLEAR -- 
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0010000000000000";
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- MOVE_GP --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0000100000000100";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DRAW_HLINE --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0011010000010000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- INC_GP --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0001001111000000";
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- INC_GP --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0001011111000000";
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- DRAW_VLINE --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0011110000100000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- MOVE_GP --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0000100000000000";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000111111";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- SET_PIXEL --
		gfx_cmd <= "0010100000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DISPLAY_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1010010000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- GET_PIXEL --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "0101100000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
	
		assert gfx_rd_data = "0000000011111111" report "Error on test #4" severity error;

		
		---------- TEST BIT BLIT COMMANDS ----------
		---------- (COPY WHOLE RESULT FROM ABOVE INTO ANOTHER BMP USING BB_FULL) ----------
		---------- (COPY SECOND QUADRANT FROM ABOVE RESULT INTO ANOTHER BMP USING BB_CLIP) ----------
		---------- (COPY A CHUNK FROM ABOVE RESULT INTO ANOTHER BMP USING BB_CHAR) ----------

		-- MOVE_GP --
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0000100000000000";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- SET_BB_EFFECT --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1000100000000000";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DEFINE_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1001000000000010";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000100";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000001111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		-- ACTIVATE_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1001100000000010";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- BB_FULL --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1100100000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DISPLAY_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1010010000000010";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);
	
		-- CLEAR -- 
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0010010000000000";
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- BB_CLIP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1100000000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000000000";
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000111111";	
		wait until rising_edge(clk);
		gfx_cmd <= "0000000000111111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DISPLAY_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1010010000000010";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- CLEAR -- 
		gfx_cmd_wr <= '1';
		gfx_cmd <= "0010010000000000";
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- BB_CHAR --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1101000000000101";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd <= "0000000000011111";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		-- DISPLAY_BMP --
		gfx_cmd_wr <= '0';
		gfx_cmd <= "1010010000000010";
		wait until rising_edge(clk);
		gfx_cmd_wr <= '1';
		wait until rising_edge(clk);	
		gfx_cmd_wr <= '0';

		wait until rising_edge(clk);
		wait until rising_edge(clk);

		stop_clock <= true;
		report "simulation done";
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

=======
>>>>>>> 6165a0b0644cb146ab1d4d2568a71b21bf33eb2e
end architecture;

