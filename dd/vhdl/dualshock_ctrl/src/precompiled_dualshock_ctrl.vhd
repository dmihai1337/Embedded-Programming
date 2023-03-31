library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dualshock_pkg.all;

entity precompiled_dualshock_ctrl is
	port (
		clk   : in std_logic;
		res_n : in std_logic;

		ds_clk  : out std_logic;
		ds_cmd  : out std_logic;
		ds_data : in  std_logic;
		ds_att  : out std_logic;
		ds_ack  : in  std_logic;

		ctrl_data : out dualshock_t;

		big_motor   : in std_logic_vector(7 downto 0);
		small_motor : in std_logic
	);
end entity;


architecture arch of precompiled_dualshock_ctrl is
	component dualshock_ctrl_top is
		port (
			clk   : in std_logic;
			res_n : in std_logic;

			ds_clk  : out std_logic;
			ds_cmd  : out std_logic;
			ds_data : in  std_logic;
			ds_att  : out std_logic;
			ds_ack  : in  std_logic;

			ctrl_data : out std_logic_vector(DUALSHOCK_T_SLV_WIDTH-1 downto 0);

			big_motor   : in std_logic_vector(7 downto 0);
			small_motor : in std_logic
		);
	end component;
	signal ctrl_data_int : std_logic_vector(DUALSHOCK_T_SLV_WIDTH-1 downto 0);
begin
	ctrl_data <= to_dualshock_t(ctrl_data_int);

	dualshock_ctrl_inst : dualshock_ctrl_top
	port map (
		clk         => clk,
		res_n       => res_n,
		ds_clk      => ds_clk,
		ds_cmd      => ds_cmd,
		ds_data     => ds_data,
		ds_att      => ds_att,
		ds_ack      => ds_ack,
		ctrl_data   => ctrl_data_int,
		big_motor   => big_motor,
		small_motor => small_motor
	);
end architecture;
