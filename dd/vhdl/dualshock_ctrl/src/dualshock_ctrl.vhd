
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dualshock_pkg.all;

entity dualshock_ctrl is
	generic (
		CLK_FREQ : natural := 50_000_000;
		DS_CLK_FREQ : natural := 250_000;
		REFRESH_TIMEOUT : natural
	);
	port (
		clk   : in std_logic;
		res_n : in std_logic;

		-- external interface to the DualShock controller
		ds_clk  : out std_logic;
		ds_cmd  : out std_logic;
		ds_data : in  std_logic;
		ds_att  : out std_logic;
		ds_ack  : in  std_logic;

		-- internal interface
		ctrl_data : out dualshock_t;
		big_motor   : in std_logic_vector(7 downto 0);
		small_motor : in std_logic
	);
end entity;


architecture arch of dualshock_ctrl is
begin

end architecture;
