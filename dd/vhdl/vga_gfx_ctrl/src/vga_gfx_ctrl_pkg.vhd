library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package vga_gfx_ctrl_pkg is

	component vga_gfx_ctrl is
		port (
			clk : in std_logic;
			res_n : in std_logic;
			display_clk : in std_logic;
			display_res_n : in std_logic;
			gfx_cmd : in std_logic_vector(15 downto 0);
			gfx_cmd_wr : in std_logic;
			gfx_cmd_full : out std_logic;
			gfx_rd_data : out std_logic_vector(15 downto 0);
			gfx_rd_valid : out std_logic;
			gfx_frame_sync : out std_logic;
			sram_dq : inout std_logic_vector(15 downto 0);
			sram_addr : out std_logic_vector(19 downto 0);
			sram_ub_n : out std_logic;
			sram_lb_n : out std_logic;
			sram_we_n : out std_logic;
			sram_ce_n : out std_logic;
			sram_oe_n : out std_logic;
			vga_hsync : out std_logic;
			vga_vsync : out std_logic;
			vga_dac_clk : out std_logic;
			vga_dac_blank_n : out std_logic;
			vga_dac_sync_n : out std_logic;
			vga_dac_r : out std_logic_vector(7 downto 0);
			vga_dac_g : out std_logic_vector(7 downto 0);
			vga_dac_b : out std_logic_vector(7 downto 0)
		);
	end component;
end package;

