
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.audio_ctrl_pkg.all;

entity audio_ctrl_2s is
	port (
		clk   : in std_logic;
		res_n : in std_logic;
		
		wm8731_xck     : out std_logic;
		
		--interface to wm8731: i2c configuration interface
		wm8731_sdat : inout std_logic;
		wm8731_sclk : inout std_logic;
		
		--samples 
		wm8731_dacdat  : out std_logic;
		wm8731_daclrck : out std_logic; -- DAC Left/Right Clock
		wm8731_bclk    : out std_logic;
		
		--internal interface to the stynthesizers
		synth_ctrl : in synth_ctrl_vec_t(0 to 1)
	);
end entity;


architecture arch of audio_ctrl_2s is
	component audio_ctrl_top is
		port (
			synth_ctrl_0_high_time : IN std_logic_vector(7 DOWNTO 0);
			synth_ctrl_1_high_time : IN std_logic_vector(7 DOWNTO 0);
			synth_ctrl_0_play : IN std_logic;
			synth_ctrl_1_play : IN std_logic;
			synth_ctrl_0_low_time : IN std_logic_vector(7 DOWNTO 0);
			synth_ctrl_1_low_time : IN std_logic_vector(7 DOWNTO 0);
			clk : IN std_logic;
			res_n : IN std_logic;
			wm8731_xck : OUT std_logic;
			wm8731_sdat : INOUT std_logic;
			wm8731_sclk : INOUT std_logic;
			wm8731_dacdat : OUT std_logic;
			wm8731_daclrck : OUT std_logic;
			wm8731_bclk : OUT std_logic
		);
	end component;
begin
	--this is just a wrapper for the precompiled audio controller
	audio_ctrl_inst : audio_ctrl_top
	port map (
		synth_ctrl_0_high_time => synth_ctrl(0).high_time,
		synth_ctrl_1_high_time =>  synth_ctrl(1).high_time,
		synth_ctrl_0_play => synth_ctrl(0).play,
		synth_ctrl_1_play => synth_ctrl(1).play,
		synth_ctrl_0_low_time => synth_ctrl(0).low_time,
		synth_ctrl_1_low_time => synth_ctrl(1).low_time,
		clk => clk,
		res_n => res_n,
		wm8731_xck => wm8731_xck,
		wm8731_sdat => wm8731_sdat,
		wm8731_sclk => wm8731_sclk,
		wm8731_dacdat => wm8731_dacdat,
		wm8731_daclrck => wm8731_daclrck,
		wm8731_bclk => wm8731_bclk
	);

end architecture;


