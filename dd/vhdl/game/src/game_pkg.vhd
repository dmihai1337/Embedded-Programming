library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.dualshock_pkg.all;
use work.audio_ctrl_pkg.all;

package game_pkg is

	component game is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			gfx_cmd : out std_logic_vector(15 downto 0);
			gfx_cmd_wr : out std_logic;
			gfx_cmd_full : in std_logic;
			gfx_rd_data : in std_logic_vector(15 downto 0);
			gfx_rd_valid : in std_logic;
			gfx_frame_sync : in std_logic;
			ctrl_data : in dualshock_t;
			rumble : out std_logic_vector(7 downto 0);
			synth_ctrl : out synth_ctrl_vec_t(0 to 1)
		);
	end component;
end package;

