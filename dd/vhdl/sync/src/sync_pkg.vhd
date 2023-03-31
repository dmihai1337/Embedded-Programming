library ieee;
use ieee.std_logic_1164.all;


package sync_pkg is
	component sync is
		generic(
			SYNC_STAGES : integer range 2 to integer'high; -- number of synchronizer stages (i.e., flip flops)
			RESET_VALUE : std_logic -- reset value of the output signal
		);
		port (
			clk       : in std_logic;
			res_n     : in std_logic;
			data_in   : in std_logic;
			data_out  : out std_logic
		);
	end component;
end package;


