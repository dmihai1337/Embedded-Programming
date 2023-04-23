library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.math_pkg.all;
use work.gfx_cmd_pkg.all;

package game_util_pkg is

	constant SHOT_COORDINATE_WIDTH : integer := 10;
	constant SHOT_LENGTH : integer := 4;
	constant DOWNWARDS : std_logic := '0';
	constant UPWARDS : std_logic := '1';

	type shot_t is record
		x : std_logic_vector(SHOT_COORDINATE_WIDTH-1 downto 0);
		y : std_logic_vector(SHOT_COORDINATE_WIDTH-1 downto 0);
		movement_direction : std_logic;
		active : std_logic;
	end record;

	type collision_info_t is record
		oob : std_logic;
		color : std_logic_vector(7 downto 0);
	end record;

	constant SHOT_RESET : shot_t := (
		active=>'0',
		movement_direction=>'0',
		others=>(others=>'0')
	);
	
	constant COLLISION_INFO_RESET : collision_info_t := (
		oob=>'0',
		others=>(others=>'0')
	);
	
	type shot_vector_t is array(natural range<>) of shot_t;

	constant SIFIELD_WIDTH : integer := 16;
	constant SIFIELD_HEIGHT : integer := 5;
	constant SIFIELD_DATA_WIDTH : integer := 2;

	type sifield_location_t is record
		x : std_logic_vector(log2c(SIFIELD_WIDTH)-1 downto 0);
		y : std_logic_vector(log2c(SIFIELD_HEIGHT)-1 downto 0);
	end record;
	
	type sifield_info_t is record
		l : std_logic_vector(log2c(SIFIELD_WIDTH)-1 downto 0);
		r : std_logic_vector(log2c(SIFIELD_WIDTH)-1 downto 0);
		b : std_logic_vector(log2c(SIFIELD_HEIGHT)-1 downto 0);
		count : std_logic_vector(log2c(SIFIELD_WIDTH*SIFIELD_HEIGHT+1)-1 downto 0);
	end record;
	
	-- synthesis translate_off
	function to_string(x : sifield_location_t) return string;
	function to_string(x : sifield_info_t) return string;
	-- synthesis translate_on
	
	component shot_ctrl is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			
			-- GFX command port
			gfx_cmd : out std_logic_vector(15 downto 0);
			gfx_cmd_wr : out std_logic;
			gfx_cmd_full : in std_logic;
			gfx_rd_data : in std_logic_vector(15 downto 0);
			gfx_rd_valid : in std_logic;
			
			-- control signals
			shot : in shot_t;
			draw : in std_logic;
			check : in std_logic;
			busy : out std_logic;
			check_result : out collision_info_t
		);
	end component;
	
	component sifield is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			
			-- GFX command port
			gfx_cmd : out std_logic_vector(15 downto 0);
			gfx_cmd_wr : out std_logic;
			gfx_cmd_full : in std_logic;
			
			-- control signals
			init : in std_logic;
			draw : in std_logic;
			check : in std_logic;
			busy : out std_logic;
			check_result : out sifield_info_t;
			draw_offset_x : in std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
			draw_offset_y : in std_logic_vector(GFX_CMD_WIDTH-1 downto 0);
			draw_bmpidx : in std_logic_vector(WIDTH_BMPIDX-1 downto 0);

			-- direct access to internal memory
			rd : in std_logic;
			rd_location : in sifield_location_t;
			rd_data : out std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0);
			wr : in std_logic;
			wr_location : in sifield_location_t;
			wr_data : in std_logic_vector(SIFIELD_DATA_WIDTH-1 downto 0)
		);
	end component;
end package;


-- synthesis translate_off
package body game_util_pkg is
	function to_string(x : sifield_location_t) return string is
	begin
		return "(" & to_string(to_integer(unsigned(x.x))) & ", " & to_string(to_integer(unsigned(x.y))) & ")";
	end function;
	
	function to_string(x : sifield_info_t) return string is
	begin
		return "(count=" & to_string(to_integer(unsigned(x.count))) &
			", l=" & to_string(to_integer(unsigned(x.l))) &
			", r=" & to_string(to_integer(unsigned(x.r))) &
			", b=" & to_string(to_integer(unsigned(x.b))) & ")";
	end function;
end package body;
-- synthesis translate_on



