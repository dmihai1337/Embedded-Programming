library ieee;
use ieee.std_logic_1164.all;

package dbg_port_pkg is
	component dbg_port_top is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			rx : in std_logic;
			tx : out std_logic;
			hw_switches : in std_logic_vector(17 downto 0);
			hw_keys : in std_logic_vector(3 downto 0);
			switches : out std_logic_vector(17 downto 0);
			keys : out std_logic_vector(3 downto 0);
			ledr : in std_logic_vector(17 downto 0);
			ledg : in std_logic_vector(8 downto 0);
			gfx_cmd : out std_logic_vector(15 downto 0);
			gfx_cmd_wr : out std_logic;
			gfx_cmd_full : in std_logic;
			gfx_rd_valid : in std_logic;
			gfx_rd_data : in std_logic_vector(15 downto 0);
			hex0 : in std_logic_vector(6 downto 0);
			hex1 : in std_logic_vector(6 downto 0);
			hex2 : in std_logic_vector(6 downto 0);
			hex3 : in std_logic_vector(6 downto 0);
			hex4 : in std_logic_vector(6 downto 0);
			hex5 : in std_logic_vector(6 downto 0);
			hex6 : in std_logic_vector(6 downto 0);
			hex7 : in std_logic_vector(6 downto 0);
			emulated_ds_state : out std_logic_vector(47 downto 0);
			emulated_ds_data : out std_logic;
			emulated_ds_cmd : in std_logic;
			emulated_ds_att : in std_logic;
			emulated_ds_ack : out std_logic;
			emulated_ds_clk : in std_logic;
			gcsc : out std_logic;
			sw_reset : out std_logic
		);
	end component;
end package;

