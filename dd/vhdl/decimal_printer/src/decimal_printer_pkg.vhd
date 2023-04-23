library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package decimal_printer_pkg is
	component decimal_printer is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			gfx_cmd : out std_logic_vector(15 downto 0);
			gfx_cmd_wr : out std_logic;
			gfx_cmd_full : in std_logic;
			start : in std_logic;
			busy : out std_logic;
			number : in std_logic_vector(15 downto 0);
			bmpidx : in std_logic_vector(2 downto 0)
		);
	end component;
end package;

