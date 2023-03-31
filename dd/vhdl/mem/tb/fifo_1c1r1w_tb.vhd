library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.math_pkg.all;

entity fifo_1c1r1w_tb is
end entity;

architecture bench of fifo_1c1r1w_tb is

	component fifo_1c1r1w is
		generic (
			DEPTH : integer;
			DATA_WIDTH : integer
		);
		port (
			clk : in std_logic;
			res_n : in std_logic;
			rd_data : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			rd : in std_logic;
			wr_data : in std_logic_vector(DATA_WIDTH - 1 downto 0);
			wr : in std_logic;
			empty : out std_logic;
			full : out std_logic;
			half_full : out std_logic
		);
	end component;

	constant DEPTH : integer := 8;
	constant DATA_WIDTH : integer := 8;
	signal clk : std_logic;
	signal res_n : std_logic;
	signal rd_data : std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal rd : std_logic;
	signal wr_data : std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal wr : std_logic;
	signal empty : std_logic;
	signal full : std_logic;
	signal half_full : std_logic;

	constant CLK_PERIOD : time := 10 ns;
	signal stop_clock : boolean := false;
begin

	uut : fifo_1c1r1w
		generic map (
			DEPTH          => DEPTH,
			DATA_WIDTH         => DATA_WIDTH
		)
		port map (
			clk        => clk,
			res_n      => res_n,
			rd_data    => rd_data,
			rd         => rd,
			wr_data    => wr_data,
			wr         => wr,
			empty      => empty,
			full       => full,
			half_full => half_full
		);

	stimulus : process
		procedure reset is
		begin
			res_n <= '0';
			wr_data <= (others=>'0');
			wr <= '0';
			rd <= '0';
			
			wait until rising_edge(clk);
			wait until rising_edge(clk);
			wait until rising_edge(clk);
			res_n <= '1';
		end procedure;
	begin
		report "starting simulation" severity note;

		reset;
		
		
		-- test reading and writing on the same cycle
		-- (1) put 0xaa into the FIFO
		-- (2) read a value and put 0x55 into the FIFO
		-- (3) read a value
		wait until rising_edge(clk);
		wr <= '1';
		wr_data <= x"aa";
		wait until rising_edge(clk);
		wr <= '0';
		wr_data <= x"00";
		
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		rd <= '1';
		wr <= '1';
		wr_data <= x"55";
		wait until rising_edge(clk);
		rd <= '0';
		wr <= '0';
		wr_data <= x"00";
		
		assert empty = '0' report "empty is not 0, altough the FIFO should contain data!" severity error;
		assert half_full = '0' report "half_full signal is assert altough there is only one data element in the FIFO" severity error;
		
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		rd <= '1';
		wait until rising_edge(clk);
		rd <= '0';
		wait until rising_edge(clk);
		wait until rising_edge(clk);
		
		reset;
		
		wr <= '1';
		for i in 0 to DEPTH-1 loop
			assert full = '0' report "FIFO should not be full at this point" severity error;
			wait until rising_edge(clk);
			wr_data <= std_logic_vector(to_unsigned(i,DATA_WIDTH) + 1);
		end loop;
		wr <= '0';
		
		assert empty = '0' report "Empty flag is asserted altough the FIFO should contain data" severity error;
		
		rd <= '1';
		wait until rising_edge(clk);
		for i in 0 to DEPTH-1 loop
			wait until rising_edge(clk);
			assert rd_data = std_logic_vector(to_unsigned(i,DATA_WIDTH)) 
			report "Read data does not match data previously written (expected: " & 
				to_string(std_logic_vector(to_unsigned(i,DATA_WIDTH))) & " actual: " & to_string(rd_data) severity error;
			if (i= DEPTH-2) then
				rd <= '0';
			end if;
		end loop;
		
		
		report "simulation done" severity note;
		stop_clock <= true;
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

