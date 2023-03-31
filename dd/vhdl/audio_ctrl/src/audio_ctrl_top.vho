-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "03/08/2023 13:44:04"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	audio_ctrl_top IS
    PORT (
	clk : IN std_logic;
	res_n : IN std_logic;
	wm8731_xck : OUT std_logic;
	wm8731_sdat : INOUT std_logic;
	wm8731_sclk : INOUT std_logic;
	wm8731_dacdat : OUT std_logic;
	wm8731_daclrck : OUT std_logic;
	wm8731_bclk : OUT std_logic;
	synth_ctrl_0_low_time : IN std_logic_vector(7 DOWNTO 0);
	synth_ctrl_0_high_time : IN std_logic_vector(7 DOWNTO 0);
	synth_ctrl_0_play : IN std_logic;
	synth_ctrl_1_low_time : IN std_logic_vector(7 DOWNTO 0);
	synth_ctrl_1_high_time : IN std_logic_vector(7 DOWNTO 0);
	synth_ctrl_1_play : IN std_logic
	);
END audio_ctrl_top;

-- Design Ports Information
-- wm8731_xck	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wm8731_dacdat	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wm8731_daclrck	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wm8731_bclk	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wm8731_sdat	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wm8731_sclk	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res_n	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[0]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[1]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[2]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[3]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[4]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[5]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[6]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_high_time[7]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[0]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[1]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[2]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[3]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[4]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[5]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[6]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_high_time[7]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_play	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_play	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[2]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[1]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[0]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[4]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[3]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[5]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[6]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_0_low_time[7]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[2]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[1]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[0]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[5]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[4]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[3]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- synth_ctrl_1_low_time[7]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF audio_ctrl_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_res_n : std_logic;
SIGNAL ww_wm8731_xck : std_logic;
SIGNAL ww_wm8731_dacdat : std_logic;
SIGNAL ww_wm8731_daclrck : std_logic;
SIGNAL ww_wm8731_bclk : std_logic;
SIGNAL ww_synth_ctrl_0_low_time : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_synth_ctrl_0_high_time : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_synth_ctrl_0_play : std_logic;
SIGNAL ww_synth_ctrl_1_low_time : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_synth_ctrl_1_high_time : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_synth_ctrl_1_play : std_logic;
SIGNAL \res_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \wm8731_sdat~input_o\ : std_logic;
SIGNAL \wm8731_sdat~output_o\ : std_logic;
SIGNAL \wm8731_sclk~output_o\ : std_logic;
SIGNAL \wm8731_xck~output_o\ : std_logic;
SIGNAL \wm8731_dacdat~output_o\ : std_logic;
SIGNAL \wm8731_daclrck~output_o\ : std_logic;
SIGNAL \wm8731_bclk~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \wm8731_sclk~input_o\ : std_logic;
SIGNAL \res_n~input_o\ : std_logic;
SIGNAL \res_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~3\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~5\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~7\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~9\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~11\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|stretch~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|stretch~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~1\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|count~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Equal0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_0~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_clk~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_clk~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|bit_cnt[0]~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector20~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector35~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector36~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector37~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[14]~61\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[15]~62_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.RESET~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.RESET~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.RESET~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector16~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[15]~63\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[16]~64_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector15~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[16]~65\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[17]~66_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector14~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[17]~67\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[18]~68_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector13~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[18]~69\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[19]~70_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector12~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[19]~71\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[20]~72_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector11~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[20]~73\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[21]~74_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector10~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[21]~75\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[22]~76_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector9~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[22]~77\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[23]~78_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector8~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[23]~79\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[24]~80_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector7~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[24]~81\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[25]~82_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector6~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[25]~83\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[26]~84_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector5~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[26]~85\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[27]~86_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector4~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[27]~87\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[28]~88_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector3~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[28]~89\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[29]~90_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector2~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[29]~91\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[30]~92_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[30]~93\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[31]~94_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt_nxt~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[0]~32_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector31~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[0]~33\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[1]~34_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector30~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[1]~35\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[2]~36_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector29~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[2]~37\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[3]~38_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector28~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[3]~39\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[4]~40_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector27~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[4]~41\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[5]~42_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector26~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[5]~43\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[6]~44_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector25~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[6]~45\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[7]~46_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector24~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[7]~47\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[8]~48_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector23~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[8]~49\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[9]~50_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector22~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[9]~51\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[10]~52_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector21~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[10]~53\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[11]~54_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector20~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[11]~55\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[12]~56_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector19~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[12]~57\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[13]~58_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector18~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[13]~59\ : std_logic;
SIGNAL \audio_ctrl_inst|reg_cnt[14]~60_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector17~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.DONE~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.DONE~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector36~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector36~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector33~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector33~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector21~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.rd~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state~13_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector0~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|busy~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector34~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector34~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.stop~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector17~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.ready~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.start~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector19~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.command~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state~15_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_ena~combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector20~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|state.wr~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Add1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector40~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_tx[0]~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_data[0]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector42~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~11_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~13_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~15_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~16_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~17_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~18_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Selector39~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector23~19_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|sda_int~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|Selector29~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl_clk~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl_clk~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl_ena~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl_ena~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl_ena~q\ : std_logic;
SIGNAL \audio_ctrl_inst|i2c_master_inst|scl~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~31_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[4]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_play~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|synth_play_last~q\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|sync~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~1\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~3\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~5\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[3]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~7\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~9\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~11\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~13\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~15\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~16_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~17\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~18_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal4~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal4~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal3~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~25\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~26_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[13]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~27\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~28_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[14]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~29\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~30_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[15]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~31\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~32_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[16]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~33\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~34_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[17]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~35\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~36_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[18]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~37\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~38_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[19]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~39\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~40_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[20]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~41\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~42_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[21]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~43\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~44_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[22]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~45\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~46_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[23]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~47\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~48_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[24]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~49\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~50_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[25]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~51\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~52_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[26]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~53\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~54_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[27]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~55\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~56_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[28]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~57\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~58_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[29]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~59\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~60_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[30]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal4~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~19\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~20_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|clk_cnt~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~21\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~22_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[11]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~23\ : std_logic;
SIGNAL \audio_ctrl_inst|Add2~24_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:clk_cnt[12]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|gen_nxt_sample~q\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[4]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[3]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[3]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[2]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[2]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[1]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[1]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[0]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[0]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[5]~input_o\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[5]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3_combout\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[6]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_1_high_time[7]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[6]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\ : std_logic;
SIGNAL \synth_ctrl_1_low_time[7]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~13\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~13\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~33_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~35_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~37_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~39_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~41_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~43_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~45_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~47_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~57_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~59_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~61_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~63_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~65_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~67_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~69_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~71_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~73_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~75_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~77_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~79_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~81_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~83_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~85_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~87_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~89_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~91_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~93_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~95_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~97_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~98\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~99_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~0_combout\ : std_logic;
SIGNAL \synth_ctrl_0_play~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~31_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[3]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|synth_play_last~q\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[3]~input_o\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[2]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[2]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[1]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[1]~input_o\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[0]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[0]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[4]~input_o\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[4]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[5]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[5]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[6]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]~feeder_combout\ : std_logic;
SIGNAL \synth_ctrl_0_high_time[7]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~feeder_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[6]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\ : std_logic;
SIGNAL \synth_ctrl_0_low_time[7]~input_o\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~13\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~13\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~33_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~35_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~37_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~39_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~41_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~43_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~45_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~47_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~57_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~59_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~61_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~63_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~65_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~67_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~69_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~71_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~73_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~75_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~77_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~79_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~81_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~83_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~85_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~87_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~89_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~91_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~93_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~95_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~97_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~98\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~99_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add3~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:audio_sample[15]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal2~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Equal3~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|Add3~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:audio_sample[14]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|Add3~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:audio_sample[13]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~14_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~13_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[1]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~12_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[2]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~11_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[3]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~10_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[4]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~9_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[5]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~8_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[6]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~7_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[7]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~6_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[8]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~5_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[9]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~4_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[10]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~3_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[11]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~2_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[12]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[13]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|sample_shift_reg~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~q\ : std_logic;
SIGNAL \audio_ctrl_inst|wm8731_dacdat~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|wm8731_dacdat~1_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|wm8731_dacdat~q\ : std_logic;
SIGNAL \audio_ctrl_inst|daclrck~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|wm8731_daclrck~q\ : std_logic;
SIGNAL \audio_ctrl_inst|wm8731_bclk~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|i2c_master_inst|data_tx\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|i2c_master_inst|count\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \audio_ctrl_inst|reg_cnt\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\ : std_logic_vector(1 TO 2);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\ : std_logic_vector(30 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\ : std_logic_vector(1 TO 2);
SIGNAL \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \audio_ctrl_inst|i2c_master_inst|bit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\ : std_logic;
SIGNAL \audio_ctrl_inst|ALT_INV_sync~0_combout\ : std_logic;
SIGNAL \audio_ctrl_inst|ALT_INV_wm8731_bclk~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_res_n <= res_n;
wm8731_xck <= ww_wm8731_xck;
wm8731_dacdat <= ww_wm8731_dacdat;
wm8731_daclrck <= ww_wm8731_daclrck;
wm8731_bclk <= ww_wm8731_bclk;
ww_synth_ctrl_0_low_time <= synth_ctrl_0_low_time;
ww_synth_ctrl_0_high_time <= synth_ctrl_0_high_time;
ww_synth_ctrl_0_play <= synth_ctrl_0_play;
ww_synth_ctrl_1_low_time <= synth_ctrl_1_low_time;
ww_synth_ctrl_1_high_time <= synth_ctrl_1_high_time;
ww_synth_ctrl_1_play <= synth_ctrl_1_play;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\res_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \res_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\ <= NOT \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\;
\audio_ctrl_inst|ALT_INV_sync~0_combout\ <= NOT \audio_ctrl_inst|sync~0_combout\;
\audio_ctrl_inst|ALT_INV_wm8731_bclk~0_combout\ <= NOT \audio_ctrl_inst|wm8731_bclk~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X52_Y73_N9
\wm8731_sdat~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \audio_ctrl_inst|i2c_master_inst|Selector29~0_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => \wm8731_sdat~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\wm8731_sclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \audio_ctrl_inst|i2c_master_inst|scl~1_combout\,
	oe => VCC,
	devoe => ww_devoe,
	o => \wm8731_sclk~output_o\);

-- Location: IOOBUF_X0_Y42_N9
\wm8731_xck~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk~input_o\,
	devoe => ww_devoe,
	o => \wm8731_xck~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\wm8731_dacdat~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \audio_ctrl_inst|wm8731_dacdat~q\,
	devoe => ww_devoe,
	o => \wm8731_dacdat~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\wm8731_daclrck~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \audio_ctrl_inst|wm8731_daclrck~q\,
	devoe => ww_devoe,
	o => \wm8731_daclrck~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\wm8731_bclk~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \audio_ctrl_inst|ALT_INV_wm8731_bclk~0_combout\,
	devoe => ww_devoe,
	o => \wm8731_bclk~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X47_Y0_N1
\wm8731_sclk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => wm8731_sclk,
	o => \wm8731_sclk~input_o\);

-- Location: IOIBUF_X0_Y36_N15
\res_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_res_n,
	o => \res_n~input_o\);

-- Location: CLKCTRL_G4
\res_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \res_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \res_n~inputclkctrl_outclk\);

-- Location: FF_X46_Y35_N31
\audio_ctrl_inst|i2c_master_inst|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|i2c_master_inst|count~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(3));

-- Location: LCCOMB_X46_Y35_N10
\audio_ctrl_inst|i2c_master_inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(1) & (!\audio_ctrl_inst|i2c_master_inst|Add0~1\)) # (!\audio_ctrl_inst|i2c_master_inst|count\(1) & ((\audio_ctrl_inst|i2c_master_inst|Add0~1\) # (GND)))
-- \audio_ctrl_inst|i2c_master_inst|Add0~3\ = CARRY((!\audio_ctrl_inst|i2c_master_inst|Add0~1\) # (!\audio_ctrl_inst|i2c_master_inst|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~1\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~3\);

-- Location: LCCOMB_X46_Y35_N12
\audio_ctrl_inst|i2c_master_inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(2) & (\audio_ctrl_inst|i2c_master_inst|Add0~3\ $ (GND))) # (!\audio_ctrl_inst|i2c_master_inst|count\(2) & (!\audio_ctrl_inst|i2c_master_inst|Add0~3\ & VCC))
-- \audio_ctrl_inst|i2c_master_inst|Add0~5\ = CARRY((\audio_ctrl_inst|i2c_master_inst|count\(2) & !\audio_ctrl_inst|i2c_master_inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|count\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~3\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~5\);

-- Location: LCCOMB_X46_Y35_N0
\audio_ctrl_inst|i2c_master_inst|count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~4_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add0~4_combout\ & !\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~4_combout\);

-- Location: FF_X46_Y35_N1
\audio_ctrl_inst|i2c_master_inst|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~4_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(2));

-- Location: LCCOMB_X46_Y35_N14
\audio_ctrl_inst|i2c_master_inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(3) & (!\audio_ctrl_inst|i2c_master_inst|Add0~5\)) # (!\audio_ctrl_inst|i2c_master_inst|count\(3) & ((\audio_ctrl_inst|i2c_master_inst|Add0~5\) # (GND)))
-- \audio_ctrl_inst|i2c_master_inst|Add0~7\ = CARRY((!\audio_ctrl_inst|i2c_master_inst|Add0~5\) # (!\audio_ctrl_inst|i2c_master_inst|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~5\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~7\);

-- Location: LCCOMB_X47_Y35_N24
\audio_ctrl_inst|i2c_master_inst|count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~2_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ & \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~2_combout\);

-- Location: LCCOMB_X46_Y35_N22
\audio_ctrl_inst|i2c_master_inst|count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ & !\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~0_combout\);

-- Location: FF_X46_Y35_N23
\audio_ctrl_inst|i2c_master_inst|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(4));

-- Location: LCCOMB_X46_Y35_N16
\audio_ctrl_inst|i2c_master_inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(4) & (\audio_ctrl_inst|i2c_master_inst|Add0~7\ $ (GND))) # (!\audio_ctrl_inst|i2c_master_inst|count\(4) & (!\audio_ctrl_inst|i2c_master_inst|Add0~7\ & VCC))
-- \audio_ctrl_inst|i2c_master_inst|Add0~9\ = CARRY((\audio_ctrl_inst|i2c_master_inst|count\(4) & !\audio_ctrl_inst|i2c_master_inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~7\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~9\);

-- Location: LCCOMB_X47_Y35_N26
\audio_ctrl_inst|i2c_master_inst|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|count~2_combout\ & (\audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ & ((\audio_ctrl_inst|i2c_master_inst|Add0~2_combout\) # 
-- (\audio_ctrl_inst|i2c_master_inst|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|count~2_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~1_combout\);

-- Location: FF_X46_Y35_N25
\audio_ctrl_inst|i2c_master_inst|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(6));

-- Location: LCCOMB_X46_Y35_N18
\audio_ctrl_inst|i2c_master_inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(5) & (!\audio_ctrl_inst|i2c_master_inst|Add0~9\)) # (!\audio_ctrl_inst|i2c_master_inst|count\(5) & ((\audio_ctrl_inst|i2c_master_inst|Add0~9\) # (GND)))
-- \audio_ctrl_inst|i2c_master_inst|Add0~11\ = CARRY((!\audio_ctrl_inst|i2c_master_inst|Add0~9\) # (!\audio_ctrl_inst|i2c_master_inst|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|count\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~9\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~11\);

-- Location: LCCOMB_X46_Y35_N2
\audio_ctrl_inst|i2c_master_inst|count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ & !\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~1_combout\);

-- Location: FF_X46_Y35_N3
\audio_ctrl_inst|i2c_master_inst|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(5));

-- Location: LCCOMB_X46_Y35_N20
\audio_ctrl_inst|i2c_master_inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\ = \audio_ctrl_inst|i2c_master_inst|Add0~11\ $ (!\audio_ctrl_inst|i2c_master_inst|count\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|i2c_master_inst|count\(6),
	cin => \audio_ctrl_inst|i2c_master_inst|Add0~11\,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\);

-- Location: LCCOMB_X46_Y35_N24
\audio_ctrl_inst|i2c_master_inst|count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~3_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ & \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~3_combout\);

-- Location: LCCOMB_X46_Y35_N6
\audio_ctrl_inst|i2c_master_inst|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~0_combout\ = (((!\audio_ctrl_inst|i2c_master_inst|count~2_combout\) # (!\audio_ctrl_inst|i2c_master_inst|count~0_combout\)) # (!\audio_ctrl_inst|i2c_master_inst|Add0~4_combout\)) # 
-- (!\audio_ctrl_inst|i2c_master_inst|count~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count~1_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|count~0_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|count~2_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~0_combout\);

-- Location: LCCOMB_X47_Y35_N12
\audio_ctrl_inst|i2c_master_inst|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~2_combout\ = (\audio_ctrl_inst|i2c_master_inst|count~3_combout\ & ((\audio_ctrl_inst|i2c_master_inst|process_0~1_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\)))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|count~3_combout\ & (((\audio_ctrl_inst|i2c_master_inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|process_0~1_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|count~3_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|process_0~0_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~2_combout\);

-- Location: LCCOMB_X47_Y35_N6
\audio_ctrl_inst|i2c_master_inst|stretch~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|stretch~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|process_0~2_combout\ & ((\audio_ctrl_inst|i2c_master_inst|stretch~q\))) # (!\audio_ctrl_inst|i2c_master_inst|process_0~2_combout\ & (!\wm8731_sclk~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \wm8731_sclk~input_o\,
	datac => \audio_ctrl_inst|i2c_master_inst|stretch~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|process_0~2_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|stretch~0_combout\);

-- Location: FF_X47_Y35_N7
\audio_ctrl_inst|i2c_master_inst|stretch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|stretch~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|stretch~q\);

-- Location: LCCOMB_X46_Y35_N8
\audio_ctrl_inst|i2c_master_inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add0~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|stretch~q\ & (\audio_ctrl_inst|i2c_master_inst|count\(0) & VCC)) # (!\audio_ctrl_inst|i2c_master_inst|stretch~q\ & (\audio_ctrl_inst|i2c_master_inst|count\(0) $ (VCC)))
-- \audio_ctrl_inst|i2c_master_inst|Add0~1\ = CARRY((!\audio_ctrl_inst|i2c_master_inst|stretch~q\ & \audio_ctrl_inst|i2c_master_inst|count\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|stretch~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|count\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|i2c_master_inst|Add0~0_combout\,
	cout => \audio_ctrl_inst|i2c_master_inst|Add0~1\);

-- Location: LCCOMB_X46_Y35_N28
\audio_ctrl_inst|i2c_master_inst|count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~6_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ & \audio_ctrl_inst|i2c_master_inst|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Add0~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~6_combout\);

-- Location: FF_X46_Y35_N29
\audio_ctrl_inst|i2c_master_inst|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~6_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(0));

-- Location: LCCOMB_X46_Y35_N26
\audio_ctrl_inst|i2c_master_inst|count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|count~5_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ & \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|count~5_combout\);

-- Location: FF_X46_Y35_N27
\audio_ctrl_inst|i2c_master_inst|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|count~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|count\(1));

-- Location: LCCOMB_X46_Y35_N30
\audio_ctrl_inst|i2c_master_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Equal0~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(4) & (\audio_ctrl_inst|i2c_master_inst|count\(5) & (!\audio_ctrl_inst|i2c_master_inst|count\(3) & \audio_ctrl_inst|i2c_master_inst|count\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count\(4),
	datab => \audio_ctrl_inst|i2c_master_inst|count\(5),
	datac => \audio_ctrl_inst|i2c_master_inst|count\(3),
	datad => \audio_ctrl_inst|i2c_master_inst|count\(6),
	combout => \audio_ctrl_inst|i2c_master_inst|Equal0~0_combout\);

-- Location: LCCOMB_X46_Y35_N4
\audio_ctrl_inst|i2c_master_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|count\(1) & (\audio_ctrl_inst|i2c_master_inst|count\(0) & (\audio_ctrl_inst|i2c_master_inst|Equal0~0_combout\ & \audio_ctrl_inst|i2c_master_inst|count\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|count\(1),
	datab => \audio_ctrl_inst|i2c_master_inst|count\(0),
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~0_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|count\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\);

-- Location: LCCOMB_X47_Y35_N30
\audio_ctrl_inst|i2c_master_inst|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~3_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add0~4_combout\ & ((\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ & ((\audio_ctrl_inst|i2c_master_inst|Add0~6_combout\))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ & (\audio_ctrl_inst|i2c_master_inst|Add0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~3_combout\);

-- Location: LCCOMB_X47_Y35_N8
\audio_ctrl_inst|i2c_master_inst|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~4_combout\ = (\audio_ctrl_inst|i2c_master_inst|process_0~3_combout\ & ((\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ & (!\audio_ctrl_inst|i2c_master_inst|Add0~8_combout\)) # 
-- (!\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\ & (\audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ & \audio_ctrl_inst|i2c_master_inst|count~2_combout\)))) # (!\audio_ctrl_inst|i2c_master_inst|process_0~3_combout\ & 
-- (\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|process_0~3_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|count~2_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~4_combout\);

-- Location: LCCOMB_X47_Y35_N10
\audio_ctrl_inst|i2c_master_inst|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_0~5_combout\ = (\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Add0~12_combout\) # (!\audio_ctrl_inst|i2c_master_inst|process_0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|process_0~4_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_0~5_combout\);

-- Location: LCCOMB_X47_Y35_N28
\audio_ctrl_inst|i2c_master_inst|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|LessThan1~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add0~2_combout\ & (\audio_ctrl_inst|i2c_master_inst|Add0~6_combout\ & (\audio_ctrl_inst|i2c_master_inst|Add0~8_combout\ & 
-- \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Add0~2_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~6_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Add0~8_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~4_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|LessThan1~0_combout\);

-- Location: LCCOMB_X47_Y35_N22
\audio_ctrl_inst|i2c_master_inst|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\ & ((\audio_ctrl_inst|i2c_master_inst|LessThan1~0_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Add0~12_combout\) # 
-- (\audio_ctrl_inst|i2c_master_inst|Add0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|LessThan1~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~10_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\);

-- Location: LCCOMB_X47_Y35_N0
\audio_ctrl_inst|i2c_master_inst|data_clk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|data_clk~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\ & ((!\audio_ctrl_inst|i2c_master_inst|process_0~2_combout\) # (!\audio_ctrl_inst|i2c_master_inst|process_0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|process_0~5_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|process_0~2_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|data_clk~0_combout\);

-- Location: FF_X47_Y35_N1
\audio_ctrl_inst|i2c_master_inst|data_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|data_clk~0_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_clk~q\);

-- Location: FF_X53_Y36_N11
\audio_ctrl_inst|i2c_master_inst|data_clk_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|i2c_master_inst|data_clk~q\,
	sload => VCC,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\);

-- Location: LCCOMB_X54_Y36_N14
\audio_ctrl_inst|i2c_master_inst|bit_cnt[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|bit_cnt[0]~5_combout\ = !\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	combout => \audio_ctrl_inst|i2c_master_inst|bit_cnt[0]~5_combout\);

-- Location: LCCOMB_X54_Y36_N28
\audio_ctrl_inst|i2c_master_inst|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\ = \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) $ (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\);

-- Location: FF_X54_Y36_N29
\audio_ctrl_inst|i2c_master_inst|bit_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1));

-- Location: LCCOMB_X54_Y36_N10
\audio_ctrl_inst|i2c_master_inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector20~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.wr~q\ & (((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1)) # (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datac => \audio_ctrl_inst|i2c_master_inst|state.wr~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector20~0_combout\);

-- Location: LCCOMB_X54_Y36_N8
\audio_ctrl_inst|i2c_master_inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\);

-- Location: LCCOMB_X56_Y36_N0
\audio_ctrl_inst|Selector35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector35~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|busy~q\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\) # (\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\,
	combout => \audio_ctrl_inst|Selector35~0_combout\);

-- Location: FF_X56_Y36_N1
\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector35~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\);

-- Location: LCCOMB_X56_Y36_N18
\audio_ctrl_inst|Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector36~0_combout\ = (!\audio_ctrl_inst|i2c_master_inst|busy~q\ & \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\,
	combout => \audio_ctrl_inst|Selector36~0_combout\);

-- Location: LCCOMB_X56_Y36_N12
\audio_ctrl_inst|Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector37~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|busy~q\ & \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\,
	combout => \audio_ctrl_inst|Selector37~0_combout\);

-- Location: LCCOMB_X57_Y37_N28
\audio_ctrl_inst|reg_cnt[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[14]~60_combout\ = (\audio_ctrl_inst|reg_cnt\(14) & (\audio_ctrl_inst|reg_cnt[13]~59\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(14) & (!\audio_ctrl_inst|reg_cnt[13]~59\ & VCC))
-- \audio_ctrl_inst|reg_cnt[14]~61\ = CARRY((\audio_ctrl_inst|reg_cnt\(14) & !\audio_ctrl_inst|reg_cnt[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(14),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[13]~59\,
	combout => \audio_ctrl_inst|reg_cnt[14]~60_combout\,
	cout => \audio_ctrl_inst|reg_cnt[14]~61\);

-- Location: LCCOMB_X57_Y37_N30
\audio_ctrl_inst|reg_cnt[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[15]~62_combout\ = (\audio_ctrl_inst|reg_cnt\(15) & (!\audio_ctrl_inst|reg_cnt[14]~61\)) # (!\audio_ctrl_inst|reg_cnt\(15) & ((\audio_ctrl_inst|reg_cnt[14]~61\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[15]~63\ = CARRY((!\audio_ctrl_inst|reg_cnt[14]~61\) # (!\audio_ctrl_inst|reg_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(15),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[14]~61\,
	combout => \audio_ctrl_inst|reg_cnt[15]~62_combout\,
	cout => \audio_ctrl_inst|reg_cnt[15]~63\);

-- Location: LCCOMB_X56_Y36_N30
\audio_ctrl_inst|cfg_fsm_state.RESET~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|cfg_fsm_state.RESET~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|busy~q\) # ((\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\) # ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\) # (\audio_ctrl_inst|cfg_fsm_state.DONE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|cfg_fsm_state.RESET~0_combout\);

-- Location: LCCOMB_X56_Y36_N16
\audio_ctrl_inst|cfg_fsm_state.RESET~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|cfg_fsm_state.RESET~1_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~0_combout\) # (\audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~0_combout\,
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|cfg_fsm_state.RESET~1_combout\);

-- Location: FF_X56_Y36_N17
\audio_ctrl_inst|cfg_fsm_state.RESET\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|cfg_fsm_state.RESET~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.RESET~q\);

-- Location: LCCOMB_X58_Y37_N22
\audio_ctrl_inst|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector16~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(15),
	combout => \audio_ctrl_inst|Selector16~0_combout\);

-- Location: FF_X57_Y37_N31
\audio_ctrl_inst|reg_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[15]~62_combout\,
	asdata => \audio_ctrl_inst|Selector16~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(15));

-- Location: LCCOMB_X57_Y36_N0
\audio_ctrl_inst|reg_cnt[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[16]~64_combout\ = (\audio_ctrl_inst|reg_cnt\(16) & (\audio_ctrl_inst|reg_cnt[15]~63\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(16) & (!\audio_ctrl_inst|reg_cnt[15]~63\ & VCC))
-- \audio_ctrl_inst|reg_cnt[16]~65\ = CARRY((\audio_ctrl_inst|reg_cnt\(16) & !\audio_ctrl_inst|reg_cnt[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(16),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[15]~63\,
	combout => \audio_ctrl_inst|reg_cnt[16]~64_combout\,
	cout => \audio_ctrl_inst|reg_cnt[16]~65\);

-- Location: LCCOMB_X58_Y36_N6
\audio_ctrl_inst|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector15~0_combout\ = (\audio_ctrl_inst|reg_cnt\(16) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(16),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector15~0_combout\);

-- Location: FF_X57_Y36_N1
\audio_ctrl_inst|reg_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[16]~64_combout\,
	asdata => \audio_ctrl_inst|Selector15~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(16));

-- Location: LCCOMB_X57_Y36_N2
\audio_ctrl_inst|reg_cnt[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[17]~66_combout\ = (\audio_ctrl_inst|reg_cnt\(17) & (!\audio_ctrl_inst|reg_cnt[16]~65\)) # (!\audio_ctrl_inst|reg_cnt\(17) & ((\audio_ctrl_inst|reg_cnt[16]~65\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[17]~67\ = CARRY((!\audio_ctrl_inst|reg_cnt[16]~65\) # (!\audio_ctrl_inst|reg_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(17),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[16]~65\,
	combout => \audio_ctrl_inst|reg_cnt[17]~66_combout\,
	cout => \audio_ctrl_inst|reg_cnt[17]~67\);

-- Location: LCCOMB_X58_Y36_N24
\audio_ctrl_inst|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector14~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(17),
	combout => \audio_ctrl_inst|Selector14~0_combout\);

-- Location: FF_X57_Y36_N3
\audio_ctrl_inst|reg_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[17]~66_combout\,
	asdata => \audio_ctrl_inst|Selector14~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(17));

-- Location: LCCOMB_X57_Y36_N4
\audio_ctrl_inst|reg_cnt[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[18]~68_combout\ = (\audio_ctrl_inst|reg_cnt\(18) & (\audio_ctrl_inst|reg_cnt[17]~67\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(18) & (!\audio_ctrl_inst|reg_cnt[17]~67\ & VCC))
-- \audio_ctrl_inst|reg_cnt[18]~69\ = CARRY((\audio_ctrl_inst|reg_cnt\(18) & !\audio_ctrl_inst|reg_cnt[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(18),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[17]~67\,
	combout => \audio_ctrl_inst|reg_cnt[18]~68_combout\,
	cout => \audio_ctrl_inst|reg_cnt[18]~69\);

-- Location: LCCOMB_X59_Y36_N6
\audio_ctrl_inst|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector13~0_combout\ = (\audio_ctrl_inst|reg_cnt\(18) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(18),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector13~0_combout\);

-- Location: FF_X57_Y36_N5
\audio_ctrl_inst|reg_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[18]~68_combout\,
	asdata => \audio_ctrl_inst|Selector13~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(18));

-- Location: LCCOMB_X57_Y36_N6
\audio_ctrl_inst|reg_cnt[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[19]~70_combout\ = (\audio_ctrl_inst|reg_cnt\(19) & (!\audio_ctrl_inst|reg_cnt[18]~69\)) # (!\audio_ctrl_inst|reg_cnt\(19) & ((\audio_ctrl_inst|reg_cnt[18]~69\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[19]~71\ = CARRY((!\audio_ctrl_inst|reg_cnt[18]~69\) # (!\audio_ctrl_inst|reg_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(19),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[18]~69\,
	combout => \audio_ctrl_inst|reg_cnt[19]~70_combout\,
	cout => \audio_ctrl_inst|reg_cnt[19]~71\);

-- Location: LCCOMB_X58_Y36_N26
\audio_ctrl_inst|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector12~0_combout\ = (\audio_ctrl_inst|reg_cnt\(19) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(19),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector12~0_combout\);

-- Location: FF_X57_Y36_N7
\audio_ctrl_inst|reg_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[19]~70_combout\,
	asdata => \audio_ctrl_inst|Selector12~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(19));

-- Location: LCCOMB_X57_Y36_N8
\audio_ctrl_inst|reg_cnt[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[20]~72_combout\ = (\audio_ctrl_inst|reg_cnt\(20) & (\audio_ctrl_inst|reg_cnt[19]~71\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(20) & (!\audio_ctrl_inst|reg_cnt[19]~71\ & VCC))
-- \audio_ctrl_inst|reg_cnt[20]~73\ = CARRY((\audio_ctrl_inst|reg_cnt\(20) & !\audio_ctrl_inst|reg_cnt[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(20),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[19]~71\,
	combout => \audio_ctrl_inst|reg_cnt[20]~72_combout\,
	cout => \audio_ctrl_inst|reg_cnt[20]~73\);

-- Location: LCCOMB_X58_Y36_N20
\audio_ctrl_inst|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector11~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(20))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(20),
	combout => \audio_ctrl_inst|Selector11~0_combout\);

-- Location: FF_X57_Y36_N9
\audio_ctrl_inst|reg_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[20]~72_combout\,
	asdata => \audio_ctrl_inst|Selector11~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(20));

-- Location: LCCOMB_X57_Y36_N10
\audio_ctrl_inst|reg_cnt[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[21]~74_combout\ = (\audio_ctrl_inst|reg_cnt\(21) & (!\audio_ctrl_inst|reg_cnt[20]~73\)) # (!\audio_ctrl_inst|reg_cnt\(21) & ((\audio_ctrl_inst|reg_cnt[20]~73\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[21]~75\ = CARRY((!\audio_ctrl_inst|reg_cnt[20]~73\) # (!\audio_ctrl_inst|reg_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(21),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[20]~73\,
	combout => \audio_ctrl_inst|reg_cnt[21]~74_combout\,
	cout => \audio_ctrl_inst|reg_cnt[21]~75\);

-- Location: LCCOMB_X58_Y36_N30
\audio_ctrl_inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector10~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(21),
	combout => \audio_ctrl_inst|Selector10~0_combout\);

-- Location: FF_X57_Y36_N11
\audio_ctrl_inst|reg_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[21]~74_combout\,
	asdata => \audio_ctrl_inst|Selector10~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(21));

-- Location: LCCOMB_X57_Y36_N12
\audio_ctrl_inst|reg_cnt[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[22]~76_combout\ = (\audio_ctrl_inst|reg_cnt\(22) & (\audio_ctrl_inst|reg_cnt[21]~75\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(22) & (!\audio_ctrl_inst|reg_cnt[21]~75\ & VCC))
-- \audio_ctrl_inst|reg_cnt[22]~77\ = CARRY((\audio_ctrl_inst|reg_cnt\(22) & !\audio_ctrl_inst|reg_cnt[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(22),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[21]~75\,
	combout => \audio_ctrl_inst|reg_cnt[22]~76_combout\,
	cout => \audio_ctrl_inst|reg_cnt[22]~77\);

-- Location: LCCOMB_X58_Y36_N8
\audio_ctrl_inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector9~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(22),
	combout => \audio_ctrl_inst|Selector9~0_combout\);

-- Location: FF_X57_Y36_N13
\audio_ctrl_inst|reg_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[22]~76_combout\,
	asdata => \audio_ctrl_inst|Selector9~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(22));

-- Location: LCCOMB_X57_Y36_N14
\audio_ctrl_inst|reg_cnt[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[23]~78_combout\ = (\audio_ctrl_inst|reg_cnt\(23) & (!\audio_ctrl_inst|reg_cnt[22]~77\)) # (!\audio_ctrl_inst|reg_cnt\(23) & ((\audio_ctrl_inst|reg_cnt[22]~77\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[23]~79\ = CARRY((!\audio_ctrl_inst|reg_cnt[22]~77\) # (!\audio_ctrl_inst|reg_cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(23),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[22]~77\,
	combout => \audio_ctrl_inst|reg_cnt[23]~78_combout\,
	cout => \audio_ctrl_inst|reg_cnt[23]~79\);

-- Location: LCCOMB_X58_Y36_N18
\audio_ctrl_inst|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector8~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(23),
	combout => \audio_ctrl_inst|Selector8~0_combout\);

-- Location: FF_X57_Y36_N15
\audio_ctrl_inst|reg_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[23]~78_combout\,
	asdata => \audio_ctrl_inst|Selector8~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(23));

-- Location: LCCOMB_X58_Y36_N2
\audio_ctrl_inst|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~6_combout\ = (!\audio_ctrl_inst|reg_cnt\(22) & (!\audio_ctrl_inst|reg_cnt\(23) & (!\audio_ctrl_inst|reg_cnt\(21) & !\audio_ctrl_inst|reg_cnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(22),
	datab => \audio_ctrl_inst|reg_cnt\(23),
	datac => \audio_ctrl_inst|reg_cnt\(21),
	datad => \audio_ctrl_inst|reg_cnt\(20),
	combout => \audio_ctrl_inst|Equal0~6_combout\);

-- Location: LCCOMB_X57_Y36_N16
\audio_ctrl_inst|reg_cnt[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[24]~80_combout\ = (\audio_ctrl_inst|reg_cnt\(24) & (\audio_ctrl_inst|reg_cnt[23]~79\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(24) & (!\audio_ctrl_inst|reg_cnt[23]~79\ & VCC))
-- \audio_ctrl_inst|reg_cnt[24]~81\ = CARRY((\audio_ctrl_inst|reg_cnt\(24) & !\audio_ctrl_inst|reg_cnt[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(24),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[23]~79\,
	combout => \audio_ctrl_inst|reg_cnt[24]~80_combout\,
	cout => \audio_ctrl_inst|reg_cnt[24]~81\);

-- Location: LCCOMB_X58_Y36_N12
\audio_ctrl_inst|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector7~0_combout\ = (\audio_ctrl_inst|reg_cnt\(24) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(24),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector7~0_combout\);

-- Location: FF_X57_Y36_N17
\audio_ctrl_inst|reg_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[24]~80_combout\,
	asdata => \audio_ctrl_inst|Selector7~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(24));

-- Location: LCCOMB_X57_Y36_N18
\audio_ctrl_inst|reg_cnt[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[25]~82_combout\ = (\audio_ctrl_inst|reg_cnt\(25) & (!\audio_ctrl_inst|reg_cnt[24]~81\)) # (!\audio_ctrl_inst|reg_cnt\(25) & ((\audio_ctrl_inst|reg_cnt[24]~81\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[25]~83\ = CARRY((!\audio_ctrl_inst|reg_cnt[24]~81\) # (!\audio_ctrl_inst|reg_cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(25),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[24]~81\,
	combout => \audio_ctrl_inst|reg_cnt[25]~82_combout\,
	cout => \audio_ctrl_inst|reg_cnt[25]~83\);

-- Location: LCCOMB_X58_Y36_N14
\audio_ctrl_inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector6~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(25),
	combout => \audio_ctrl_inst|Selector6~0_combout\);

-- Location: FF_X57_Y36_N19
\audio_ctrl_inst|reg_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[25]~82_combout\,
	asdata => \audio_ctrl_inst|Selector6~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(25));

-- Location: LCCOMB_X57_Y36_N20
\audio_ctrl_inst|reg_cnt[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[26]~84_combout\ = (\audio_ctrl_inst|reg_cnt\(26) & (\audio_ctrl_inst|reg_cnt[25]~83\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(26) & (!\audio_ctrl_inst|reg_cnt[25]~83\ & VCC))
-- \audio_ctrl_inst|reg_cnt[26]~85\ = CARRY((\audio_ctrl_inst|reg_cnt\(26) & !\audio_ctrl_inst|reg_cnt[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(26),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[25]~83\,
	combout => \audio_ctrl_inst|reg_cnt[26]~84_combout\,
	cout => \audio_ctrl_inst|reg_cnt[26]~85\);

-- Location: LCCOMB_X58_Y36_N0
\audio_ctrl_inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector5~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(26))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(26),
	combout => \audio_ctrl_inst|Selector5~0_combout\);

-- Location: FF_X57_Y36_N21
\audio_ctrl_inst|reg_cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[26]~84_combout\,
	asdata => \audio_ctrl_inst|Selector5~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(26));

-- Location: LCCOMB_X57_Y36_N22
\audio_ctrl_inst|reg_cnt[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[27]~86_combout\ = (\audio_ctrl_inst|reg_cnt\(27) & (!\audio_ctrl_inst|reg_cnt[26]~85\)) # (!\audio_ctrl_inst|reg_cnt\(27) & ((\audio_ctrl_inst|reg_cnt[26]~85\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[27]~87\ = CARRY((!\audio_ctrl_inst|reg_cnt[26]~85\) # (!\audio_ctrl_inst|reg_cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(27),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[26]~85\,
	combout => \audio_ctrl_inst|reg_cnt[27]~86_combout\,
	cout => \audio_ctrl_inst|reg_cnt[27]~87\);

-- Location: LCCOMB_X58_Y36_N10
\audio_ctrl_inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector4~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(27),
	combout => \audio_ctrl_inst|Selector4~0_combout\);

-- Location: FF_X57_Y36_N23
\audio_ctrl_inst|reg_cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[27]~86_combout\,
	asdata => \audio_ctrl_inst|Selector4~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(27));

-- Location: LCCOMB_X58_Y36_N28
\audio_ctrl_inst|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~7_combout\ = (!\audio_ctrl_inst|reg_cnt\(27) & (!\audio_ctrl_inst|reg_cnt\(26) & (!\audio_ctrl_inst|reg_cnt\(24) & !\audio_ctrl_inst|reg_cnt\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(27),
	datab => \audio_ctrl_inst|reg_cnt\(26),
	datac => \audio_ctrl_inst|reg_cnt\(24),
	datad => \audio_ctrl_inst|reg_cnt\(25),
	combout => \audio_ctrl_inst|Equal0~7_combout\);

-- Location: LCCOMB_X58_Y36_N16
\audio_ctrl_inst|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~5_combout\ = (!\audio_ctrl_inst|reg_cnt\(16) & (!\audio_ctrl_inst|reg_cnt\(19) & (!\audio_ctrl_inst|reg_cnt\(18) & !\audio_ctrl_inst|reg_cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(16),
	datab => \audio_ctrl_inst|reg_cnt\(19),
	datac => \audio_ctrl_inst|reg_cnt\(18),
	datad => \audio_ctrl_inst|reg_cnt\(17),
	combout => \audio_ctrl_inst|Equal0~5_combout\);

-- Location: LCCOMB_X57_Y36_N24
\audio_ctrl_inst|reg_cnt[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[28]~88_combout\ = (\audio_ctrl_inst|reg_cnt\(28) & (\audio_ctrl_inst|reg_cnt[27]~87\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(28) & (!\audio_ctrl_inst|reg_cnt[27]~87\ & VCC))
-- \audio_ctrl_inst|reg_cnt[28]~89\ = CARRY((\audio_ctrl_inst|reg_cnt\(28) & !\audio_ctrl_inst|reg_cnt[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(28),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[27]~87\,
	combout => \audio_ctrl_inst|reg_cnt[28]~88_combout\,
	cout => \audio_ctrl_inst|reg_cnt[28]~89\);

-- Location: LCCOMB_X58_Y36_N4
\audio_ctrl_inst|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector3~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(28))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(28),
	combout => \audio_ctrl_inst|Selector3~0_combout\);

-- Location: FF_X57_Y36_N25
\audio_ctrl_inst|reg_cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[28]~88_combout\,
	asdata => \audio_ctrl_inst|Selector3~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(28));

-- Location: LCCOMB_X57_Y36_N26
\audio_ctrl_inst|reg_cnt[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[29]~90_combout\ = (\audio_ctrl_inst|reg_cnt\(29) & (!\audio_ctrl_inst|reg_cnt[28]~89\)) # (!\audio_ctrl_inst|reg_cnt\(29) & ((\audio_ctrl_inst|reg_cnt[28]~89\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[29]~91\ = CARRY((!\audio_ctrl_inst|reg_cnt[28]~89\) # (!\audio_ctrl_inst|reg_cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(29),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[28]~89\,
	combout => \audio_ctrl_inst|reg_cnt[29]~90_combout\,
	cout => \audio_ctrl_inst|reg_cnt[29]~91\);

-- Location: LCCOMB_X56_Y36_N26
\audio_ctrl_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector2~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(29))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(29),
	combout => \audio_ctrl_inst|Selector2~0_combout\);

-- Location: FF_X57_Y36_N27
\audio_ctrl_inst|reg_cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[29]~90_combout\,
	asdata => \audio_ctrl_inst|Selector2~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(29));

-- Location: LCCOMB_X57_Y36_N28
\audio_ctrl_inst|reg_cnt[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[30]~92_combout\ = (\audio_ctrl_inst|reg_cnt\(30) & (\audio_ctrl_inst|reg_cnt[29]~91\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(30) & (!\audio_ctrl_inst|reg_cnt[29]~91\ & VCC))
-- \audio_ctrl_inst|reg_cnt[30]~93\ = CARRY((\audio_ctrl_inst|reg_cnt\(30) & !\audio_ctrl_inst|reg_cnt[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(30),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[29]~91\,
	combout => \audio_ctrl_inst|reg_cnt[30]~92_combout\,
	cout => \audio_ctrl_inst|reg_cnt[30]~93\);

-- Location: LCCOMB_X58_Y36_N22
\audio_ctrl_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector1~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(30))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|reg_cnt\(30),
	combout => \audio_ctrl_inst|Selector1~0_combout\);

-- Location: FF_X57_Y36_N29
\audio_ctrl_inst|reg_cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[30]~92_combout\,
	asdata => \audio_ctrl_inst|Selector1~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(30));

-- Location: LCCOMB_X57_Y36_N30
\audio_ctrl_inst|reg_cnt[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[31]~94_combout\ = \audio_ctrl_inst|reg_cnt\(31) $ (\audio_ctrl_inst|reg_cnt[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(31),
	cin => \audio_ctrl_inst|reg_cnt[30]~93\,
	combout => \audio_ctrl_inst|reg_cnt[31]~94_combout\);

-- Location: LCCOMB_X59_Y36_N8
\audio_ctrl_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector0~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(31),
	combout => \audio_ctrl_inst|Selector0~0_combout\);

-- Location: FF_X57_Y36_N31
\audio_ctrl_inst|reg_cnt[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[31]~94_combout\,
	asdata => \audio_ctrl_inst|Selector0~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(31));

-- Location: LCCOMB_X59_Y36_N24
\audio_ctrl_inst|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~8_combout\ = (!\audio_ctrl_inst|reg_cnt\(29) & (!\audio_ctrl_inst|reg_cnt\(31) & (!\audio_ctrl_inst|reg_cnt\(30) & !\audio_ctrl_inst|reg_cnt\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(29),
	datab => \audio_ctrl_inst|reg_cnt\(31),
	datac => \audio_ctrl_inst|reg_cnt\(30),
	datad => \audio_ctrl_inst|reg_cnt\(28),
	combout => \audio_ctrl_inst|Equal0~8_combout\);

-- Location: LCCOMB_X59_Y36_N10
\audio_ctrl_inst|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~9_combout\ = (\audio_ctrl_inst|Equal0~6_combout\ & (\audio_ctrl_inst|Equal0~7_combout\ & (\audio_ctrl_inst|Equal0~5_combout\ & \audio_ctrl_inst|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal0~6_combout\,
	datab => \audio_ctrl_inst|Equal0~7_combout\,
	datac => \audio_ctrl_inst|Equal0~5_combout\,
	datad => \audio_ctrl_inst|Equal0~8_combout\,
	combout => \audio_ctrl_inst|Equal0~9_combout\);

-- Location: LCCOMB_X56_Y36_N14
\audio_ctrl_inst|reg_cnt_nxt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt_nxt~0_combout\ = ((\audio_ctrl_inst|Equal0~4_combout\ & \audio_ctrl_inst|Equal0~9_combout\)) # (!\audio_ctrl_inst|i2c_master_inst|busy~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datac => \audio_ctrl_inst|Equal0~4_combout\,
	datad => \audio_ctrl_inst|Equal0~9_combout\,
	combout => \audio_ctrl_inst|reg_cnt_nxt~0_combout\);

-- Location: LCCOMB_X57_Y37_N0
\audio_ctrl_inst|reg_cnt[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[0]~32_combout\ = (\audio_ctrl_inst|reg_cnt_nxt~0_combout\ & (\audio_ctrl_inst|reg_cnt\(0) & VCC)) # (!\audio_ctrl_inst|reg_cnt_nxt~0_combout\ & (\audio_ctrl_inst|reg_cnt\(0) $ (VCC)))
-- \audio_ctrl_inst|reg_cnt[0]~33\ = CARRY((!\audio_ctrl_inst|reg_cnt_nxt~0_combout\ & \audio_ctrl_inst|reg_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt_nxt~0_combout\,
	datab => \audio_ctrl_inst|reg_cnt\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|reg_cnt[0]~32_combout\,
	cout => \audio_ctrl_inst|reg_cnt[0]~33\);

-- Location: LCCOMB_X56_Y37_N16
\audio_ctrl_inst|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector31~0_combout\ = (\audio_ctrl_inst|reg_cnt\(0) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(0),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector31~0_combout\);

-- Location: FF_X57_Y37_N1
\audio_ctrl_inst|reg_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[0]~32_combout\,
	asdata => \audio_ctrl_inst|Selector31~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(0));

-- Location: LCCOMB_X57_Y37_N2
\audio_ctrl_inst|reg_cnt[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[1]~34_combout\ = (\audio_ctrl_inst|reg_cnt\(1) & (!\audio_ctrl_inst|reg_cnt[0]~33\)) # (!\audio_ctrl_inst|reg_cnt\(1) & ((\audio_ctrl_inst|reg_cnt[0]~33\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[1]~35\ = CARRY((!\audio_ctrl_inst|reg_cnt[0]~33\) # (!\audio_ctrl_inst|reg_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[0]~33\,
	combout => \audio_ctrl_inst|reg_cnt[1]~34_combout\,
	cout => \audio_ctrl_inst|reg_cnt[1]~35\);

-- Location: LCCOMB_X56_Y37_N26
\audio_ctrl_inst|Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector30~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|reg_cnt\(1),
	combout => \audio_ctrl_inst|Selector30~0_combout\);

-- Location: FF_X57_Y37_N3
\audio_ctrl_inst|reg_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[1]~34_combout\,
	asdata => \audio_ctrl_inst|Selector30~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(1));

-- Location: LCCOMB_X57_Y37_N4
\audio_ctrl_inst|reg_cnt[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[2]~36_combout\ = (\audio_ctrl_inst|reg_cnt\(2) & (\audio_ctrl_inst|reg_cnt[1]~35\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(2) & (!\audio_ctrl_inst|reg_cnt[1]~35\ & VCC))
-- \audio_ctrl_inst|reg_cnt[2]~37\ = CARRY((\audio_ctrl_inst|reg_cnt\(2) & !\audio_ctrl_inst|reg_cnt[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[1]~35\,
	combout => \audio_ctrl_inst|reg_cnt[2]~36_combout\,
	cout => \audio_ctrl_inst|reg_cnt[2]~37\);

-- Location: LCCOMB_X58_Y37_N26
\audio_ctrl_inst|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector29~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|reg_cnt\(2),
	combout => \audio_ctrl_inst|Selector29~0_combout\);

-- Location: FF_X57_Y37_N5
\audio_ctrl_inst|reg_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[2]~36_combout\,
	asdata => \audio_ctrl_inst|Selector29~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(2));

-- Location: LCCOMB_X57_Y37_N6
\audio_ctrl_inst|reg_cnt[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[3]~38_combout\ = (\audio_ctrl_inst|reg_cnt\(3) & (!\audio_ctrl_inst|reg_cnt[2]~37\)) # (!\audio_ctrl_inst|reg_cnt\(3) & ((\audio_ctrl_inst|reg_cnt[2]~37\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[3]~39\ = CARRY((!\audio_ctrl_inst|reg_cnt[2]~37\) # (!\audio_ctrl_inst|reg_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[2]~37\,
	combout => \audio_ctrl_inst|reg_cnt[3]~38_combout\,
	cout => \audio_ctrl_inst|reg_cnt[3]~39\);

-- Location: LCCOMB_X56_Y37_N4
\audio_ctrl_inst|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector28~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(3),
	combout => \audio_ctrl_inst|Selector28~0_combout\);

-- Location: FF_X57_Y37_N7
\audio_ctrl_inst|reg_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[3]~38_combout\,
	asdata => \audio_ctrl_inst|Selector28~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(3));

-- Location: LCCOMB_X57_Y37_N8
\audio_ctrl_inst|reg_cnt[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[4]~40_combout\ = (\audio_ctrl_inst|reg_cnt\(4) & (\audio_ctrl_inst|reg_cnt[3]~39\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(4) & (!\audio_ctrl_inst|reg_cnt[3]~39\ & VCC))
-- \audio_ctrl_inst|reg_cnt[4]~41\ = CARRY((\audio_ctrl_inst|reg_cnt\(4) & !\audio_ctrl_inst|reg_cnt[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[3]~39\,
	combout => \audio_ctrl_inst|reg_cnt[4]~40_combout\,
	cout => \audio_ctrl_inst|reg_cnt[4]~41\);

-- Location: LCCOMB_X58_Y37_N20
\audio_ctrl_inst|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector27~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(4),
	combout => \audio_ctrl_inst|Selector27~0_combout\);

-- Location: FF_X57_Y37_N9
\audio_ctrl_inst|reg_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[4]~40_combout\,
	asdata => \audio_ctrl_inst|Selector27~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(4));

-- Location: LCCOMB_X57_Y37_N10
\audio_ctrl_inst|reg_cnt[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[5]~42_combout\ = (\audio_ctrl_inst|reg_cnt\(5) & (!\audio_ctrl_inst|reg_cnt[4]~41\)) # (!\audio_ctrl_inst|reg_cnt\(5) & ((\audio_ctrl_inst|reg_cnt[4]~41\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[5]~43\ = CARRY((!\audio_ctrl_inst|reg_cnt[4]~41\) # (!\audio_ctrl_inst|reg_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[4]~41\,
	combout => \audio_ctrl_inst|reg_cnt[5]~42_combout\,
	cout => \audio_ctrl_inst|reg_cnt[5]~43\);

-- Location: LCCOMB_X58_Y37_N30
\audio_ctrl_inst|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector26~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(5),
	combout => \audio_ctrl_inst|Selector26~0_combout\);

-- Location: FF_X57_Y37_N11
\audio_ctrl_inst|reg_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[5]~42_combout\,
	asdata => \audio_ctrl_inst|Selector26~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(5));

-- Location: LCCOMB_X57_Y37_N12
\audio_ctrl_inst|reg_cnt[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[6]~44_combout\ = (\audio_ctrl_inst|reg_cnt\(6) & (\audio_ctrl_inst|reg_cnt[5]~43\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(6) & (!\audio_ctrl_inst|reg_cnt[5]~43\ & VCC))
-- \audio_ctrl_inst|reg_cnt[6]~45\ = CARRY((\audio_ctrl_inst|reg_cnt\(6) & !\audio_ctrl_inst|reg_cnt[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(6),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[5]~43\,
	combout => \audio_ctrl_inst|reg_cnt[6]~44_combout\,
	cout => \audio_ctrl_inst|reg_cnt[6]~45\);

-- Location: LCCOMB_X58_Y37_N0
\audio_ctrl_inst|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector25~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(6),
	combout => \audio_ctrl_inst|Selector25~0_combout\);

-- Location: FF_X57_Y37_N13
\audio_ctrl_inst|reg_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[6]~44_combout\,
	asdata => \audio_ctrl_inst|Selector25~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(6));

-- Location: LCCOMB_X57_Y37_N14
\audio_ctrl_inst|reg_cnt[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[7]~46_combout\ = (\audio_ctrl_inst|reg_cnt\(7) & (!\audio_ctrl_inst|reg_cnt[6]~45\)) # (!\audio_ctrl_inst|reg_cnt\(7) & ((\audio_ctrl_inst|reg_cnt[6]~45\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[7]~47\ = CARRY((!\audio_ctrl_inst|reg_cnt[6]~45\) # (!\audio_ctrl_inst|reg_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(7),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[6]~45\,
	combout => \audio_ctrl_inst|reg_cnt[7]~46_combout\,
	cout => \audio_ctrl_inst|reg_cnt[7]~47\);

-- Location: LCCOMB_X59_Y36_N12
\audio_ctrl_inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector24~0_combout\ = (\audio_ctrl_inst|reg_cnt\(7) & \audio_ctrl_inst|cfg_fsm_state.RESET~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|reg_cnt\(7),
	datad => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	combout => \audio_ctrl_inst|Selector24~0_combout\);

-- Location: FF_X57_Y37_N15
\audio_ctrl_inst|reg_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[7]~46_combout\,
	asdata => \audio_ctrl_inst|Selector24~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(7));

-- Location: LCCOMB_X57_Y37_N16
\audio_ctrl_inst|reg_cnt[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[8]~48_combout\ = (\audio_ctrl_inst|reg_cnt\(8) & (\audio_ctrl_inst|reg_cnt[7]~47\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(8) & (!\audio_ctrl_inst|reg_cnt[7]~47\ & VCC))
-- \audio_ctrl_inst|reg_cnt[8]~49\ = CARRY((\audio_ctrl_inst|reg_cnt\(8) & !\audio_ctrl_inst|reg_cnt[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(8),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[7]~47\,
	combout => \audio_ctrl_inst|reg_cnt[8]~48_combout\,
	cout => \audio_ctrl_inst|reg_cnt[8]~49\);

-- Location: LCCOMB_X58_Y37_N2
\audio_ctrl_inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector23~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|reg_cnt\(8),
	combout => \audio_ctrl_inst|Selector23~0_combout\);

-- Location: FF_X57_Y37_N17
\audio_ctrl_inst|reg_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[8]~48_combout\,
	asdata => \audio_ctrl_inst|Selector23~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(8));

-- Location: LCCOMB_X57_Y37_N18
\audio_ctrl_inst|reg_cnt[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[9]~50_combout\ = (\audio_ctrl_inst|reg_cnt\(9) & (!\audio_ctrl_inst|reg_cnt[8]~49\)) # (!\audio_ctrl_inst|reg_cnt\(9) & ((\audio_ctrl_inst|reg_cnt[8]~49\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[9]~51\ = CARRY((!\audio_ctrl_inst|reg_cnt[8]~49\) # (!\audio_ctrl_inst|reg_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(9),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[8]~49\,
	combout => \audio_ctrl_inst|reg_cnt[9]~50_combout\,
	cout => \audio_ctrl_inst|reg_cnt[9]~51\);

-- Location: LCCOMB_X58_Y37_N12
\audio_ctrl_inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector22~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(9),
	combout => \audio_ctrl_inst|Selector22~0_combout\);

-- Location: FF_X57_Y37_N19
\audio_ctrl_inst|reg_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[9]~50_combout\,
	asdata => \audio_ctrl_inst|Selector22~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(9));

-- Location: LCCOMB_X57_Y37_N20
\audio_ctrl_inst|reg_cnt[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[10]~52_combout\ = (\audio_ctrl_inst|reg_cnt\(10) & (\audio_ctrl_inst|reg_cnt[9]~51\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(10) & (!\audio_ctrl_inst|reg_cnt[9]~51\ & VCC))
-- \audio_ctrl_inst|reg_cnt[10]~53\ = CARRY((\audio_ctrl_inst|reg_cnt\(10) & !\audio_ctrl_inst|reg_cnt[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(10),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[9]~51\,
	combout => \audio_ctrl_inst|reg_cnt[10]~52_combout\,
	cout => \audio_ctrl_inst|reg_cnt[10]~53\);

-- Location: LCCOMB_X58_Y37_N14
\audio_ctrl_inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector21~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(10),
	combout => \audio_ctrl_inst|Selector21~0_combout\);

-- Location: FF_X57_Y37_N21
\audio_ctrl_inst|reg_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[10]~52_combout\,
	asdata => \audio_ctrl_inst|Selector21~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(10));

-- Location: LCCOMB_X57_Y37_N22
\audio_ctrl_inst|reg_cnt[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[11]~54_combout\ = (\audio_ctrl_inst|reg_cnt\(11) & (!\audio_ctrl_inst|reg_cnt[10]~53\)) # (!\audio_ctrl_inst|reg_cnt\(11) & ((\audio_ctrl_inst|reg_cnt[10]~53\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[11]~55\ = CARRY((!\audio_ctrl_inst|reg_cnt[10]~53\) # (!\audio_ctrl_inst|reg_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(11),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[10]~53\,
	combout => \audio_ctrl_inst|reg_cnt[11]~54_combout\,
	cout => \audio_ctrl_inst|reg_cnt[11]~55\);

-- Location: LCCOMB_X56_Y37_N6
\audio_ctrl_inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector20~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(11),
	combout => \audio_ctrl_inst|Selector20~0_combout\);

-- Location: FF_X57_Y37_N23
\audio_ctrl_inst|reg_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[11]~54_combout\,
	asdata => \audio_ctrl_inst|Selector20~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(11));

-- Location: LCCOMB_X57_Y37_N24
\audio_ctrl_inst|reg_cnt[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[12]~56_combout\ = (\audio_ctrl_inst|reg_cnt\(12) & (\audio_ctrl_inst|reg_cnt[11]~55\ $ (GND))) # (!\audio_ctrl_inst|reg_cnt\(12) & (!\audio_ctrl_inst|reg_cnt[11]~55\ & VCC))
-- \audio_ctrl_inst|reg_cnt[12]~57\ = CARRY((\audio_ctrl_inst|reg_cnt\(12) & !\audio_ctrl_inst|reg_cnt[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|reg_cnt\(12),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[11]~55\,
	combout => \audio_ctrl_inst|reg_cnt[12]~56_combout\,
	cout => \audio_ctrl_inst|reg_cnt[12]~57\);

-- Location: LCCOMB_X58_Y37_N8
\audio_ctrl_inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector19~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(12),
	combout => \audio_ctrl_inst|Selector19~0_combout\);

-- Location: FF_X57_Y37_N25
\audio_ctrl_inst|reg_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[12]~56_combout\,
	asdata => \audio_ctrl_inst|Selector19~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(12));

-- Location: LCCOMB_X57_Y37_N26
\audio_ctrl_inst|reg_cnt[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|reg_cnt[13]~58_combout\ = (\audio_ctrl_inst|reg_cnt\(13) & (!\audio_ctrl_inst|reg_cnt[12]~57\)) # (!\audio_ctrl_inst|reg_cnt\(13) & ((\audio_ctrl_inst|reg_cnt[12]~57\) # (GND)))
-- \audio_ctrl_inst|reg_cnt[13]~59\ = CARRY((!\audio_ctrl_inst|reg_cnt[12]~57\) # (!\audio_ctrl_inst|reg_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(13),
	datad => VCC,
	cin => \audio_ctrl_inst|reg_cnt[12]~57\,
	combout => \audio_ctrl_inst|reg_cnt[13]~58_combout\,
	cout => \audio_ctrl_inst|reg_cnt[13]~59\);

-- Location: LCCOMB_X58_Y37_N10
\audio_ctrl_inst|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector18~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|reg_cnt\(13),
	combout => \audio_ctrl_inst|Selector18~0_combout\);

-- Location: FF_X57_Y37_N27
\audio_ctrl_inst|reg_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[13]~58_combout\,
	asdata => \audio_ctrl_inst|Selector18~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(13));

-- Location: LCCOMB_X58_Y37_N28
\audio_ctrl_inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector17~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.RESET~q\ & \audio_ctrl_inst|reg_cnt\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datad => \audio_ctrl_inst|reg_cnt\(14),
	combout => \audio_ctrl_inst|Selector17~0_combout\);

-- Location: FF_X57_Y37_N29
\audio_ctrl_inst|reg_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|reg_cnt[14]~60_combout\,
	asdata => \audio_ctrl_inst|Selector17~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \audio_ctrl_inst|ALT_INV_cfg_fsm_state.WAIT_BUSY_LOW~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|reg_cnt\(14));

-- Location: LCCOMB_X58_Y37_N6
\audio_ctrl_inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~3_combout\ = (!\audio_ctrl_inst|reg_cnt\(14) & (!\audio_ctrl_inst|reg_cnt\(15) & (!\audio_ctrl_inst|reg_cnt\(13) & !\audio_ctrl_inst|reg_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(14),
	datab => \audio_ctrl_inst|reg_cnt\(15),
	datac => \audio_ctrl_inst|reg_cnt\(13),
	datad => \audio_ctrl_inst|reg_cnt\(12),
	combout => \audio_ctrl_inst|Equal0~3_combout\);

-- Location: LCCOMB_X58_Y37_N24
\audio_ctrl_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~0_combout\ = (\audio_ctrl_inst|reg_cnt\(0) & (!\audio_ctrl_inst|reg_cnt\(2) & (!\audio_ctrl_inst|reg_cnt\(3) & \audio_ctrl_inst|reg_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(0),
	datab => \audio_ctrl_inst|reg_cnt\(2),
	datac => \audio_ctrl_inst|reg_cnt\(3),
	datad => \audio_ctrl_inst|reg_cnt\(1),
	combout => \audio_ctrl_inst|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y37_N4
\audio_ctrl_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~2_combout\ = (!\audio_ctrl_inst|reg_cnt\(11) & (!\audio_ctrl_inst|reg_cnt\(9) & (!\audio_ctrl_inst|reg_cnt\(8) & !\audio_ctrl_inst|reg_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(11),
	datab => \audio_ctrl_inst|reg_cnt\(9),
	datac => \audio_ctrl_inst|reg_cnt\(8),
	datad => \audio_ctrl_inst|reg_cnt\(10),
	combout => \audio_ctrl_inst|Equal0~2_combout\);

-- Location: LCCOMB_X58_Y37_N18
\audio_ctrl_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~1_combout\ = (!\audio_ctrl_inst|reg_cnt\(6) & (!\audio_ctrl_inst|reg_cnt\(7) & (!\audio_ctrl_inst|reg_cnt\(5) & !\audio_ctrl_inst|reg_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(6),
	datab => \audio_ctrl_inst|reg_cnt\(7),
	datac => \audio_ctrl_inst|reg_cnt\(5),
	datad => \audio_ctrl_inst|reg_cnt\(4),
	combout => \audio_ctrl_inst|Equal0~1_combout\);

-- Location: LCCOMB_X58_Y37_N16
\audio_ctrl_inst|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal0~4_combout\ = (\audio_ctrl_inst|Equal0~3_combout\ & (\audio_ctrl_inst|Equal0~0_combout\ & (\audio_ctrl_inst|Equal0~2_combout\ & \audio_ctrl_inst|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal0~3_combout\,
	datab => \audio_ctrl_inst|Equal0~0_combout\,
	datac => \audio_ctrl_inst|Equal0~2_combout\,
	datad => \audio_ctrl_inst|Equal0~1_combout\,
	combout => \audio_ctrl_inst|Equal0~4_combout\);

-- Location: LCCOMB_X56_Y36_N24
\audio_ctrl_inst|cfg_fsm_state.DONE~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|cfg_fsm_state.DONE~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.DONE~q\) # ((\audio_ctrl_inst|Selector37~0_combout\ & (\audio_ctrl_inst|Equal0~4_combout\ & \audio_ctrl_inst|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Selector37~0_combout\,
	datab => \audio_ctrl_inst|Equal0~4_combout\,
	datac => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	datad => \audio_ctrl_inst|Equal0~9_combout\,
	combout => \audio_ctrl_inst|cfg_fsm_state.DONE~0_combout\);

-- Location: FF_X56_Y36_N25
\audio_ctrl_inst|cfg_fsm_state.DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|cfg_fsm_state.DONE~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.DONE~q\);

-- Location: LCCOMB_X56_Y36_N20
\audio_ctrl_inst|Selector36~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector36~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|busy~q\ & (!\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\ & (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\ & !\audio_ctrl_inst|cfg_fsm_state.DONE~q\))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|busy~q\ & ((\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\) # ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_HIGH~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|Selector36~1_combout\);

-- Location: LCCOMB_X56_Y36_N10
\audio_ctrl_inst|Selector36~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector36~2_combout\ = (!\audio_ctrl_inst|cfg_fsm_state.DONE~q\ & ((\audio_ctrl_inst|Selector36~0_combout\) # ((!\audio_ctrl_inst|Selector36~1_combout\ & \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Selector36~0_combout\,
	datab => \audio_ctrl_inst|Selector36~1_combout\,
	datac => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|Selector36~2_combout\);

-- Location: FF_X56_Y36_N11
\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector36~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\);

-- Location: LCCOMB_X56_Y36_N8
\audio_ctrl_inst|Selector33~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector33~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|busy~q\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\) # (!\audio_ctrl_inst|cfg_fsm_state.RESET~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.RESET~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	combout => \audio_ctrl_inst|Selector33~0_combout\);

-- Location: LCCOMB_X56_Y36_N4
\audio_ctrl_inst|Selector33~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector33~1_combout\ = (\audio_ctrl_inst|Selector33~0_combout\) # ((\audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\ & !\audio_ctrl_inst|reg_cnt_nxt~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.WAIT_BUSY_LOW~q\,
	datab => \audio_ctrl_inst|reg_cnt_nxt~0_combout\,
	datac => \audio_ctrl_inst|Selector33~0_combout\,
	combout => \audio_ctrl_inst|Selector33~1_combout\);

-- Location: FF_X56_Y36_N5
\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector33~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\);

-- Location: LCCOMB_X55_Y36_N30
\audio_ctrl_inst|i2c_master_inst|Selector21~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.rd~q\ & (((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2)) # (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|state.rd~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\);

-- Location: LCCOMB_X55_Y36_N28
\audio_ctrl_inst|i2c_master_inst|Selector21~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector21~3_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\) # ((\audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\) # 
-- (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\,
	datad => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector21~3_combout\);

-- Location: LCCOMB_X53_Y36_N4
\audio_ctrl_inst|i2c_master_inst|process_1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|data_clk~q\ & !\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|i2c_master_inst|data_clk~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\);

-- Location: FF_X55_Y36_N29
\audio_ctrl_inst|i2c_master_inst|state.rd\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector21~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.rd~q\);

-- Location: LCCOMB_X55_Y36_N4
\audio_ctrl_inst|i2c_master_inst|state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|state~14_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & (\audio_ctrl_inst|i2c_master_inst|state.rd~q\ & \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|state.rd~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|state~14_combout\);

-- Location: FF_X55_Y36_N5
\audio_ctrl_inst|i2c_master_inst|state.mstr_ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|state~14_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\);

-- Location: LCCOMB_X55_Y36_N26
\audio_ctrl_inst|i2c_master_inst|state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|state~13_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & (\audio_ctrl_inst|i2c_master_inst|state.wr~q\ & \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|state.wr~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|state~13_combout\);

-- Location: FF_X55_Y36_N27
\audio_ctrl_inst|i2c_master_inst|state.slv_ack2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|state~13_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\);

-- Location: LCCOMB_X55_Y36_N6
\audio_ctrl_inst|i2c_master_inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\ = (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\ & (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & ((\audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\) # 
-- (\audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\);

-- Location: LCCOMB_X55_Y36_N20
\audio_ctrl_inst|i2c_master_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector0~0_combout\ = (!\audio_ctrl_inst|i2c_master_inst|busy~q\ & ((\audio_ctrl_inst|i2c_master_inst|state.command~q\) # ((\audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\) # 
-- (\audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.command~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector0~0_combout\);

-- Location: LCCOMB_X55_Y36_N8
\audio_ctrl_inst|i2c_master_inst|Selector0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector0~3_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\ & (!\audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\ & (!\audio_ctrl_inst|i2c_master_inst|state.start~q\ & 
-- !\audio_ctrl_inst|i2c_master_inst|Selector0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector0~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector0~3_combout\);

-- Location: FF_X55_Y36_N9
\audio_ctrl_inst|i2c_master_inst|busy\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector0~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|busy~q\);

-- Location: LCCOMB_X56_Y36_N2
\audio_ctrl_inst|Selector34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector34~0_combout\ = (!\audio_ctrl_inst|i2c_master_inst|busy~q\ & \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|busy~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	combout => \audio_ctrl_inst|Selector34~0_combout\);

-- Location: LCCOMB_X56_Y36_N6
\audio_ctrl_inst|Selector34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector34~1_combout\ = (!\audio_ctrl_inst|cfg_fsm_state.DONE~q\ & ((\audio_ctrl_inst|Selector34~0_combout\) # ((!\audio_ctrl_inst|Selector36~1_combout\ & \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Selector34~0_combout\,
	datab => \audio_ctrl_inst|Selector36~1_combout\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|Selector34~1_combout\);

-- Location: FF_X56_Y36_N7
\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector34~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\);

-- Location: FF_X55_Y36_N7
\audio_ctrl_inst|i2c_master_inst|state.stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector22~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.stop~q\);

-- Location: LCCOMB_X55_Y36_N0
\audio_ctrl_inst|i2c_master_inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector17~0_combout\ = (!\audio_ctrl_inst|i2c_master_inst|state.stop~q\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\) # ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\) # 
-- (\audio_ctrl_inst|i2c_master_inst|state.ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.ready~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.stop~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector17~0_combout\);

-- Location: FF_X55_Y36_N1
\audio_ctrl_inst|i2c_master_inst|state.ready\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector17~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.ready~q\);

-- Location: LCCOMB_X55_Y36_N14
\audio_ctrl_inst|i2c_master_inst|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\ = (!\audio_ctrl_inst|i2c_master_inst|state.ready~q\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\) # (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.ready~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\);

-- Location: FF_X55_Y36_N15
\audio_ctrl_inst|i2c_master_inst|state.start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.start~q\);

-- Location: LCCOMB_X55_Y36_N16
\audio_ctrl_inst|i2c_master_inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector19~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.start~q\) # ((\audio_ctrl_inst|i2c_master_inst|state.command~q\ & ((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2)) # 
-- (!\audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.command~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector19~0_combout\);

-- Location: FF_X55_Y36_N17
\audio_ctrl_inst|i2c_master_inst|state.command\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector19~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.command~q\);

-- Location: LCCOMB_X55_Y36_N18
\audio_ctrl_inst|i2c_master_inst|state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|state~15_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & \audio_ctrl_inst|i2c_master_inst|state.command~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datad => \audio_ctrl_inst|i2c_master_inst|state.command~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|state~15_combout\);

-- Location: FF_X55_Y36_N19
\audio_ctrl_inst|i2c_master_inst|state.slv_ack1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|state~15_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\);

-- Location: LCCOMB_X56_Y36_N28
\audio_ctrl_inst|i2c_ena\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_ena~combout\ = (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\) # (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	combout => \audio_ctrl_inst|i2c_ena~combout\);

-- Location: LCCOMB_X55_Y36_N2
\audio_ctrl_inst|i2c_master_inst|Selector20~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector20~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector20~0_combout\) # ((\audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\) # ((\audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\ & 
-- \audio_ctrl_inst|i2c_ena~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector20~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	datad => \audio_ctrl_inst|i2c_ena~combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector20~1_combout\);

-- Location: FF_X55_Y36_N3
\audio_ctrl_inst|i2c_master_inst|state.wr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector20~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|state.wr~q\);

-- Location: LCCOMB_X53_Y36_N0
\audio_ctrl_inst|i2c_master_inst|Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\ = (!\audio_ctrl_inst|i2c_master_inst|state.wr~q\ & !\audio_ctrl_inst|i2c_master_inst|state.rd~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|state.wr~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.rd~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\);

-- Location: LCCOMB_X53_Y36_N18
\audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\ = (!\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\ & (\audio_ctrl_inst|i2c_master_inst|data_clk~q\ & ((\audio_ctrl_inst|i2c_master_inst|state.command~q\) # 
-- (!\audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|Selector0~2_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|data_clk~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.command~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\);

-- Location: FF_X54_Y36_N15
\audio_ctrl_inst|i2c_master_inst|bit_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|bit_cnt[0]~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0));

-- Location: LCCOMB_X54_Y36_N18
\audio_ctrl_inst|i2c_master_inst|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Add1~0_combout\ = \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) $ (((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datad => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Add1~0_combout\);

-- Location: FF_X54_Y36_N19
\audio_ctrl_inst|i2c_master_inst|bit_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Add1~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|bit_cnt[2]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2));

-- Location: LCCOMB_X54_Y36_N0
\audio_ctrl_inst|i2c_master_inst|Selector23~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~10_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|state.start~q\ & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) $ (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datad => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~10_combout\);

-- Location: LCCOMB_X54_Y37_N24
\audio_ctrl_inst|Selector40~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector40~0_combout\ = (\audio_ctrl_inst|reg_cnt\(1) & (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & !\audio_ctrl_inst|reg_cnt\(0))) # (!\audio_ctrl_inst|reg_cnt\(1) & (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & 
-- \audio_ctrl_inst|reg_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100001001000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(1),
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|reg_cnt\(0),
	combout => \audio_ctrl_inst|Selector40~0_combout\);

-- Location: LCCOMB_X53_Y36_N24
\audio_ctrl_inst|i2c_master_inst|data_tx[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|data_tx[0]~4_combout\ = (\res_n~input_o\ & ((\audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\) # ((\audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\) # (!\audio_ctrl_inst|i2c_master_inst|state.ready~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.ready~q\,
	datac => \res_n~input_o\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~4_combout\);

-- Location: LCCOMB_X53_Y36_N20
\audio_ctrl_inst|i2c_master_inst|data_tx[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\ = (\audio_ctrl_inst|i2c_master_inst|process_1~0_combout\ & (\audio_ctrl_inst|i2c_master_inst|data_tx[0]~4_combout\ & ((\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\) # 
-- (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~4_combout\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datad => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\);

-- Location: FF_X54_Y37_N25
\audio_ctrl_inst|i2c_master_inst|data_tx[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector40~0_combout\,
	ena => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_tx\(2));

-- Location: LCCOMB_X54_Y37_N28
\audio_ctrl_inst|i2c_data[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_data[0]~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & ((\audio_ctrl_inst|reg_cnt\(1)) # (\audio_ctrl_inst|reg_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(1),
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|reg_cnt\(0),
	combout => \audio_ctrl_inst|i2c_data[0]~0_combout\);

-- Location: FF_X54_Y37_N29
\audio_ctrl_inst|i2c_master_inst|data_tx[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_data[0]~0_combout\,
	ena => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_tx\(0));

-- Location: LCCOMB_X54_Y37_N26
\audio_ctrl_inst|Selector42~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector42~0_combout\ = (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & ((\audio_ctrl_inst|reg_cnt\(1)) # (!\audio_ctrl_inst|reg_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(1),
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|reg_cnt\(0),
	combout => \audio_ctrl_inst|Selector42~0_combout\);

-- Location: FF_X54_Y37_N27
\audio_ctrl_inst|i2c_master_inst|data_tx[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector42~0_combout\,
	ena => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_tx\(1));

-- Location: LCCOMB_X54_Y36_N2
\audio_ctrl_inst|i2c_master_inst|Selector23~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~11_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|data_tx\(0))) # (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & 
-- ((\audio_ctrl_inst|i2c_master_inst|data_tx\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_tx\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datad => \audio_ctrl_inst|i2c_master_inst|data_tx\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~11_combout\);

-- Location: LCCOMB_X54_Y36_N20
\audio_ctrl_inst|i2c_master_inst|Selector23~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~12_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~11_combout\) # ((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & \audio_ctrl_inst|i2c_master_inst|data_tx\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|data_tx\(2),
	datad => \audio_ctrl_inst|i2c_master_inst|Selector23~11_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~12_combout\);

-- Location: LCCOMB_X54_Y36_N22
\audio_ctrl_inst|i2c_master_inst|Selector23~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~13_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~10_combout\) # ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & (\audio_ctrl_inst|i2c_master_inst|Selector23~12_combout\ & 
-- \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datab => \audio_ctrl_inst|i2c_master_inst|Selector23~10_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Selector23~12_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~13_combout\);

-- Location: LCCOMB_X55_Y36_N12
\audio_ctrl_inst|i2c_master_inst|Selector23~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~14_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.command~q\ & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) $ (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) $ 
-- (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datad => \audio_ctrl_inst|i2c_master_inst|state.command~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~14_combout\);

-- Location: LCCOMB_X54_Y37_N16
\audio_ctrl_inst|i2c_master_inst|Selector23~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~15_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & ((\audio_ctrl_inst|i2c_data[0]~0_combout\))) # (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & 
-- (\audio_ctrl_inst|Selector42~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|Selector42~0_combout\,
	datad => \audio_ctrl_inst|i2c_data[0]~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~15_combout\);

-- Location: LCCOMB_X54_Y37_N10
\audio_ctrl_inst|i2c_master_inst|Selector23~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~16_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~15_combout\) # ((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & \audio_ctrl_inst|Selector40~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|Selector23~15_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datad => \audio_ctrl_inst|Selector40~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~16_combout\);

-- Location: LCCOMB_X53_Y36_N28
\audio_ctrl_inst|i2c_master_inst|Selector23~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~17_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\) # ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & (\audio_ctrl_inst|i2c_master_inst|Selector23~16_combout\ & 
-- \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datac => \audio_ctrl_inst|i2c_master_inst|Selector23~16_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~17_combout\);

-- Location: LCCOMB_X55_Y36_N22
\audio_ctrl_inst|i2c_master_inst|Selector23~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~18_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~14_combout\) # ((\audio_ctrl_inst|i2c_ena~combout\ & (\audio_ctrl_inst|i2c_master_inst|Selector23~17_combout\)) # (!\audio_ctrl_inst|i2c_ena~combout\ & 
-- ((\audio_ctrl_inst|i2c_master_inst|state~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector23~14_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Selector23~17_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|state~14_combout\,
	datad => \audio_ctrl_inst|i2c_ena~combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~18_combout\);

-- Location: LCCOMB_X54_Y36_N4
\audio_ctrl_inst|i2c_master_inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2)) # (\audio_ctrl_inst|i2c_master_inst|data_tx\(2))))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & (\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & \audio_ctrl_inst|i2c_master_inst|data_tx\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datad => \audio_ctrl_inst|i2c_master_inst|data_tx\(2),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~0_combout\);

-- Location: LCCOMB_X54_Y36_N30
\audio_ctrl_inst|i2c_master_inst|Selector23~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|Add1~0_combout\ & ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & ((\audio_ctrl_inst|i2c_master_inst|data_tx\(1)))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & (\audio_ctrl_inst|i2c_master_inst|data_tx\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_tx\(0),
	datab => \audio_ctrl_inst|i2c_master_inst|Add1~0_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datad => \audio_ctrl_inst|i2c_master_inst|data_tx\(1),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~1_combout\);

-- Location: LCCOMB_X54_Y37_N14
\audio_ctrl_inst|Selector39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Selector39~0_combout\ = \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ $ (((\audio_ctrl_inst|reg_cnt\(0)) # (!\audio_ctrl_inst|reg_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|reg_cnt\(1),
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|reg_cnt\(0),
	combout => \audio_ctrl_inst|Selector39~0_combout\);

-- Location: FF_X54_Y37_N15
\audio_ctrl_inst|i2c_master_inst|data_tx[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Selector39~0_combout\,
	ena => \audio_ctrl_inst|i2c_master_inst|data_tx[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|data_tx\(4));

-- Location: LCCOMB_X54_Y36_N24
\audio_ctrl_inst|i2c_master_inst|Selector23~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~2_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~1_combout\) # ((!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(0) & 
-- \audio_ctrl_inst|i2c_master_inst|data_tx\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(0),
	datac => \audio_ctrl_inst|i2c_master_inst|Selector23~1_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|data_tx\(4),
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~2_combout\);

-- Location: LCCOMB_X53_Y36_N2
\audio_ctrl_inst|i2c_master_inst|Selector23~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~3_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.wr~q\ & ((\audio_ctrl_inst|i2c_master_inst|Selector23~0_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Selector23~2_combout\ & 
-- \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector23~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Selector23~2_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.wr~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector25~0_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~3_combout\);

-- Location: LCCOMB_X56_Y36_N22
\audio_ctrl_inst|i2c_master_inst|Selector23~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~4_combout\ = ((\audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\ & (!\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\ & !\audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\))) # 
-- (!\audio_ctrl_inst|i2c_master_inst|state.ready~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	datab => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_L~q\,
	datac => \audio_ctrl_inst|cfg_fsm_state.SEND_DATA_H~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.ready~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~4_combout\);

-- Location: LCCOMB_X55_Y36_N24
\audio_ctrl_inst|i2c_master_inst|Selector23~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~5_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\) # ((\audio_ctrl_inst|i2c_master_inst|state.stop~q\) # ((\audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\) # 
-- (\audio_ctrl_inst|i2c_master_inst|Selector23~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|state.mstr_ack~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|state.stop~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|Selector21~2_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector23~4_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~5_combout\);

-- Location: LCCOMB_X54_Y36_N26
\audio_ctrl_inst|i2c_master_inst|Selector23~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~6_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~3_combout\) # ((!\audio_ctrl_inst|i2c_master_inst|sda_int~q\ & \audio_ctrl_inst|i2c_master_inst|Selector23~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector23~3_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|sda_int~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector23~5_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~6_combout\);

-- Location: LCCOMB_X55_Y36_N10
\audio_ctrl_inst|i2c_master_inst|Selector23~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~7_combout\ = (\audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\ & (\audio_ctrl_inst|Selector39~0_combout\ & (\audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\ & \audio_ctrl_inst|i2c_ena~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\,
	datab => \audio_ctrl_inst|Selector39~0_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.slv_ack2~q\,
	datad => \audio_ctrl_inst|i2c_ena~combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~7_combout\);

-- Location: LCCOMB_X54_Y36_N12
\audio_ctrl_inst|i2c_master_inst|Selector23~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~8_combout\ = (\audio_ctrl_inst|i2c_master_inst|Selector23~7_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\ & (\audio_ctrl_inst|i2c_master_inst|data_tx\(4) & 
-- \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Equal1~0_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|data_tx\(4),
	datac => \audio_ctrl_inst|i2c_master_inst|Selector23~7_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.slv_ack1~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~8_combout\);

-- Location: LCCOMB_X54_Y36_N6
\audio_ctrl_inst|i2c_master_inst|Selector23~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~9_combout\ = (!\audio_ctrl_inst|i2c_master_inst|bit_cnt\(2) & ((\audio_ctrl_inst|i2c_master_inst|Selector23~8_combout\) # ((\audio_ctrl_inst|i2c_master_inst|bit_cnt\(1) & 
-- \audio_ctrl_inst|i2c_master_inst|state.start~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector23~8_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(1),
	datac => \audio_ctrl_inst|i2c_master_inst|bit_cnt\(2),
	datad => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~9_combout\);

-- Location: LCCOMB_X54_Y36_N16
\audio_ctrl_inst|i2c_master_inst|Selector23~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector23~19_combout\ = (!\audio_ctrl_inst|i2c_master_inst|Selector23~13_combout\ & (!\audio_ctrl_inst|i2c_master_inst|Selector23~18_combout\ & (!\audio_ctrl_inst|i2c_master_inst|Selector23~6_combout\ & 
-- !\audio_ctrl_inst|i2c_master_inst|Selector23~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|Selector23~13_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Selector23~18_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|Selector23~6_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Selector23~9_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector23~19_combout\);

-- Location: FF_X54_Y36_N17
\audio_ctrl_inst|i2c_master_inst|sda_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|Selector23~19_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|i2c_master_inst|process_1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|sda_int~q\);

-- Location: LCCOMB_X53_Y36_N30
\audio_ctrl_inst|i2c_master_inst|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|Selector29~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|state.start~q\ & (\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\)) # (!\audio_ctrl_inst|i2c_master_inst|state.start~q\ & 
-- ((\audio_ctrl_inst|i2c_master_inst|state.stop~q\ & (!\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\)) # (!\audio_ctrl_inst|i2c_master_inst|state.stop~q\ & ((!\audio_ctrl_inst|i2c_master_inst|sda_int~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|sda_int~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.stop~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|Selector29~0_combout\);

-- Location: LCCOMB_X47_Y35_N18
\audio_ctrl_inst|i2c_master_inst|scl_clk~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|scl_clk~2_combout\ = (\audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\ & ((\audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\) # ((\audio_ctrl_inst|i2c_master_inst|Add0~12_combout\) # 
-- (!\audio_ctrl_inst|i2c_master_inst|process_0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|LessThan1~1_combout\,
	datab => \audio_ctrl_inst|i2c_master_inst|Equal0~1_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|process_0~4_combout\,
	datad => \audio_ctrl_inst|i2c_master_inst|Add0~12_combout\,
	combout => \audio_ctrl_inst|i2c_master_inst|scl_clk~2_combout\);

-- Location: FF_X47_Y35_N19
\audio_ctrl_inst|i2c_master_inst|scl_clk\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|scl_clk~2_combout\,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|scl_clk~q\);

-- Location: LCCOMB_X53_Y36_N14
\audio_ctrl_inst|i2c_master_inst|scl_ena~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|scl_ena~0_combout\ = (\audio_ctrl_inst|i2c_master_inst|scl_ena~q\ & ((\audio_ctrl_inst|i2c_master_inst|data_clk~q\) # ((!\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\) # 
-- (!\audio_ctrl_inst|i2c_master_inst|state.stop~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_clk~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|scl_ena~q\,
	datac => \audio_ctrl_inst|i2c_master_inst|state.stop~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|scl_ena~0_combout\);

-- Location: LCCOMB_X53_Y36_N16
\audio_ctrl_inst|i2c_master_inst|scl_ena~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|scl_ena~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|scl_ena~0_combout\) # ((\audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\ & (!\audio_ctrl_inst|i2c_master_inst|data_clk~q\ & 
-- \audio_ctrl_inst|i2c_master_inst|state.start~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|i2c_master_inst|data_clk_prev~q\,
	datab => \audio_ctrl_inst|i2c_master_inst|scl_ena~0_combout\,
	datac => \audio_ctrl_inst|i2c_master_inst|data_clk~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|state.start~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|scl_ena~1_combout\);

-- Location: FF_X53_Y36_N17
\audio_ctrl_inst|i2c_master_inst|scl_ena\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|i2c_master_inst|scl_ena~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|i2c_master_inst|scl_ena~q\);

-- Location: LCCOMB_X47_Y35_N20
\audio_ctrl_inst|i2c_master_inst|scl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|i2c_master_inst|scl~1_combout\ = (\audio_ctrl_inst|i2c_master_inst|scl_clk~q\) # (!\audio_ctrl_inst|i2c_master_inst|scl_ena~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|i2c_master_inst|scl_clk~q\,
	datad => \audio_ctrl_inst|i2c_master_inst|scl_ena~q\,
	combout => \audio_ctrl_inst|i2c_master_inst|scl~1_combout\);

-- Location: LCCOMB_X35_Y49_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~31_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0) $ (VCC)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\ = CARRY(\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~31_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\);

-- Location: IOIBUF_X27_Y73_N22
\synth_ctrl_1_low_time[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(4),
	o => \synth_ctrl_1_low_time[4]~input_o\);

-- Location: IOIBUF_X42_Y73_N1
\synth_ctrl_1_play~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_play,
	o => \synth_ctrl_1_play~input_o\);

-- Location: LCCOMB_X42_Y69_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\ = \synth_ctrl_1_play~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_play~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\);

-- Location: FF_X42_Y69_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(1));

-- Location: FF_X34_Y49_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(1),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2));

-- Location: FF_X34_Y48_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|synth_play_last\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|synth_play_last~q\);

-- Location: LCCOMB_X34_Y48_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|synth_play_last~q\ & \res_n~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|synth_play_last~q\,
	datad => \res_n~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\);

-- Location: FF_X33_Y52_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[4]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(4));

-- Location: LCCOMB_X48_Y40_N2
\audio_ctrl_inst|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~0_combout\ = \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\ $ (VCC)
-- \audio_ctrl_inst|Add2~1\ = CARRY(\audio_ctrl_inst|dac_interface:clk_cnt[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\,
	datad => VCC,
	combout => \audio_ctrl_inst|Add2~0_combout\,
	cout => \audio_ctrl_inst|Add2~1\);

-- Location: LCCOMB_X46_Y44_N12
\audio_ctrl_inst|sync~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sync~0_combout\ = (!\audio_ctrl_inst|cfg_fsm_state.DONE~q\) # (!\res_n~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \res_n~input_o\,
	datac => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|sync~0_combout\);

-- Location: FF_X48_Y40_N3
\audio_ctrl_inst|dac_interface:clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~0_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\);

-- Location: LCCOMB_X48_Y40_N4
\audio_ctrl_inst|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~2_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[1]~q\ & (!\audio_ctrl_inst|Add2~1\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[1]~q\ & ((\audio_ctrl_inst|Add2~1\) # (GND)))
-- \audio_ctrl_inst|Add2~3\ = CARRY((!\audio_ctrl_inst|Add2~1\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~1\,
	combout => \audio_ctrl_inst|Add2~2_combout\,
	cout => \audio_ctrl_inst|Add2~3\);

-- Location: FF_X48_Y40_N5
\audio_ctrl_inst|dac_interface:clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~2_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\);

-- Location: LCCOMB_X48_Y40_N6
\audio_ctrl_inst|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~4_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[2]~q\ & (\audio_ctrl_inst|Add2~3\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[2]~q\ & (!\audio_ctrl_inst|Add2~3\ & VCC))
-- \audio_ctrl_inst|Add2~5\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[2]~q\ & !\audio_ctrl_inst|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~3\,
	combout => \audio_ctrl_inst|Add2~4_combout\,
	cout => \audio_ctrl_inst|Add2~5\);

-- Location: LCCOMB_X47_Y40_N2
\audio_ctrl_inst|clk_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~4_combout\ = (!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|Add2~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|Equal4~2_combout\,
	datad => \audio_ctrl_inst|Add2~4_combout\,
	combout => \audio_ctrl_inst|clk_cnt~4_combout\);

-- Location: FF_X47_Y40_N3
\audio_ctrl_inst|dac_interface:clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~4_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\);

-- Location: LCCOMB_X48_Y40_N8
\audio_ctrl_inst|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~6_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[3]~q\ & (!\audio_ctrl_inst|Add2~5\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[3]~q\ & ((\audio_ctrl_inst|Add2~5\) # (GND)))
-- \audio_ctrl_inst|Add2~7\ = CARRY((!\audio_ctrl_inst|Add2~5\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[3]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~5\,
	combout => \audio_ctrl_inst|Add2~6_combout\,
	cout => \audio_ctrl_inst|Add2~7\);

-- Location: LCCOMB_X47_Y40_N16
\audio_ctrl_inst|clk_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~6_combout\ = (\audio_ctrl_inst|Add2~6_combout\ & !\audio_ctrl_inst|Equal4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|Add2~6_combout\,
	datad => \audio_ctrl_inst|Equal4~2_combout\,
	combout => \audio_ctrl_inst|clk_cnt~6_combout\);

-- Location: FF_X47_Y40_N17
\audio_ctrl_inst|dac_interface:clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~6_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[3]~q\);

-- Location: LCCOMB_X48_Y40_N10
\audio_ctrl_inst|Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~8_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ & (\audio_ctrl_inst|Add2~7\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ & (!\audio_ctrl_inst|Add2~7\ & VCC))
-- \audio_ctrl_inst|Add2~9\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ & !\audio_ctrl_inst|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[4]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~7\,
	combout => \audio_ctrl_inst|Add2~8_combout\,
	cout => \audio_ctrl_inst|Add2~9\);

-- Location: LCCOMB_X47_Y44_N0
\audio_ctrl_inst|clk_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~2_combout\ = (!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|Add2~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal4~2_combout\,
	datac => \audio_ctrl_inst|Add2~8_combout\,
	combout => \audio_ctrl_inst|clk_cnt~2_combout\);

-- Location: FF_X47_Y44_N1
\audio_ctrl_inst|dac_interface:clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~2_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[4]~q\);

-- Location: LCCOMB_X48_Y40_N12
\audio_ctrl_inst|Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~10_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ & (!\audio_ctrl_inst|Add2~9\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ & ((\audio_ctrl_inst|Add2~9\) # (GND)))
-- \audio_ctrl_inst|Add2~11\ = CARRY((!\audio_ctrl_inst|Add2~9\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~9\,
	combout => \audio_ctrl_inst|Add2~10_combout\,
	cout => \audio_ctrl_inst|Add2~11\);

-- Location: FF_X48_Y40_N13
\audio_ctrl_inst|dac_interface:clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~10_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\);

-- Location: LCCOMB_X48_Y40_N14
\audio_ctrl_inst|Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~12_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ & (\audio_ctrl_inst|Add2~11\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ & (!\audio_ctrl_inst|Add2~11\ & VCC))
-- \audio_ctrl_inst|Add2~13\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ & !\audio_ctrl_inst|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[6]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~11\,
	combout => \audio_ctrl_inst|Add2~12_combout\,
	cout => \audio_ctrl_inst|Add2~13\);

-- Location: LCCOMB_X47_Y40_N14
\audio_ctrl_inst|clk_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~5_combout\ = (\audio_ctrl_inst|Add2~12_combout\ & !\audio_ctrl_inst|Equal4~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \audio_ctrl_inst|Add2~12_combout\,
	datad => \audio_ctrl_inst|Equal4~2_combout\,
	combout => \audio_ctrl_inst|clk_cnt~5_combout\);

-- Location: FF_X47_Y40_N15
\audio_ctrl_inst|dac_interface:clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~5_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[6]~q\);

-- Location: LCCOMB_X48_Y40_N16
\audio_ctrl_inst|Add2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~14_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[7]~q\ & (!\audio_ctrl_inst|Add2~13\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[7]~q\ & ((\audio_ctrl_inst|Add2~13\) # (GND)))
-- \audio_ctrl_inst|Add2~15\ = CARRY((!\audio_ctrl_inst|Add2~13\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[7]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~13\,
	combout => \audio_ctrl_inst|Add2~14_combout\,
	cout => \audio_ctrl_inst|Add2~15\);

-- Location: LCCOMB_X47_Y40_N0
\audio_ctrl_inst|clk_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~3_combout\ = (!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|Add2~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|Equal4~2_combout\,
	datad => \audio_ctrl_inst|Add2~14_combout\,
	combout => \audio_ctrl_inst|clk_cnt~3_combout\);

-- Location: FF_X47_Y40_N1
\audio_ctrl_inst|dac_interface:clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~3_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\);

-- Location: LCCOMB_X48_Y40_N18
\audio_ctrl_inst|Add2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~16_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ & (\audio_ctrl_inst|Add2~15\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ & (!\audio_ctrl_inst|Add2~15\ & VCC))
-- \audio_ctrl_inst|Add2~17\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ & !\audio_ctrl_inst|Add2~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[8]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~15\,
	combout => \audio_ctrl_inst|Add2~16_combout\,
	cout => \audio_ctrl_inst|Add2~17\);

-- Location: LCCOMB_X47_Y40_N26
\audio_ctrl_inst|clk_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~1_combout\ = (!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|Add2~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|Equal4~2_combout\,
	datad => \audio_ctrl_inst|Add2~16_combout\,
	combout => \audio_ctrl_inst|clk_cnt~1_combout\);

-- Location: FF_X47_Y40_N27
\audio_ctrl_inst|dac_interface:clk_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~1_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[8]~q\);

-- Location: LCCOMB_X48_Y40_N20
\audio_ctrl_inst|Add2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~18_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ & (!\audio_ctrl_inst|Add2~17\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ & ((\audio_ctrl_inst|Add2~17\) # (GND)))
-- \audio_ctrl_inst|Add2~19\ = CARRY((!\audio_ctrl_inst|Add2~17\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~17\,
	combout => \audio_ctrl_inst|Add2~18_combout\,
	cout => \audio_ctrl_inst|Add2~19\);

-- Location: FF_X48_Y40_N21
\audio_ctrl_inst|dac_interface:clk_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~18_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\);

-- Location: LCCOMB_X47_Y40_N24
\audio_ctrl_inst|Equal4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal4~0_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ & (\audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[10]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\,
	combout => \audio_ctrl_inst|Equal4~0_combout\);

-- Location: LCCOMB_X47_Y40_N10
\audio_ctrl_inst|Equal4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal4~1_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ & (\audio_ctrl_inst|Equal4~0_combout\ & (\audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ & \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[8]~q\,
	datab => \audio_ctrl_inst|Equal4~0_combout\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[4]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\,
	combout => \audio_ctrl_inst|Equal4~1_combout\);

-- Location: LCCOMB_X47_Y40_N20
\audio_ctrl_inst|Equal3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal3~0_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[0]~q\ & (\audio_ctrl_inst|dac_interface:clk_cnt[3]~q\ & (\audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ & \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[3]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[6]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\,
	combout => \audio_ctrl_inst|Equal3~0_combout\);

-- Location: LCCOMB_X48_Y40_N26
\audio_ctrl_inst|Add2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~24_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[12]~q\ & (\audio_ctrl_inst|Add2~23\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[12]~q\ & (!\audio_ctrl_inst|Add2~23\ & VCC))
-- \audio_ctrl_inst|Add2~25\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[12]~q\ & !\audio_ctrl_inst|Add2~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[12]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~23\,
	combout => \audio_ctrl_inst|Add2~24_combout\,
	cout => \audio_ctrl_inst|Add2~25\);

-- Location: LCCOMB_X48_Y40_N28
\audio_ctrl_inst|Add2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~26_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[13]~q\ & (!\audio_ctrl_inst|Add2~25\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[13]~q\ & ((\audio_ctrl_inst|Add2~25\) # (GND)))
-- \audio_ctrl_inst|Add2~27\ = CARRY((!\audio_ctrl_inst|Add2~25\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[13]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[13]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~25\,
	combout => \audio_ctrl_inst|Add2~26_combout\,
	cout => \audio_ctrl_inst|Add2~27\);

-- Location: FF_X48_Y40_N29
\audio_ctrl_inst|dac_interface:clk_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~26_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[13]~q\);

-- Location: LCCOMB_X48_Y40_N30
\audio_ctrl_inst|Add2~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~28_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[14]~q\ & (\audio_ctrl_inst|Add2~27\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[14]~q\ & (!\audio_ctrl_inst|Add2~27\ & VCC))
-- \audio_ctrl_inst|Add2~29\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[14]~q\ & !\audio_ctrl_inst|Add2~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[14]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~27\,
	combout => \audio_ctrl_inst|Add2~28_combout\,
	cout => \audio_ctrl_inst|Add2~29\);

-- Location: FF_X48_Y40_N31
\audio_ctrl_inst|dac_interface:clk_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~28_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[14]~q\);

-- Location: LCCOMB_X48_Y39_N0
\audio_ctrl_inst|Add2~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~30_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[15]~q\ & (!\audio_ctrl_inst|Add2~29\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[15]~q\ & ((\audio_ctrl_inst|Add2~29\) # (GND)))
-- \audio_ctrl_inst|Add2~31\ = CARRY((!\audio_ctrl_inst|Add2~29\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[15]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[15]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~29\,
	combout => \audio_ctrl_inst|Add2~30_combout\,
	cout => \audio_ctrl_inst|Add2~31\);

-- Location: FF_X48_Y39_N1
\audio_ctrl_inst|dac_interface:clk_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~30_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[15]~q\);

-- Location: LCCOMB_X48_Y39_N2
\audio_ctrl_inst|Add2~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~32_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[16]~q\ & (\audio_ctrl_inst|Add2~31\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[16]~q\ & (!\audio_ctrl_inst|Add2~31\ & VCC))
-- \audio_ctrl_inst|Add2~33\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[16]~q\ & !\audio_ctrl_inst|Add2~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[16]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~31\,
	combout => \audio_ctrl_inst|Add2~32_combout\,
	cout => \audio_ctrl_inst|Add2~33\);

-- Location: FF_X48_Y39_N3
\audio_ctrl_inst|dac_interface:clk_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~32_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[16]~q\);

-- Location: LCCOMB_X48_Y39_N4
\audio_ctrl_inst|Add2~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~34_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[17]~q\ & (!\audio_ctrl_inst|Add2~33\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[17]~q\ & ((\audio_ctrl_inst|Add2~33\) # (GND)))
-- \audio_ctrl_inst|Add2~35\ = CARRY((!\audio_ctrl_inst|Add2~33\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[17]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[17]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~33\,
	combout => \audio_ctrl_inst|Add2~34_combout\,
	cout => \audio_ctrl_inst|Add2~35\);

-- Location: FF_X48_Y39_N5
\audio_ctrl_inst|dac_interface:clk_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~34_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[17]~q\);

-- Location: LCCOMB_X48_Y39_N6
\audio_ctrl_inst|Add2~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~36_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[18]~q\ & (\audio_ctrl_inst|Add2~35\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[18]~q\ & (!\audio_ctrl_inst|Add2~35\ & VCC))
-- \audio_ctrl_inst|Add2~37\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[18]~q\ & !\audio_ctrl_inst|Add2~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[18]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~35\,
	combout => \audio_ctrl_inst|Add2~36_combout\,
	cout => \audio_ctrl_inst|Add2~37\);

-- Location: FF_X48_Y39_N7
\audio_ctrl_inst|dac_interface:clk_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~36_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[18]~q\);

-- Location: LCCOMB_X48_Y39_N8
\audio_ctrl_inst|Add2~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~38_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[19]~q\ & (!\audio_ctrl_inst|Add2~37\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[19]~q\ & ((\audio_ctrl_inst|Add2~37\) # (GND)))
-- \audio_ctrl_inst|Add2~39\ = CARRY((!\audio_ctrl_inst|Add2~37\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[19]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[19]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~37\,
	combout => \audio_ctrl_inst|Add2~38_combout\,
	cout => \audio_ctrl_inst|Add2~39\);

-- Location: FF_X48_Y39_N9
\audio_ctrl_inst|dac_interface:clk_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~38_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[19]~q\);

-- Location: LCCOMB_X48_Y39_N10
\audio_ctrl_inst|Add2~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~40_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[20]~q\ & (\audio_ctrl_inst|Add2~39\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[20]~q\ & (!\audio_ctrl_inst|Add2~39\ & VCC))
-- \audio_ctrl_inst|Add2~41\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[20]~q\ & !\audio_ctrl_inst|Add2~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[20]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~39\,
	combout => \audio_ctrl_inst|Add2~40_combout\,
	cout => \audio_ctrl_inst|Add2~41\);

-- Location: FF_X48_Y39_N11
\audio_ctrl_inst|dac_interface:clk_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~40_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[20]~q\);

-- Location: LCCOMB_X48_Y39_N12
\audio_ctrl_inst|Add2~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~42_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[21]~q\ & (!\audio_ctrl_inst|Add2~41\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[21]~q\ & ((\audio_ctrl_inst|Add2~41\) # (GND)))
-- \audio_ctrl_inst|Add2~43\ = CARRY((!\audio_ctrl_inst|Add2~41\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[21]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[21]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~41\,
	combout => \audio_ctrl_inst|Add2~42_combout\,
	cout => \audio_ctrl_inst|Add2~43\);

-- Location: FF_X48_Y39_N13
\audio_ctrl_inst|dac_interface:clk_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~42_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[21]~q\);

-- Location: LCCOMB_X48_Y39_N14
\audio_ctrl_inst|Add2~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~44_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[22]~q\ & (\audio_ctrl_inst|Add2~43\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[22]~q\ & (!\audio_ctrl_inst|Add2~43\ & VCC))
-- \audio_ctrl_inst|Add2~45\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[22]~q\ & !\audio_ctrl_inst|Add2~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[22]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~43\,
	combout => \audio_ctrl_inst|Add2~44_combout\,
	cout => \audio_ctrl_inst|Add2~45\);

-- Location: FF_X48_Y39_N15
\audio_ctrl_inst|dac_interface:clk_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~44_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[22]~q\);

-- Location: LCCOMB_X48_Y39_N16
\audio_ctrl_inst|Add2~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~46_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[23]~q\ & (!\audio_ctrl_inst|Add2~45\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[23]~q\ & ((\audio_ctrl_inst|Add2~45\) # (GND)))
-- \audio_ctrl_inst|Add2~47\ = CARRY((!\audio_ctrl_inst|Add2~45\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[23]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[23]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~45\,
	combout => \audio_ctrl_inst|Add2~46_combout\,
	cout => \audio_ctrl_inst|Add2~47\);

-- Location: FF_X48_Y39_N17
\audio_ctrl_inst|dac_interface:clk_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~46_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[23]~q\);

-- Location: LCCOMB_X48_Y39_N18
\audio_ctrl_inst|Add2~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~48_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[24]~q\ & (\audio_ctrl_inst|Add2~47\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[24]~q\ & (!\audio_ctrl_inst|Add2~47\ & VCC))
-- \audio_ctrl_inst|Add2~49\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[24]~q\ & !\audio_ctrl_inst|Add2~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[24]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~47\,
	combout => \audio_ctrl_inst|Add2~48_combout\,
	cout => \audio_ctrl_inst|Add2~49\);

-- Location: FF_X48_Y39_N19
\audio_ctrl_inst|dac_interface:clk_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~48_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[24]~q\);

-- Location: LCCOMB_X48_Y39_N20
\audio_ctrl_inst|Add2~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~50_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[25]~q\ & (!\audio_ctrl_inst|Add2~49\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[25]~q\ & ((\audio_ctrl_inst|Add2~49\) # (GND)))
-- \audio_ctrl_inst|Add2~51\ = CARRY((!\audio_ctrl_inst|Add2~49\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[25]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[25]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~49\,
	combout => \audio_ctrl_inst|Add2~50_combout\,
	cout => \audio_ctrl_inst|Add2~51\);

-- Location: FF_X48_Y39_N21
\audio_ctrl_inst|dac_interface:clk_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~50_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[25]~q\);

-- Location: LCCOMB_X48_Y39_N22
\audio_ctrl_inst|Add2~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~52_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[26]~q\ & (\audio_ctrl_inst|Add2~51\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[26]~q\ & (!\audio_ctrl_inst|Add2~51\ & VCC))
-- \audio_ctrl_inst|Add2~53\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[26]~q\ & !\audio_ctrl_inst|Add2~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[26]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~51\,
	combout => \audio_ctrl_inst|Add2~52_combout\,
	cout => \audio_ctrl_inst|Add2~53\);

-- Location: FF_X48_Y39_N23
\audio_ctrl_inst|dac_interface:clk_cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~52_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[26]~q\);

-- Location: LCCOMB_X47_Y39_N10
\audio_ctrl_inst|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~2_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[23]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[24]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[25]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[26]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[23]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[24]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[25]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[26]~q\,
	combout => \audio_ctrl_inst|Equal2~2_combout\);

-- Location: LCCOMB_X48_Y39_N24
\audio_ctrl_inst|Add2~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~54_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[27]~q\ & (!\audio_ctrl_inst|Add2~53\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[27]~q\ & ((\audio_ctrl_inst|Add2~53\) # (GND)))
-- \audio_ctrl_inst|Add2~55\ = CARRY((!\audio_ctrl_inst|Add2~53\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[27]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[27]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~53\,
	combout => \audio_ctrl_inst|Add2~54_combout\,
	cout => \audio_ctrl_inst|Add2~55\);

-- Location: FF_X48_Y39_N25
\audio_ctrl_inst|dac_interface:clk_cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~54_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[27]~q\);

-- Location: LCCOMB_X48_Y39_N26
\audio_ctrl_inst|Add2~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~56_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[28]~q\ & (\audio_ctrl_inst|Add2~55\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[28]~q\ & (!\audio_ctrl_inst|Add2~55\ & VCC))
-- \audio_ctrl_inst|Add2~57\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[28]~q\ & !\audio_ctrl_inst|Add2~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[28]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~55\,
	combout => \audio_ctrl_inst|Add2~56_combout\,
	cout => \audio_ctrl_inst|Add2~57\);

-- Location: FF_X48_Y39_N27
\audio_ctrl_inst|dac_interface:clk_cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~56_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[28]~q\);

-- Location: LCCOMB_X48_Y39_N28
\audio_ctrl_inst|Add2~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~58_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[29]~q\ & (!\audio_ctrl_inst|Add2~57\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[29]~q\ & ((\audio_ctrl_inst|Add2~57\) # (GND)))
-- \audio_ctrl_inst|Add2~59\ = CARRY((!\audio_ctrl_inst|Add2~57\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[29]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[29]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~57\,
	combout => \audio_ctrl_inst|Add2~58_combout\,
	cout => \audio_ctrl_inst|Add2~59\);

-- Location: FF_X48_Y39_N29
\audio_ctrl_inst|dac_interface:clk_cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~58_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[29]~q\);

-- Location: LCCOMB_X48_Y39_N30
\audio_ctrl_inst|Add2~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~60_combout\ = \audio_ctrl_inst|dac_interface:clk_cnt[30]~q\ $ (!\audio_ctrl_inst|Add2~59\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[30]~q\,
	cin => \audio_ctrl_inst|Add2~59\,
	combout => \audio_ctrl_inst|Add2~60_combout\);

-- Location: FF_X48_Y39_N31
\audio_ctrl_inst|dac_interface:clk_cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~60_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[30]~q\);

-- Location: LCCOMB_X47_Y39_N24
\audio_ctrl_inst|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~1_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[27]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[28]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[30]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[29]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[27]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[28]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[30]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[29]~q\,
	combout => \audio_ctrl_inst|Equal2~1_combout\);

-- Location: LCCOMB_X47_Y39_N12
\audio_ctrl_inst|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~3_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[20]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[21]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[19]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[22]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[20]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[21]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[19]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[22]~q\,
	combout => \audio_ctrl_inst|Equal2~3_combout\);

-- Location: LCCOMB_X47_Y39_N6
\audio_ctrl_inst|Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~4_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[17]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[18]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[15]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[16]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[17]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[18]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[15]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[16]~q\,
	combout => \audio_ctrl_inst|Equal2~4_combout\);

-- Location: LCCOMB_X47_Y39_N0
\audio_ctrl_inst|Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~5_combout\ = (\audio_ctrl_inst|Equal2~2_combout\ & (\audio_ctrl_inst|Equal2~1_combout\ & (\audio_ctrl_inst|Equal2~3_combout\ & \audio_ctrl_inst|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~2_combout\,
	datab => \audio_ctrl_inst|Equal2~1_combout\,
	datac => \audio_ctrl_inst|Equal2~3_combout\,
	datad => \audio_ctrl_inst|Equal2~4_combout\,
	combout => \audio_ctrl_inst|Equal2~5_combout\);

-- Location: LCCOMB_X47_Y40_N28
\audio_ctrl_inst|Equal4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal4~2_combout\ = (\audio_ctrl_inst|Equal4~1_combout\ & (\audio_ctrl_inst|Equal3~0_combout\ & (\audio_ctrl_inst|Equal2~0_combout\ & \audio_ctrl_inst|Equal2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal4~1_combout\,
	datab => \audio_ctrl_inst|Equal3~0_combout\,
	datac => \audio_ctrl_inst|Equal2~0_combout\,
	datad => \audio_ctrl_inst|Equal2~5_combout\,
	combout => \audio_ctrl_inst|Equal4~2_combout\);

-- Location: LCCOMB_X48_Y40_N22
\audio_ctrl_inst|Add2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~20_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ & (\audio_ctrl_inst|Add2~19\ $ (GND))) # (!\audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ & (!\audio_ctrl_inst|Add2~19\ & VCC))
-- \audio_ctrl_inst|Add2~21\ = CARRY((\audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ & !\audio_ctrl_inst|Add2~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[10]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~19\,
	combout => \audio_ctrl_inst|Add2~20_combout\,
	cout => \audio_ctrl_inst|Add2~21\);

-- Location: LCCOMB_X47_Y40_N8
\audio_ctrl_inst|clk_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|clk_cnt~0_combout\ = (!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|Add2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|Equal4~2_combout\,
	datad => \audio_ctrl_inst|Add2~20_combout\,
	combout => \audio_ctrl_inst|clk_cnt~0_combout\);

-- Location: FF_X47_Y40_N9
\audio_ctrl_inst|dac_interface:clk_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|clk_cnt~0_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[10]~q\);

-- Location: LCCOMB_X48_Y40_N24
\audio_ctrl_inst|Add2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add2~22_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[11]~q\ & (!\audio_ctrl_inst|Add2~21\)) # (!\audio_ctrl_inst|dac_interface:clk_cnt[11]~q\ & ((\audio_ctrl_inst|Add2~21\) # (GND)))
-- \audio_ctrl_inst|Add2~23\ = CARRY((!\audio_ctrl_inst|Add2~21\) # (!\audio_ctrl_inst|dac_interface:clk_cnt[11]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[11]~q\,
	datad => VCC,
	cin => \audio_ctrl_inst|Add2~21\,
	combout => \audio_ctrl_inst|Add2~22_combout\,
	cout => \audio_ctrl_inst|Add2~23\);

-- Location: FF_X48_Y40_N25
\audio_ctrl_inst|dac_interface:clk_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~22_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[11]~q\);

-- Location: FF_X48_Y40_N27
\audio_ctrl_inst|dac_interface:clk_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add2~24_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:clk_cnt[12]~q\);

-- Location: LCCOMB_X48_Y40_N0
\audio_ctrl_inst|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~0_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[12]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[11]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[14]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[13]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[12]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[11]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[14]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[13]~q\,
	combout => \audio_ctrl_inst|Equal2~0_combout\);

-- Location: LCCOMB_X47_Y40_N4
\audio_ctrl_inst|Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~6_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[8]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[4]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[10]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[8]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[4]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[10]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[1]~q\,
	combout => \audio_ctrl_inst|Equal2~6_combout\);

-- Location: LCCOMB_X47_Y40_N12
\audio_ctrl_inst|Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~8_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[7]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ & !\audio_ctrl_inst|dac_interface:clk_cnt[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[7]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\,
	combout => \audio_ctrl_inst|Equal2~8_combout\);

-- Location: LCCOMB_X47_Y40_N18
\audio_ctrl_inst|Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~9_combout\ = (!\audio_ctrl_inst|dac_interface:clk_cnt[0]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[3]~q\ & (!\audio_ctrl_inst|dac_interface:clk_cnt[6]~q\ & \audio_ctrl_inst|Equal2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[0]~q\,
	datab => \audio_ctrl_inst|dac_interface:clk_cnt[3]~q\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[6]~q\,
	datad => \audio_ctrl_inst|Equal2~8_combout\,
	combout => \audio_ctrl_inst|Equal2~9_combout\);

-- Location: LCCOMB_X47_Y40_N22
\audio_ctrl_inst|Equal2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~10_combout\ = (\audio_ctrl_inst|Equal2~0_combout\ & (\audio_ctrl_inst|Equal2~5_combout\ & (\audio_ctrl_inst|Equal2~6_combout\ & \audio_ctrl_inst|Equal2~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~0_combout\,
	datab => \audio_ctrl_inst|Equal2~5_combout\,
	datac => \audio_ctrl_inst|Equal2~6_combout\,
	datad => \audio_ctrl_inst|Equal2~9_combout\,
	combout => \audio_ctrl_inst|Equal2~10_combout\);

-- Location: FF_X47_Y40_N23
\audio_ctrl_inst|gen_nxt_sample\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Equal2~10_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|gen_nxt_sample~q\);

-- Location: LCCOMB_X34_Y48_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ & (\audio_ctrl_inst|gen_nxt_sample~q\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2) & \res_n~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\,
	datab => \audio_ctrl_inst|gen_nxt_sample~q\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datad => \res_n~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\);

-- Location: FF_X34_Y52_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(4),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(4));

-- Location: IOIBUF_X35_Y73_N22
\synth_ctrl_1_high_time[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(4),
	o => \synth_ctrl_1_high_time[4]~input_o\);

-- Location: FF_X33_Y52_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_high_time[4]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(4));

-- Location: FF_X34_Y52_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(4),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4));

-- Location: IOIBUF_X25_Y73_N15
\synth_ctrl_1_low_time[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(3),
	o => \synth_ctrl_1_low_time[3]~input_o\);

-- Location: LCCOMB_X33_Y52_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]~feeder_combout\ = \synth_ctrl_1_low_time[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_low_time[3]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]~feeder_combout\);

-- Location: FF_X33_Y52_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[3]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(3));

-- Location: FF_X34_Y52_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(3),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3));

-- Location: IOIBUF_X27_Y73_N8
\synth_ctrl_1_high_time[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(3),
	o => \synth_ctrl_1_high_time[3]~input_o\);

-- Location: LCCOMB_X33_Y52_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]~feeder_combout\ = \synth_ctrl_1_high_time[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_high_time[3]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]~feeder_combout\);

-- Location: FF_X33_Y52_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[3]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(3));

-- Location: FF_X34_Y52_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(3),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3));

-- Location: IOIBUF_X38_Y73_N8
\synth_ctrl_1_low_time[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(2),
	o => \synth_ctrl_1_low_time[2]~input_o\);

-- Location: FF_X33_Y52_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[2]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(2));

-- Location: FF_X34_Y52_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(2),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(2));

-- Location: IOIBUF_X27_Y73_N15
\synth_ctrl_1_high_time[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(2),
	o => \synth_ctrl_1_high_time[2]~input_o\);

-- Location: FF_X33_Y52_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_high_time[2]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(2));

-- Location: FF_X34_Y52_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(2),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2));

-- Location: IOIBUF_X35_Y73_N15
\synth_ctrl_1_low_time[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(1),
	o => \synth_ctrl_1_low_time[1]~input_o\);

-- Location: FF_X33_Y52_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[1]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(1));

-- Location: FF_X34_Y52_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(1),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1));

-- Location: IOIBUF_X31_Y73_N8
\synth_ctrl_1_high_time[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(1),
	o => \synth_ctrl_1_high_time[1]~input_o\);

-- Location: LCCOMB_X33_Y52_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]~feeder_combout\ = \synth_ctrl_1_high_time[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_high_time[1]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]~feeder_combout\);

-- Location: FF_X33_Y52_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[1]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(1));

-- Location: FF_X34_Y52_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(1),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1));

-- Location: IOIBUF_X38_Y73_N15
\synth_ctrl_1_low_time[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(0),
	o => \synth_ctrl_1_low_time[0]~input_o\);

-- Location: FF_X33_Y52_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[0]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(0));

-- Location: FF_X34_Y52_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(0),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(0));

-- Location: IOIBUF_X0_Y52_N1
\synth_ctrl_1_high_time[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(0),
	o => \synth_ctrl_1_high_time[0]~input_o\);

-- Location: LCCOMB_X33_Y52_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]~feeder_combout\ = \synth_ctrl_1_high_time[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_high_time[0]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]~feeder_combout\);

-- Location: FF_X33_Y52_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[0]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(0));

-- Location: FF_X34_Y52_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(0),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0));

-- Location: LCCOMB_X34_Y52_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(0) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0) $ (VCC))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(0) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0) & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(0) & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(0),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\);

-- Location: LCCOMB_X34_Y52_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) 
-- & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1) & ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~1\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\);

-- Location: LCCOMB_X34_Y52_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(2) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(2) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(2) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(2),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~3\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\);

-- Location: LCCOMB_X34_Y52_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) 
-- & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3) & ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(3),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~5\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\);

-- Location: LCCOMB_X34_Y52_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(4) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(4) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(4),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~7\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\);

-- Location: LCCOMB_X34_Y52_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\ $ (VCC)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\ = CARRY(\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~0_combout\,
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\);

-- Location: LCCOMB_X34_Y52_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~2_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~1\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\);

-- Location: LCCOMB_X34_Y52_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~4_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~3\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\);

-- Location: LCCOMB_X34_Y52_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~6_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~5\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\);

-- Location: LCCOMB_X34_Y52_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~8_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~7\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\);

-- Location: IOIBUF_X31_Y73_N1
\synth_ctrl_1_low_time[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(5),
	o => \synth_ctrl_1_low_time[5]~input_o\);

-- Location: FF_X33_Y52_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[5]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(5));

-- Location: FF_X34_Y52_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(5),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5));

-- Location: IOIBUF_X38_Y73_N22
\synth_ctrl_1_high_time[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(5),
	o => \synth_ctrl_1_high_time[5]~input_o\);

-- Location: FF_X33_Y52_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_high_time[5]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(5));

-- Location: FF_X34_Y52_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(5),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5));

-- Location: LCCOMB_X34_Y52_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5) & 
-- ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(5),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~9\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\);

-- Location: LCCOMB_X34_Y52_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~10_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~9\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\);

-- Location: LCCOMB_X34_Y49_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\)))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\ & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~8_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~10_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51_combout\);

-- Location: LCCOMB_X34_Y49_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0))))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~0_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~2_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52_combout\);

-- Location: LCCOMB_X34_Y49_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~52_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~6_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53_combout\);

-- Location: LCCOMB_X34_Y49_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(4),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(5),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3_combout\);

-- Location: IOIBUF_X33_Y73_N8
\synth_ctrl_1_high_time[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(6),
	o => \synth_ctrl_1_high_time[6]~input_o\);

-- Location: LCCOMB_X33_Y52_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]~feeder_combout\ = \synth_ctrl_1_high_time[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_high_time[6]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]~feeder_combout\);

-- Location: FF_X33_Y52_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[6]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(6));

-- Location: FF_X34_Y52_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(6),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6));

-- Location: IOIBUF_X29_Y73_N8
\synth_ctrl_1_high_time[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_high_time(7),
	o => \synth_ctrl_1_high_time[7]~input_o\);

-- Location: LCCOMB_X33_Y52_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~feeder_combout\ = \synth_ctrl_1_high_time[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_high_time[7]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~feeder_combout\);

-- Location: FF_X33_Y52_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(7));

-- Location: FF_X34_Y52_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time\(7),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7));

-- Location: LCCOMB_X34_Y49_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4_combout\);

-- Location: LCCOMB_X34_Y49_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(2),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(3),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1_combout\);

-- Location: LCCOMB_X34_Y49_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(1),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(0),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0_combout\);

-- Location: LCCOMB_X34_Y49_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~1_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~0_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2_combout\);

-- Location: LCCOMB_X34_Y49_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~3_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~4_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~2_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\);

-- Location: LCCOMB_X34_Y49_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\);

-- Location: LCCOMB_X34_Y49_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\);

-- Location: LCCOMB_X34_Y49_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\ & 
-- (((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49_combout\);

-- Location: LCCOMB_X34_Y49_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4_combout\ $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~4_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~49_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50_combout\);

-- Location: IOIBUF_X33_Y73_N1
\synth_ctrl_1_low_time[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(6),
	o => \synth_ctrl_1_low_time[6]~input_o\);

-- Location: FF_X33_Y52_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_1_low_time[6]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(6));

-- Location: FF_X34_Y52_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(6),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(6));

-- Location: LCCOMB_X34_Y52_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(6) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~13\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(6) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(6) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(6),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~11\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~13\);

-- Location: LCCOMB_X34_Y52_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~13\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~12_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~11\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~13\);

-- Location: IOIBUF_X29_Y73_N1
\synth_ctrl_1_low_time[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_1_low_time(7),
	o => \synth_ctrl_1_low_time[7]~input_o\);

-- Location: LCCOMB_X33_Y52_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]~feeder_combout\ = \synth_ctrl_1_low_time[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_1_low_time[7]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]~feeder_combout\);

-- Location: FF_X33_Y52_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time[7]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(7));

-- Location: FF_X34_Y52_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|low_time\(7),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(7));

-- Location: LCCOMB_X34_Y52_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(7) $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_high_time\(7),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|current_low_time\(7),
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~13\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14_combout\);

-- Location: LCCOMB_X34_Y52_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~13\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add0~14_combout\,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~13\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\);

-- Location: LCCOMB_X34_Y49_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\ & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\ 
-- $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6)))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\ 
-- & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6)) # (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\ $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~12_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Add1~14_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54_combout\);

-- Location: LCCOMB_X34_Y49_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50_combout\ & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~51_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~53_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~50_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~54_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\);

-- Location: LCCOMB_X34_Y48_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\ = (\audio_ctrl_inst|gen_nxt_sample~q\ & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\,
	datab => \audio_ctrl_inst|gen_nxt_sample~q\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\);

-- Location: FF_X35_Y49_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~31_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(0));

-- Location: LCCOMB_X35_Y49_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~33_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[0]~32\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~33_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\);

-- Location: FF_X35_Y49_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~33_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(1));

-- Location: LCCOMB_X35_Y49_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~35_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[1]~34\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~35_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\);

-- Location: FF_X35_Y49_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~35_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(2));

-- Location: LCCOMB_X35_Y49_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~37_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[2]~36\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~37_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\);

-- Location: FF_X35_Y49_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~37_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(3));

-- Location: LCCOMB_X35_Y49_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~39_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[3]~38\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~39_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\);

-- Location: FF_X35_Y49_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~39_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(4));

-- Location: LCCOMB_X35_Y49_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~41_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[4]~40\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~41_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\);

-- Location: FF_X35_Y49_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~41_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(5));

-- Location: LCCOMB_X35_Y49_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~43_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[5]~42\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~43_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\);

-- Location: FF_X35_Y49_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~43_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(6));

-- Location: LCCOMB_X35_Y49_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~45_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[6]~44\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~45_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\);

-- Location: FF_X35_Y49_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~45_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(7));

-- Location: LCCOMB_X35_Y49_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~47_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[7]~46\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~47_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\);

-- Location: FF_X35_Y49_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~47_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8));

-- Location: LCCOMB_X35_Y49_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~57_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[8]~48\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~57_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\);

-- Location: FF_X35_Y49_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~57_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9));

-- Location: LCCOMB_X35_Y49_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~59_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[9]~58\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~59_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\);

-- Location: FF_X35_Y49_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~59_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10));

-- Location: LCCOMB_X35_Y49_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~61_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[10]~60\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~61_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\);

-- Location: FF_X35_Y49_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~61_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11));

-- Location: LCCOMB_X35_Y49_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(8),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(9),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(10),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(11),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0_combout\);

-- Location: LCCOMB_X35_Y49_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~63_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[11]~62\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~63_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\);

-- Location: FF_X35_Y49_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~63_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12));

-- Location: LCCOMB_X35_Y49_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~65_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[12]~64\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~65_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\);

-- Location: FF_X35_Y49_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~65_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13));

-- Location: LCCOMB_X35_Y49_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~67_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[13]~66\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~67_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\);

-- Location: FF_X35_Y49_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~67_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14));

-- Location: LCCOMB_X35_Y48_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~69_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[14]~68\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~69_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\);

-- Location: FF_X35_Y48_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~69_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15));

-- Location: LCCOMB_X34_Y48_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(14),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(12),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(15),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(13),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1_combout\);

-- Location: LCCOMB_X35_Y48_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~71_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[15]~70\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~71_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\);

-- Location: FF_X35_Y48_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~71_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16));

-- Location: LCCOMB_X35_Y48_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~73_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[16]~72\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~73_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\);

-- Location: FF_X35_Y48_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~73_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17));

-- Location: LCCOMB_X35_Y48_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~75_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[17]~74\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~75_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\);

-- Location: FF_X35_Y48_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~75_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18));

-- Location: LCCOMB_X35_Y48_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~77_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[18]~76\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~77_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\);

-- Location: FF_X35_Y48_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~77_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19));

-- Location: LCCOMB_X34_Y48_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(16),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(17),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(19),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(18),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2_combout\);

-- Location: LCCOMB_X35_Y48_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~79_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[19]~78\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~79_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\);

-- Location: FF_X35_Y48_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~79_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20));

-- Location: LCCOMB_X35_Y48_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~81_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[20]~80\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~81_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\);

-- Location: FF_X35_Y48_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~81_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21));

-- Location: LCCOMB_X35_Y48_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~83_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[21]~82\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~83_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\);

-- Location: FF_X35_Y48_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~83_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22));

-- Location: LCCOMB_X35_Y48_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~85_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[22]~84\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~85_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\);

-- Location: FF_X35_Y48_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~85_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23));

-- Location: LCCOMB_X34_Y48_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(20),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(21),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(22),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(23),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3_combout\);

-- Location: LCCOMB_X34_Y48_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~0_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~1_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~2_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~3_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4_combout\);

-- Location: LCCOMB_X35_Y48_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~87_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[23]~86\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~87_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\);

-- Location: FF_X35_Y48_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~87_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24));

-- Location: LCCOMB_X35_Y48_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~89_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[24]~88\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~89_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\);

-- Location: FF_X35_Y48_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~89_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25));

-- Location: LCCOMB_X35_Y48_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~91_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[25]~90\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~91_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\);

-- Location: FF_X35_Y48_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~91_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26));

-- Location: LCCOMB_X35_Y48_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~93_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[26]~92\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~93_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\);

-- Location: FF_X35_Y48_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~93_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27));

-- Location: LCCOMB_X34_Y48_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(27),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(24),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(25),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(26),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5_combout\);

-- Location: LCCOMB_X35_Y48_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~95_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[27]~94\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~95_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\);

-- Location: FF_X35_Y48_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~95_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28));

-- Location: LCCOMB_X35_Y48_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~97_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~98\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[28]~96\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~97_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~98\);

-- Location: FF_X35_Y48_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~97_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29));

-- Location: LCCOMB_X35_Y48_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~99_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(30) $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~98\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(30),
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[29]~98\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~99_combout\);

-- Location: FF_X35_Y48_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~99_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(30));

-- Location: LCCOMB_X34_Y48_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(30) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(28),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(30),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_cnt\(29),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6_combout\);

-- Location: LCCOMB_X34_Y48_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5_combout\ & 
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~4_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~5_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~6_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\);

-- Location: LCCOMB_X34_Y49_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\ & 
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~7_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~9_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~8_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\);

-- Location: LCCOMB_X34_Y48_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~0_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15)) # (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~0_combout\);

-- Location: FF_X34_Y48_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|gen_nxt_sample~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15));

-- Location: IOIBUF_X74_Y73_N15
\synth_ctrl_0_play~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_play,
	o => \synth_ctrl_0_play~input_o\);

-- Location: LCCOMB_X74_Y54_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\ = \synth_ctrl_0_play~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_play~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\);

-- Location: FF_X74_Y54_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(1));

-- Location: FF_X74_Y48_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(1),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2));

-- Location: LCCOMB_X75_Y49_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~31_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0) $ (VCC)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\ = CARRY(\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~31_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\);

-- Location: IOIBUF_X72_Y73_N1
\synth_ctrl_0_high_time[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(3),
	o => \synth_ctrl_0_high_time[3]~input_o\);

-- Location: LCCOMB_X76_Y55_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]~feeder_combout\ = \synth_ctrl_0_high_time[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_high_time[3]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]~feeder_combout\);

-- Location: FF_X74_Y48_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|synth_play_last\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|synth_play_last~q\);

-- Location: LCCOMB_X74_Y48_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2) & (\res_n~input_o\ & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|synth_play_last~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datab => \res_n~input_o\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|synth_play_last~q\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\);

-- Location: FF_X76_Y55_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[3]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(3));

-- Location: LCCOMB_X75_Y51_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]~feeder_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(3),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]~feeder_combout\);

-- Location: LCCOMB_X74_Y48_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2) & (\res_n~input_o\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ & \audio_ctrl_inst|gen_nxt_sample~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datab => \res_n~input_o\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\,
	datad => \audio_ctrl_inst|gen_nxt_sample~q\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\);

-- Location: FF_X75_Y51_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[3]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3));

-- Location: IOIBUF_X83_Y73_N8
\synth_ctrl_0_low_time[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(3),
	o => \synth_ctrl_0_low_time[3]~input_o\);

-- Location: FF_X76_Y55_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_low_time[3]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(3));

-- Location: FF_X76_Y51_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(3),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3));

-- Location: IOIBUF_X69_Y73_N22
\synth_ctrl_0_high_time[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(2),
	o => \synth_ctrl_0_high_time[2]~input_o\);

-- Location: LCCOMB_X76_Y55_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]~feeder_combout\ = \synth_ctrl_0_high_time[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_high_time[2]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]~feeder_combout\);

-- Location: FF_X76_Y55_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[2]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(2));

-- Location: FF_X76_Y51_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(2),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2));

-- Location: IOIBUF_X69_Y73_N15
\synth_ctrl_0_low_time[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(2),
	o => \synth_ctrl_0_low_time[2]~input_o\);

-- Location: LCCOMB_X76_Y55_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]~feeder_combout\ = \synth_ctrl_0_low_time[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_low_time[2]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]~feeder_combout\);

-- Location: FF_X76_Y55_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[2]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(2));

-- Location: FF_X76_Y51_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(2),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(2));

-- Location: IOIBUF_X74_Y73_N22
\synth_ctrl_0_high_time[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(1),
	o => \synth_ctrl_0_high_time[1]~input_o\);

-- Location: FF_X76_Y55_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_high_time[1]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(1));

-- Location: LCCOMB_X76_Y51_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]~feeder_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(1),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]~feeder_combout\);

-- Location: FF_X76_Y51_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[1]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1));

-- Location: IOIBUF_X81_Y73_N15
\synth_ctrl_0_low_time[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(1),
	o => \synth_ctrl_0_low_time[1]~input_o\);

-- Location: FF_X76_Y55_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_low_time[1]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(1));

-- Location: FF_X76_Y51_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(1),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1));

-- Location: IOIBUF_X81_Y73_N22
\synth_ctrl_0_low_time[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(0),
	o => \synth_ctrl_0_low_time[0]~input_o\);

-- Location: LCCOMB_X76_Y55_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]~feeder_combout\ = \synth_ctrl_0_low_time[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_low_time[0]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]~feeder_combout\);

-- Location: FF_X76_Y55_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[0]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(0));

-- Location: FF_X76_Y51_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(0),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(0));

-- Location: IOIBUF_X83_Y73_N22
\synth_ctrl_0_high_time[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(0),
	o => \synth_ctrl_0_high_time[0]~input_o\);

-- Location: FF_X76_Y55_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_high_time[0]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(0));

-- Location: FF_X76_Y51_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(0),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0));

-- Location: LCCOMB_X76_Y51_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(0) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0) $ (VCC))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(0) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0) & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(0) & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(0),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0),
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\);

-- Location: LCCOMB_X76_Y51_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1) 
-- & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~1\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\);

-- Location: LCCOMB_X76_Y51_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(2) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(2)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(2) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~3\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\);

-- Location: LCCOMB_X76_Y51_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3) 
-- & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~5\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\);

-- Location: LCCOMB_X76_Y49_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\ $ (VCC)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\ = CARRY(\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~0_combout\,
	datad => VCC,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\);

-- Location: LCCOMB_X76_Y49_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~2_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~1\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\);

-- Location: LCCOMB_X76_Y49_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~4_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~3\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\);

-- Location: LCCOMB_X76_Y49_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~6_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~5\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\);

-- Location: IOIBUF_X81_Y73_N1
\synth_ctrl_0_low_time[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(4),
	o => \synth_ctrl_0_low_time[4]~input_o\);

-- Location: FF_X76_Y55_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_low_time[4]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(4));

-- Location: FF_X76_Y51_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(4),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(4));

-- Location: IOIBUF_X79_Y73_N1
\synth_ctrl_0_high_time[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(4),
	o => \synth_ctrl_0_high_time[4]~input_o\);

-- Location: FF_X76_Y55_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_high_time[4]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(4));

-- Location: FF_X76_Y51_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(4),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4));

-- Location: LCCOMB_X76_Y51_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(4) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(4) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(4),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~7\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\);

-- Location: LCCOMB_X76_Y49_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~8_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~7\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\);

-- Location: LCCOMB_X76_Y49_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\)))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~6_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~8_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51_combout\);

-- Location: IOIBUF_X83_Y73_N15
\synth_ctrl_0_high_time[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(5),
	o => \synth_ctrl_0_high_time[5]~input_o\);

-- Location: LCCOMB_X76_Y55_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]~feeder_combout\ = \synth_ctrl_0_high_time[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_high_time[5]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]~feeder_combout\);

-- Location: FF_X76_Y55_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[5]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(5));

-- Location: LCCOMB_X76_Y51_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]~feeder_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(5),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]~feeder_combout\);

-- Location: FF_X76_Y51_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[5]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5));

-- Location: IOIBUF_X81_Y73_N8
\synth_ctrl_0_low_time[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(5),
	o => \synth_ctrl_0_low_time[5]~input_o\);

-- Location: LCCOMB_X76_Y55_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]~feeder_combout\ = \synth_ctrl_0_low_time[5]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_low_time[5]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]~feeder_combout\);

-- Location: FF_X76_Y55_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[5]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(5));

-- Location: FF_X76_Y51_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(5),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5));

-- Location: LCCOMB_X76_Y51_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\)))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\)) 
-- # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\) # (GND)))))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) & 
-- ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~9\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\);

-- Location: LCCOMB_X76_Y49_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\ & VCC)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\ & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\ & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~10_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~9\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\);

-- Location: LCCOMB_X76_Y49_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1))))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~2_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~0_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52_combout\);

-- Location: LCCOMB_X76_Y49_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~10_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~52_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53_combout\);

-- Location: LCCOMB_X76_Y49_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\);

-- Location: LCCOMB_X76_Y49_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\);

-- Location: LCCOMB_X74_Y48_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\ & 
-- (((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49_combout\);

-- Location: LCCOMB_X74_Y48_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\);

-- Location: LCCOMB_X76_Y51_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(5),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(4),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2_combout\);

-- Location: IOIBUF_X79_Y73_N8
\synth_ctrl_0_high_time[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(6),
	o => \synth_ctrl_0_high_time[6]~input_o\);

-- Location: LCCOMB_X76_Y55_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]~feeder_combout\ = \synth_ctrl_0_high_time[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \synth_ctrl_0_high_time[6]~input_o\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]~feeder_combout\);

-- Location: FF_X76_Y55_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[6]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(6));

-- Location: FF_X76_Y51_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(6),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6));

-- Location: IOIBUF_X72_Y73_N8
\synth_ctrl_0_high_time[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_high_time(7),
	o => \synth_ctrl_0_high_time[7]~input_o\);

-- Location: FF_X76_Y55_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_high_time[7]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(7));

-- Location: LCCOMB_X76_Y51_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~feeder_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time\(7),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~feeder_combout\);

-- Location: FF_X76_Y51_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~feeder_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7));

-- Location: LCCOMB_X76_Y51_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3_combout\);

-- Location: LCCOMB_X76_Y51_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(3),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(2),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1_combout\);

-- Location: LCCOMB_X76_Y51_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0))))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0) $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(0),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(1),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0_combout\);

-- Location: LCCOMB_X76_Y51_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~2_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~3_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~1_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~0_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4_combout\);

-- Location: LCCOMB_X74_Y49_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0_combout\);

-- Location: LCCOMB_X74_Y48_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2_combout\);

-- Location: LCCOMB_X74_Y48_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3_combout\);

-- Location: LCCOMB_X74_Y48_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1_combout\);

-- Location: LCCOMB_X74_Y48_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~0_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~2_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~3_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~1_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\);

-- Location: LCCOMB_X74_Y48_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4_combout\ & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~4_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\);

-- Location: LCCOMB_X75_Y49_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49_combout\ & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~49_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~4_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50_combout\);

-- Location: IOIBUF_X72_Y73_N15
\synth_ctrl_0_low_time[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(6),
	o => \synth_ctrl_0_low_time[6]~input_o\);

-- Location: FF_X76_Y55_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_low_time[6]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(6));

-- Location: FF_X76_Y51_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(6),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(6));

-- Location: LCCOMB_X76_Y51_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\ = ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(6) $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6) $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\)))) # (GND)
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~13\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(6) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(6) & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(6),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(6),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~11\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~13\);

-- Location: LCCOMB_X76_Y49_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\ & ((GND) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\))) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\ $ (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~13\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~12_combout\,
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~11\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~13\);

-- Location: IOIBUF_X72_Y73_N22
\synth_ctrl_0_low_time[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_synth_ctrl_0_low_time(7),
	o => \synth_ctrl_0_low_time[7]~input_o\);

-- Location: FF_X76_Y55_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \synth_ctrl_0_low_time[7]~input_o\,
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(7));

-- Location: FF_X76_Y51_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|low_time\(7),
	sload => VCC,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time[7]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(7));

-- Location: LCCOMB_X76_Y51_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7) $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~13\ $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_high_time\(7),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|current_low_time\(7),
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~13\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14_combout\);

-- Location: LCCOMB_X76_Y49_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~13\ $ (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add0~14_combout\,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~13\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\);

-- Location: LCCOMB_X76_Y49_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\ $ 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\) # (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\ $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101111011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~12_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Add1~14_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54_combout\);

-- Location: LCCOMB_X76_Y49_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50_combout\ & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~51_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~53_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~50_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~54_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\);

-- Location: LCCOMB_X74_Y48_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\ = (\audio_ctrl_inst|gen_nxt_sample~q\ & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\,
	datad => \audio_ctrl_inst|gen_nxt_sample~q\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\);

-- Location: FF_X75_Y49_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~31_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(0));

-- Location: LCCOMB_X75_Y49_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~33_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[0]~32\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~33_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\);

-- Location: FF_X75_Y49_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~33_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(1));

-- Location: LCCOMB_X75_Y49_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~35_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[1]~34\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~35_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\);

-- Location: FF_X75_Y49_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~35_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(2));

-- Location: LCCOMB_X75_Y49_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~37_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[2]~36\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~37_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\);

-- Location: FF_X75_Y49_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~37_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(3));

-- Location: LCCOMB_X75_Y49_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~39_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[3]~38\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~39_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\);

-- Location: FF_X75_Y49_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~39_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(4));

-- Location: LCCOMB_X75_Y49_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~41_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[4]~40\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~41_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\);

-- Location: FF_X75_Y49_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~41_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(5));

-- Location: LCCOMB_X75_Y49_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~43_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[5]~42\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~43_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\);

-- Location: FF_X75_Y49_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~43_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(6));

-- Location: LCCOMB_X75_Y49_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~45_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[6]~44\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~45_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\);

-- Location: FF_X75_Y49_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~45_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(7));

-- Location: LCCOMB_X75_Y49_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~47_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[7]~46\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~47_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\);

-- Location: FF_X75_Y49_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~47_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(8));

-- Location: LCCOMB_X75_Y49_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~57_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9) & ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\) 
-- # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[8]~48\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~57_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\);

-- Location: FF_X75_Y49_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~57_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(9));

-- Location: LCCOMB_X75_Y49_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~59_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[9]~58\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~59_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\);

-- Location: FF_X75_Y49_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~59_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(10));

-- Location: LCCOMB_X75_Y49_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~61_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[10]~60\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~61_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\);

-- Location: FF_X75_Y49_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~61_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(11));

-- Location: LCCOMB_X75_Y49_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~63_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[11]~62\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~63_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\);

-- Location: FF_X75_Y49_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~63_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(12));

-- Location: LCCOMB_X75_Y49_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~65_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[12]~64\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~65_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\);

-- Location: FF_X75_Y49_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~65_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(13));

-- Location: LCCOMB_X75_Y49_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~67_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[13]~66\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~67_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\);

-- Location: FF_X75_Y49_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~67_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(14));

-- Location: LCCOMB_X75_Y48_N0
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~69_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[14]~68\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~69_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\);

-- Location: FF_X75_Y48_N1
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~69_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(15));

-- Location: LCCOMB_X75_Y48_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~71_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[15]~70\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~71_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\);

-- Location: FF_X75_Y48_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~71_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(16));

-- Location: LCCOMB_X75_Y48_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~73_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[16]~72\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~73_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\);

-- Location: FF_X75_Y48_N5
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~73_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(17));

-- Location: LCCOMB_X75_Y48_N6
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~75_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[17]~74\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~75_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\);

-- Location: FF_X75_Y48_N7
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~75_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(18));

-- Location: LCCOMB_X75_Y48_N8
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~77_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[18]~76\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~77_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\);

-- Location: FF_X75_Y48_N9
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~77_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(19));

-- Location: LCCOMB_X75_Y48_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~79_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[19]~78\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~79_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\);

-- Location: FF_X75_Y48_N11
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~79_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(20));

-- Location: LCCOMB_X75_Y48_N12
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~81_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[20]~80\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~81_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\);

-- Location: FF_X75_Y48_N13
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~81_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(21));

-- Location: LCCOMB_X75_Y48_N14
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~83_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[21]~82\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~83_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\);

-- Location: FF_X75_Y48_N15
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~83_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(22));

-- Location: LCCOMB_X75_Y48_N16
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~85_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[22]~84\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~85_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\);

-- Location: FF_X75_Y48_N17
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~85_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(23));

-- Location: LCCOMB_X75_Y48_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~87_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[23]~86\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~87_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\);

-- Location: FF_X75_Y48_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~87_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(24));

-- Location: LCCOMB_X75_Y48_N20
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~89_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[24]~88\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~89_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\);

-- Location: FF_X75_Y48_N21
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~89_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(25));

-- Location: LCCOMB_X75_Y48_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~91_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[25]~90\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~91_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\);

-- Location: FF_X75_Y48_N23
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~91_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(26));

-- Location: LCCOMB_X75_Y48_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~93_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[26]~92\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~93_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\);

-- Location: FF_X75_Y48_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~93_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(27));

-- Location: LCCOMB_X75_Y48_N26
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~95_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28) & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\ $ (GND))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\ & VCC))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\ = CARRY((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[27]~94\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~95_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\);

-- Location: FF_X75_Y48_N27
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~95_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28));

-- Location: LCCOMB_X75_Y48_N28
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~97_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29) & 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\)) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29) & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\) # (GND)))
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~98\ = CARRY((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29),
	datad => VCC,
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[28]~96\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~97_combout\,
	cout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~98\);

-- Location: FF_X75_Y48_N29
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~97_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29));

-- Location: LCCOMB_X75_Y48_N30
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~99_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(30) $ 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~98\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(30),
	cin => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[29]~98\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~99_combout\);

-- Location: FF_X75_Y48_N31
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~99_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt~55_combout\,
	ena => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt[30]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(30));

-- Location: LCCOMB_X74_Y48_N22
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29) & (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(30) & 
-- !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(29),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(30),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_cnt\(28),
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\);

-- Location: LCCOMB_X74_Y48_N10
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\ & 
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~6_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~4_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\);

-- Location: LCCOMB_X74_Y48_N4
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\ & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\ & 
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~7_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~9_combout\,
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~8_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\);

-- Location: LCCOMB_X74_Y48_N18
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~1_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ & 
-- (((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~1_combout\);

-- Location: FF_X74_Y48_N19
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|gen_nxt_sample~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14));

-- Location: LCCOMB_X34_Y48_N2
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~1_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ & 
-- (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\ & 
-- (((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14) & !\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal0~10_combout\,
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|play_sync_inst|sync_vec\(2),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|Equal1~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~1_combout\);

-- Location: FF_X34_Y48_N3
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|gen_nxt_sample~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14));

-- Location: LCCOMB_X74_Y48_N24
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~0_combout\ = (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\ & 
-- ((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15)) # (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal0~10_combout\,
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|Equal1~5_combout\,
	combout => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~0_combout\);

-- Location: FF_X74_Y48_N25
\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \audio_ctrl_inst|gen_nxt_sample~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15));

-- Location: LCCOMB_X46_Y44_N6
\audio_ctrl_inst|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add3~0_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15) & (((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14)))) # (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15) 
-- & (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15) & ((!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14)) # 
-- (!\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15),
	combout => \audio_ctrl_inst|Add3~0_combout\);

-- Location: FF_X46_Y44_N7
\audio_ctrl_inst|dac_interface:audio_sample[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add3~0_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	ena => \audio_ctrl_inst|Equal4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:audio_sample[15]~q\);

-- Location: LCCOMB_X47_Y40_N6
\audio_ctrl_inst|Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal2~7_combout\ = (\audio_ctrl_inst|Equal2~0_combout\ & (\audio_ctrl_inst|Equal2~5_combout\ & \audio_ctrl_inst|Equal2~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~0_combout\,
	datab => \audio_ctrl_inst|Equal2~5_combout\,
	datac => \audio_ctrl_inst|Equal2~6_combout\,
	combout => \audio_ctrl_inst|Equal2~7_combout\);

-- Location: LCCOMB_X47_Y40_N30
\audio_ctrl_inst|Equal3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Equal3~1_combout\ = (\audio_ctrl_inst|dac_interface:clk_cnt[9]~q\ & (\audio_ctrl_inst|Equal3~0_combout\ & (\audio_ctrl_inst|dac_interface:clk_cnt[5]~q\ & \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:clk_cnt[9]~q\,
	datab => \audio_ctrl_inst|Equal3~0_combout\,
	datac => \audio_ctrl_inst|dac_interface:clk_cnt[5]~q\,
	datad => \audio_ctrl_inst|dac_interface:clk_cnt[2]~q\,
	combout => \audio_ctrl_inst|Equal3~1_combout\);

-- Location: LCCOMB_X46_Y44_N8
\audio_ctrl_inst|dac_interface:audio_sample[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ = (\audio_ctrl_inst|Equal2~7_combout\ & ((\audio_ctrl_inst|Equal2~9_combout\) # (\audio_ctrl_inst|Equal3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~9_combout\,
	datab => \audio_ctrl_inst|Equal2~7_combout\,
	datac => \audio_ctrl_inst|Equal3~1_combout\,
	combout => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\);

-- Location: LCCOMB_X46_Y44_N14
\audio_ctrl_inst|Add3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add3~1_combout\ = \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15) $ (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15) $ 
-- (((\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14) & \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(15),
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14),
	datad => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(15),
	combout => \audio_ctrl_inst|Add3~1_combout\);

-- Location: FF_X46_Y44_N15
\audio_ctrl_inst|dac_interface:audio_sample[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add3~1_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	ena => \audio_ctrl_inst|Equal4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:audio_sample[14]~q\);

-- Location: LCCOMB_X46_Y44_N2
\audio_ctrl_inst|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|Add3~2_combout\ = (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14)) # (\audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:0:synthesizer_inst1|sample_out\(14),
	datac => \audio_ctrl_inst|synth:GENERATE_SYHTESIZERS:1:synthesizer_inst1|sample_out\(14),
	combout => \audio_ctrl_inst|Add3~2_combout\);

-- Location: FF_X46_Y44_N3
\audio_ctrl_inst|dac_interface:audio_sample[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|Add3~2_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	ena => \audio_ctrl_inst|Equal4~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\);

-- Location: LCCOMB_X46_Y44_N28
\audio_ctrl_inst|sample_shift_reg~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~14_combout\ = (\audio_ctrl_inst|Equal2~7_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\ & ((\audio_ctrl_inst|Equal2~9_combout\) # (\audio_ctrl_inst|Equal3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~9_combout\,
	datab => \audio_ctrl_inst|Equal2~7_combout\,
	datac => \audio_ctrl_inst|Equal3~1_combout\,
	datad => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~14_combout\);

-- Location: LCCOMB_X46_Y44_N24
\audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\ = (\audio_ctrl_inst|cfg_fsm_state.DONE~q\ & (\res_n~input_o\ & ((\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\) # (!\audio_ctrl_inst|Equal4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	datab => \res_n~input_o\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|Equal4~2_combout\,
	combout => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\);

-- Location: LCCOMB_X47_Y44_N12
\audio_ctrl_inst|dac_interface:sample_shift_reg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~0_combout\ = (\audio_ctrl_inst|sync~0_combout\ & (((\audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\ & !\audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\)))) # 
-- (!\audio_ctrl_inst|sync~0_combout\ & ((\audio_ctrl_inst|sample_shift_reg~14_combout\) # ((\audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\ & !\audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|sync~0_combout\,
	datab => \audio_ctrl_inst|sample_shift_reg~14_combout\,
	datac => \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	combout => \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~0_combout\);

-- Location: FF_X47_Y44_N13
\audio_ctrl_inst|dac_interface:sample_shift_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\);

-- Location: LCCOMB_X48_Y44_N16
\audio_ctrl_inst|sample_shift_reg~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~13_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[0]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~13_combout\);

-- Location: FF_X48_Y44_N17
\audio_ctrl_inst|dac_interface:sample_shift_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~13_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[1]~q\);

-- Location: LCCOMB_X48_Y44_N6
\audio_ctrl_inst|sample_shift_reg~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~12_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[1]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[1]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~12_combout\);

-- Location: FF_X48_Y44_N7
\audio_ctrl_inst|dac_interface:sample_shift_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~12_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[2]~q\);

-- Location: LCCOMB_X48_Y44_N28
\audio_ctrl_inst|sample_shift_reg~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~11_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[2]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[2]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~11_combout\);

-- Location: FF_X48_Y44_N29
\audio_ctrl_inst|dac_interface:sample_shift_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~11_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[3]~q\);

-- Location: LCCOMB_X48_Y44_N18
\audio_ctrl_inst|sample_shift_reg~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~10_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[3]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~10_combout\);

-- Location: FF_X48_Y44_N19
\audio_ctrl_inst|dac_interface:sample_shift_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~10_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[4]~q\);

-- Location: LCCOMB_X48_Y44_N8
\audio_ctrl_inst|sample_shift_reg~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~9_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[4]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[4]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~9_combout\);

-- Location: FF_X48_Y44_N9
\audio_ctrl_inst|dac_interface:sample_shift_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~9_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[5]~q\);

-- Location: LCCOMB_X48_Y44_N22
\audio_ctrl_inst|sample_shift_reg~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~8_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[5]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datab => \audio_ctrl_inst|dac_interface:sample_shift_reg[5]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	combout => \audio_ctrl_inst|sample_shift_reg~8_combout\);

-- Location: FF_X48_Y44_N23
\audio_ctrl_inst|dac_interface:sample_shift_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~8_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[6]~q\);

-- Location: LCCOMB_X48_Y44_N20
\audio_ctrl_inst|sample_shift_reg~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~7_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[6]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datab => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datac => \audio_ctrl_inst|dac_interface:sample_shift_reg[6]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~7_combout\);

-- Location: FF_X48_Y44_N21
\audio_ctrl_inst|dac_interface:sample_shift_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~7_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[7]~q\);

-- Location: LCCOMB_X48_Y44_N26
\audio_ctrl_inst|sample_shift_reg~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~6_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[7]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[7]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~6_combout\);

-- Location: FF_X48_Y44_N27
\audio_ctrl_inst|dac_interface:sample_shift_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~6_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[8]~q\);

-- Location: LCCOMB_X48_Y44_N0
\audio_ctrl_inst|sample_shift_reg~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~5_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[8]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datab => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datac => \audio_ctrl_inst|dac_interface:sample_shift_reg[8]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~5_combout\);

-- Location: FF_X48_Y44_N1
\audio_ctrl_inst|dac_interface:sample_shift_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~5_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[9]~q\);

-- Location: LCCOMB_X48_Y44_N30
\audio_ctrl_inst|sample_shift_reg~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~4_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[9]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[9]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~4_combout\);

-- Location: FF_X48_Y44_N31
\audio_ctrl_inst|dac_interface:sample_shift_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~4_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[10]~q\);

-- Location: LCCOMB_X48_Y44_N12
\audio_ctrl_inst|sample_shift_reg~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~3_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[10]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datab => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datac => \audio_ctrl_inst|dac_interface:sample_shift_reg[10]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~3_combout\);

-- Location: FF_X48_Y44_N13
\audio_ctrl_inst|dac_interface:sample_shift_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~3_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[11]~q\);

-- Location: LCCOMB_X48_Y44_N10
\audio_ctrl_inst|sample_shift_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~2_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[11]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[11]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~2_combout\);

-- Location: FF_X48_Y44_N11
\audio_ctrl_inst|dac_interface:sample_shift_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~2_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[12]~q\);

-- Location: LCCOMB_X48_Y44_N24
\audio_ctrl_inst|sample_shift_reg~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~1_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[13]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[12]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[13]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[12]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~1_combout\);

-- Location: FF_X48_Y44_N25
\audio_ctrl_inst|dac_interface:sample_shift_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~1_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[13]~q\);

-- Location: LCCOMB_X47_Y44_N18
\audio_ctrl_inst|sample_shift_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|sample_shift_reg~0_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[14]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- ((\audio_ctrl_inst|dac_interface:sample_shift_reg[13]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[14]~q\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[13]~q\,
	combout => \audio_ctrl_inst|sample_shift_reg~0_combout\);

-- Location: FF_X47_Y44_N19
\audio_ctrl_inst|dac_interface:sample_shift_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|sample_shift_reg~0_combout\,
	ena => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~q\);

-- Location: LCCOMB_X46_Y44_N10
\audio_ctrl_inst|wm8731_dacdat~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|wm8731_dacdat~0_combout\ = (\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|dac_interface:audio_sample[15]~q\)) # (!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & 
-- (((!\audio_ctrl_inst|Equal4~2_combout\ & \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|dac_interface:audio_sample[15]~q\,
	datab => \audio_ctrl_inst|Equal4~2_combout\,
	datac => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datad => \audio_ctrl_inst|dac_interface:sample_shift_reg[14]~q\,
	combout => \audio_ctrl_inst|wm8731_dacdat~0_combout\);

-- Location: LCCOMB_X46_Y44_N16
\audio_ctrl_inst|wm8731_dacdat~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|wm8731_dacdat~1_combout\ = (\audio_ctrl_inst|wm8731_dacdat~0_combout\) # ((!\audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\ & (\audio_ctrl_inst|wm8731_dacdat~q\ & \audio_ctrl_inst|Equal4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|wm8731_dacdat~0_combout\,
	datab => \audio_ctrl_inst|dac_interface:audio_sample[6]~0_combout\,
	datac => \audio_ctrl_inst|wm8731_dacdat~q\,
	datad => \audio_ctrl_inst|Equal4~2_combout\,
	combout => \audio_ctrl_inst|wm8731_dacdat~1_combout\);

-- Location: FF_X46_Y44_N17
\audio_ctrl_inst|wm8731_dacdat\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|wm8731_dacdat~1_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|wm8731_dacdat~q\);

-- Location: LCCOMB_X46_Y44_N26
\audio_ctrl_inst|daclrck~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|daclrck~0_combout\ = (\audio_ctrl_inst|Equal2~7_combout\ & ((\audio_ctrl_inst|Equal2~9_combout\) # ((\audio_ctrl_inst|wm8731_daclrck~q\ & !\audio_ctrl_inst|Equal3~1_combout\)))) # (!\audio_ctrl_inst|Equal2~7_combout\ & 
-- (((\audio_ctrl_inst|wm8731_daclrck~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \audio_ctrl_inst|Equal2~9_combout\,
	datab => \audio_ctrl_inst|Equal2~7_combout\,
	datac => \audio_ctrl_inst|wm8731_daclrck~q\,
	datad => \audio_ctrl_inst|Equal3~1_combout\,
	combout => \audio_ctrl_inst|daclrck~0_combout\);

-- Location: FF_X46_Y44_N27
\audio_ctrl_inst|wm8731_daclrck\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \audio_ctrl_inst|daclrck~0_combout\,
	clrn => \audio_ctrl_inst|ALT_INV_sync~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \audio_ctrl_inst|wm8731_daclrck~q\);

-- Location: LCCOMB_X46_Y44_N20
\audio_ctrl_inst|wm8731_bclk~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \audio_ctrl_inst|wm8731_bclk~0_combout\ = (\clk~input_o\) # (!\audio_ctrl_inst|cfg_fsm_state.DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clk~input_o\,
	datac => \audio_ctrl_inst|cfg_fsm_state.DONE~q\,
	combout => \audio_ctrl_inst|wm8731_bclk~0_combout\);

-- Location: IOIBUF_X52_Y73_N8
\wm8731_sdat~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => wm8731_sdat,
	o => \wm8731_sdat~input_o\);

ww_wm8731_xck <= \wm8731_xck~output_o\;

ww_wm8731_dacdat <= \wm8731_dacdat~output_o\;

ww_wm8731_daclrck <= \wm8731_daclrck~output_o\;

ww_wm8731_bclk <= \wm8731_bclk~output_o\;

wm8731_sdat <= \wm8731_sdat~output_o\;

wm8731_sclk <= \wm8731_sclk~output_o\;
END structure;


