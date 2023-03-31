library ieee;
use ieee.std_logic_1164.all;

package dualshock_pkg is
	type dualshock_t is record
		up    : std_logic;
		right : std_logic;
		down  : std_logic;
		left  : std_logic;

		l1 : std_logic;
		l2 : std_logic;
		l3 : std_logic;

		r1 : std_logic;
		r2 : std_logic;
		r3 : std_logic;

		start  : std_logic;
		sel    : std_logic;

		triangle  : std_logic;
		circle    : std_logic;
		cross     : std_logic;
		square    : std_logic;

		ls_x : std_logic_vector(7 downto 0);
		ls_y : std_logic_vector(7 downto 0);

		rs_x : std_logic_vector(7 downto 0);
		rs_y : std_logic_vector(7 downto 0);

	end record;

	constant DUALSHOCK_RST : dualshock_t := (
		ls_x => (others=>'0'),
		ls_y => (others=>'0'),
		rs_x => (others=>'0'),
		rs_y => (others=>'0'),
		others => '0'
	);

	constant DUALSHOCK_T_SLV_WIDTH : integer := 48;

	function to_slv (ds : dualshock_t) return std_logic_vector;
	function to_dualshock_t(x : std_logic_vector(DUALSHOCK_T_SLV_WIDTH-1 downto 0)) return dualshock_t;

	component precompiled_dualshock_ctrl is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			ds_clk : out std_logic;
			ds_cmd : out std_logic;
			ds_data : in std_logic;
			ds_att : out std_logic;
			ds_ack : in std_logic;
			ctrl_data : out dualshock_t;
			big_motor : in std_logic_vector(7 downto 0);
			small_motor : in std_logic
		);
	end component;

end package;


package body dualshock_pkg is

	function to_slv(ds : dualshock_t) return std_logic_vector is
		variable x : std_logic_vector(DUALSHOCK_T_SLV_WIDTH-1 downto 0);
	begin
		x(47 downto 32) := (
			ds.up, ds.right, ds.down, ds.left,
			ds.l1, ds.l2, ds.l3, ds.r1, ds.r2, ds.r3, ds.start, ds.sel,
			ds.triangle, ds.circle, ds.cross, ds.square);
		x(31 downto 24) := ds.rs_y;
		x(23 downto 16) := ds.rs_x;
		x(15 downto 8) := ds.ls_y;
		x(7 downto 0) := ds.ls_x;
		return x;
	end function;

	function to_dualshock_t(x : std_logic_vector(DUALSHOCK_T_SLV_WIDTH-1 downto 0)) return dualshock_t is
		variable ds : dualshock_t;
	begin
		ds.up := x(47);
		ds.right := x(46);
		ds.down := x(45);
		ds.left := x(44);
		ds.l1 := x(43);
		ds.l2 := x(42);
		ds.l3 := x(41);
		ds.r1 := x(40);
		ds.r2 := x(39);
		ds.r3 := x(38);
		ds.start := x(37);
		ds.sel := x(36);
		ds.triangle := x(35);
		ds.circle := x(34);
		ds.cross := x(33);
		ds.square := x(32);
		ds.rs_y := x(31 downto 24);
		ds.rs_x := x(23 downto 16);
		ds.ls_y := x(15 downto 8);
		ds.ls_x := x(7 downto 0);
		return ds;
	end function;

end package body;

