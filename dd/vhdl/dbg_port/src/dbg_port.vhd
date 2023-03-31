
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dbg_port_pkg.all;
use work.dualshock_pkg.all;

entity dbg_port is
	port (
		clk   : in std_logic;
		res_n : in std_logic;
		rx    : in std_logic;
		tx    : out std_logic;
		ledr : in std_logic_vector(17 downto 0);
		ledg : in std_logic_vector(8 downto 0);
		gcsc : out std_logic;
		sw_reset : out std_logic;
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
		hw_switches : in std_logic_vector(17 downto 0);
		hw_keys : in std_logic_vector(3 downto 0);
		switches : out std_logic_vector(17 downto 0);
		keys : out std_logic_vector(3 downto 0);
		emulated_ds_state : out dualshock_t;
		emulated_ds_ack : out std_logic;
		emulated_ds_att : in std_logic;
		emulated_ds_cmd : in std_logic;
		emulated_ds_data : out std_logic;
		emulated_ds_clk : in std_logic
	);
end entity;


architecture arch of dbg_port is
	signal ds_state_slv : std_logic_vector(47 downto 0);
begin
	emulated_ds_state <= to_dualshock_t(ds_state_slv);
	dbg_port_inst : dbg_port_top
	port map (
		clk              => clk,
		res_n            => res_n,
		rx               => rx,
		tx               => tx,
		hw_switches      => hw_switches,
		switches         => switches,
		hw_keys          => hw_keys,
		keys             => keys,
		ledr             => ledr,
		ledg             => ledg,
		gfx_cmd        => gfx_cmd,
		gfx_cmd_wr     => gfx_cmd_wr,
		gfx_cmd_full   => gfx_cmd_full,
		gfx_rd_valid   => gfx_rd_valid,
		gfx_rd_data    => gfx_rd_data,
		emulated_ds_state => ds_state_slv,
		emulated_ds_data  => emulated_ds_data,
		emulated_ds_cmd   => emulated_ds_cmd,
		emulated_ds_att   => emulated_ds_att,
		emulated_ds_ack   => emulated_ds_ack,
		emulated_ds_clk   => emulated_ds_clk,
		hex0 => hex0,
		hex1 => hex1,
		hex2 => hex2,
		hex3 => hex3,
		hex4 => hex4,
		hex5 => hex5,
		hex6 => hex6,
		hex7 => hex7,
		gcsc  => gcsc,
		sw_reset => sw_reset
	);
end architecture;
