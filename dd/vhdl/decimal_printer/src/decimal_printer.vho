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

-- DATE "04/06/2023 12:05:15"

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

ENTITY 	decimal_printer IS
    PORT (
	clk : IN std_logic;
	res_n : IN std_logic;
	gfx_cmd : OUT std_logic_vector(15 DOWNTO 0);
	gfx_cmd_wr : OUT std_logic;
	gfx_cmd_full : IN std_logic;
	start : IN std_logic;
	busy : OUT std_logic;
	number : IN std_logic_vector(15 DOWNTO 0);
	bmpidx : IN std_logic_vector(2 DOWNTO 0)
	);
END decimal_printer;

-- Design Ports Information
-- gfx_cmd[0]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[1]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[2]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[3]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[4]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[5]	=>  Location: PIN_AD5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[6]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[7]	=>  Location: PIN_AB24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[8]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[9]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[10]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[11]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[12]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[13]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[14]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd[15]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd_wr	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- busy	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bmpidx[0]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- gfx_cmd_full	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bmpidx[1]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bmpidx[2]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res_n	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[15]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[14]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[12]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[11]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[7]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[6]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[5]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[4]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[10]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[9]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[8]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[13]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[3]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[2]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[1]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- number[0]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decimal_printer IS
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
SIGNAL ww_gfx_cmd : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_gfx_cmd_wr : std_logic;
SIGNAL ww_gfx_cmd_full : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_busy : std_logic;
SIGNAL ww_number : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_bmpidx : std_logic_vector(2 DOWNTO 0);
SIGNAL \res_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \gfx_cmd[0]~output_o\ : std_logic;
SIGNAL \gfx_cmd[1]~output_o\ : std_logic;
SIGNAL \gfx_cmd[2]~output_o\ : std_logic;
SIGNAL \gfx_cmd[3]~output_o\ : std_logic;
SIGNAL \gfx_cmd[4]~output_o\ : std_logic;
SIGNAL \gfx_cmd[5]~output_o\ : std_logic;
SIGNAL \gfx_cmd[6]~output_o\ : std_logic;
SIGNAL \gfx_cmd[7]~output_o\ : std_logic;
SIGNAL \gfx_cmd[8]~output_o\ : std_logic;
SIGNAL \gfx_cmd[9]~output_o\ : std_logic;
SIGNAL \gfx_cmd[10]~output_o\ : std_logic;
SIGNAL \gfx_cmd[11]~output_o\ : std_logic;
SIGNAL \gfx_cmd[12]~output_o\ : std_logic;
SIGNAL \gfx_cmd[13]~output_o\ : std_logic;
SIGNAL \gfx_cmd[14]~output_o\ : std_logic;
SIGNAL \gfx_cmd[15]~output_o\ : std_logic;
SIGNAL \gfx_cmd_wr~output_o\ : std_logic;
SIGNAL \busy~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \number[3]~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \res_n~input_o\ : std_logic;
SIGNAL \res_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \state.fsm_state.CALC_DIGITS~q\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \gfx_cmd_full~input_o\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \state.fsm_state.BB_CHAR_ARG~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \state.fsm_state.DIGIT_DONE~q\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \state.fsm_state.IDLE~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \Add7~7\ : std_logic;
SIGNAL \Add7~9\ : std_logic;
SIGNAL \Add7~10_combout\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~3\ : std_logic;
SIGNAL \Add3~5\ : std_logic;
SIGNAL \Add3~7\ : std_logic;
SIGNAL \Add3~9\ : std_logic;
SIGNAL \Add3~11\ : std_logic;
SIGNAL \Add3~12_combout\ : std_logic;
SIGNAL \Add5~13\ : std_logic;
SIGNAL \Add5~14_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Selector11~0_combout\ : std_logic;
SIGNAL \Add7~13\ : std_logic;
SIGNAL \Add7~15\ : std_logic;
SIGNAL \Add7~16_combout\ : std_logic;
SIGNAL \Selector11~1_combout\ : std_logic;
SIGNAL \state.number[9]~feeder_combout\ : std_logic;
SIGNAL \number[9]~input_o\ : std_logic;
SIGNAL \state.number[7]~21_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \Add7~23\ : std_logic;
SIGNAL \Add7~25\ : std_logic;
SIGNAL \Add7~26_combout\ : std_logic;
SIGNAL \Add5~23\ : std_logic;
SIGNAL \Add5~24_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \Add3~13\ : std_logic;
SIGNAL \Add3~15\ : std_logic;
SIGNAL \Add3~17\ : std_logic;
SIGNAL \Add3~19\ : std_logic;
SIGNAL \Add3~21\ : std_logic;
SIGNAL \Add3~22_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \state.number[14]~feeder_combout\ : std_logic;
SIGNAL \number[14]~input_o\ : std_logic;
SIGNAL \number[15]~input_o\ : std_logic;
SIGNAL \Add3~23\ : std_logic;
SIGNAL \Add3~24_combout\ : std_logic;
SIGNAL \Add5~25\ : std_logic;
SIGNAL \Add5~26_combout\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Add7~27\ : std_logic;
SIGNAL \Add7~28_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \state.number[15]~8_combout\ : std_logic;
SIGNAL \state.number[15]~9_combout\ : std_logic;
SIGNAL \state_nxt~6_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \state.number[7]~6_combout\ : std_logic;
SIGNAL \state.number[7]~7_combout\ : std_logic;
SIGNAL \Add3~6_combout\ : std_logic;
SIGNAL \Selector14~0_combout\ : std_logic;
SIGNAL \Add5~7\ : std_logic;
SIGNAL \Add5~8_combout\ : std_logic;
SIGNAL \Selector14~1_combout\ : std_logic;
SIGNAL \state.number[6]~feeder_combout\ : std_logic;
SIGNAL \number[6]~input_o\ : std_logic;
SIGNAL \Add7~11\ : std_logic;
SIGNAL \Add7~12_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add5~9\ : std_logic;
SIGNAL \Add5~10_combout\ : std_logic;
SIGNAL \Selector13~0_combout\ : std_logic;
SIGNAL \Add3~8_combout\ : std_logic;
SIGNAL \Selector13~1_combout\ : std_logic;
SIGNAL \state.number[7]~feeder_combout\ : std_logic;
SIGNAL \number[7]~input_o\ : std_logic;
SIGNAL \Add5~11\ : std_logic;
SIGNAL \Add5~12_combout\ : std_logic;
SIGNAL \Add3~10_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Selector12~0_combout\ : std_logic;
SIGNAL \Add7~14_combout\ : std_logic;
SIGNAL \Selector12~1_combout\ : std_logic;
SIGNAL \state.number[8]~feeder_combout\ : std_logic;
SIGNAL \number[8]~input_o\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \state_nxt~8_combout\ : std_logic;
SIGNAL \state_nxt~11_combout\ : std_logic;
SIGNAL \number[1]~input_o\ : std_logic;
SIGNAL \Add7~0_combout\ : std_logic;
SIGNAL \state.number[1]~18_combout\ : std_logic;
SIGNAL \state.number[1]~19_combout\ : std_logic;
SIGNAL \Add7~1\ : std_logic;
SIGNAL \Add7~2_combout\ : std_logic;
SIGNAL \state.number[2]~23_combout\ : std_logic;
SIGNAL \state.number[2]~15_combout\ : std_logic;
SIGNAL \state.number[2]~16_combout\ : std_logic;
SIGNAL \number[2]~input_o\ : std_logic;
SIGNAL \state.number[2]~17_combout\ : std_logic;
SIGNAL \Add7~3\ : std_logic;
SIGNAL \Add7~4_combout\ : std_logic;
SIGNAL \Add5~1\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \state.number[3]~12_combout\ : std_logic;
SIGNAL \state.number[3]~22_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \state.number[3]~13_combout\ : std_logic;
SIGNAL \state_nxt~12_combout\ : std_logic;
SIGNAL \state.number[3]~10_combout\ : std_logic;
SIGNAL \state.number[3]~11_combout\ : std_logic;
SIGNAL \state.number[3]~14_combout\ : std_logic;
SIGNAL \Add7~5\ : std_logic;
SIGNAL \Add7~6_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \Add5~3\ : std_logic;
SIGNAL \Add5~4_combout\ : std_logic;
SIGNAL \Selector16~0_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Selector16~1_combout\ : std_logic;
SIGNAL \state.number[4]~feeder_combout\ : std_logic;
SIGNAL \number[4]~input_o\ : std_logic;
SIGNAL \Add5~5\ : std_logic;
SIGNAL \Add5~6_combout\ : std_logic;
SIGNAL \Add7~8_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add3~4_combout\ : std_logic;
SIGNAL \Selector15~0_combout\ : std_logic;
SIGNAL \Selector15~1_combout\ : std_logic;
SIGNAL \state.number[5]~feeder_combout\ : std_logic;
SIGNAL \number[5]~input_o\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \state_nxt~9_combout\ : std_logic;
SIGNAL \Add3~14_combout\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL \Add7~17\ : std_logic;
SIGNAL \Add7~18_combout\ : std_logic;
SIGNAL \Add5~15\ : std_logic;
SIGNAL \Add5~16_combout\ : std_logic;
SIGNAL \Selector10~1_combout\ : std_logic;
SIGNAL \state.number[10]~feeder_combout\ : std_logic;
SIGNAL \number[10]~input_o\ : std_logic;
SIGNAL \Add7~19\ : std_logic;
SIGNAL \Add7~20_combout\ : std_logic;
SIGNAL \Add3~16_combout\ : std_logic;
SIGNAL \Add5~17\ : std_logic;
SIGNAL \Add5~18_combout\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Selector9~1_combout\ : std_logic;
SIGNAL \state.number[11]~feeder_combout\ : std_logic;
SIGNAL \number[11]~input_o\ : std_logic;
SIGNAL \Add7~21\ : std_logic;
SIGNAL \Add7~22_combout\ : std_logic;
SIGNAL \Add5~19\ : std_logic;
SIGNAL \Add5~20_combout\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \Add3~18_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector8~1_combout\ : std_logic;
SIGNAL \state.number[12]~feeder_combout\ : std_logic;
SIGNAL \number[12]~input_o\ : std_logic;
SIGNAL \Add5~21\ : std_logic;
SIGNAL \Add5~22_combout\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Add3~20_combout\ : std_logic;
SIGNAL \Add7~24_combout\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \state.number[13]~feeder_combout\ : std_logic;
SIGNAL \number[13]~input_o\ : std_logic;
SIGNAL \state_nxt~7_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \state_nxt~10_combout\ : std_logic;
SIGNAL \state.digit_cnt[0]~5_combout\ : std_logic;
SIGNAL \state.digit_cnt[0]~6_combout\ : std_logic;
SIGNAL \state.digit_cnt[1]~4_combout\ : std_logic;
SIGNAL \Add8~0_combout\ : std_logic;
SIGNAL \state.digit_cnt[2]~3_combout\ : std_logic;
SIGNAL \state.digit_cnt[0]~2_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \state.fsm_state.BB_CHAR~q\ : std_logic;
SIGNAL \bmpidx[0]~input_o\ : std_logic;
SIGNAL \gfx_cmd~0_combout\ : std_logic;
SIGNAL \bmpidx[1]~input_o\ : std_logic;
SIGNAL \gfx_cmd~1_combout\ : std_logic;
SIGNAL \bmpidx[2]~input_o\ : std_logic;
SIGNAL \gfx_cmd~2_combout\ : std_logic;
SIGNAL \Selector44~0_combout\ : std_logic;
SIGNAL \gfx_cmd~3_combout\ : std_logic;
SIGNAL \number[0]~input_o\ : std_logic;
SIGNAL \state.number[0]~20_combout\ : std_logic;
SIGNAL \Selector39~0_combout\ : std_logic;
SIGNAL \state.bcd_data[4][0]~0_combout\ : std_logic;
SIGNAL \state.bcd_data[0][3]~7_combout\ : std_logic;
SIGNAL \state.bcd_data[0][0]~q\ : std_logic;
SIGNAL \Selector35~0_combout\ : std_logic;
SIGNAL \state.bcd_data[1][3]~6_combout\ : std_logic;
SIGNAL \state.bcd_data[1][0]~q\ : std_logic;
SIGNAL \Selector31~0_combout\ : std_logic;
SIGNAL \state.bcd_data[2][2]~5_combout\ : std_logic;
SIGNAL \state.bcd_data[2][0]~q\ : std_logic;
SIGNAL \Selector27~0_combout\ : std_logic;
SIGNAL \state.bcd_data[3][3]~2_combout\ : std_logic;
SIGNAL \state.bcd_data[3][3]~3_combout\ : std_logic;
SIGNAL \state.bcd_data[3][3]~4_combout\ : std_logic;
SIGNAL \state.bcd_data[3][0]~q\ : std_logic;
SIGNAL \Selector23~0_combout\ : std_logic;
SIGNAL \state.bcd_data[4][0]~1_combout\ : std_logic;
SIGNAL \state.bcd_data[4][0]~q\ : std_logic;
SIGNAL \gfx_cmd~4_combout\ : std_logic;
SIGNAL \Selector38~0_combout\ : std_logic;
SIGNAL \state.bcd_data[0][1]~q\ : std_logic;
SIGNAL \Selector34~0_combout\ : std_logic;
SIGNAL \Selector34~1_combout\ : std_logic;
SIGNAL \state.bcd_data[1][1]~q\ : std_logic;
SIGNAL \Selector30~0_combout\ : std_logic;
SIGNAL \Selector30~1_combout\ : std_logic;
SIGNAL \state.bcd_data[2][1]~q\ : std_logic;
SIGNAL \Selector26~0_combout\ : std_logic;
SIGNAL \Selector26~1_combout\ : std_logic;
SIGNAL \state.bcd_data[3][1]~q\ : std_logic;
SIGNAL \Selector22~0_combout\ : std_logic;
SIGNAL \Selector22~1_combout\ : std_logic;
SIGNAL \state.bcd_data[4][1]~q\ : std_logic;
SIGNAL \gfx_cmd~5_combout\ : std_logic;
SIGNAL \Selector29~0_combout\ : std_logic;
SIGNAL \Selector37~0_combout\ : std_logic;
SIGNAL \state.bcd_data[0][2]~q\ : std_logic;
SIGNAL \Selector33~0_combout\ : std_logic;
SIGNAL \Selector33~1_combout\ : std_logic;
SIGNAL \state.bcd_data[1][2]~q\ : std_logic;
SIGNAL \Selector29~1_combout\ : std_logic;
SIGNAL \state.bcd_data[2][2]~q\ : std_logic;
SIGNAL \Selector25~0_combout\ : std_logic;
SIGNAL \Selector25~1_combout\ : std_logic;
SIGNAL \state.bcd_data[3][2]~q\ : std_logic;
SIGNAL \Selector21~0_combout\ : std_logic;
SIGNAL \Selector21~1_combout\ : std_logic;
SIGNAL \state.bcd_data[4][2]~q\ : std_logic;
SIGNAL \gfx_cmd~6_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \Add6~0_combout\ : std_logic;
SIGNAL \Selector36~0_combout\ : std_logic;
SIGNAL \state.bcd_data[0][3]~q\ : std_logic;
SIGNAL \Selector32~0_combout\ : std_logic;
SIGNAL \state.bcd_data[1][3]~q\ : std_logic;
SIGNAL \Selector28~0_combout\ : std_logic;
SIGNAL \state.bcd_data[2][3]~q\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Selector24~0_combout\ : std_logic;
SIGNAL \state.bcd_data[3][3]~q\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Selector20~0_combout\ : std_logic;
SIGNAL \state.bcd_data[4][3]~q\ : std_logic;
SIGNAL \Selector44~1_combout\ : std_logic;
SIGNAL \Selector43~0_combout\ : std_logic;
SIGNAL \state.digit_cnt\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \state.number\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_state.fsm_state.CALC_DIGITS~q\ : std_logic;
SIGNAL \ALT_INV_gfx_cmd~3_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_res_n <= res_n;
gfx_cmd <= ww_gfx_cmd;
gfx_cmd_wr <= ww_gfx_cmd_wr;
ww_gfx_cmd_full <= gfx_cmd_full;
ww_start <= start;
busy <= ww_busy;
ww_number <= number;
ww_bmpidx <= bmpidx;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\res_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \res_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_state.fsm_state.CALC_DIGITS~q\ <= NOT \state.fsm_state.CALC_DIGITS~q\;
\ALT_INV_gfx_cmd~3_combout\ <= NOT \gfx_cmd~3_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X72_Y73_N23
\gfx_cmd[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~0_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[0]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\gfx_cmd[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~1_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\gfx_cmd[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~2_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[2]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\gfx_cmd[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector44~0_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N23
\gfx_cmd[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gfx_cmd~3_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[4]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\gfx_cmd[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \gfx_cmd[5]~output_o\);

-- Location: IOOBUF_X115_Y9_N23
\gfx_cmd[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \gfx_cmd[6]~output_o\);

-- Location: IOOBUF_X115_Y5_N16
\gfx_cmd[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \gfx_cmd[7]~output_o\);

-- Location: IOOBUF_X27_Y73_N9
\gfx_cmd[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \gfx_cmd[8]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\gfx_cmd[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~4_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[9]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\gfx_cmd[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~5_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[10]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\gfx_cmd[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gfx_cmd~6_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[11]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\gfx_cmd[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector44~1_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[12]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\gfx_cmd[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \gfx_cmd[13]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\gfx_cmd[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gfx_cmd~3_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[14]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\gfx_cmd[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_gfx_cmd~3_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd[15]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\gfx_cmd_wr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector43~0_combout\,
	devoe => ww_devoe,
	o => \gfx_cmd_wr~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\busy~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state.fsm_state.IDLE~q\,
	devoe => ww_devoe,
	o => \busy~output_o\);

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

-- Location: IOIBUF_X83_Y73_N8
\number[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(3),
	o => \number[3]~input_o\);

-- Location: IOIBUF_X74_Y73_N15
\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

-- Location: LCCOMB_X74_Y69_N2
\Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\state_nxt~10_combout\ & (\start~input_o\ & ((!\state.fsm_state.IDLE~q\)))) # (!\state_nxt~10_combout\ & ((\state.fsm_state.CALC_DIGITS~q\) # ((\start~input_o\ & !\state.fsm_state.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~10_combout\,
	datab => \start~input_o\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.fsm_state.IDLE~q\,
	combout => \Selector1~2_combout\);

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

-- Location: FF_X74_Y69_N3
\state.fsm_state.CALC_DIGITS\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.fsm_state.CALC_DIGITS~q\);

-- Location: LCCOMB_X74_Y69_N12
\Selector3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\state.fsm_state.BB_CHAR_ARG~q\ & (!\Selector3~0_combout\ & ((!\state_nxt~10_combout\) # (!\state.fsm_state.CALC_DIGITS~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.BB_CHAR_ARG~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state_nxt~10_combout\,
	datad => \Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: IOIBUF_X83_Y73_N1
\gfx_cmd_full~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_gfx_cmd_full,
	o => \gfx_cmd_full~input_o\);

-- Location: LCCOMB_X75_Y71_N16
\Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (!\state.fsm_state.DIGIT_DONE~q\ & ((\gfx_cmd_full~input_o\ & (\Selector3~1_combout\)) # (!\gfx_cmd_full~input_o\ & ((\state.fsm_state.BB_CHAR~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~1_combout\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.fsm_state.BB_CHAR~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \Selector3~2_combout\);

-- Location: FF_X75_Y71_N17
\state.fsm_state.BB_CHAR_ARG\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.fsm_state.BB_CHAR_ARG~q\);

-- Location: LCCOMB_X75_Y71_N24
\Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\state.fsm_state.BB_CHAR_ARG~q\ & (!\state.fsm_state.DIGIT_DONE~q\ & !\gfx_cmd_full~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR_ARG~q\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \Selector4~0_combout\);

-- Location: FF_X75_Y71_N25
\state.fsm_state.DIGIT_DONE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.fsm_state.DIGIT_DONE~q\);

-- Location: LCCOMB_X74_Y69_N6
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\state.fsm_state.DIGIT_DONE~q\ & ((\state.fsm_state.IDLE~q\) # ((\start~input_o\ & !\state.fsm_state.CALC_DIGITS~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datab => \start~input_o\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \state.fsm_state.CALC_DIGITS~q\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X74_Y69_N0
\Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\Selector0~1_combout\) # (!\Selector2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~1_combout\,
	datad => \Selector2~0_combout\,
	combout => \Selector0~2_combout\);

-- Location: FF_X74_Y69_N1
\state.fsm_state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.fsm_state.IDLE~q\);

-- Location: LCCOMB_X74_Y69_N18
\Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (!\state.fsm_state.IDLE~q\ & \start~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.IDLE~q\,
	datac => \start~input_o\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X74_Y68_N4
\Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = \state.number\(2) $ (VCC)
-- \Add5~1\ = CARRY(\state.number\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(2),
	datad => VCC,
	combout => \Add5~0_combout\,
	cout => \Add5~1\);

-- Location: LCCOMB_X75_Y68_N8
\Add7~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~6_combout\ = (\state.number\(4) & (\Add7~5\ & VCC)) # (!\state.number\(4) & (!\Add7~5\))
-- \Add7~7\ = CARRY((!\state.number\(4) & !\Add7~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(4),
	datad => VCC,
	cin => \Add7~5\,
	combout => \Add7~6_combout\,
	cout => \Add7~7\);

-- Location: LCCOMB_X75_Y68_N10
\Add7~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~8_combout\ = (\state.number\(5) & ((GND) # (!\Add7~7\))) # (!\state.number\(5) & (\Add7~7\ $ (GND)))
-- \Add7~9\ = CARRY((\state.number\(5)) # (!\Add7~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(5),
	datad => VCC,
	cin => \Add7~7\,
	combout => \Add7~8_combout\,
	cout => \Add7~9\);

-- Location: LCCOMB_X75_Y68_N12
\Add7~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~10_combout\ = (\state.number\(6) & (\Add7~9\ & VCC)) # (!\state.number\(6) & (!\Add7~9\))
-- \Add7~11\ = CARRY((!\state.number\(6) & !\Add7~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(6),
	datad => VCC,
	cin => \Add7~9\,
	combout => \Add7~10_combout\,
	cout => \Add7~11\);

-- Location: LCCOMB_X73_Y68_N2
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \state.number\(4) $ (VCC)
-- \Add1~1\ = CARRY(\state.number\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(4),
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X73_Y68_N4
\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\state.number\(5) & (\Add1~1\ & VCC)) # (!\state.number\(5) & (!\Add1~1\))
-- \Add1~3\ = CARRY((!\state.number\(5) & !\Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(5),
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X73_Y68_N6
\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\state.number\(6) & ((GND) # (!\Add1~3\))) # (!\state.number\(6) & (\Add1~3\ $ (GND)))
-- \Add1~5\ = CARRY((\state.number\(6)) # (!\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(6),
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X76_Y68_N4
\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = \state.number\(3) $ (VCC)
-- \Add3~1\ = CARRY(\state.number\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(3),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

-- Location: LCCOMB_X76_Y68_N6
\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (\state.number\(4) & (\Add3~1\ & VCC)) # (!\state.number\(4) & (!\Add3~1\))
-- \Add3~3\ = CARRY((!\state.number\(4) & !\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(4),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~2_combout\,
	cout => \Add3~3\);

-- Location: LCCOMB_X76_Y68_N8
\Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~4_combout\ = (\state.number\(5) & (\Add3~3\ $ (GND))) # (!\state.number\(5) & (!\Add3~3\ & VCC))
-- \Add3~5\ = CARRY((\state.number\(5) & !\Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(5),
	datad => VCC,
	cin => \Add3~3\,
	combout => \Add3~4_combout\,
	cout => \Add3~5\);

-- Location: LCCOMB_X76_Y68_N10
\Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~6_combout\ = (\state.number\(6) & (!\Add3~5\)) # (!\state.number\(6) & ((\Add3~5\) # (GND)))
-- \Add3~7\ = CARRY((!\Add3~5\) # (!\state.number\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(6),
	datad => VCC,
	cin => \Add3~5\,
	combout => \Add3~6_combout\,
	cout => \Add3~7\);

-- Location: LCCOMB_X76_Y68_N12
\Add3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~8_combout\ = (\state.number\(7) & (\Add3~7\ $ (GND))) # (!\state.number\(7) & (!\Add3~7\ & VCC))
-- \Add3~9\ = CARRY((\state.number\(7) & !\Add3~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(7),
	datad => VCC,
	cin => \Add3~7\,
	combout => \Add3~8_combout\,
	cout => \Add3~9\);

-- Location: LCCOMB_X76_Y68_N14
\Add3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~10_combout\ = (\state.number\(8) & (!\Add3~9\)) # (!\state.number\(8) & ((\Add3~9\) # (GND)))
-- \Add3~11\ = CARRY((!\Add3~9\) # (!\state.number\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(8),
	datad => VCC,
	cin => \Add3~9\,
	combout => \Add3~10_combout\,
	cout => \Add3~11\);

-- Location: LCCOMB_X76_Y68_N16
\Add3~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~12_combout\ = (\state.number\(9) & (\Add3~11\ $ (GND))) # (!\state.number\(9) & (!\Add3~11\ & VCC))
-- \Add3~13\ = CARRY((\state.number\(9) & !\Add3~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(9),
	datad => VCC,
	cin => \Add3~11\,
	combout => \Add3~12_combout\,
	cout => \Add3~13\);

-- Location: LCCOMB_X74_Y68_N16
\Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~12_combout\ = (\state.number\(8) & ((GND) # (!\Add5~11\))) # (!\state.number\(8) & (\Add5~11\ $ (GND)))
-- \Add5~13\ = CARRY((\state.number\(8)) # (!\Add5~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(8),
	datad => VCC,
	cin => \Add5~11\,
	combout => \Add5~12_combout\,
	cout => \Add5~13\);

-- Location: LCCOMB_X74_Y68_N18
\Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~14_combout\ = (\state.number\(9) & (\Add5~13\ & VCC)) # (!\state.number\(9) & (!\Add5~13\))
-- \Add5~15\ = CARRY((!\state.number\(9) & !\Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(9),
	datad => VCC,
	cin => \Add5~13\,
	combout => \Add5~14_combout\,
	cout => \Add5~15\);

-- Location: LCCOMB_X73_Y68_N8
\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\state.number\(7) & (\Add1~5\ & VCC)) # (!\state.number\(7) & (!\Add1~5\))
-- \Add1~7\ = CARRY((!\state.number\(7) & !\Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(7),
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X73_Y68_N10
\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\state.number\(8) & (\Add1~7\ $ (GND))) # (!\state.number\(8) & (!\Add1~7\ & VCC))
-- \Add1~9\ = CARRY((\state.number\(8) & !\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(8),
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X73_Y68_N12
\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\state.number\(9) & (!\Add1~9\)) # (!\state.number\(9) & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!\state.number\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(9),
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X72_Y68_N20
\Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~0_combout\ = (\state_nxt~9_combout\ & ((\Add5~14_combout\) # ((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & (((\Add1~10_combout\ & !\state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \Add5~14_combout\,
	datac => \Add1~10_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector11~0_combout\);

-- Location: LCCOMB_X75_Y68_N14
\Add7~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~12_combout\ = (\state.number\(7) & ((GND) # (!\Add7~11\))) # (!\state.number\(7) & (\Add7~11\ $ (GND)))
-- \Add7~13\ = CARRY((\state.number\(7)) # (!\Add7~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(7),
	datad => VCC,
	cin => \Add7~11\,
	combout => \Add7~12_combout\,
	cout => \Add7~13\);

-- Location: LCCOMB_X75_Y68_N16
\Add7~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~14_combout\ = (\state.number\(8) & (\Add7~13\ & VCC)) # (!\state.number\(8) & (!\Add7~13\))
-- \Add7~15\ = CARRY((!\state.number\(8) & !\Add7~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(8),
	datad => VCC,
	cin => \Add7~13\,
	combout => \Add7~14_combout\,
	cout => \Add7~15\);

-- Location: LCCOMB_X75_Y68_N18
\Add7~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~16_combout\ = (\state.number\(9) & ((GND) # (!\Add7~15\))) # (!\state.number\(9) & (\Add7~15\ $ (GND)))
-- \Add7~17\ = CARRY((\state.number\(9)) # (!\Add7~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(9),
	datad => VCC,
	cin => \Add7~15\,
	combout => \Add7~16_combout\,
	cout => \Add7~17\);

-- Location: LCCOMB_X72_Y68_N22
\Selector11~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector11~1_combout\ = (\Selector11~0_combout\ & (((\Add7~16_combout\) # (!\state.number[7]~7_combout\)))) # (!\Selector11~0_combout\ & (\Add3~12_combout\ & ((\state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~12_combout\,
	datab => \Selector11~0_combout\,
	datac => \Add7~16_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector11~1_combout\);

-- Location: LCCOMB_X72_Y68_N14
\state.number[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[9]~feeder_combout\ = \Selector11~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector11~1_combout\,
	combout => \state.number[9]~feeder_combout\);

-- Location: IOIBUF_X62_Y73_N15
\number[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(9),
	o => \number[9]~input_o\);

-- Location: LCCOMB_X74_Y69_N28
\state.number[7]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[7]~21_combout\ = (\state.fsm_state.IDLE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & ((!\LessThan3~2_combout\)))) # (!\state.fsm_state.IDLE~q\ & ((\start~input_o\) # ((\state.fsm_state.CALC_DIGITS~q\ & !\LessThan3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \start~input_o\,
	datad => \LessThan3~2_combout\,
	combout => \state.number[7]~21_combout\);

-- Location: FF_X72_Y68_N15
\state.number[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[9]~feeder_combout\,
	asdata => \number[9]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(9));

-- Location: LCCOMB_X72_Y68_N0
\LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!\state.number\(5) & (!\state.number\(7) & (!\state.number\(6) & !\state.number\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(5),
	datab => \state.number\(7),
	datac => \state.number\(6),
	datad => \state.number\(4),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X76_Y68_N0
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (((\LessThan3~0_combout\) # (!\state.number\(8))) # (!\state.number\(9))) # (!\state.number\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(10),
	datab => \state.number\(9),
	datac => \state.number\(8),
	datad => \LessThan3~0_combout\,
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X75_Y68_N24
\Add7~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~22_combout\ = (\state.number\(12) & (\Add7~21\ & VCC)) # (!\state.number\(12) & (!\Add7~21\))
-- \Add7~23\ = CARRY((!\state.number\(12) & !\Add7~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(12),
	datad => VCC,
	cin => \Add7~21\,
	combout => \Add7~22_combout\,
	cout => \Add7~23\);

-- Location: LCCOMB_X75_Y68_N26
\Add7~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~24_combout\ = (\state.number\(13) & ((GND) # (!\Add7~23\))) # (!\state.number\(13) & (\Add7~23\ $ (GND)))
-- \Add7~25\ = CARRY((\state.number\(13)) # (!\Add7~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(13),
	datad => VCC,
	cin => \Add7~23\,
	combout => \Add7~24_combout\,
	cout => \Add7~25\);

-- Location: LCCOMB_X75_Y68_N28
\Add7~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~26_combout\ = (\state.number\(14) & (\Add7~25\ & VCC)) # (!\state.number\(14) & (!\Add7~25\))
-- \Add7~27\ = CARRY((!\state.number\(14) & !\Add7~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(14),
	datad => VCC,
	cin => \Add7~25\,
	combout => \Add7~26_combout\,
	cout => \Add7~27\);

-- Location: LCCOMB_X74_Y68_N26
\Add5~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~22_combout\ = (\state.number\(13) & (\Add5~21\ & VCC)) # (!\state.number\(13) & (!\Add5~21\))
-- \Add5~23\ = CARRY((!\state.number\(13) & !\Add5~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(13),
	datad => VCC,
	cin => \Add5~21\,
	combout => \Add5~22_combout\,
	cout => \Add5~23\);

-- Location: LCCOMB_X74_Y68_N28
\Add5~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~24_combout\ = (\state.number\(14) & ((GND) # (!\Add5~23\))) # (!\state.number\(14) & (\Add5~23\ $ (GND)))
-- \Add5~25\ = CARRY((\state.number\(14)) # (!\Add5~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(14),
	datad => VCC,
	cin => \Add5~23\,
	combout => \Add5~24_combout\,
	cout => \Add5~25\);

-- Location: LCCOMB_X73_Y68_N14
\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\state.number\(10) & (\Add1~11\ $ (GND))) # (!\state.number\(10) & (!\Add1~11\ & VCC))
-- \Add1~13\ = CARRY((\state.number\(10) & !\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(10),
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X73_Y68_N16
\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\state.number\(11) & (\Add1~13\ & VCC)) # (!\state.number\(11) & (!\Add1~13\))
-- \Add1~15\ = CARRY((!\state.number\(11) & !\Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(11),
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

-- Location: LCCOMB_X73_Y68_N18
\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\state.number\(12) & ((GND) # (!\Add1~15\))) # (!\state.number\(12) & (\Add1~15\ $ (GND)))
-- \Add1~17\ = CARRY((\state.number\(12)) # (!\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(12),
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

-- Location: LCCOMB_X73_Y68_N20
\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\state.number\(13) & (!\Add1~17\)) # (!\state.number\(13) & ((\Add1~17\) # (GND)))
-- \Add1~19\ = CARRY((!\Add1~17\) # (!\state.number\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(13),
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

-- Location: LCCOMB_X73_Y68_N22
\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\state.number\(14) & ((GND) # (!\Add1~19\))) # (!\state.number\(14) & (\Add1~19\ $ (GND)))
-- \Add1~21\ = CARRY((\state.number\(14)) # (!\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(14),
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

-- Location: LCCOMB_X76_Y68_N18
\Add3~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~14_combout\ = (\state.number\(10) & (\Add3~13\ & VCC)) # (!\state.number\(10) & (!\Add3~13\))
-- \Add3~15\ = CARRY((!\state.number\(10) & !\Add3~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(10),
	datad => VCC,
	cin => \Add3~13\,
	combout => \Add3~14_combout\,
	cout => \Add3~15\);

-- Location: LCCOMB_X76_Y68_N20
\Add3~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~16_combout\ = (\state.number\(11) & ((GND) # (!\Add3~15\))) # (!\state.number\(11) & (\Add3~15\ $ (GND)))
-- \Add3~17\ = CARRY((\state.number\(11)) # (!\Add3~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(11),
	datad => VCC,
	cin => \Add3~15\,
	combout => \Add3~16_combout\,
	cout => \Add3~17\);

-- Location: LCCOMB_X76_Y68_N22
\Add3~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~18_combout\ = (\state.number\(12) & (\Add3~17\ & VCC)) # (!\state.number\(12) & (!\Add3~17\))
-- \Add3~19\ = CARRY((!\state.number\(12) & !\Add3~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(12),
	datad => VCC,
	cin => \Add3~17\,
	combout => \Add3~18_combout\,
	cout => \Add3~19\);

-- Location: LCCOMB_X76_Y68_N24
\Add3~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~20_combout\ = (\state.number\(13) & ((GND) # (!\Add3~19\))) # (!\state.number\(13) & (\Add3~19\ $ (GND)))
-- \Add3~21\ = CARRY((\state.number\(13)) # (!\Add3~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(13),
	datad => VCC,
	cin => \Add3~19\,
	combout => \Add3~20_combout\,
	cout => \Add3~21\);

-- Location: LCCOMB_X76_Y68_N26
\Add3~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~22_combout\ = (\state.number\(14) & (\Add3~21\ & VCC)) # (!\state.number\(14) & (!\Add3~21\))
-- \Add3~23\ = CARRY((!\state.number\(14) & !\Add3~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(14),
	datad => VCC,
	cin => \Add3~21\,
	combout => \Add3~22_combout\,
	cout => \Add3~23\);

-- Location: LCCOMB_X77_Y68_N22
\Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\state_nxt~9_combout\ & (((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & ((\state.number[7]~7_combout\ & ((\Add3~22_combout\))) # (!\state.number[7]~7_combout\ & (\Add1~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \Add1~20_combout\,
	datac => \Add3~22_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X77_Y68_N16
\Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\Selector6~0_combout\ & ((\Add7~26_combout\) # ((!\state_nxt~9_combout\)))) # (!\Selector6~0_combout\ & (((\Add5~24_combout\ & \state_nxt~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~26_combout\,
	datab => \Add5~24_combout\,
	datac => \Selector6~0_combout\,
	datad => \state_nxt~9_combout\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X77_Y68_N8
\state.number[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[14]~feeder_combout\ = \Selector6~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector6~1_combout\,
	combout => \state.number[14]~feeder_combout\);

-- Location: IOIBUF_X81_Y73_N8
\number[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(14),
	o => \number[14]~input_o\);

-- Location: FF_X77_Y68_N9
\state.number[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[14]~feeder_combout\,
	asdata => \number[14]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(14));

-- Location: IOIBUF_X85_Y73_N1
\number[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(15),
	o => \number[15]~input_o\);

-- Location: LCCOMB_X76_Y68_N28
\Add3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~24_combout\ = \Add3~23\ $ (\state.number\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \state.number\(15),
	cin => \Add3~23\,
	combout => \Add3~24_combout\);

-- Location: LCCOMB_X74_Y68_N30
\Add5~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~26_combout\ = \state.number\(15) $ (!\Add5~25\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(15),
	cin => \Add5~25\,
	combout => \Add5~26_combout\);

-- Location: LCCOMB_X73_Y68_N24
\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = \state.number\(15) $ (!\Add1~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(15),
	cin => \Add1~21\,
	combout => \Add1~22_combout\);

-- Location: LCCOMB_X73_Y68_N28
\Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\state.number[7]~7_combout\ & (\state_nxt~9_combout\)) # (!\state.number[7]~7_combout\ & ((\state_nxt~9_combout\ & (\Add5~26_combout\)) # (!\state_nxt~9_combout\ & ((\Add1~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[7]~7_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add5~26_combout\,
	datad => \Add1~22_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X75_Y68_N30
\Add7~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~28_combout\ = \Add7~27\ $ (\state.number\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \state.number\(15),
	cin => \Add7~27\,
	combout => \Add7~28_combout\);

-- Location: LCCOMB_X76_Y68_N2
\Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\state.number[7]~7_combout\ & ((\Selector5~0_combout\ & ((\Add7~28_combout\))) # (!\Selector5~0_combout\ & (\Add3~24_combout\)))) # (!\state.number[7]~7_combout\ & (((\Selector5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[7]~7_combout\,
	datab => \Add3~24_combout\,
	datac => \Selector5~0_combout\,
	datad => \Add7~28_combout\,
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X77_Y68_N28
\state.number[15]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[15]~8_combout\ = (\state.number[7]~21_combout\ & ((\state.fsm_state.CALC_DIGITS~q\ & ((\Selector5~1_combout\))) # (!\state.fsm_state.CALC_DIGITS~q\ & (\number[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[7]~21_combout\,
	datab => \number[15]~input_o\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \Selector5~1_combout\,
	combout => \state.number[15]~8_combout\);

-- Location: LCCOMB_X77_Y68_N24
\state.number[15]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[15]~9_combout\ = (\state.number[15]~8_combout\) # ((!\state.number[7]~21_combout\ & \state.number\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.number[7]~21_combout\,
	datac => \state.number\(15),
	datad => \state.number[15]~8_combout\,
	combout => \state.number[15]~9_combout\);

-- Location: FF_X77_Y68_N25
\state.number[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[15]~9_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(15));

-- Location: LCCOMB_X77_Y68_N18
\state_nxt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~6_combout\ = (!\state.number\(14) & !\state.number\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.number\(14),
	datad => \state.number\(15),
	combout => \state_nxt~6_combout\);

-- Location: LCCOMB_X77_Y68_N4
\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!\state.number\(12) & !\state.number\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(12),
	datac => \state.number\(11),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X77_Y68_N30
\state.number[7]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[7]~6_combout\ = (\state_nxt~6_combout\ & (((\LessThan0~1_combout\ & \LessThan0~0_combout\)) # (!\state.number\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~1_combout\,
	datab => \state_nxt~6_combout\,
	datac => \LessThan0~0_combout\,
	datad => \state.number\(13),
	combout => \state.number[7]~6_combout\);

-- Location: LCCOMB_X77_Y68_N26
\state.number[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[7]~7_combout\ = (\LessThan1~1_combout\ & ((\state_nxt~7_combout\ & ((\state_nxt~8_combout\))) # (!\state_nxt~7_combout\ & (\state.number[7]~6_combout\)))) # (!\LessThan1~1_combout\ & (\state.number[7]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[7]~6_combout\,
	datab => \LessThan1~1_combout\,
	datac => \state_nxt~8_combout\,
	datad => \state_nxt~7_combout\,
	combout => \state.number[7]~7_combout\);

-- Location: LCCOMB_X72_Y68_N4
\Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~0_combout\ = (\state.number[7]~7_combout\ & (((\Add3~6_combout\) # (\state_nxt~9_combout\)))) # (!\state.number[7]~7_combout\ & (\Add1~4_combout\ & ((!\state_nxt~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \state.number[7]~7_combout\,
	datac => \Add3~6_combout\,
	datad => \state_nxt~9_combout\,
	combout => \Selector14~0_combout\);

-- Location: LCCOMB_X74_Y68_N10
\Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~6_combout\ = (\state.number\(5) & (!\Add5~5\)) # (!\state.number\(5) & ((\Add5~5\) # (GND)))
-- \Add5~7\ = CARRY((!\Add5~5\) # (!\state.number\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(5),
	datad => VCC,
	cin => \Add5~5\,
	combout => \Add5~6_combout\,
	cout => \Add5~7\);

-- Location: LCCOMB_X74_Y68_N12
\Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~8_combout\ = (\state.number\(6) & (\Add5~7\ $ (GND))) # (!\state.number\(6) & (!\Add5~7\ & VCC))
-- \Add5~9\ = CARRY((\state.number\(6) & !\Add5~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(6),
	datad => VCC,
	cin => \Add5~7\,
	combout => \Add5~8_combout\,
	cout => \Add5~9\);

-- Location: LCCOMB_X72_Y68_N30
\Selector14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector14~1_combout\ = (\state_nxt~9_combout\ & ((\Selector14~0_combout\ & (\Add7~10_combout\)) # (!\Selector14~0_combout\ & ((\Add5~8_combout\))))) # (!\state_nxt~9_combout\ & (((\Selector14~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \Add7~10_combout\,
	datac => \Selector14~0_combout\,
	datad => \Add5~8_combout\,
	combout => \Selector14~1_combout\);

-- Location: LCCOMB_X72_Y68_N26
\state.number[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[6]~feeder_combout\ = \Selector14~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector14~1_combout\,
	combout => \state.number[6]~feeder_combout\);

-- Location: IOIBUF_X65_Y73_N15
\number[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(6),
	o => \number[6]~input_o\);

-- Location: FF_X72_Y68_N27
\state.number[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[6]~feeder_combout\,
	asdata => \number[6]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(6));

-- Location: LCCOMB_X74_Y68_N14
\Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~10_combout\ = (\state.number\(7) & (\Add5~9\ & VCC)) # (!\state.number\(7) & (!\Add5~9\))
-- \Add5~11\ = CARRY((!\state.number\(7) & !\Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(7),
	datad => VCC,
	cin => \Add5~9\,
	combout => \Add5~10_combout\,
	cout => \Add5~11\);

-- Location: LCCOMB_X72_Y68_N24
\Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~0_combout\ = (\state_nxt~9_combout\ & ((\state.number[7]~7_combout\) # ((\Add5~10_combout\)))) # (!\state_nxt~9_combout\ & (!\state.number[7]~7_combout\ & (\Add1~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \state.number[7]~7_combout\,
	datac => \Add1~6_combout\,
	datad => \Add5~10_combout\,
	combout => \Selector13~0_combout\);

-- Location: LCCOMB_X72_Y68_N2
\Selector13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector13~1_combout\ = (\Selector13~0_combout\ & ((\Add7~12_combout\) # ((!\state.number[7]~7_combout\)))) # (!\Selector13~0_combout\ & (((\Add3~8_combout\ & \state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~12_combout\,
	datab => \Selector13~0_combout\,
	datac => \Add3~8_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector13~1_combout\);

-- Location: LCCOMB_X72_Y68_N16
\state.number[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[7]~feeder_combout\ = \Selector13~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector13~1_combout\,
	combout => \state.number[7]~feeder_combout\);

-- Location: IOIBUF_X65_Y73_N22
\number[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(7),
	o => \number[7]~input_o\);

-- Location: FF_X72_Y68_N17
\state.number[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[7]~feeder_combout\,
	asdata => \number[7]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(7));

-- Location: LCCOMB_X77_Y68_N10
\Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~0_combout\ = (\state.number[7]~7_combout\ & ((\Add3~10_combout\) # ((\state_nxt~9_combout\)))) # (!\state.number[7]~7_combout\ & (((!\state_nxt~9_combout\ & \Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~10_combout\,
	datab => \state.number[7]~7_combout\,
	datac => \state_nxt~9_combout\,
	datad => \Add1~8_combout\,
	combout => \Selector12~0_combout\);

-- Location: LCCOMB_X75_Y68_N0
\Selector12~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector12~1_combout\ = (\state_nxt~9_combout\ & ((\Selector12~0_combout\ & ((\Add7~14_combout\))) # (!\Selector12~0_combout\ & (\Add5~12_combout\)))) # (!\state_nxt~9_combout\ & (((\Selector12~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~12_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Selector12~0_combout\,
	datad => \Add7~14_combout\,
	combout => \Selector12~1_combout\);

-- Location: LCCOMB_X77_Y68_N12
\state.number[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[8]~feeder_combout\ = \Selector12~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector12~1_combout\,
	combout => \state.number[8]~feeder_combout\);

-- Location: IOIBUF_X85_Y73_N8
\number[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(8),
	o => \number[8]~input_o\);

-- Location: FF_X77_Y68_N13
\state.number[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[8]~feeder_combout\,
	asdata => \number[8]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(8));

-- Location: LCCOMB_X73_Y68_N0
\LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (!\state.number\(3) & (!\state.number\(4) & (!\state.number\(7) & !\state.number\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(3),
	datab => \state.number\(4),
	datac => \state.number\(7),
	datad => \state.number\(2),
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X74_Y68_N0
\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\LessThan2~0_combout\) # ((!\state.number\(7) & ((!\state.number\(5)) # (!\state.number\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~0_combout\,
	datab => \state.number\(6),
	datac => \state.number\(7),
	datad => \state.number\(5),
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X75_Y69_N18
\state_nxt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~8_combout\ = (!\state.number\(8) & (!\state.number\(9) & (\state_nxt~7_combout\ & \LessThan2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(8),
	datab => \state.number\(9),
	datac => \state_nxt~7_combout\,
	datad => \LessThan2~1_combout\,
	combout => \state_nxt~8_combout\);

-- Location: LCCOMB_X74_Y69_N22
\state_nxt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~11_combout\ = (!\LessThan3~2_combout\ & (\state.fsm_state.CALC_DIGITS~q\ & (\state.fsm_state.IDLE~q\ & \state_nxt~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~2_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.fsm_state.IDLE~q\,
	datad => \state_nxt~8_combout\,
	combout => \state_nxt~11_combout\);

-- Location: IOIBUF_X69_Y73_N15
\number[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(1),
	o => \number[1]~input_o\);

-- Location: LCCOMB_X75_Y68_N2
\Add7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~0_combout\ = \state.number\(1) $ (VCC)
-- \Add7~1\ = CARRY(\state.number\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(1),
	datad => VCC,
	combout => \Add7~0_combout\,
	cout => \Add7~1\);

-- Location: LCCOMB_X74_Y69_N4
\state.number[1]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[1]~18_combout\ = (\state.fsm_state.IDLE~q\ & ((\Add7~0_combout\))) # (!\state.fsm_state.IDLE~q\ & (\number[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.IDLE~q\,
	datac => \number[1]~input_o\,
	datad => \Add7~0_combout\,
	combout => \state.number[1]~18_combout\);

-- Location: LCCOMB_X74_Y69_N30
\state.number[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[1]~19_combout\ = (\state_nxt~11_combout\ & (\state.number[1]~18_combout\)) # (!\state_nxt~11_combout\ & ((\Selector3~0_combout\ & (\state.number[1]~18_combout\)) # (!\Selector3~0_combout\ & ((\state.number\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~11_combout\,
	datab => \state.number[1]~18_combout\,
	datac => \state.number\(1),
	datad => \Selector3~0_combout\,
	combout => \state.number[1]~19_combout\);

-- Location: FF_X74_Y69_N31
\state.number[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[1]~19_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(1));

-- Location: LCCOMB_X75_Y68_N4
\Add7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~2_combout\ = (\state.number\(2) & (\Add7~1\ & VCC)) # (!\state.number\(2) & (!\Add7~1\))
-- \Add7~3\ = CARRY((!\state.number\(2) & !\Add7~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(2),
	datad => VCC,
	cin => \Add7~1\,
	combout => \Add7~2_combout\,
	cout => \Add7~3\);

-- Location: LCCOMB_X74_Y69_N14
\state.number[2]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[2]~23_combout\ = (\state.fsm_state.IDLE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & ((\state_nxt~9_combout\)))) # (!\state.fsm_state.IDLE~q\ & (((\start~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \start~input_o\,
	datad => \state_nxt~9_combout\,
	combout => \state.number[2]~23_combout\);

-- Location: LCCOMB_X74_Y69_N16
\state.number[2]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[2]~15_combout\ = (\state.number[2]~23_combout\ & ((\LessThan3~2_combout\ & ((\state.number\(2)))) # (!\LessThan3~2_combout\ & (\Add7~2_combout\)))) # (!\state.number[2]~23_combout\ & (((\state.number\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~2_combout\,
	datab => \state.number\(2),
	datac => \state.number[2]~23_combout\,
	datad => \LessThan3~2_combout\,
	combout => \state.number[2]~15_combout\);

-- Location: LCCOMB_X74_Y69_N10
\state.number[2]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[2]~16_combout\ = (\state.number[2]~23_combout\ & ((\state_nxt~8_combout\ & ((\state.number[2]~15_combout\))) # (!\state_nxt~8_combout\ & (\Add5~0_combout\)))) # (!\state.number[2]~23_combout\ & (((\state.number[2]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~0_combout\,
	datab => \state.number[2]~15_combout\,
	datac => \state.number[2]~23_combout\,
	datad => \state_nxt~8_combout\,
	combout => \state.number[2]~16_combout\);

-- Location: IOIBUF_X74_Y73_N22
\number[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(2),
	o => \number[2]~input_o\);

-- Location: LCCOMB_X74_Y69_N20
\state.number[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[2]~17_combout\ = (\state.fsm_state.IDLE~q\ & (\state.number[2]~16_combout\)) # (!\state.fsm_state.IDLE~q\ & ((\state.number[2]~23_combout\ & ((\number[2]~input_o\))) # (!\state.number[2]~23_combout\ & (\state.number[2]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[2]~16_combout\,
	datab => \state.fsm_state.IDLE~q\,
	datac => \state.number[2]~23_combout\,
	datad => \number[2]~input_o\,
	combout => \state.number[2]~17_combout\);

-- Location: FF_X74_Y69_N21
\state.number[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[2]~17_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(2));

-- Location: LCCOMB_X75_Y68_N6
\Add7~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~4_combout\ = (\state.number\(3) & (\Add7~3\ $ (GND))) # (!\state.number\(3) & (!\Add7~3\ & VCC))
-- \Add7~5\ = CARRY((\state.number\(3) & !\Add7~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(3),
	datad => VCC,
	cin => \Add7~3\,
	combout => \Add7~4_combout\,
	cout => \Add7~5\);

-- Location: LCCOMB_X74_Y68_N6
\Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = (\state.number\(3) & (\Add5~1\ & VCC)) # (!\state.number\(3) & (!\Add5~1\))
-- \Add5~3\ = CARRY((!\state.number\(3) & !\Add5~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(3),
	datad => VCC,
	cin => \Add5~1\,
	combout => \Add5~2_combout\,
	cout => \Add5~3\);

-- Location: LCCOMB_X75_Y69_N30
\state.number[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~12_combout\ = (\state_nxt~8_combout\ & (\Add7~4_combout\ & ((!\LessThan3~2_combout\)))) # (!\state_nxt~8_combout\ & (((\Add5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~4_combout\,
	datab => \state_nxt~8_combout\,
	datac => \Add5~2_combout\,
	datad => \LessThan3~2_combout\,
	combout => \state.number[3]~12_combout\);

-- Location: LCCOMB_X75_Y69_N14
\state.number[3]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~22_combout\ = (\state.fsm_state.IDLE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & \state.number[7]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.number[7]~6_combout\,
	combout => \state.number[3]~22_combout\);

-- Location: LCCOMB_X75_Y69_N8
\state.number[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~13_combout\ = (\state.number[3]~22_combout\ & ((\state_nxt~9_combout\ & (\state.number[3]~12_combout\)) # (!\state_nxt~9_combout\ & ((\Add3~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[3]~12_combout\,
	datab => \state.number[3]~22_combout\,
	datac => \state_nxt~9_combout\,
	datad => \Add3~0_combout\,
	combout => \state.number[3]~13_combout\);

-- Location: LCCOMB_X75_Y69_N28
\state_nxt~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~12_combout\ = (\state.fsm_state.IDLE~q\ & (((\state.fsm_state.CALC_DIGITS~q\ & \state.number[7]~6_combout\)))) # (!\state.fsm_state.IDLE~q\ & (\start~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datab => \start~input_o\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.number[7]~6_combout\,
	combout => \state_nxt~12_combout\);

-- Location: LCCOMB_X75_Y69_N26
\state.number[3]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~10_combout\ = (\state.fsm_state.IDLE~q\ & (\state_nxt~8_combout\ & (\state_nxt~9_combout\ & \LessThan3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.IDLE~q\,
	datab => \state_nxt~8_combout\,
	datac => \state_nxt~9_combout\,
	datad => \LessThan3~2_combout\,
	combout => \state.number[3]~10_combout\);

-- Location: LCCOMB_X75_Y69_N20
\state.number[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~11_combout\ = (\state.number\(3) & ((\state.number[3]~10_combout\) # (!\state_nxt~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_nxt~12_combout\,
	datac => \state.number[3]~10_combout\,
	datad => \state.number\(3),
	combout => \state.number[3]~11_combout\);

-- Location: LCCOMB_X75_Y69_N16
\state.number[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[3]~14_combout\ = (\state.number[3]~13_combout\) # ((\state.number[3]~11_combout\) # ((\number[3]~input_o\ & \Selector3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \number[3]~input_o\,
	datab => \Selector3~0_combout\,
	datac => \state.number[3]~13_combout\,
	datad => \state.number[3]~11_combout\,
	combout => \state.number[3]~14_combout\);

-- Location: FF_X75_Y69_N17
\state.number[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[3]~14_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(3));

-- Location: LCCOMB_X74_Y68_N8
\Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~4_combout\ = (\state.number\(4) & ((GND) # (!\Add5~3\))) # (!\state.number\(4) & (\Add5~3\ $ (GND)))
-- \Add5~5\ = CARRY((\state.number\(4)) # (!\Add5~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(4),
	datad => VCC,
	cin => \Add5~3\,
	combout => \Add5~4_combout\,
	cout => \Add5~5\);

-- Location: LCCOMB_X72_Y68_N8
\Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~0_combout\ = (\state.number[7]~7_combout\ & (((\state_nxt~9_combout\)))) # (!\state.number[7]~7_combout\ & ((\state_nxt~9_combout\ & ((\Add5~4_combout\))) # (!\state_nxt~9_combout\ & (\Add1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \state.number[7]~7_combout\,
	datac => \Add5~4_combout\,
	datad => \state_nxt~9_combout\,
	combout => \Selector16~0_combout\);

-- Location: LCCOMB_X72_Y68_N18
\Selector16~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector16~1_combout\ = (\state.number[7]~7_combout\ & ((\Selector16~0_combout\ & (\Add7~6_combout\)) # (!\Selector16~0_combout\ & ((\Add3~2_combout\))))) # (!\state.number[7]~7_combout\ & (((\Selector16~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~6_combout\,
	datab => \state.number[7]~7_combout\,
	datac => \Selector16~0_combout\,
	datad => \Add3~2_combout\,
	combout => \Selector16~1_combout\);

-- Location: LCCOMB_X72_Y68_N28
\state.number[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[4]~feeder_combout\ = \Selector16~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector16~1_combout\,
	combout => \state.number[4]~feeder_combout\);

-- Location: IOIBUF_X65_Y73_N8
\number[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(4),
	o => \number[4]~input_o\);

-- Location: FF_X72_Y68_N29
\state.number[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[4]~feeder_combout\,
	asdata => \number[4]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(4));

-- Location: LCCOMB_X75_Y67_N28
\Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~0_combout\ = (\state_nxt~9_combout\ & (((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & ((\state.number[7]~7_combout\ & ((\Add3~4_combout\))) # (!\state.number[7]~7_combout\ & (\Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add3~4_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector15~0_combout\);

-- Location: LCCOMB_X75_Y67_N6
\Selector15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector15~1_combout\ = (\state_nxt~9_combout\ & ((\Selector15~0_combout\ & ((\Add7~8_combout\))) # (!\Selector15~0_combout\ & (\Add5~6_combout\)))) # (!\state_nxt~9_combout\ & (((\Selector15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~6_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add7~8_combout\,
	datad => \Selector15~0_combout\,
	combout => \Selector15~1_combout\);

-- Location: LCCOMB_X75_Y67_N12
\state.number[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[5]~feeder_combout\ = \Selector15~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector15~1_combout\,
	combout => \state.number[5]~feeder_combout\);

-- Location: IOIBUF_X67_Y73_N22
\number[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(5),
	o => \number[5]~input_o\);

-- Location: FF_X75_Y67_N13
\state.number[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[5]~feeder_combout\,
	asdata => \number[5]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(5));

-- Location: LCCOMB_X73_Y68_N26
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (((!\state.number\(4) & !\state.number\(3))) # (!\state.number\(8))) # (!\state.number\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(9),
	datab => \state.number\(4),
	datac => \state.number\(8),
	datad => \state.number\(3),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X72_Y68_N10
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (((\LessThan1~0_combout\) # (!\state.number\(6))) # (!\state.number\(7))) # (!\state.number\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(5),
	datab => \state.number\(7),
	datac => \state.number\(6),
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X72_Y68_N12
\state_nxt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~9_combout\ = (\LessThan1~1_combout\ & \state_nxt~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datac => \state_nxt~7_combout\,
	combout => \state_nxt~9_combout\);

-- Location: LCCOMB_X73_Y68_N30
\Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\state.number[7]~7_combout\ & ((\Add3~14_combout\) # ((\state_nxt~9_combout\)))) # (!\state.number[7]~7_combout\ & (((\Add1~12_combout\ & !\state_nxt~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add3~14_combout\,
	datab => \Add1~12_combout\,
	datac => \state.number[7]~7_combout\,
	datad => \state_nxt~9_combout\,
	combout => \Selector10~0_combout\);

-- Location: LCCOMB_X75_Y68_N20
\Add7~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~18_combout\ = (\state.number\(10) & (\Add7~17\ & VCC)) # (!\state.number\(10) & (!\Add7~17\))
-- \Add7~19\ = CARRY((!\state.number\(10) & !\Add7~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(10),
	datad => VCC,
	cin => \Add7~17\,
	combout => \Add7~18_combout\,
	cout => \Add7~19\);

-- Location: LCCOMB_X74_Y68_N20
\Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~16_combout\ = (\state.number\(10) & ((GND) # (!\Add5~15\))) # (!\state.number\(10) & (\Add5~15\ $ (GND)))
-- \Add5~17\ = CARRY((\state.number\(10)) # (!\Add5~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(10),
	datad => VCC,
	cin => \Add5~15\,
	combout => \Add5~16_combout\,
	cout => \Add5~17\);

-- Location: LCCOMB_X74_Y68_N2
\Selector10~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector10~1_combout\ = (\state_nxt~9_combout\ & ((\Selector10~0_combout\ & (\Add7~18_combout\)) # (!\Selector10~0_combout\ & ((\Add5~16_combout\))))) # (!\state_nxt~9_combout\ & (\Selector10~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \Selector10~0_combout\,
	datac => \Add7~18_combout\,
	datad => \Add5~16_combout\,
	combout => \Selector10~1_combout\);

-- Location: LCCOMB_X77_Y68_N2
\state.number[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[10]~feeder_combout\ = \Selector10~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector10~1_combout\,
	combout => \state.number[10]~feeder_combout\);

-- Location: IOIBUF_X81_Y73_N1
\number[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(10),
	o => \number[10]~input_o\);

-- Location: FF_X77_Y68_N3
\state.number[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[10]~feeder_combout\,
	asdata => \number[10]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(10));

-- Location: LCCOMB_X75_Y68_N22
\Add7~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add7~20_combout\ = (\state.number\(11) & ((GND) # (!\Add7~19\))) # (!\state.number\(11) & (\Add7~19\ $ (GND)))
-- \Add7~21\ = CARRY((\state.number\(11)) # (!\Add7~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(11),
	datad => VCC,
	cin => \Add7~19\,
	combout => \Add7~20_combout\,
	cout => \Add7~21\);

-- Location: LCCOMB_X74_Y68_N22
\Add5~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~18_combout\ = (\state.number\(11) & (\Add5~17\ & VCC)) # (!\state.number\(11) & (!\Add5~17\))
-- \Add5~19\ = CARRY((!\state.number\(11) & !\Add5~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(11),
	datad => VCC,
	cin => \Add5~17\,
	combout => \Add5~18_combout\,
	cout => \Add5~19\);

-- Location: LCCOMB_X72_Y68_N6
\Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\state_nxt~9_combout\ & ((\Add5~18_combout\) # ((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & (((\Add1~14_combout\ & !\state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~9_combout\,
	datab => \Add5~18_combout\,
	datac => \Add1~14_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector9~0_combout\);

-- Location: LCCOMB_X76_Y68_N30
\Selector9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector9~1_combout\ = (\Selector9~0_combout\ & ((\Add7~20_combout\) # ((!\state.number[7]~7_combout\)))) # (!\Selector9~0_combout\ & (((\Add3~16_combout\ & \state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~20_combout\,
	datab => \Add3~16_combout\,
	datac => \Selector9~0_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector9~1_combout\);

-- Location: LCCOMB_X75_Y67_N2
\state.number[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[11]~feeder_combout\ = \Selector9~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector9~1_combout\,
	combout => \state.number[11]~feeder_combout\);

-- Location: IOIBUF_X87_Y73_N1
\number[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(11),
	o => \number[11]~input_o\);

-- Location: FF_X75_Y67_N3
\state.number[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[11]~feeder_combout\,
	asdata => \number[11]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(11));

-- Location: LCCOMB_X74_Y68_N24
\Add5~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~20_combout\ = (\state.number\(12) & ((GND) # (!\Add5~19\))) # (!\state.number\(12) & (\Add5~19\ $ (GND)))
-- \Add5~21\ = CARRY((\state.number\(12)) # (!\Add5~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(12),
	datad => VCC,
	cin => \Add5~19\,
	combout => \Add5~20_combout\,
	cout => \Add5~21\);

-- Location: LCCOMB_X75_Y67_N16
\Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\state_nxt~9_combout\ & (((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & ((\state.number[7]~7_combout\ & ((\Add3~18_combout\))) # (!\state.number[7]~7_combout\ & (\Add1~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~16_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add3~18_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X75_Y67_N18
\Selector8~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector8~1_combout\ = (\state_nxt~9_combout\ & ((\Selector8~0_combout\ & (\Add7~22_combout\)) # (!\Selector8~0_combout\ & ((\Add5~20_combout\))))) # (!\state_nxt~9_combout\ & (((\Selector8~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add7~22_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add5~20_combout\,
	datad => \Selector8~0_combout\,
	combout => \Selector8~1_combout\);

-- Location: LCCOMB_X75_Y67_N0
\state.number[12]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[12]~feeder_combout\ = \Selector8~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector8~1_combout\,
	combout => \state.number[12]~feeder_combout\);

-- Location: IOIBUF_X83_Y73_N15
\number[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(12),
	o => \number[12]~input_o\);

-- Location: FF_X75_Y67_N1
\state.number[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[12]~feeder_combout\,
	asdata => \number[12]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(12));

-- Location: LCCOMB_X74_Y66_N8
\Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\state_nxt~9_combout\ & ((\Add5~22_combout\) # ((\state.number[7]~7_combout\)))) # (!\state_nxt~9_combout\ & (((\Add1~18_combout\ & !\state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~22_combout\,
	datab => \state_nxt~9_combout\,
	datac => \Add1~18_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X75_Y66_N0
\Selector7~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = (\Selector7~0_combout\ & (((\Add7~24_combout\) # (!\state.number[7]~7_combout\)))) # (!\Selector7~0_combout\ & (\Add3~20_combout\ & ((\state.number[7]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector7~0_combout\,
	datab => \Add3~20_combout\,
	datac => \Add7~24_combout\,
	datad => \state.number[7]~7_combout\,
	combout => \Selector7~1_combout\);

-- Location: LCCOMB_X77_Y68_N6
\state.number[13]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[13]~feeder_combout\ = \Selector7~1_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector7~1_combout\,
	combout => \state.number[13]~feeder_combout\);

-- Location: IOIBUF_X85_Y73_N15
\number[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(13),
	o => \number[13]~input_o\);

-- Location: FF_X77_Y68_N7
\state.number[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[13]~feeder_combout\,
	asdata => \number[13]~input_o\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => \ALT_INV_state.fsm_state.CALC_DIGITS~q\,
	ena => \state.number[7]~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(13));

-- Location: LCCOMB_X77_Y68_N0
\state_nxt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~7_combout\ = (!\state.number\(13) & (\state_nxt~6_combout\ & (\LessThan0~0_combout\ & !\state.number\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(13),
	datab => \state_nxt~6_combout\,
	datac => \LessThan0~0_combout\,
	datad => \state.number\(10),
	combout => \state_nxt~7_combout\);

-- Location: LCCOMB_X75_Y69_N12
\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (\state_nxt~7_combout\ & (!\state.number\(9) & (!\state.number\(8) & \LessThan3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~7_combout\,
	datab => \state.number\(9),
	datac => \state.number\(8),
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X75_Y69_N6
\LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (\LessThan3~1_combout\ & (((!\state.number\(2) & !\state.number\(1))) # (!\state.number\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~1_combout\,
	datab => \state.number\(2),
	datac => \state.number\(1),
	datad => \state.number\(3),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X75_Y69_N24
\state_nxt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_nxt~10_combout\ = (\LessThan3~2_combout\ & (\state_nxt~8_combout\ & (\state_nxt~9_combout\ & \state.number[7]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~2_combout\,
	datab => \state_nxt~8_combout\,
	datac => \state_nxt~9_combout\,
	datad => \state.number[7]~6_combout\,
	combout => \state_nxt~10_combout\);

-- Location: LCCOMB_X75_Y67_N26
\state.digit_cnt[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.digit_cnt[0]~5_combout\ = (\state.digit_cnt\(0) & (!\Selector3~0_combout\ & (\state.digit_cnt[0]~2_combout\))) # (!\state.digit_cnt\(0) & (\state.fsm_state.DIGIT_DONE~q\ & ((\Selector3~0_combout\) # (!\state.digit_cnt[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~0_combout\,
	datab => \state.digit_cnt[0]~2_combout\,
	datac => \state.digit_cnt\(0),
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \state.digit_cnt[0]~5_combout\);

-- Location: FF_X75_Y67_N27
\state.digit_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.digit_cnt[0]~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.digit_cnt\(0));

-- Location: LCCOMB_X74_Y69_N26
\state.digit_cnt[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.digit_cnt[0]~6_combout\ = (\state.digit_cnt[0]~2_combout\ & ((\state.fsm_state.IDLE~q\) # (!\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.digit_cnt[0]~2_combout\,
	datac => \start~input_o\,
	datad => \state.fsm_state.IDLE~q\,
	combout => \state.digit_cnt[0]~6_combout\);

-- Location: LCCOMB_X75_Y67_N24
\state.digit_cnt[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.digit_cnt[1]~4_combout\ = (\state.digit_cnt[0]~6_combout\ & (((\state.digit_cnt\(1))))) # (!\state.digit_cnt[0]~6_combout\ & (\state.fsm_state.DIGIT_DONE~q\ & (\state.digit_cnt\(0) $ (\state.digit_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.digit_cnt\(0),
	datab => \state.digit_cnt[0]~6_combout\,
	datac => \state.digit_cnt\(1),
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \state.digit_cnt[1]~4_combout\);

-- Location: FF_X75_Y67_N25
\state.digit_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.digit_cnt[1]~4_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.digit_cnt\(1));

-- Location: LCCOMB_X75_Y67_N30
\Add8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add8~0_combout\ = \state.digit_cnt\(2) $ (((\state.digit_cnt\(0) & \state.digit_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.digit_cnt\(2),
	datac => \state.digit_cnt\(0),
	datad => \state.digit_cnt\(1),
	combout => \Add8~0_combout\);

-- Location: LCCOMB_X75_Y67_N22
\state.digit_cnt[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.digit_cnt[2]~3_combout\ = (\state.digit_cnt[0]~6_combout\ & (((\state.digit_cnt\(2))))) # (!\state.digit_cnt[0]~6_combout\ & (\Add8~0_combout\ & ((\state.fsm_state.DIGIT_DONE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add8~0_combout\,
	datab => \state.digit_cnt[0]~6_combout\,
	datac => \state.digit_cnt\(2),
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \state.digit_cnt[2]~3_combout\);

-- Location: FF_X75_Y67_N23
\state.digit_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.digit_cnt[2]~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.digit_cnt\(2));

-- Location: LCCOMB_X75_Y67_N20
\state.digit_cnt[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.digit_cnt[0]~2_combout\ = ((\state.digit_cnt\(2) & (!\state.digit_cnt\(1) & !\state.digit_cnt\(0)))) # (!\state.fsm_state.DIGIT_DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.digit_cnt\(2),
	datab => \state.digit_cnt\(1),
	datac => \state.digit_cnt\(0),
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \state.digit_cnt[0]~2_combout\);

-- Location: LCCOMB_X74_Y69_N24
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\state.digit_cnt[0]~2_combout\ & (((\state.fsm_state.DIGIT_DONE~q\) # (!\state.fsm_state.CALC_DIGITS~q\)) # (!\state_nxt~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_nxt~10_combout\,
	datab => \state.digit_cnt[0]~2_combout\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \state.fsm_state.CALC_DIGITS~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X75_Y71_N0
\Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = ((!\state.fsm_state.DIGIT_DONE~q\ & (\state.fsm_state.BB_CHAR~q\ & \gfx_cmd_full~input_o\))) # (!\Selector2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~0_combout\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.fsm_state.BB_CHAR~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \Selector2~1_combout\);

-- Location: FF_X75_Y71_N1
\state.fsm_state.BB_CHAR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.fsm_state.BB_CHAR~q\);

-- Location: IOIBUF_X72_Y73_N1
\bmpidx[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bmpidx(0),
	o => \bmpidx[0]~input_o\);

-- Location: LCCOMB_X75_Y71_N2
\gfx_cmd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~0_combout\ = (\state.fsm_state.BB_CHAR~q\ & (\bmpidx[0]~input_o\ & !\gfx_cmd_full~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR~q\,
	datac => \bmpidx[0]~input_o\,
	datad => \gfx_cmd_full~input_o\,
	combout => \gfx_cmd~0_combout\);

-- Location: IOIBUF_X79_Y73_N8
\bmpidx[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bmpidx(1),
	o => \bmpidx[1]~input_o\);

-- Location: LCCOMB_X75_Y71_N20
\gfx_cmd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~1_combout\ = (\state.fsm_state.BB_CHAR~q\ & (\bmpidx[1]~input_o\ & !\gfx_cmd_full~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR~q\,
	datac => \bmpidx[1]~input_o\,
	datad => \gfx_cmd_full~input_o\,
	combout => \gfx_cmd~1_combout\);

-- Location: IOIBUF_X79_Y73_N1
\bmpidx[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bmpidx(2),
	o => \bmpidx[2]~input_o\);

-- Location: LCCOMB_X75_Y71_N6
\gfx_cmd~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~2_combout\ = (\state.fsm_state.BB_CHAR~q\ & (\bmpidx[2]~input_o\ & !\gfx_cmd_full~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR~q\,
	datac => \bmpidx[2]~input_o\,
	datad => \gfx_cmd_full~input_o\,
	combout => \gfx_cmd~2_combout\);

-- Location: LCCOMB_X75_Y71_N18
\Selector44~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector44~0_combout\ = (\state.fsm_state.BB_CHAR_ARG~q\ & !\gfx_cmd_full~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR_ARG~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \Selector44~0_combout\);

-- Location: LCCOMB_X75_Y71_N4
\gfx_cmd~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~3_combout\ = (\gfx_cmd_full~input_o\) # (!\state.fsm_state.BB_CHAR~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \gfx_cmd~3_combout\);

-- Location: IOIBUF_X67_Y73_N15
\number[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_number(0),
	o => \number[0]~input_o\);

-- Location: LCCOMB_X74_Y69_N8
\state.number[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.number[0]~20_combout\ = (\start~input_o\ & ((\state.fsm_state.IDLE~q\ & ((\state.number\(0)))) # (!\state.fsm_state.IDLE~q\ & (\number[0]~input_o\)))) # (!\start~input_o\ & (((\state.number\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \number[0]~input_o\,
	datab => \start~input_o\,
	datac => \state.number\(0),
	datad => \state.fsm_state.IDLE~q\,
	combout => \state.number[0]~20_combout\);

-- Location: FF_X74_Y69_N9
\state.number[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state.number[0]~20_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.number\(0));

-- Location: LCCOMB_X75_Y69_N10
\Selector39~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector39~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & \state.number\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.number\(0),
	combout => \Selector39~0_combout\);

-- Location: LCCOMB_X75_Y71_N10
\state.bcd_data[4][0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[4][0]~0_combout\ = (!\state.fsm_state.BB_CHAR~q\ & (!\state.fsm_state.BB_CHAR_ARG~q\ & ((\start~input_o\) # (\state.fsm_state.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \start~input_o\,
	datab => \state.fsm_state.BB_CHAR~q\,
	datac => \state.fsm_state.IDLE~q\,
	datad => \state.fsm_state.BB_CHAR_ARG~q\,
	combout => \state.bcd_data[4][0]~0_combout\);

-- Location: LCCOMB_X75_Y69_N2
\state.bcd_data[0][3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[0][3]~7_combout\ = (\state.bcd_data[4][0]~0_combout\ & ((\state_nxt~10_combout\) # (!\state.fsm_state.CALC_DIGITS~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state_nxt~10_combout\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.bcd_data[4][0]~0_combout\,
	combout => \state.bcd_data[0][3]~7_combout\);

-- Location: FF_X75_Y69_N11
\state.bcd_data[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector39~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[0][3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[0][0]~q\);

-- Location: LCCOMB_X76_Y67_N18
\Selector35~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector35~0_combout\ = (\state.fsm_state.DIGIT_DONE~q\ & ((\state.bcd_data[0][0]~q\) # ((\state.fsm_state.CALC_DIGITS~q\ & !\state.bcd_data[1][0]~q\)))) # (!\state.fsm_state.DIGIT_DONE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & 
-- (!\state.bcd_data[1][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.DIGIT_DONE~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[1][0]~q\,
	datad => \state.bcd_data[0][0]~q\,
	combout => \Selector35~0_combout\);

-- Location: LCCOMB_X76_Y67_N2
\state.bcd_data[1][3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[1][3]~6_combout\ = (\state.bcd_data[4][0]~0_combout\ & (((!\LessThan3~2_combout\ & \state_nxt~8_combout\)) # (!\state.fsm_state.CALC_DIGITS~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][0]~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \LessThan3~2_combout\,
	datad => \state_nxt~8_combout\,
	combout => \state.bcd_data[1][3]~6_combout\);

-- Location: FF_X76_Y67_N19
\state.bcd_data[1][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector35~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[1][3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[1][0]~q\);

-- Location: LCCOMB_X76_Y67_N16
\Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector31~0_combout\ = (\state.fsm_state.DIGIT_DONE~q\ & ((\state.bcd_data[1][0]~q\) # ((\state.fsm_state.CALC_DIGITS~q\ & !\state.bcd_data[2][0]~q\)))) # (!\state.fsm_state.DIGIT_DONE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & 
-- (!\state.bcd_data[2][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.DIGIT_DONE~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[2][0]~q\,
	datad => \state.bcd_data[1][0]~q\,
	combout => \Selector31~0_combout\);

-- Location: LCCOMB_X76_Y67_N20
\state.bcd_data[2][2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[2][2]~5_combout\ = (\state.bcd_data[4][0]~0_combout\ & (((\state_nxt~9_combout\ & !\state_nxt~8_combout\)) # (!\state.fsm_state.CALC_DIGITS~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][0]~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state_nxt~9_combout\,
	datad => \state_nxt~8_combout\,
	combout => \state.bcd_data[2][2]~5_combout\);

-- Location: FF_X76_Y67_N17
\state.bcd_data[2][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector31~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[2][2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[2][0]~q\);

-- Location: LCCOMB_X76_Y71_N0
\Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector27~0_combout\ = (\state.bcd_data[2][0]~q\ & ((\state.fsm_state.DIGIT_DONE~q\) # ((\state.fsm_state.CALC_DIGITS~q\ & !\state.bcd_data[3][0]~q\)))) # (!\state.bcd_data[2][0]~q\ & (\state.fsm_state.CALC_DIGITS~q\ & (!\state.bcd_data[3][0]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][0]~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[3][0]~q\,
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \Selector27~0_combout\);

-- Location: LCCOMB_X77_Y68_N20
\state.bcd_data[3][3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[3][3]~2_combout\ = (!\state.number\(13) & (!\state.number\(12) & (!\state.number\(11) & !\state.number\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(13),
	datab => \state.number\(12),
	datac => \state.number\(11),
	datad => \state.number\(10),
	combout => \state.bcd_data[3][3]~2_combout\);

-- Location: LCCOMB_X77_Y68_N14
\state.bcd_data[3][3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[3][3]~3_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (((\LessThan1~1_combout\ & \state.bcd_data[3][3]~2_combout\)) # (!\state.number[7]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number[7]~6_combout\,
	datab => \LessThan1~1_combout\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.bcd_data[3][3]~2_combout\,
	combout => \state.bcd_data[3][3]~3_combout\);

-- Location: LCCOMB_X76_Y71_N8
\state.bcd_data[3][3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[3][3]~4_combout\ = (\state.bcd_data[4][0]~0_combout\ & !\state.bcd_data[3][3]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][0]~0_combout\,
	datac => \state.bcd_data[3][3]~3_combout\,
	combout => \state.bcd_data[3][3]~4_combout\);

-- Location: FF_X76_Y71_N1
\state.bcd_data[3][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector27~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[3][3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[3][0]~q\);

-- Location: LCCOMB_X76_Y71_N16
\Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector23~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[3][0]~q\)) # (!\state.bcd_data[4][0]~q\))) # (!\state.fsm_state.CALC_DIGITS~q\ & (\state.fsm_state.DIGIT_DONE~q\ & 
-- ((\state.bcd_data[3][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.CALC_DIGITS~q\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.bcd_data[4][0]~q\,
	datad => \state.bcd_data[3][0]~q\,
	combout => \Selector23~0_combout\);

-- Location: LCCOMB_X76_Y71_N10
\state.bcd_data[4][0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.bcd_data[4][0]~1_combout\ = (\state.bcd_data[4][0]~0_combout\ & ((!\state.number[7]~6_combout\) # (!\state.fsm_state.CALC_DIGITS~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][0]~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.number[7]~6_combout\,
	combout => \state.bcd_data[4][0]~1_combout\);

-- Location: FF_X76_Y71_N17
\state.bcd_data[4][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector23~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[4][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[4][0]~q\);

-- Location: LCCOMB_X75_Y71_N22
\gfx_cmd~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~4_combout\ = (\state.bcd_data[4][0]~q\ & (!\gfx_cmd_full~input_o\ & \state.fsm_state.BB_CHAR_ARG~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.bcd_data[4][0]~q\,
	datac => \gfx_cmd_full~input_o\,
	datad => \state.fsm_state.BB_CHAR_ARG~q\,
	combout => \gfx_cmd~4_combout\);

-- Location: LCCOMB_X75_Y69_N4
\Selector38~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector38~0_combout\ = (\state.number\(1) & \state.fsm_state.CALC_DIGITS~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.number\(1),
	datac => \state.fsm_state.CALC_DIGITS~q\,
	combout => \Selector38~0_combout\);

-- Location: FF_X75_Y69_N5
\state.bcd_data[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector38~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[0][3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[0][1]~q\);

-- Location: LCCOMB_X75_Y67_N8
\Selector34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector34~0_combout\ = (\state.bcd_data[0][1]~q\ & \state.fsm_state.DIGIT_DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.bcd_data[0][1]~q\,
	datad => \state.fsm_state.DIGIT_DONE~q\,
	combout => \Selector34~0_combout\);

-- Location: LCCOMB_X76_Y67_N14
\Selector34~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector34~1_combout\ = (\Selector34~0_combout\) # ((\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[1][1]~q\ $ (\state.bcd_data[1][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector34~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[1][1]~q\,
	datad => \state.bcd_data[1][0]~q\,
	combout => \Selector34~1_combout\);

-- Location: FF_X76_Y67_N15
\state.bcd_data[1][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector34~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[1][3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[1][1]~q\);

-- Location: LCCOMB_X76_Y67_N0
\Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector30~0_combout\ = (\state.bcd_data[1][1]~q\ & \state.fsm_state.DIGIT_DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.bcd_data[1][1]~q\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	combout => \Selector30~0_combout\);

-- Location: LCCOMB_X76_Y67_N26
\Selector30~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector30~1_combout\ = (\Selector30~0_combout\) # ((\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[2][1]~q\ $ (\state.bcd_data[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.CALC_DIGITS~q\,
	datab => \Selector30~0_combout\,
	datac => \state.bcd_data[2][1]~q\,
	datad => \state.bcd_data[2][0]~q\,
	combout => \Selector30~1_combout\);

-- Location: FF_X76_Y67_N27
\state.bcd_data[2][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector30~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[2][2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[2][1]~q\);

-- Location: LCCOMB_X76_Y67_N4
\Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~0_combout\ = (\state.bcd_data[2][1]~q\ & \state.fsm_state.DIGIT_DONE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][1]~q\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	combout => \Selector26~0_combout\);

-- Location: LCCOMB_X76_Y71_N4
\Selector26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector26~1_combout\ = (\Selector26~0_combout\) # ((\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[3][1]~q\ $ (\state.bcd_data[3][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector26~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[3][1]~q\,
	datad => \state.bcd_data[3][0]~q\,
	combout => \Selector26~1_combout\);

-- Location: FF_X76_Y71_N5
\state.bcd_data[3][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector26~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[3][3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[3][1]~q\);

-- Location: LCCOMB_X76_Y71_N14
\Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~0_combout\ = (\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[3][1]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.bcd_data[3][1]~q\,
	combout => \Selector22~0_combout\);

-- Location: LCCOMB_X76_Y71_N18
\Selector22~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector22~1_combout\ = (\Selector22~0_combout\) # ((\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[4][1]~q\ $ (\state.bcd_data[4][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.CALC_DIGITS~q\,
	datab => \Selector22~0_combout\,
	datac => \state.bcd_data[4][1]~q\,
	datad => \state.bcd_data[4][0]~q\,
	combout => \Selector22~1_combout\);

-- Location: FF_X76_Y71_N19
\state.bcd_data[4][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector22~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[4][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[4][1]~q\);

-- Location: LCCOMB_X75_Y71_N8
\gfx_cmd~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~5_combout\ = (\state.bcd_data[4][1]~q\ & (!\gfx_cmd_full~input_o\ & \state.fsm_state.BB_CHAR_ARG~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.bcd_data[4][1]~q\,
	datac => \gfx_cmd_full~input_o\,
	datad => \state.fsm_state.BB_CHAR_ARG~q\,
	combout => \gfx_cmd~5_combout\);

-- Location: LCCOMB_X76_Y67_N10
\Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector29~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[2][2]~q\ $ (((\state.bcd_data[2][1]~q\ & \state.bcd_data[2][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][2]~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[2][1]~q\,
	datad => \state.bcd_data[2][0]~q\,
	combout => \Selector29~0_combout\);

-- Location: LCCOMB_X75_Y69_N22
\Selector37~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector37~0_combout\ = (\state.number\(2) & \state.fsm_state.CALC_DIGITS~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.number\(2),
	datac => \state.fsm_state.CALC_DIGITS~q\,
	combout => \Selector37~0_combout\);

-- Location: FF_X75_Y69_N23
\state.bcd_data[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector37~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[0][3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[0][2]~q\);

-- Location: LCCOMB_X76_Y67_N28
\Selector33~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector33~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[1][2]~q\ $ (((\state.bcd_data[1][1]~q\ & \state.bcd_data[1][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[1][2]~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.bcd_data[1][1]~q\,
	datad => \state.bcd_data[1][0]~q\,
	combout => \Selector33~0_combout\);

-- Location: LCCOMB_X76_Y67_N12
\Selector33~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector33~1_combout\ = (\Selector33~0_combout\) # ((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[0][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.bcd_data[0][2]~q\,
	datad => \Selector33~0_combout\,
	combout => \Selector33~1_combout\);

-- Location: FF_X76_Y67_N13
\state.bcd_data[1][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector33~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[1][3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[1][2]~q\);

-- Location: LCCOMB_X76_Y67_N6
\Selector29~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector29~1_combout\ = (\Selector29~0_combout\) # ((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[1][2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector29~0_combout\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \state.bcd_data[1][2]~q\,
	combout => \Selector29~1_combout\);

-- Location: FF_X76_Y67_N7
\state.bcd_data[2][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector29~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[2][2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[2][2]~q\);

-- Location: LCCOMB_X76_Y71_N26
\Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[3][2]~q\ $ (((\state.bcd_data[3][1]~q\ & \state.bcd_data[3][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.CALC_DIGITS~q\,
	datab => \state.bcd_data[3][2]~q\,
	datac => \state.bcd_data[3][1]~q\,
	datad => \state.bcd_data[3][0]~q\,
	combout => \Selector25~0_combout\);

-- Location: LCCOMB_X76_Y71_N2
\Selector25~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector25~1_combout\ = (\Selector25~0_combout\) # ((\state.bcd_data[2][2]~q\ & \state.fsm_state.DIGIT_DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][2]~q\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \Selector25~0_combout\,
	combout => \Selector25~1_combout\);

-- Location: FF_X76_Y71_N3
\state.bcd_data[3][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector25~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[3][3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[3][2]~q\);

-- Location: LCCOMB_X76_Y71_N24
\Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & (\state.bcd_data[4][2]~q\ $ (((\state.bcd_data[4][1]~q\ & \state.bcd_data[4][0]~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][2]~q\,
	datab => \state.bcd_data[4][1]~q\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.bcd_data[4][0]~q\,
	combout => \Selector21~0_combout\);

-- Location: LCCOMB_X76_Y71_N12
\Selector21~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector21~1_combout\ = (\Selector21~0_combout\) # ((\state.bcd_data[3][2]~q\ & \state.fsm_state.DIGIT_DONE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.bcd_data[3][2]~q\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \Selector21~0_combout\,
	combout => \Selector21~1_combout\);

-- Location: FF_X76_Y71_N13
\state.bcd_data[4][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector21~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[4][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[4][2]~q\);

-- Location: LCCOMB_X75_Y71_N26
\gfx_cmd~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gfx_cmd~6_combout\ = (\state.fsm_state.BB_CHAR_ARG~q\ & (\state.bcd_data[4][2]~q\ & !\gfx_cmd_full~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.fsm_state.BB_CHAR_ARG~q\,
	datac => \state.bcd_data[4][2]~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \gfx_cmd~6_combout\);

-- Location: LCCOMB_X76_Y67_N22
\Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = \state.bcd_data[2][3]~q\ $ (((\state.bcd_data[2][2]~q\ & (\state.bcd_data[2][1]~q\ & \state.bcd_data[2][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][2]~q\,
	datab => \state.bcd_data[2][3]~q\,
	datac => \state.bcd_data[2][1]~q\,
	datad => \state.bcd_data[2][0]~q\,
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X76_Y67_N30
\Add6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add6~0_combout\ = \state.bcd_data[1][3]~q\ $ (((\state.bcd_data[1][2]~q\ & (\state.bcd_data[1][0]~q\ & \state.bcd_data[1][1]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[1][2]~q\,
	datab => \state.bcd_data[1][0]~q\,
	datac => \state.bcd_data[1][1]~q\,
	datad => \state.bcd_data[1][3]~q\,
	combout => \Add6~0_combout\);

-- Location: LCCOMB_X75_Y69_N0
\Selector36~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector36~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & \state.number\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \state.number\(3),
	combout => \Selector36~0_combout\);

-- Location: FF_X75_Y69_N1
\state.bcd_data[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector36~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[0][3]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[0][3]~q\);

-- Location: LCCOMB_X76_Y67_N24
\Selector32~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector32~0_combout\ = (\state.fsm_state.DIGIT_DONE~q\ & ((\state.bcd_data[0][3]~q\) # ((\state.fsm_state.CALC_DIGITS~q\ & \Add6~0_combout\)))) # (!\state.fsm_state.DIGIT_DONE~q\ & (\state.fsm_state.CALC_DIGITS~q\ & (\Add6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.DIGIT_DONE~q\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \Add6~0_combout\,
	datad => \state.bcd_data[0][3]~q\,
	combout => \Selector32~0_combout\);

-- Location: FF_X76_Y67_N25
\state.bcd_data[1][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector32~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[1][3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[1][3]~q\);

-- Location: LCCOMB_X76_Y67_N8
\Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector28~0_combout\ = (\Add4~0_combout\ & ((\state.fsm_state.CALC_DIGITS~q\) # ((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[1][3]~q\)))) # (!\Add4~0_combout\ & (((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[1][3]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~0_combout\,
	datab => \state.fsm_state.CALC_DIGITS~q\,
	datac => \state.fsm_state.DIGIT_DONE~q\,
	datad => \state.bcd_data[1][3]~q\,
	combout => \Selector28~0_combout\);

-- Location: FF_X76_Y67_N9
\state.bcd_data[2][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector28~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[2][2]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[2][3]~q\);

-- Location: LCCOMB_X76_Y71_N28
\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = \state.bcd_data[3][3]~q\ $ (((\state.bcd_data[3][2]~q\ & (\state.bcd_data[3][1]~q\ & \state.bcd_data[3][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[3][3]~q\,
	datab => \state.bcd_data[3][2]~q\,
	datac => \state.bcd_data[3][1]~q\,
	datad => \state.bcd_data[3][0]~q\,
	combout => \Add2~0_combout\);

-- Location: LCCOMB_X76_Y71_N30
\Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector24~0_combout\ = (\state.bcd_data[2][3]~q\ & ((\state.fsm_state.DIGIT_DONE~q\) # ((\state.fsm_state.CALC_DIGITS~q\ & \Add2~0_combout\)))) # (!\state.bcd_data[2][3]~q\ & (((\state.fsm_state.CALC_DIGITS~q\ & \Add2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[2][3]~q\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.fsm_state.CALC_DIGITS~q\,
	datad => \Add2~0_combout\,
	combout => \Selector24~0_combout\);

-- Location: FF_X76_Y71_N31
\state.bcd_data[3][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector24~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[3][3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[3][3]~q\);

-- Location: LCCOMB_X76_Y71_N20
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \state.bcd_data[4][3]~q\ $ (((\state.bcd_data[4][2]~q\ & (\state.bcd_data[4][1]~q\ & \state.bcd_data[4][0]~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][2]~q\,
	datab => \state.bcd_data[4][1]~q\,
	datac => \state.bcd_data[4][3]~q\,
	datad => \state.bcd_data[4][0]~q\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X76_Y71_N6
\Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector20~0_combout\ = (\state.fsm_state.CALC_DIGITS~q\ & ((\Add0~0_combout\) # ((\state.fsm_state.DIGIT_DONE~q\ & \state.bcd_data[3][3]~q\)))) # (!\state.fsm_state.CALC_DIGITS~q\ & (\state.fsm_state.DIGIT_DONE~q\ & (\state.bcd_data[3][3]~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.fsm_state.CALC_DIGITS~q\,
	datab => \state.fsm_state.DIGIT_DONE~q\,
	datac => \state.bcd_data[3][3]~q\,
	datad => \Add0~0_combout\,
	combout => \Selector20~0_combout\);

-- Location: FF_X76_Y71_N7
\state.bcd_data[4][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector20~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \state.bcd_data[4][0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.bcd_data[4][3]~q\);

-- Location: LCCOMB_X75_Y71_N12
\Selector44~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector44~1_combout\ = (!\gfx_cmd_full~input_o\ & ((\state.fsm_state.BB_CHAR~q\) # ((\state.bcd_data[4][3]~q\ & \state.fsm_state.BB_CHAR_ARG~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.bcd_data[4][3]~q\,
	datab => \state.fsm_state.BB_CHAR_ARG~q\,
	datac => \state.fsm_state.BB_CHAR~q\,
	datad => \gfx_cmd_full~input_o\,
	combout => \Selector44~1_combout\);

-- Location: LCCOMB_X75_Y71_N30
\Selector43~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector43~0_combout\ = (!\gfx_cmd_full~input_o\ & ((\state.fsm_state.BB_CHAR_ARG~q\) # (\state.fsm_state.BB_CHAR~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gfx_cmd_full~input_o\,
	datab => \state.fsm_state.BB_CHAR_ARG~q\,
	datac => \state.fsm_state.BB_CHAR~q\,
	combout => \Selector43~0_combout\);

ww_gfx_cmd(0) <= \gfx_cmd[0]~output_o\;

ww_gfx_cmd(1) <= \gfx_cmd[1]~output_o\;

ww_gfx_cmd(2) <= \gfx_cmd[2]~output_o\;

ww_gfx_cmd(3) <= \gfx_cmd[3]~output_o\;

ww_gfx_cmd(4) <= \gfx_cmd[4]~output_o\;

ww_gfx_cmd(5) <= \gfx_cmd[5]~output_o\;

ww_gfx_cmd(6) <= \gfx_cmd[6]~output_o\;

ww_gfx_cmd(7) <= \gfx_cmd[7]~output_o\;

ww_gfx_cmd(8) <= \gfx_cmd[8]~output_o\;

ww_gfx_cmd(9) <= \gfx_cmd[9]~output_o\;

ww_gfx_cmd(10) <= \gfx_cmd[10]~output_o\;

ww_gfx_cmd(11) <= \gfx_cmd[11]~output_o\;

ww_gfx_cmd(12) <= \gfx_cmd[12]~output_o\;

ww_gfx_cmd(13) <= \gfx_cmd[13]~output_o\;

ww_gfx_cmd(14) <= \gfx_cmd[14]~output_o\;

ww_gfx_cmd(15) <= \gfx_cmd[15]~output_o\;

ww_gfx_cmd_wr <= \gfx_cmd_wr~output_o\;

ww_busy <= \busy~output_o\;
END structure;


