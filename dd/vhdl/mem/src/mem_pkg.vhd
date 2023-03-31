library ieee;
use ieee.std_logic_1164.all;
use work.math_pkg.all;

package mem_pkg is

	component dp_ram_1c1r1w is
		generic (
			ADDR_WIDTH : integer;
			DATA_WIDTH : integer
		);
		port (
			clk : in std_logic;
			-- read port
			rd1_addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
			rd1_data : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			rd1 : in std_logic;
			-- write port
			wr2_addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
			wr2_data : in std_logic_vector(DATA_WIDTH - 1 downto 0);
			wr2 : in std_logic
		);
	end component;

	component fifo_1c1r1w is
		generic (
			DEPTH : integer;
			DATA_WIDTH : integer
		);
		port (
			clk : in std_logic;
			res_n : in std_logic;
			-- read port
			rd_data : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			rd : in std_logic;
			-- write port
			wr_data : in std_logic_vector(DATA_WIDTH - 1 downto 0);
			wr : in std_logic;
			-- status flags
			empty : out std_logic;
			full : out std_logic;
			half_full : out std_logic
		);
	end component;
	
	component fifo_1c1r1w_fwft is
		generic (
			DEPTH : integer;
			DATA_WIDTH : integer
		);
		port (
			clk : in std_logic;
			res_n : in std_logic;
			-- read port
			rd_data : out std_logic_vector(DATA_WIDTH - 1 downto 0);
			rd_ack : in std_logic;
			rd_valid : out std_logic;
			-- write port
			wr_data : in std_logic_vector(DATA_WIDTH - 1 downto 0);
			wr : in std_logic;
			-- status flags
			full : out std_logic;
			half_full : out std_logic
		);
	end component;

end package;

