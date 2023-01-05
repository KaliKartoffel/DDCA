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

-- DATE "02/24/2022 15:42:56"

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

ENTITY 	gc_cntrl_top IS
    PORT (
	clk : IN std_logic;
	res_n : IN std_logic;
	data : INOUT std_logic;
	cntrl_state : OUT std_logic_vector(63 DOWNTO 0);
	rumble : IN std_logic
	);
END gc_cntrl_top;

-- Design Ports Information
-- cntrl_state[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[1]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[2]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[3]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[4]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[5]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[6]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[7]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[8]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[9]	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[10]	=>  Location: PIN_M25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[11]	=>  Location: PIN_P27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[12]	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[13]	=>  Location: PIN_L28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[14]	=>  Location: PIN_N26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[15]	=>  Location: PIN_L27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[16]	=>  Location: PIN_P25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[17]	=>  Location: PIN_N25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[18]	=>  Location: PIN_M27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[19]	=>  Location: PIN_M28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[20]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[21]	=>  Location: PIN_M26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[22]	=>  Location: PIN_L24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[23]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[24]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[25]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[26]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[27]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[28]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[29]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[30]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[31]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[32]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[33]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[34]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[35]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[36]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[37]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[38]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[39]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[40]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[41]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[42]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[43]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[44]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[45]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[46]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[47]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[48]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[49]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[50]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[51]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[52]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[53]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[54]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[55]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[56]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[57]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[58]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[59]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[60]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[61]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[62]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cntrl_state[63]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- res_n	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rumble	=>  Location: PIN_AG15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gc_cntrl_top IS
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
SIGNAL ww_cntrl_state : std_logic_vector(63 DOWNTO 0);
SIGNAL ww_rumble : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \res_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data~output_o\ : std_logic;
SIGNAL \cntrl_state[0]~output_o\ : std_logic;
SIGNAL \cntrl_state[1]~output_o\ : std_logic;
SIGNAL \cntrl_state[2]~output_o\ : std_logic;
SIGNAL \cntrl_state[3]~output_o\ : std_logic;
SIGNAL \cntrl_state[4]~output_o\ : std_logic;
SIGNAL \cntrl_state[5]~output_o\ : std_logic;
SIGNAL \cntrl_state[6]~output_o\ : std_logic;
SIGNAL \cntrl_state[7]~output_o\ : std_logic;
SIGNAL \cntrl_state[8]~output_o\ : std_logic;
SIGNAL \cntrl_state[9]~output_o\ : std_logic;
SIGNAL \cntrl_state[10]~output_o\ : std_logic;
SIGNAL \cntrl_state[11]~output_o\ : std_logic;
SIGNAL \cntrl_state[12]~output_o\ : std_logic;
SIGNAL \cntrl_state[13]~output_o\ : std_logic;
SIGNAL \cntrl_state[14]~output_o\ : std_logic;
SIGNAL \cntrl_state[15]~output_o\ : std_logic;
SIGNAL \cntrl_state[16]~output_o\ : std_logic;
SIGNAL \cntrl_state[17]~output_o\ : std_logic;
SIGNAL \cntrl_state[18]~output_o\ : std_logic;
SIGNAL \cntrl_state[19]~output_o\ : std_logic;
SIGNAL \cntrl_state[20]~output_o\ : std_logic;
SIGNAL \cntrl_state[21]~output_o\ : std_logic;
SIGNAL \cntrl_state[22]~output_o\ : std_logic;
SIGNAL \cntrl_state[23]~output_o\ : std_logic;
SIGNAL \cntrl_state[24]~output_o\ : std_logic;
SIGNAL \cntrl_state[25]~output_o\ : std_logic;
SIGNAL \cntrl_state[26]~output_o\ : std_logic;
SIGNAL \cntrl_state[27]~output_o\ : std_logic;
SIGNAL \cntrl_state[28]~output_o\ : std_logic;
SIGNAL \cntrl_state[29]~output_o\ : std_logic;
SIGNAL \cntrl_state[30]~output_o\ : std_logic;
SIGNAL \cntrl_state[31]~output_o\ : std_logic;
SIGNAL \cntrl_state[32]~output_o\ : std_logic;
SIGNAL \cntrl_state[33]~output_o\ : std_logic;
SIGNAL \cntrl_state[34]~output_o\ : std_logic;
SIGNAL \cntrl_state[35]~output_o\ : std_logic;
SIGNAL \cntrl_state[36]~output_o\ : std_logic;
SIGNAL \cntrl_state[37]~output_o\ : std_logic;
SIGNAL \cntrl_state[38]~output_o\ : std_logic;
SIGNAL \cntrl_state[39]~output_o\ : std_logic;
SIGNAL \cntrl_state[40]~output_o\ : std_logic;
SIGNAL \cntrl_state[41]~output_o\ : std_logic;
SIGNAL \cntrl_state[42]~output_o\ : std_logic;
SIGNAL \cntrl_state[43]~output_o\ : std_logic;
SIGNAL \cntrl_state[44]~output_o\ : std_logic;
SIGNAL \cntrl_state[45]~output_o\ : std_logic;
SIGNAL \cntrl_state[46]~output_o\ : std_logic;
SIGNAL \cntrl_state[47]~output_o\ : std_logic;
SIGNAL \cntrl_state[48]~output_o\ : std_logic;
SIGNAL \cntrl_state[49]~output_o\ : std_logic;
SIGNAL \cntrl_state[50]~output_o\ : std_logic;
SIGNAL \cntrl_state[51]~output_o\ : std_logic;
SIGNAL \cntrl_state[52]~output_o\ : std_logic;
SIGNAL \cntrl_state[53]~output_o\ : std_logic;
SIGNAL \cntrl_state[54]~output_o\ : std_logic;
SIGNAL \cntrl_state[55]~output_o\ : std_logic;
SIGNAL \cntrl_state[56]~output_o\ : std_logic;
SIGNAL \cntrl_state[57]~output_o\ : std_logic;
SIGNAL \cntrl_state[58]~output_o\ : std_logic;
SIGNAL \cntrl_state[59]~output_o\ : std_logic;
SIGNAL \cntrl_state[60]~output_o\ : std_logic;
SIGNAL \cntrl_state[61]~output_o\ : std_logic;
SIGNAL \cntrl_state[62]~output_o\ : std_logic;
SIGNAL \cntrl_state[63]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[0]~8_combout\ : std_logic;
SIGNAL \res_n~input_o\ : std_logic;
SIGNAL \res_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \data~input_o\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_synced_old~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~10_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~8_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~1\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~3\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~4_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~5\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~6_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~7\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~8_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~9\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~10_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~7_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~11\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~12_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~6_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~13\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~14_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~5_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~15\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~16_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~4_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~17\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~18_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~19\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~20_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~21\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~22_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~23\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~24_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~25\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~26_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~27\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~28_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~29\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~30_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~31\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~32_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~33\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~34_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~35\ : std_logic;
SIGNAL \gc_cntrl_inst|Add0~36_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|refresh_counter~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~4_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|Equal0~5_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|do_send~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|sync~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector4~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~17_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~4\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~5_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~18_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~6\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~7_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~15_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~8\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~9_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~16_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~10\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~11_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt[5]~5_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~12\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~13_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt[6]~4_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|LessThan1~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt[0]~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt[0]~6_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|WideOr2~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~2\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Add0~19_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|LessThan0~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_len_reg[0]~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|LessThan0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector1~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~4_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[6]~24_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|WideOr3~combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[6]~25\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[7]~26_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal0~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal0~2_combout\ : std_logic;
SIGNAL \rumble~input_o\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_reg[0]~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_reg~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector31~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector30~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector29~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector28~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector27~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector26~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector25~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector24~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector23~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector22~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector21~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector20~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector19~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector18~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector17~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector16~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector15~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector14~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector13~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector12~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector11~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector10~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector9~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector8~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal1~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal1~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~5_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector1~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector1~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector1~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.IDLE~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector6~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector2~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector6~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector5~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector2~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector5~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector6~3_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector7~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[7]~12_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[7]~14_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[1]~10_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[2]~16_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[3]~18_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[4]~20_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt[5]~22_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal2~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Equal2~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector6~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~9_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector2~2_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.SEND~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~7_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~6_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector3~8_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector0~0_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|Selector0~1_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|received_valid_reg~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[2]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[3]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[2]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[3]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[7]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_r[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[8]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[10]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[11]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[14]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[15]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[16]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.trigger_l[7]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[17]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[18]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[19]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[2]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[20]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[3]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[21]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[22]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[23]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_y[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[24]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[26]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[27]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[2]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[28]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[30]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[31]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[32]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.c_x[7]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[33]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[34]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[35]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[3]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[37]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[38]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[39]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[40]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_y[7]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[41]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[0]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[42]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[1]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[43]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[2]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[44]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[3]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[45]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[4]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[46]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[5]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[6]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[48]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.joy_x[7]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[49]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_left~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_left~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[50]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_right~q\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_down~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_down~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[52]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_up~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_up~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[53]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_z~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_z~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[54]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_r~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_r~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[55]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_l~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_l~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[56]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_a~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_a~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[58]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_b~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_b~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[59]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_x~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_x~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[60]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_y~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_y~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg[61]~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_start~feeder_combout\ : std_logic;
SIGNAL \gc_cntrl_inst|button_reg.btn_start~q\ : std_logic;
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_len_reg\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.trigger_r\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.c_y\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.c_x\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|pwe_inst|data_cnt\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.joy_y\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\ : std_logic_vector(1 TO 2);
SIGNAL \gc_cntrl_inst|pwe_inst|clk_cnt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.joy_x\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|button_reg.trigger_l\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gc_cntrl_inst|pwe_inst|recveived_reg\ : std_logic_vector(64 DOWNTO 0);
SIGNAL \gc_cntrl_inst|refresh_counter\ : std_logic_vector(18 DOWNTO 0);
SIGNAL \gc_cntrl_inst|pwe_inst|send_data_reg\ : std_logic_vector(24 DOWNTO 0);
SIGNAL \gc_cntrl_inst|pwe_inst|ALT_INV_state.SEND_LOW~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_res_n <= res_n;
cntrl_state <= ww_cntrl_state;
ww_rumble <= rumble;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\res_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \res_n~input_o\);
\gc_cntrl_inst|pwe_inst|ALT_INV_state.SEND_LOW~q\ <= NOT \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X42_Y73_N9
\data~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|pwe_inst|ALT_INV_state.SEND_LOW~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \data~output_o\);

-- Location: IOOBUF_X58_Y73_N9
\cntrl_state[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(0),
	devoe => ww_devoe,
	o => \cntrl_state[0]~output_o\);

-- Location: IOOBUF_X60_Y73_N9
\cntrl_state[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(1),
	devoe => ww_devoe,
	o => \cntrl_state[1]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\cntrl_state[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(2),
	devoe => ww_devoe,
	o => \cntrl_state[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\cntrl_state[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(3),
	devoe => ww_devoe,
	o => \cntrl_state[3]~output_o\);

-- Location: IOOBUF_X87_Y73_N2
\cntrl_state[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(4),
	devoe => ww_devoe,
	o => \cntrl_state[4]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\cntrl_state[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(5),
	devoe => ww_devoe,
	o => \cntrl_state[5]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\cntrl_state[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(6),
	devoe => ww_devoe,
	o => \cntrl_state[6]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\cntrl_state[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_r\(7),
	devoe => ww_devoe,
	o => \cntrl_state[7]~output_o\);

-- Location: IOOBUF_X85_Y73_N16
\cntrl_state[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(0),
	devoe => ww_devoe,
	o => \cntrl_state[8]~output_o\);

-- Location: IOOBUF_X83_Y73_N9
\cntrl_state[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(1),
	devoe => ww_devoe,
	o => \cntrl_state[9]~output_o\);

-- Location: IOOBUF_X115_Y47_N23
\cntrl_state[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(2),
	devoe => ww_devoe,
	o => \cntrl_state[10]~output_o\);

-- Location: IOOBUF_X115_Y44_N9
\cntrl_state[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(3),
	devoe => ww_devoe,
	o => \cntrl_state[11]~output_o\);

-- Location: IOOBUF_X115_Y43_N9
\cntrl_state[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(4),
	devoe => ww_devoe,
	o => \cntrl_state[12]~output_o\);

-- Location: IOOBUF_X115_Y47_N16
\cntrl_state[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(5),
	devoe => ww_devoe,
	o => \cntrl_state[13]~output_o\);

-- Location: IOOBUF_X115_Y44_N2
\cntrl_state[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(6),
	devoe => ww_devoe,
	o => \cntrl_state[14]~output_o\);

-- Location: IOOBUF_X115_Y48_N9
\cntrl_state[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.trigger_l\(7),
	devoe => ww_devoe,
	o => \cntrl_state[15]~output_o\);

-- Location: IOOBUF_X115_Y41_N9
\cntrl_state[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(0),
	devoe => ww_devoe,
	o => \cntrl_state[16]~output_o\);

-- Location: IOOBUF_X115_Y45_N23
\cntrl_state[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(1),
	devoe => ww_devoe,
	o => \cntrl_state[17]~output_o\);

-- Location: IOOBUF_X115_Y46_N9
\cntrl_state[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(2),
	devoe => ww_devoe,
	o => \cntrl_state[18]~output_o\);

-- Location: IOOBUF_X115_Y45_N16
\cntrl_state[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(3),
	devoe => ww_devoe,
	o => \cntrl_state[19]~output_o\);

-- Location: IOOBUF_X115_Y42_N16
\cntrl_state[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(4),
	devoe => ww_devoe,
	o => \cntrl_state[20]~output_o\);

-- Location: IOOBUF_X115_Y46_N2
\cntrl_state[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(5),
	devoe => ww_devoe,
	o => \cntrl_state[21]~output_o\);

-- Location: IOOBUF_X115_Y48_N2
\cntrl_state[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(6),
	devoe => ww_devoe,
	o => \cntrl_state[22]~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\cntrl_state[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_y\(7),
	devoe => ww_devoe,
	o => \cntrl_state[23]~output_o\);

-- Location: IOOBUF_X58_Y73_N16
\cntrl_state[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(0),
	devoe => ww_devoe,
	o => \cntrl_state[24]~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\cntrl_state[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(1),
	devoe => ww_devoe,
	o => \cntrl_state[25]~output_o\);

-- Location: IOOBUF_X58_Y73_N23
\cntrl_state[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(2),
	devoe => ww_devoe,
	o => \cntrl_state[26]~output_o\);

-- Location: IOOBUF_X54_Y73_N9
\cntrl_state[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(3),
	devoe => ww_devoe,
	o => \cntrl_state[27]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\cntrl_state[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(4),
	devoe => ww_devoe,
	o => \cntrl_state[28]~output_o\);

-- Location: IOOBUF_X54_Y73_N2
\cntrl_state[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(5),
	devoe => ww_devoe,
	o => \cntrl_state[29]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\cntrl_state[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(6),
	devoe => ww_devoe,
	o => \cntrl_state[30]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\cntrl_state[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.c_x\(7),
	devoe => ww_devoe,
	o => \cntrl_state[31]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\cntrl_state[32]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(0),
	devoe => ww_devoe,
	o => \cntrl_state[32]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\cntrl_state[33]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(1),
	devoe => ww_devoe,
	o => \cntrl_state[33]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\cntrl_state[34]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(2),
	devoe => ww_devoe,
	o => \cntrl_state[34]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\cntrl_state[35]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(3),
	devoe => ww_devoe,
	o => \cntrl_state[35]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\cntrl_state[36]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(4),
	devoe => ww_devoe,
	o => \cntrl_state[36]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\cntrl_state[37]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(5),
	devoe => ww_devoe,
	o => \cntrl_state[37]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\cntrl_state[38]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(6),
	devoe => ww_devoe,
	o => \cntrl_state[38]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\cntrl_state[39]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_y\(7),
	devoe => ww_devoe,
	o => \cntrl_state[39]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\cntrl_state[40]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(0),
	devoe => ww_devoe,
	o => \cntrl_state[40]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\cntrl_state[41]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(1),
	devoe => ww_devoe,
	o => \cntrl_state[41]~output_o\);

-- Location: IOOBUF_X81_Y73_N16
\cntrl_state[42]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(2),
	devoe => ww_devoe,
	o => \cntrl_state[42]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\cntrl_state[43]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(3),
	devoe => ww_devoe,
	o => \cntrl_state[43]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\cntrl_state[44]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(4),
	devoe => ww_devoe,
	o => \cntrl_state[44]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\cntrl_state[45]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(5),
	devoe => ww_devoe,
	o => \cntrl_state[45]~output_o\);

-- Location: IOOBUF_X79_Y73_N2
\cntrl_state[46]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(6),
	devoe => ww_devoe,
	o => \cntrl_state[46]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\cntrl_state[47]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.joy_x\(7),
	devoe => ww_devoe,
	o => \cntrl_state[47]~output_o\);

-- Location: IOOBUF_X79_Y73_N9
\cntrl_state[48]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_left~q\,
	devoe => ww_devoe,
	o => \cntrl_state[48]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\cntrl_state[49]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_right~q\,
	devoe => ww_devoe,
	o => \cntrl_state[49]~output_o\);

-- Location: IOOBUF_X81_Y73_N9
\cntrl_state[50]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_down~q\,
	devoe => ww_devoe,
	o => \cntrl_state[50]~output_o\);

-- Location: IOOBUF_X83_Y73_N16
\cntrl_state[51]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_up~q\,
	devoe => ww_devoe,
	o => \cntrl_state[51]~output_o\);

-- Location: IOOBUF_X85_Y73_N2
\cntrl_state[52]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_z~q\,
	devoe => ww_devoe,
	o => \cntrl_state[52]~output_o\);

-- Location: IOOBUF_X81_Y73_N2
\cntrl_state[53]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_r~q\,
	devoe => ww_devoe,
	o => \cntrl_state[53]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\cntrl_state[54]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_l~q\,
	devoe => ww_devoe,
	o => \cntrl_state[54]~output_o\);

-- Location: IOOBUF_X52_Y0_N23
\cntrl_state[55]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \cntrl_state[55]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\cntrl_state[56]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_a~q\,
	devoe => ww_devoe,
	o => \cntrl_state[56]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\cntrl_state[57]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_b~q\,
	devoe => ww_devoe,
	o => \cntrl_state[57]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\cntrl_state[58]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_x~q\,
	devoe => ww_devoe,
	o => \cntrl_state[58]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\cntrl_state[59]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_y~q\,
	devoe => ww_devoe,
	o => \cntrl_state[59]~output_o\);

-- Location: IOOBUF_X60_Y73_N2
\cntrl_state[60]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gc_cntrl_inst|button_reg.btn_start~q\,
	devoe => ww_devoe,
	o => \cntrl_state[60]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\cntrl_state[61]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \cntrl_state[61]~output_o\);

-- Location: IOOBUF_X0_Y34_N9
\cntrl_state[62]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \cntrl_state[62]~output_o\);

-- Location: IOOBUF_X0_Y65_N16
\cntrl_state[63]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \cntrl_state[63]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
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

-- Location: LCCOMB_X45_Y59_N12
\gc_cntrl_inst|pwe_inst|clk_cnt[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[0]~8_combout\ = \gc_cntrl_inst|pwe_inst|clk_cnt\(0) $ (VCC)
-- \gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\ = CARRY(\gc_cntrl_inst|pwe_inst|clk_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(0),
	datad => VCC,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[0]~8_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\);

-- Location: IOIBUF_X0_Y36_N22
\res_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_res_n,
	o => \res_n~input_o\);

-- Location: CLKCTRL_G3
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

-- Location: IOIBUF_X42_Y73_N8
\data~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => data,
	o => \data~input_o\);

-- Location: FF_X42_Y67_N9
\gc_cntrl_inst|pwe_inst|data_sync_inst|sync[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \data~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(1));

-- Location: FF_X42_Y59_N21
\gc_cntrl_inst|pwe_inst|data_sync_inst|sync[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2));

-- Location: FF_X42_Y59_N17
\gc_cntrl_inst|pwe_inst|data_synced_old\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	sload => VCC,
	ena => \res_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_synced_old~q\);

-- Location: LCCOMB_X42_Y59_N24
\gc_cntrl_inst|pwe_inst|Selector3~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~10_combout\ = (\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & ((\gc_cntrl_inst|pwe_inst|Equal2~1_combout\) # ((!\gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2) & \gc_cntrl_inst|pwe_inst|data_synced_old~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datab => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|data_synced_old~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\);

-- Location: LCCOMB_X39_Y48_N14
\gc_cntrl_inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~0_combout\ = \gc_cntrl_inst|refresh_counter\(0) $ (VCC)
-- \gc_cntrl_inst|Add0~1\ = CARRY(\gc_cntrl_inst|refresh_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(0),
	datad => VCC,
	combout => \gc_cntrl_inst|Add0~0_combout\,
	cout => \gc_cntrl_inst|Add0~1\);

-- Location: LCCOMB_X39_Y48_N2
\gc_cntrl_inst|refresh_counter~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~8_combout\ = (\gc_cntrl_inst|Add0~0_combout\ & !\gc_cntrl_inst|Equal0~5_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|Add0~0_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~8_combout\);

-- Location: FF_X39_Y48_N3
\gc_cntrl_inst|refresh_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~8_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(0));

-- Location: LCCOMB_X39_Y48_N16
\gc_cntrl_inst|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~2_combout\ = (\gc_cntrl_inst|refresh_counter\(1) & (!\gc_cntrl_inst|Add0~1\)) # (!\gc_cntrl_inst|refresh_counter\(1) & ((\gc_cntrl_inst|Add0~1\) # (GND)))
-- \gc_cntrl_inst|Add0~3\ = CARRY((!\gc_cntrl_inst|Add0~1\) # (!\gc_cntrl_inst|refresh_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(1),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~1\,
	combout => \gc_cntrl_inst|Add0~2_combout\,
	cout => \gc_cntrl_inst|Add0~3\);

-- Location: FF_X39_Y48_N17
\gc_cntrl_inst|refresh_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(1));

-- Location: LCCOMB_X39_Y48_N18
\gc_cntrl_inst|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~4_combout\ = (\gc_cntrl_inst|refresh_counter\(2) & (\gc_cntrl_inst|Add0~3\ $ (GND))) # (!\gc_cntrl_inst|refresh_counter\(2) & (!\gc_cntrl_inst|Add0~3\ & VCC))
-- \gc_cntrl_inst|Add0~5\ = CARRY((\gc_cntrl_inst|refresh_counter\(2) & !\gc_cntrl_inst|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(2),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~3\,
	combout => \gc_cntrl_inst|Add0~4_combout\,
	cout => \gc_cntrl_inst|Add0~5\);

-- Location: FF_X39_Y48_N19
\gc_cntrl_inst|refresh_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~4_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(2));

-- Location: LCCOMB_X39_Y48_N20
\gc_cntrl_inst|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~6_combout\ = (\gc_cntrl_inst|refresh_counter\(3) & (!\gc_cntrl_inst|Add0~5\)) # (!\gc_cntrl_inst|refresh_counter\(3) & ((\gc_cntrl_inst|Add0~5\) # (GND)))
-- \gc_cntrl_inst|Add0~7\ = CARRY((!\gc_cntrl_inst|Add0~5\) # (!\gc_cntrl_inst|refresh_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(3),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~5\,
	combout => \gc_cntrl_inst|Add0~6_combout\,
	cout => \gc_cntrl_inst|Add0~7\);

-- Location: FF_X39_Y48_N21
\gc_cntrl_inst|refresh_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~6_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(3));

-- Location: LCCOMB_X39_Y48_N22
\gc_cntrl_inst|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~8_combout\ = (\gc_cntrl_inst|refresh_counter\(4) & (\gc_cntrl_inst|Add0~7\ $ (GND))) # (!\gc_cntrl_inst|refresh_counter\(4) & (!\gc_cntrl_inst|Add0~7\ & VCC))
-- \gc_cntrl_inst|Add0~9\ = CARRY((\gc_cntrl_inst|refresh_counter\(4) & !\gc_cntrl_inst|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(4),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~7\,
	combout => \gc_cntrl_inst|Add0~8_combout\,
	cout => \gc_cntrl_inst|Add0~9\);

-- Location: FF_X39_Y48_N23
\gc_cntrl_inst|refresh_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~8_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(4));

-- Location: LCCOMB_X39_Y48_N24
\gc_cntrl_inst|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~10_combout\ = (\gc_cntrl_inst|refresh_counter\(5) & ((\gc_cntrl_inst|Add0~9\) # (GND))) # (!\gc_cntrl_inst|refresh_counter\(5) & (!\gc_cntrl_inst|Add0~9\))
-- \gc_cntrl_inst|Add0~11\ = CARRY((\gc_cntrl_inst|refresh_counter\(5)) # (!\gc_cntrl_inst|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(5),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~9\,
	combout => \gc_cntrl_inst|Add0~10_combout\,
	cout => \gc_cntrl_inst|Add0~11\);

-- Location: LCCOMB_X39_Y48_N6
\gc_cntrl_inst|refresh_counter~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~7_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|Add0~10_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~7_combout\);

-- Location: FF_X39_Y48_N7
\gc_cntrl_inst|refresh_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~7_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(5));

-- Location: LCCOMB_X39_Y48_N26
\gc_cntrl_inst|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~12_combout\ = (\gc_cntrl_inst|refresh_counter\(6) & (!\gc_cntrl_inst|Add0~11\ & VCC)) # (!\gc_cntrl_inst|refresh_counter\(6) & (\gc_cntrl_inst|Add0~11\ $ (GND)))
-- \gc_cntrl_inst|Add0~13\ = CARRY((!\gc_cntrl_inst|refresh_counter\(6) & !\gc_cntrl_inst|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(6),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~11\,
	combout => \gc_cntrl_inst|Add0~12_combout\,
	cout => \gc_cntrl_inst|Add0~13\);

-- Location: LCCOMB_X39_Y48_N4
\gc_cntrl_inst|refresh_counter~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~6_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|Add0~12_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~6_combout\);

-- Location: FF_X39_Y48_N5
\gc_cntrl_inst|refresh_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~6_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(6));

-- Location: LCCOMB_X39_Y48_N0
\gc_cntrl_inst|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~3_combout\ = (!\gc_cntrl_inst|refresh_counter\(5) & (!\gc_cntrl_inst|refresh_counter\(6) & (!\gc_cntrl_inst|refresh_counter\(4) & !\gc_cntrl_inst|refresh_counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(5),
	datab => \gc_cntrl_inst|refresh_counter\(6),
	datac => \gc_cntrl_inst|refresh_counter\(4),
	datad => \gc_cntrl_inst|refresh_counter\(3),
	combout => \gc_cntrl_inst|Equal0~3_combout\);

-- Location: LCCOMB_X39_Y48_N28
\gc_cntrl_inst|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~14_combout\ = (\gc_cntrl_inst|refresh_counter\(7) & ((\gc_cntrl_inst|Add0~13\) # (GND))) # (!\gc_cntrl_inst|refresh_counter\(7) & (!\gc_cntrl_inst|Add0~13\))
-- \gc_cntrl_inst|Add0~15\ = CARRY((\gc_cntrl_inst|refresh_counter\(7)) # (!\gc_cntrl_inst|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(7),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~13\,
	combout => \gc_cntrl_inst|Add0~14_combout\,
	cout => \gc_cntrl_inst|Add0~15\);

-- Location: LCCOMB_X39_Y48_N10
\gc_cntrl_inst|refresh_counter~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~5_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|Add0~14_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~5_combout\);

-- Location: FF_X39_Y48_N11
\gc_cntrl_inst|refresh_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(7));

-- Location: LCCOMB_X39_Y48_N30
\gc_cntrl_inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~16_combout\ = (\gc_cntrl_inst|refresh_counter\(8) & (!\gc_cntrl_inst|Add0~15\ & VCC)) # (!\gc_cntrl_inst|refresh_counter\(8) & (\gc_cntrl_inst|Add0~15\ $ (GND)))
-- \gc_cntrl_inst|Add0~17\ = CARRY((!\gc_cntrl_inst|refresh_counter\(8) & !\gc_cntrl_inst|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(8),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~15\,
	combout => \gc_cntrl_inst|Add0~16_combout\,
	cout => \gc_cntrl_inst|Add0~17\);

-- Location: LCCOMB_X39_Y48_N8
\gc_cntrl_inst|refresh_counter~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~4_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|Add0~16_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~4_combout\);

-- Location: FF_X39_Y48_N9
\gc_cntrl_inst|refresh_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~4_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(8));

-- Location: LCCOMB_X39_Y47_N0
\gc_cntrl_inst|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~18_combout\ = (\gc_cntrl_inst|refresh_counter\(9) & ((\gc_cntrl_inst|Add0~17\) # (GND))) # (!\gc_cntrl_inst|refresh_counter\(9) & (!\gc_cntrl_inst|Add0~17\))
-- \gc_cntrl_inst|Add0~19\ = CARRY((\gc_cntrl_inst|refresh_counter\(9)) # (!\gc_cntrl_inst|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(9),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~17\,
	combout => \gc_cntrl_inst|Add0~18_combout\,
	cout => \gc_cntrl_inst|Add0~19\);

-- Location: LCCOMB_X39_Y47_N20
\gc_cntrl_inst|refresh_counter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~3_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|Add0~18_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~3_combout\);

-- Location: FF_X39_Y47_N21
\gc_cntrl_inst|refresh_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(9));

-- Location: LCCOMB_X39_Y47_N2
\gc_cntrl_inst|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~20_combout\ = (\gc_cntrl_inst|refresh_counter\(10) & (\gc_cntrl_inst|Add0~19\ $ (GND))) # (!\gc_cntrl_inst|refresh_counter\(10) & (!\gc_cntrl_inst|Add0~19\ & VCC))
-- \gc_cntrl_inst|Add0~21\ = CARRY((\gc_cntrl_inst|refresh_counter\(10) & !\gc_cntrl_inst|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(10),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~19\,
	combout => \gc_cntrl_inst|Add0~20_combout\,
	cout => \gc_cntrl_inst|Add0~21\);

-- Location: FF_X39_Y47_N3
\gc_cntrl_inst|refresh_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~20_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(10));

-- Location: LCCOMB_X39_Y47_N22
\gc_cntrl_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~2_combout\ = (!\gc_cntrl_inst|refresh_counter\(8) & (!\gc_cntrl_inst|refresh_counter\(10) & (!\gc_cntrl_inst|refresh_counter\(7) & !\gc_cntrl_inst|refresh_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(8),
	datab => \gc_cntrl_inst|refresh_counter\(10),
	datac => \gc_cntrl_inst|refresh_counter\(7),
	datad => \gc_cntrl_inst|refresh_counter\(9),
	combout => \gc_cntrl_inst|Equal0~2_combout\);

-- Location: LCCOMB_X39_Y47_N4
\gc_cntrl_inst|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~22_combout\ = (\gc_cntrl_inst|refresh_counter\(11) & (!\gc_cntrl_inst|Add0~21\)) # (!\gc_cntrl_inst|refresh_counter\(11) & ((\gc_cntrl_inst|Add0~21\) # (GND)))
-- \gc_cntrl_inst|Add0~23\ = CARRY((!\gc_cntrl_inst|Add0~21\) # (!\gc_cntrl_inst|refresh_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(11),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~21\,
	combout => \gc_cntrl_inst|Add0~22_combout\,
	cout => \gc_cntrl_inst|Add0~23\);

-- Location: FF_X39_Y47_N5
\gc_cntrl_inst|refresh_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~22_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(11));

-- Location: LCCOMB_X39_Y47_N6
\gc_cntrl_inst|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~24_combout\ = (\gc_cntrl_inst|refresh_counter\(12) & (!\gc_cntrl_inst|Add0~23\ & VCC)) # (!\gc_cntrl_inst|refresh_counter\(12) & (\gc_cntrl_inst|Add0~23\ $ (GND)))
-- \gc_cntrl_inst|Add0~25\ = CARRY((!\gc_cntrl_inst|refresh_counter\(12) & !\gc_cntrl_inst|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(12),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~23\,
	combout => \gc_cntrl_inst|Add0~24_combout\,
	cout => \gc_cntrl_inst|Add0~25\);

-- Location: LCCOMB_X39_Y47_N26
\gc_cntrl_inst|refresh_counter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~2_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|Add0~24_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~2_combout\);

-- Location: FF_X39_Y47_N27
\gc_cntrl_inst|refresh_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(12));

-- Location: LCCOMB_X39_Y47_N8
\gc_cntrl_inst|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~26_combout\ = (\gc_cntrl_inst|refresh_counter\(13) & (!\gc_cntrl_inst|Add0~25\)) # (!\gc_cntrl_inst|refresh_counter\(13) & ((\gc_cntrl_inst|Add0~25\) # (GND)))
-- \gc_cntrl_inst|Add0~27\ = CARRY((!\gc_cntrl_inst|Add0~25\) # (!\gc_cntrl_inst|refresh_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(13),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~25\,
	combout => \gc_cntrl_inst|Add0~26_combout\,
	cout => \gc_cntrl_inst|Add0~27\);

-- Location: FF_X39_Y47_N9
\gc_cntrl_inst|refresh_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~26_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(13));

-- Location: LCCOMB_X39_Y47_N10
\gc_cntrl_inst|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~28_combout\ = (\gc_cntrl_inst|refresh_counter\(14) & (\gc_cntrl_inst|Add0~27\ $ (GND))) # (!\gc_cntrl_inst|refresh_counter\(14) & (!\gc_cntrl_inst|Add0~27\ & VCC))
-- \gc_cntrl_inst|Add0~29\ = CARRY((\gc_cntrl_inst|refresh_counter\(14) & !\gc_cntrl_inst|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(14),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~27\,
	combout => \gc_cntrl_inst|Add0~28_combout\,
	cout => \gc_cntrl_inst|Add0~29\);

-- Location: FF_X39_Y47_N11
\gc_cntrl_inst|refresh_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~28_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(14));

-- Location: LCCOMB_X39_Y47_N12
\gc_cntrl_inst|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~30_combout\ = (\gc_cntrl_inst|refresh_counter\(15) & ((\gc_cntrl_inst|Add0~29\) # (GND))) # (!\gc_cntrl_inst|refresh_counter\(15) & (!\gc_cntrl_inst|Add0~29\))
-- \gc_cntrl_inst|Add0~31\ = CARRY((\gc_cntrl_inst|refresh_counter\(15)) # (!\gc_cntrl_inst|Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(15),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~29\,
	combout => \gc_cntrl_inst|Add0~30_combout\,
	cout => \gc_cntrl_inst|Add0~31\);

-- Location: LCCOMB_X39_Y47_N30
\gc_cntrl_inst|refresh_counter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~1_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|Add0~30_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~1_combout\);

-- Location: FF_X39_Y47_N31
\gc_cntrl_inst|refresh_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(15));

-- Location: LCCOMB_X39_Y47_N14
\gc_cntrl_inst|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~32_combout\ = (\gc_cntrl_inst|refresh_counter\(16) & (\gc_cntrl_inst|Add0~31\ $ (GND))) # (!\gc_cntrl_inst|refresh_counter\(16) & (!\gc_cntrl_inst|Add0~31\ & VCC))
-- \gc_cntrl_inst|Add0~33\ = CARRY((\gc_cntrl_inst|refresh_counter\(16) & !\gc_cntrl_inst|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(16),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~31\,
	combout => \gc_cntrl_inst|Add0~32_combout\,
	cout => \gc_cntrl_inst|Add0~33\);

-- Location: FF_X39_Y47_N15
\gc_cntrl_inst|refresh_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~32_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(16));

-- Location: LCCOMB_X39_Y47_N16
\gc_cntrl_inst|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~34_combout\ = (\gc_cntrl_inst|refresh_counter\(17) & (!\gc_cntrl_inst|Add0~33\)) # (!\gc_cntrl_inst|refresh_counter\(17) & ((\gc_cntrl_inst|Add0~33\) # (GND)))
-- \gc_cntrl_inst|Add0~35\ = CARRY((!\gc_cntrl_inst|Add0~33\) # (!\gc_cntrl_inst|refresh_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|refresh_counter\(17),
	datad => VCC,
	cin => \gc_cntrl_inst|Add0~33\,
	combout => \gc_cntrl_inst|Add0~34_combout\,
	cout => \gc_cntrl_inst|Add0~35\);

-- Location: FF_X39_Y47_N17
\gc_cntrl_inst|refresh_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|Add0~34_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(17));

-- Location: LCCOMB_X39_Y47_N18
\gc_cntrl_inst|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Add0~36_combout\ = \gc_cntrl_inst|Add0~35\ $ (\gc_cntrl_inst|refresh_counter\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|refresh_counter\(18),
	cin => \gc_cntrl_inst|Add0~35\,
	combout => \gc_cntrl_inst|Add0~36_combout\);

-- Location: LCCOMB_X39_Y47_N28
\gc_cntrl_inst|refresh_counter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|refresh_counter~0_combout\ = (\gc_cntrl_inst|Equal0~5_combout\) # (!\gc_cntrl_inst|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|Add0~36_combout\,
	datad => \gc_cntrl_inst|Equal0~5_combout\,
	combout => \gc_cntrl_inst|refresh_counter~0_combout\);

-- Location: FF_X39_Y47_N29
\gc_cntrl_inst|refresh_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|refresh_counter~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|refresh_counter\(18));

-- Location: LCCOMB_X39_Y47_N24
\gc_cntrl_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~0_combout\ = (!\gc_cntrl_inst|refresh_counter\(15) & (!\gc_cntrl_inst|refresh_counter\(18) & (!\gc_cntrl_inst|refresh_counter\(16) & !\gc_cntrl_inst|refresh_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(15),
	datab => \gc_cntrl_inst|refresh_counter\(18),
	datac => \gc_cntrl_inst|refresh_counter\(16),
	datad => \gc_cntrl_inst|refresh_counter\(17),
	combout => \gc_cntrl_inst|Equal0~0_combout\);

-- Location: LCCOMB_X38_Y47_N24
\gc_cntrl_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~1_combout\ = (!\gc_cntrl_inst|refresh_counter\(12) & (!\gc_cntrl_inst|refresh_counter\(14) & (!\gc_cntrl_inst|refresh_counter\(13) & !\gc_cntrl_inst|refresh_counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(12),
	datab => \gc_cntrl_inst|refresh_counter\(14),
	datac => \gc_cntrl_inst|refresh_counter\(13),
	datad => \gc_cntrl_inst|refresh_counter\(11),
	combout => \gc_cntrl_inst|Equal0~1_combout\);

-- Location: LCCOMB_X38_Y47_N2
\gc_cntrl_inst|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~4_combout\ = (\gc_cntrl_inst|Equal0~3_combout\ & (\gc_cntrl_inst|Equal0~2_combout\ & (\gc_cntrl_inst|Equal0~0_combout\ & \gc_cntrl_inst|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|Equal0~3_combout\,
	datab => \gc_cntrl_inst|Equal0~2_combout\,
	datac => \gc_cntrl_inst|Equal0~0_combout\,
	datad => \gc_cntrl_inst|Equal0~1_combout\,
	combout => \gc_cntrl_inst|Equal0~4_combout\);

-- Location: LCCOMB_X39_Y48_N12
\gc_cntrl_inst|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|Equal0~5_combout\ = (!\gc_cntrl_inst|refresh_counter\(0) & (!\gc_cntrl_inst|refresh_counter\(2) & (\gc_cntrl_inst|Equal0~4_combout\ & !\gc_cntrl_inst|refresh_counter\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|refresh_counter\(0),
	datab => \gc_cntrl_inst|refresh_counter\(2),
	datac => \gc_cntrl_inst|Equal0~4_combout\,
	datad => \gc_cntrl_inst|refresh_counter\(1),
	combout => \gc_cntrl_inst|Equal0~5_combout\);

-- Location: FF_X42_Y59_N31
\gc_cntrl_inst|do_send\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|Equal0~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|do_send~q\);

-- Location: LCCOMB_X42_Y59_N20
\gc_cntrl_inst|pwe_inst|sync~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|sync~0_combout\ = (!\gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2) & \gc_cntrl_inst|pwe_inst|data_synced_old~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	datad => \gc_cntrl_inst|pwe_inst|data_synced_old~q\,
	combout => \gc_cntrl_inst|pwe_inst|sync~0_combout\);

-- Location: LCCOMB_X42_Y59_N28
\gc_cntrl_inst|pwe_inst|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector4~0_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\ & ((\gc_cntrl_inst|pwe_inst|Selector6~2_combout\ & (\gc_cntrl_inst|pwe_inst|Selector6~0_combout\)) # (!\gc_cntrl_inst|pwe_inst|Selector6~2_combout\ & 
-- ((\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector6~2_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector4~0_combout\);

-- Location: FF_X42_Y59_N29
\gc_cntrl_inst|pwe_inst|state.SEND_HIGH\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector4~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\);

-- Location: LCCOMB_X42_Y60_N8
\gc_cntrl_inst|pwe_inst|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~1_combout\ = \gc_cntrl_inst|pwe_inst|data_cnt\(0) $ (VCC)
-- \gc_cntrl_inst|pwe_inst|Add0~2\ = CARRY(\gc_cntrl_inst|pwe_inst|data_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(0),
	datad => VCC,
	combout => \gc_cntrl_inst|pwe_inst|Add0~1_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~2\);

-- Location: LCCOMB_X42_Y60_N6
\gc_cntrl_inst|pwe_inst|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~17_combout\ = (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & (\gc_cntrl_inst|pwe_inst|Add0~1_combout\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datac => \gc_cntrl_inst|pwe_inst|Add0~1_combout\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~17_combout\);

-- Location: LCCOMB_X42_Y60_N10
\gc_cntrl_inst|pwe_inst|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~3_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(1) & (!\gc_cntrl_inst|pwe_inst|Add0~2\)) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(1) & ((\gc_cntrl_inst|pwe_inst|Add0~2\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|Add0~4\ = CARRY((!\gc_cntrl_inst|pwe_inst|Add0~2\) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(1),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|Add0~2\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~3_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~4\);

-- Location: LCCOMB_X42_Y60_N12
\gc_cntrl_inst|pwe_inst|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~5_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(2) & (\gc_cntrl_inst|pwe_inst|Add0~4\ $ (GND))) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(2) & (!\gc_cntrl_inst|pwe_inst|Add0~4\ & VCC))
-- \gc_cntrl_inst|pwe_inst|Add0~6\ = CARRY((\gc_cntrl_inst|pwe_inst|data_cnt\(2) & !\gc_cntrl_inst|pwe_inst|Add0~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(2),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|Add0~4\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~5_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~6\);

-- Location: LCCOMB_X42_Y60_N24
\gc_cntrl_inst|pwe_inst|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~18_combout\ = (\gc_cntrl_inst|pwe_inst|Add0~5_combout\ & (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Add0~5_combout\,
	datab => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~18_combout\);

-- Location: FF_X42_Y60_N25
\gc_cntrl_inst|pwe_inst|data_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Add0~18_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(2));

-- Location: LCCOMB_X42_Y60_N14
\gc_cntrl_inst|pwe_inst|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~7_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(3) & (!\gc_cntrl_inst|pwe_inst|Add0~6\)) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(3) & ((\gc_cntrl_inst|pwe_inst|Add0~6\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|Add0~8\ = CARRY((!\gc_cntrl_inst|pwe_inst|Add0~6\) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(3),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|Add0~6\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~7_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~8\);

-- Location: LCCOMB_X42_Y60_N4
\gc_cntrl_inst|pwe_inst|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~15_combout\ = (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & (\gc_cntrl_inst|pwe_inst|Add0~7_combout\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datac => \gc_cntrl_inst|pwe_inst|Add0~7_combout\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~15_combout\);

-- Location: FF_X42_Y60_N5
\gc_cntrl_inst|pwe_inst|data_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Add0~15_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(3));

-- Location: LCCOMB_X42_Y60_N16
\gc_cntrl_inst|pwe_inst|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~9_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(4) & (\gc_cntrl_inst|pwe_inst|Add0~8\ $ (GND))) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(4) & (!\gc_cntrl_inst|pwe_inst|Add0~8\ & VCC))
-- \gc_cntrl_inst|pwe_inst|Add0~10\ = CARRY((\gc_cntrl_inst|pwe_inst|data_cnt\(4) & !\gc_cntrl_inst|pwe_inst|Add0~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(4),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|Add0~8\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~9_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~10\);

-- Location: LCCOMB_X42_Y60_N30
\gc_cntrl_inst|pwe_inst|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~16_combout\ = (\gc_cntrl_inst|pwe_inst|Add0~9_combout\ & (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datab => \gc_cntrl_inst|pwe_inst|Add0~9_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~16_combout\);

-- Location: FF_X42_Y60_N31
\gc_cntrl_inst|pwe_inst|data_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Add0~16_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(4));

-- Location: LCCOMB_X42_Y60_N18
\gc_cntrl_inst|pwe_inst|Add0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~11_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(5) & (!\gc_cntrl_inst|pwe_inst|Add0~10\)) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(5) & ((\gc_cntrl_inst|pwe_inst|Add0~10\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|Add0~12\ = CARRY((!\gc_cntrl_inst|pwe_inst|Add0~10\) # (!\gc_cntrl_inst|pwe_inst|data_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(5),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|Add0~10\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~11_combout\,
	cout => \gc_cntrl_inst|pwe_inst|Add0~12\);

-- Location: LCCOMB_X43_Y60_N22
\gc_cntrl_inst|pwe_inst|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~0_combout\ = (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~0_combout\);

-- Location: LCCOMB_X42_Y60_N2
\gc_cntrl_inst|pwe_inst|data_cnt[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|data_cnt[5]~5_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ & (\gc_cntrl_inst|pwe_inst|Add0~11_combout\ & ((\gc_cntrl_inst|pwe_inst|Add0~0_combout\)))) # (!\gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ & 
-- (((\gc_cntrl_inst|pwe_inst|data_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Add0~11_combout\,
	datab => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(5),
	datad => \gc_cntrl_inst|pwe_inst|Add0~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|data_cnt[5]~5_combout\);

-- Location: FF_X42_Y60_N3
\gc_cntrl_inst|pwe_inst|data_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|data_cnt[5]~5_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(5));

-- Location: LCCOMB_X42_Y60_N20
\gc_cntrl_inst|pwe_inst|Add0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~13_combout\ = \gc_cntrl_inst|pwe_inst|Add0~12\ $ (!\gc_cntrl_inst|pwe_inst|data_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|data_cnt\(6),
	cin => \gc_cntrl_inst|pwe_inst|Add0~12\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~13_combout\);

-- Location: LCCOMB_X42_Y60_N0
\gc_cntrl_inst|pwe_inst|data_cnt[6]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|data_cnt[6]~4_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ & (\gc_cntrl_inst|pwe_inst|Add0~13_combout\ & ((\gc_cntrl_inst|pwe_inst|Add0~0_combout\)))) # (!\gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ & 
-- (((\gc_cntrl_inst|pwe_inst|data_cnt\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Add0~13_combout\,
	datab => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(6),
	datad => \gc_cntrl_inst|pwe_inst|Add0~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|data_cnt[6]~4_combout\);

-- Location: FF_X42_Y60_N1
\gc_cntrl_inst|pwe_inst|data_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|data_cnt[6]~4_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(6));

-- Location: LCCOMB_X42_Y60_N22
\gc_cntrl_inst|pwe_inst|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|LessThan1~0_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(1)) # ((\gc_cntrl_inst|pwe_inst|data_cnt\(2)) # ((\gc_cntrl_inst|pwe_inst|data_cnt\(4)) # (\gc_cntrl_inst|pwe_inst|data_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(1),
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(2),
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(4),
	datad => \gc_cntrl_inst|pwe_inst|data_cnt\(5),
	combout => \gc_cntrl_inst|pwe_inst|LessThan1~0_combout\);

-- Location: LCCOMB_X43_Y60_N24
\gc_cntrl_inst|pwe_inst|data_cnt[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|data_cnt[0]~2_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(6) & (\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & ((\gc_cntrl_inst|pwe_inst|data_cnt\(3)) # (\gc_cntrl_inst|pwe_inst|LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(6),
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(3),
	datac => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan1~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|data_cnt[0]~2_combout\);

-- Location: LCCOMB_X42_Y59_N18
\gc_cntrl_inst|pwe_inst|data_cnt[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|data_cnt[0]~6_combout\ = (\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & (((!\gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2) & \gc_cntrl_inst|pwe_inst|data_synced_old~q\)) # (!\gc_cntrl_inst|pwe_inst|Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datab => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|data_synced_old~q\,
	combout => \gc_cntrl_inst|pwe_inst|data_cnt[0]~6_combout\);

-- Location: LCCOMB_X43_Y60_N0
\gc_cntrl_inst|pwe_inst|WideOr2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|WideOr2~0_combout\ = (!\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & !\gc_cntrl_inst|pwe_inst|state.SEND~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	combout => \gc_cntrl_inst|pwe_inst|WideOr2~0_combout\);

-- Location: LCCOMB_X43_Y60_N18
\gc_cntrl_inst|pwe_inst|data_cnt[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\ = (!\gc_cntrl_inst|pwe_inst|data_cnt[0]~2_combout\ & (!\gc_cntrl_inst|pwe_inst|data_cnt[0]~6_combout\ & ((\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\) # (!\gc_cntrl_inst|pwe_inst|WideOr2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datab => \gc_cntrl_inst|pwe_inst|data_cnt[0]~2_combout\,
	datac => \gc_cntrl_inst|pwe_inst|data_cnt[0]~6_combout\,
	datad => \gc_cntrl_inst|pwe_inst|WideOr2~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\);

-- Location: FF_X42_Y60_N7
\gc_cntrl_inst|pwe_inst|data_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Add0~17_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(0));

-- Location: LCCOMB_X42_Y60_N26
\gc_cntrl_inst|pwe_inst|Add0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Add0~19_combout\ = (!\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & (\gc_cntrl_inst|pwe_inst|Add0~3_combout\ & ((!\gc_cntrl_inst|pwe_inst|LessThan0~2_combout\) # (!\gc_cntrl_inst|pwe_inst|state.SEND~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datac => \gc_cntrl_inst|pwe_inst|Add0~3_combout\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Add0~19_combout\);

-- Location: FF_X42_Y60_N27
\gc_cntrl_inst|pwe_inst|data_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Add0~19_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|data_cnt[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|data_cnt\(1));

-- Location: LCCOMB_X42_Y60_N28
\gc_cntrl_inst|pwe_inst|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|LessThan0~1_combout\ = (\gc_cntrl_inst|pwe_inst|data_cnt\(4) & ((\gc_cntrl_inst|pwe_inst|data_cnt\(1)) # ((\gc_cntrl_inst|pwe_inst|data_cnt\(2)) # (\gc_cntrl_inst|pwe_inst|data_cnt\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|data_cnt\(1),
	datab => \gc_cntrl_inst|pwe_inst|data_cnt\(2),
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(4),
	datad => \gc_cntrl_inst|pwe_inst|data_cnt\(0),
	combout => \gc_cntrl_inst|pwe_inst|LessThan0~1_combout\);

-- Location: LCCOMB_X42_Y59_N2
\gc_cntrl_inst|pwe_inst|send_data_len_reg[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|send_data_len_reg[0]~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_len_reg\(0)) # ((\gc_cntrl_inst|do_send~q\ & (!\gc_cntrl_inst|pwe_inst|sync~0_combout\ & !\gc_cntrl_inst|pwe_inst|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|do_send~q\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|send_data_len_reg\(0),
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|send_data_len_reg[0]~0_combout\);

-- Location: FF_X42_Y59_N3
\gc_cntrl_inst|pwe_inst|send_data_len_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|send_data_len_reg[0]~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_len_reg\(0));

-- Location: LCCOMB_X43_Y60_N20
\gc_cntrl_inst|pwe_inst|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|LessThan0~0_combout\ = ((\gc_cntrl_inst|pwe_inst|data_cnt\(6)) # (\gc_cntrl_inst|pwe_inst|data_cnt\(5))) # (!\gc_cntrl_inst|pwe_inst|send_data_len_reg\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|send_data_len_reg\(0),
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(6),
	datad => \gc_cntrl_inst|pwe_inst|data_cnt\(5),
	combout => \gc_cntrl_inst|pwe_inst|LessThan0~0_combout\);

-- Location: LCCOMB_X43_Y60_N6
\gc_cntrl_inst|pwe_inst|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\ = (\gc_cntrl_inst|pwe_inst|LessThan0~0_combout\) # ((\gc_cntrl_inst|pwe_inst|LessThan0~1_combout\ & \gc_cntrl_inst|pwe_inst|data_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|LessThan0~1_combout\,
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(3),
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\);

-- Location: LCCOMB_X43_Y60_N8
\gc_cntrl_inst|pwe_inst|Selector1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector1~2_combout\ = (!\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & (\gc_cntrl_inst|pwe_inst|state.SEND~q\ & (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\ & \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datac => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector1~2_combout\);

-- Location: LCCOMB_X43_Y59_N28
\gc_cntrl_inst|pwe_inst|Selector3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~4_combout\ = (!\gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\ & \gc_cntrl_inst|pwe_inst|state.IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~4_combout\);

-- Location: LCCOMB_X45_Y59_N22
\gc_cntrl_inst|pwe_inst|clk_cnt[5]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[5]~22_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(5) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\)) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(5) & ((\gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\ = CARRY((!\gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(5),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[5]~22_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\);

-- Location: LCCOMB_X45_Y59_N24
\gc_cntrl_inst|pwe_inst|clk_cnt[6]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[6]~24_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & (\gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\ $ (GND))) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\ & VCC))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[6]~25\ = CARRY((\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & !\gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(6),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[5]~23\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[6]~24_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[6]~25\);

-- Location: LCCOMB_X43_Y60_N10
\gc_cntrl_inst|pwe_inst|WideOr3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|WideOr3~combout\ = (!\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & (\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & !\gc_cntrl_inst|pwe_inst|state.SEND~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	combout => \gc_cntrl_inst|pwe_inst|WideOr3~combout\);

-- Location: FF_X45_Y59_N25
\gc_cntrl_inst|pwe_inst|clk_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[6]~24_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(6));

-- Location: LCCOMB_X45_Y59_N26
\gc_cntrl_inst|pwe_inst|clk_cnt[7]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[7]~26_combout\ = \gc_cntrl_inst|pwe_inst|clk_cnt\(7) $ (\gc_cntrl_inst|pwe_inst|clk_cnt[6]~25\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(7),
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[6]~25\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~26_combout\);

-- Location: FF_X45_Y59_N27
\gc_cntrl_inst|pwe_inst|clk_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~26_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(7));

-- Location: LCCOMB_X45_Y59_N30
\gc_cntrl_inst|pwe_inst|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal0~1_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(5) & !\gc_cntrl_inst|pwe_inst|clk_cnt\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(5),
	datac => \gc_cntrl_inst|pwe_inst|clk_cnt\(7),
	combout => \gc_cntrl_inst|pwe_inst|Equal0~1_combout\);

-- Location: LCCOMB_X45_Y59_N8
\gc_cntrl_inst|pwe_inst|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal0~0_combout\ = (!\gc_cntrl_inst|pwe_inst|clk_cnt\(0) & (\gc_cntrl_inst|pwe_inst|clk_cnt\(4) & (\gc_cntrl_inst|pwe_inst|clk_cnt\(1) & !\gc_cntrl_inst|pwe_inst|clk_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(0),
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(4),
	datac => \gc_cntrl_inst|pwe_inst|clk_cnt\(1),
	datad => \gc_cntrl_inst|pwe_inst|clk_cnt\(3),
	combout => \gc_cntrl_inst|pwe_inst|Equal0~0_combout\);

-- Location: LCCOMB_X45_Y59_N28
\gc_cntrl_inst|pwe_inst|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal0~2_combout\ = (\gc_cntrl_inst|pwe_inst|Equal0~1_combout\ & (!\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & (\gc_cntrl_inst|pwe_inst|Equal0~0_combout\ & !\gc_cntrl_inst|pwe_inst|clk_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Equal0~1_combout\,
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(6),
	datac => \gc_cntrl_inst|pwe_inst|Equal0~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|clk_cnt\(2),
	combout => \gc_cntrl_inst|pwe_inst|Equal0~2_combout\);

-- Location: IOIBUF_X58_Y0_N8
\rumble~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rumble,
	o => \rumble~input_o\);

-- Location: LCCOMB_X43_Y60_N14
\gc_cntrl_inst|pwe_inst|send_data_reg[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|send_data_reg[0]~3_combout\ = !\gc_cntrl_inst|pwe_inst|state.IDLE~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|send_data_reg[0]~3_combout\);

-- Location: LCCOMB_X42_Y59_N0
\gc_cntrl_inst|pwe_inst|send_data_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|send_data_reg~2_combout\ = (\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & (((\gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\)))) # (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & (\gc_cntrl_inst|do_send~q\ & 
-- (!\gc_cntrl_inst|pwe_inst|sync~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|do_send~q\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|send_data_reg~2_combout\);

-- Location: FF_X43_Y60_N15
\gc_cntrl_inst|pwe_inst|send_data_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|send_data_reg[0]~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(0));

-- Location: LCCOMB_X43_Y60_N4
\gc_cntrl_inst|pwe_inst|Selector31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector31~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & ((\gc_cntrl_inst|pwe_inst|send_data_reg\(0)))) # (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & (\rumble~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rumble~input_o\,
	datab => \gc_cntrl_inst|pwe_inst|send_data_reg\(0),
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector31~0_combout\);

-- Location: FF_X43_Y60_N5
\gc_cntrl_inst|pwe_inst|send_data_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector31~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(1));

-- Location: LCCOMB_X46_Y59_N28
\gc_cntrl_inst|pwe_inst|Selector30~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector30~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(1),
	combout => \gc_cntrl_inst|pwe_inst|Selector30~0_combout\);

-- Location: LCCOMB_X43_Y59_N6
\gc_cntrl_inst|pwe_inst|send_data_reg[11]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\) # ((!\gc_cntrl_inst|pwe_inst|sync~0_combout\ & (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & \gc_cntrl_inst|do_send~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	datad => \gc_cntrl_inst|do_send~q\,
	combout => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\);

-- Location: FF_X46_Y59_N29
\gc_cntrl_inst|pwe_inst|send_data_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector30~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(2));

-- Location: LCCOMB_X46_Y59_N10
\gc_cntrl_inst|pwe_inst|Selector29~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector29~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(2),
	combout => \gc_cntrl_inst|pwe_inst|Selector29~0_combout\);

-- Location: FF_X46_Y59_N11
\gc_cntrl_inst|pwe_inst|send_data_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector29~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(3));

-- Location: LCCOMB_X46_Y59_N24
\gc_cntrl_inst|pwe_inst|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector28~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(3),
	combout => \gc_cntrl_inst|pwe_inst|Selector28~0_combout\);

-- Location: FF_X46_Y59_N25
\gc_cntrl_inst|pwe_inst|send_data_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector28~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(4));

-- Location: LCCOMB_X46_Y59_N6
\gc_cntrl_inst|pwe_inst|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector27~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(4),
	combout => \gc_cntrl_inst|pwe_inst|Selector27~0_combout\);

-- Location: FF_X46_Y59_N7
\gc_cntrl_inst|pwe_inst|send_data_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector27~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(5));

-- Location: LCCOMB_X46_Y59_N12
\gc_cntrl_inst|pwe_inst|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector26~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(5),
	combout => \gc_cntrl_inst|pwe_inst|Selector26~0_combout\);

-- Location: FF_X46_Y59_N13
\gc_cntrl_inst|pwe_inst|send_data_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector26~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(6));

-- Location: LCCOMB_X46_Y59_N2
\gc_cntrl_inst|pwe_inst|Selector25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector25~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(6),
	combout => \gc_cntrl_inst|pwe_inst|Selector25~0_combout\);

-- Location: FF_X46_Y59_N3
\gc_cntrl_inst|pwe_inst|send_data_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector25~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(7));

-- Location: LCCOMB_X47_Y59_N30
\gc_cntrl_inst|pwe_inst|Selector24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector24~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(7),
	combout => \gc_cntrl_inst|pwe_inst|Selector24~0_combout\);

-- Location: FF_X47_Y59_N31
\gc_cntrl_inst|pwe_inst|send_data_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector24~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(8));

-- Location: LCCOMB_X47_Y59_N28
\gc_cntrl_inst|pwe_inst|Selector23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector23~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(8)) # (!\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(8),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector23~0_combout\);

-- Location: FF_X47_Y59_N29
\gc_cntrl_inst|pwe_inst|send_data_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector23~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(9));

-- Location: LCCOMB_X47_Y59_N2
\gc_cntrl_inst|pwe_inst|Selector22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector22~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(9)) # (!\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(9),
	combout => \gc_cntrl_inst|pwe_inst|Selector22~0_combout\);

-- Location: FF_X47_Y59_N3
\gc_cntrl_inst|pwe_inst|send_data_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector22~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(10));

-- Location: LCCOMB_X47_Y59_N16
\gc_cntrl_inst|pwe_inst|Selector21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector21~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(10),
	combout => \gc_cntrl_inst|pwe_inst|Selector21~0_combout\);

-- Location: FF_X47_Y59_N17
\gc_cntrl_inst|pwe_inst|send_data_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector21~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(11));

-- Location: LCCOMB_X47_Y59_N14
\gc_cntrl_inst|pwe_inst|Selector20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector20~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(11),
	combout => \gc_cntrl_inst|pwe_inst|Selector20~0_combout\);

-- Location: FF_X47_Y59_N15
\gc_cntrl_inst|pwe_inst|send_data_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector20~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(12));

-- Location: LCCOMB_X47_Y59_N4
\gc_cntrl_inst|pwe_inst|Selector19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector19~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(12) & \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(12),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector19~0_combout\);

-- Location: FF_X47_Y59_N5
\gc_cntrl_inst|pwe_inst|send_data_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector19~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(13));

-- Location: LCCOMB_X47_Y59_N26
\gc_cntrl_inst|pwe_inst|Selector18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector18~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(13) & \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(13),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector18~0_combout\);

-- Location: FF_X47_Y59_N27
\gc_cntrl_inst|pwe_inst|send_data_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector18~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(14));

-- Location: LCCOMB_X47_Y59_N0
\gc_cntrl_inst|pwe_inst|Selector17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector17~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(14) & \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(14),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector17~0_combout\);

-- Location: FF_X47_Y59_N1
\gc_cntrl_inst|pwe_inst|send_data_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector17~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(15));

-- Location: LCCOMB_X47_Y59_N6
\gc_cntrl_inst|pwe_inst|Selector16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector16~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(15),
	combout => \gc_cntrl_inst|pwe_inst|Selector16~0_combout\);

-- Location: FF_X47_Y59_N7
\gc_cntrl_inst|pwe_inst|send_data_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector16~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(16));

-- Location: LCCOMB_X47_Y59_N12
\gc_cntrl_inst|pwe_inst|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector15~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(16),
	combout => \gc_cntrl_inst|pwe_inst|Selector15~0_combout\);

-- Location: FF_X47_Y59_N13
\gc_cntrl_inst|pwe_inst|send_data_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector15~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(17));

-- Location: LCCOMB_X47_Y59_N10
\gc_cntrl_inst|pwe_inst|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector14~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(17),
	combout => \gc_cntrl_inst|pwe_inst|Selector14~0_combout\);

-- Location: FF_X47_Y59_N11
\gc_cntrl_inst|pwe_inst|send_data_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector14~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(18));

-- Location: LCCOMB_X47_Y59_N8
\gc_cntrl_inst|pwe_inst|Selector13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector13~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(18),
	combout => \gc_cntrl_inst|pwe_inst|Selector13~0_combout\);

-- Location: FF_X47_Y59_N9
\gc_cntrl_inst|pwe_inst|send_data_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector13~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(19));

-- Location: LCCOMB_X47_Y59_N22
\gc_cntrl_inst|pwe_inst|Selector12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector12~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(19) & \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(19),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector12~0_combout\);

-- Location: FF_X47_Y59_N23
\gc_cntrl_inst|pwe_inst|send_data_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector12~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(20));

-- Location: LCCOMB_X47_Y59_N20
\gc_cntrl_inst|pwe_inst|Selector11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector11~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(20) & \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(20),
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector11~0_combout\);

-- Location: FF_X47_Y59_N21
\gc_cntrl_inst|pwe_inst|send_data_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector11~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(21));

-- Location: LCCOMB_X47_Y59_N18
\gc_cntrl_inst|pwe_inst|Selector10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector10~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(21),
	combout => \gc_cntrl_inst|pwe_inst|Selector10~0_combout\);

-- Location: FF_X47_Y59_N19
\gc_cntrl_inst|pwe_inst|send_data_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector10~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(22));

-- Location: LCCOMB_X47_Y59_N24
\gc_cntrl_inst|pwe_inst|Selector9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector9~0_combout\ = (\gc_cntrl_inst|pwe_inst|send_data_reg\(22)) # (!\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(22),
	combout => \gc_cntrl_inst|pwe_inst|Selector9~0_combout\);

-- Location: FF_X47_Y59_N25
\gc_cntrl_inst|pwe_inst|send_data_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector9~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(23));

-- Location: LCCOMB_X46_Y59_N8
\gc_cntrl_inst|pwe_inst|Selector8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector8~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & \gc_cntrl_inst|pwe_inst|send_data_reg\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(23),
	combout => \gc_cntrl_inst|pwe_inst|Selector8~0_combout\);

-- Location: FF_X46_Y59_N9
\gc_cntrl_inst|pwe_inst|send_data_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector8~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|send_data_reg[11]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|send_data_reg\(24));

-- Location: LCCOMB_X42_Y59_N26
\gc_cntrl_inst|pwe_inst|send_data_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & ((\gc_cntrl_inst|pwe_inst|send_data_reg\(24) & (\gc_cntrl_inst|pwe_inst|Equal2~1_combout\)) # (!\gc_cntrl_inst|pwe_inst|send_data_reg\(24) & 
-- ((\gc_cntrl_inst|pwe_inst|Equal0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datac => \gc_cntrl_inst|pwe_inst|Equal0~2_combout\,
	datad => \gc_cntrl_inst|pwe_inst|send_data_reg\(24),
	combout => \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\);

-- Location: LCCOMB_X45_Y59_N0
\gc_cntrl_inst|pwe_inst|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal1~0_combout\ = (!\gc_cntrl_inst|pwe_inst|clk_cnt\(4) & (\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & (!\gc_cntrl_inst|pwe_inst|clk_cnt\(1) & \gc_cntrl_inst|pwe_inst|clk_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(4),
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(6),
	datac => \gc_cntrl_inst|pwe_inst|clk_cnt\(1),
	datad => \gc_cntrl_inst|pwe_inst|clk_cnt\(2),
	combout => \gc_cntrl_inst|pwe_inst|Equal1~0_combout\);

-- Location: LCCOMB_X45_Y59_N2
\gc_cntrl_inst|pwe_inst|Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal1~1_combout\ = (!\gc_cntrl_inst|pwe_inst|clk_cnt\(0) & (!\gc_cntrl_inst|pwe_inst|clk_cnt\(3) & (\gc_cntrl_inst|pwe_inst|Equal0~1_combout\ & \gc_cntrl_inst|pwe_inst|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(0),
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(3),
	datac => \gc_cntrl_inst|pwe_inst|Equal0~1_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Equal1~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Equal1~1_combout\);

-- Location: LCCOMB_X43_Y59_N30
\gc_cntrl_inst|pwe_inst|Selector3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~5_combout\ = (\gc_cntrl_inst|pwe_inst|Selector3~4_combout\ & ((\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\ & ((\gc_cntrl_inst|pwe_inst|Equal1~1_combout\))) # (!\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\ & 
-- (\gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~4_combout\,
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Equal1~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~5_combout\);

-- Location: LCCOMB_X42_Y59_N16
\gc_cntrl_inst|pwe_inst|Selector3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~3_combout\ = (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & ((\gc_cntrl_inst|do_send~q\) # ((!\gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2) & \gc_cntrl_inst|pwe_inst|data_synced_old~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|do_send~q\,
	datab => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	datac => \gc_cntrl_inst|pwe_inst|data_synced_old~q\,
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~3_combout\);

-- Location: LCCOMB_X43_Y59_N8
\gc_cntrl_inst|pwe_inst|Selector3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~2_combout\ = (\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & ((\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\) # ((\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\) # (\gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~2_combout\);

-- Location: LCCOMB_X43_Y59_N18
\gc_cntrl_inst|pwe_inst|Selector1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector1~0_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector3~3_combout\ & (\gc_cntrl_inst|pwe_inst|WideOr2~0_combout\ & ((!\gc_cntrl_inst|pwe_inst|Selector6~0_combout\) # (!\gc_cntrl_inst|pwe_inst|Selector3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector3~3_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~2_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|WideOr2~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector1~0_combout\);

-- Location: LCCOMB_X43_Y60_N26
\gc_cntrl_inst|pwe_inst|Selector1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector1~1_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector3~5_combout\ & (\gc_cntrl_inst|pwe_inst|Selector1~0_combout\ & (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & !\gc_cntrl_inst|pwe_inst|Selector3~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector3~5_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector1~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	datad => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector1~1_combout\);

-- Location: LCCOMB_X43_Y59_N22
\gc_cntrl_inst|pwe_inst|Selector1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector1~3_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector1~2_combout\ & (!\gc_cntrl_inst|pwe_inst|Selector1~1_combout\ & ((\gc_cntrl_inst|pwe_inst|sync~0_combout\) # (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector1~2_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Selector1~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector1~3_combout\);

-- Location: FF_X43_Y59_N23
\gc_cntrl_inst|pwe_inst|state.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector1~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.IDLE~q\);

-- Location: LCCOMB_X42_Y59_N10
\gc_cntrl_inst|pwe_inst|Selector6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector6~1_combout\ = (!\gc_cntrl_inst|pwe_inst|state.IDLE~q\ & ((\gc_cntrl_inst|pwe_inst|sync~0_combout\) # ((\gc_cntrl_inst|do_send~q\ & !\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|do_send~q\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector6~1_combout\);

-- Location: LCCOMB_X43_Y59_N14
\gc_cntrl_inst|pwe_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector2~0_combout\ = (!\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & (!\gc_cntrl_inst|pwe_inst|state.SEND~q\ & ((!\gc_cntrl_inst|pwe_inst|Equal1~1_combout\) # (!\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\,
	datab => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datad => \gc_cntrl_inst|pwe_inst|Equal1~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector2~0_combout\);

-- Location: LCCOMB_X42_Y59_N8
\gc_cntrl_inst|pwe_inst|Selector6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector6~2_combout\ = (\gc_cntrl_inst|pwe_inst|Selector6~1_combout\) # (((\gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\) # (\gc_cntrl_inst|pwe_inst|Selector6~0_combout\)) # (!\gc_cntrl_inst|pwe_inst|Selector2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector6~1_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector2~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector6~2_combout\);

-- Location: LCCOMB_X42_Y59_N6
\gc_cntrl_inst|pwe_inst|Selector5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector5~0_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\ & ((\gc_cntrl_inst|pwe_inst|state.IDLE~q\) # (!\gc_cntrl_inst|pwe_inst|Selector6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector6~2_combout\,
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector5~0_combout\);

-- Location: LCCOMB_X42_Y59_N22
\gc_cntrl_inst|pwe_inst|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector2~1_combout\ = (\gc_cntrl_inst|pwe_inst|Selector3~10_combout\) # (!\gc_cntrl_inst|pwe_inst|Selector6~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector6~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector2~1_combout\);

-- Location: LCCOMB_X42_Y59_N14
\gc_cntrl_inst|pwe_inst|Selector5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector5~1_combout\ = (\gc_cntrl_inst|pwe_inst|Selector5~0_combout\ & (((\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\ & \gc_cntrl_inst|pwe_inst|Selector2~1_combout\)))) # (!\gc_cntrl_inst|pwe_inst|Selector5~0_combout\ & 
-- (\gc_cntrl_inst|pwe_inst|sync~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector5~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\,
	datad => \gc_cntrl_inst|pwe_inst|Selector2~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector5~1_combout\);

-- Location: FF_X42_Y59_N15
\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector5~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\);

-- Location: LCCOMB_X43_Y59_N26
\gc_cntrl_inst|pwe_inst|Selector6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector6~3_combout\ = (\gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\ & (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\ & (\gc_cntrl_inst|pwe_inst|Selector6~2_combout\ & \gc_cntrl_inst|pwe_inst|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_SAMPLE~q\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector6~2_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Equal1~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector6~3_combout\);

-- Location: FF_X43_Y59_N27
\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector6~3_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\);

-- Location: LCCOMB_X43_Y59_N12
\gc_cntrl_inst|pwe_inst|Selector7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector7~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\) # ((!\gc_cntrl_inst|pwe_inst|Equal2~1_combout\ & (\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & !\gc_cntrl_inst|pwe_inst|sync~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datab => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector7~0_combout\);

-- Location: FF_X43_Y59_N13
\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector7~0_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\);

-- Location: LCCOMB_X45_Y59_N6
\gc_cntrl_inst|pwe_inst|clk_cnt[7]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[7]~12_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & (\gc_cntrl_inst|pwe_inst|Equal0~2_combout\)) # (!\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & ((\gc_cntrl_inst|pwe_inst|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|Equal0~2_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	datad => \gc_cntrl_inst|pwe_inst|Equal1~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~12_combout\);

-- Location: LCCOMB_X42_Y59_N30
\gc_cntrl_inst|pwe_inst|clk_cnt[7]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & (\gc_cntrl_inst|pwe_inst|send_data_reg\(24))) # (!\gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\ & ((\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|send_data_reg\(24),
	datab => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_HIGH~q\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\);

-- Location: LCCOMB_X43_Y59_N0
\gc_cntrl_inst|pwe_inst|clk_cnt[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[7]~14_combout\ = (!\gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\ & ((\gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\ & ((\gc_cntrl_inst|pwe_inst|Equal2~1_combout\))) # (!\gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\ & 
-- (\gc_cntrl_inst|pwe_inst|clk_cnt[7]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\,
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~12_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datad => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~13_combout\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~14_combout\);

-- Location: LCCOMB_X43_Y59_N2
\gc_cntrl_inst|pwe_inst|clk_cnt[7]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt[7]~14_combout\) # ((\gc_cntrl_inst|pwe_inst|Selector6~0_combout\) # ((\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & \gc_cntrl_inst|pwe_inst|sync~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~14_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\);

-- Location: FF_X45_Y59_N13
\gc_cntrl_inst|pwe_inst|clk_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[0]~8_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(0));

-- Location: LCCOMB_X45_Y59_N14
\gc_cntrl_inst|pwe_inst|clk_cnt[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[1]~10_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(1) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\)) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(1) & ((\gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\ = CARRY((!\gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(1),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[0]~9\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[1]~10_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\);

-- Location: FF_X45_Y59_N15
\gc_cntrl_inst|pwe_inst|clk_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[1]~10_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(1));

-- Location: LCCOMB_X45_Y59_N16
\gc_cntrl_inst|pwe_inst|clk_cnt[2]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[2]~16_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(2) & (\gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\ $ (GND))) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(2) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\ & VCC))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\ = CARRY((\gc_cntrl_inst|pwe_inst|clk_cnt\(2) & !\gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(2),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[1]~11\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[2]~16_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\);

-- Location: FF_X45_Y59_N17
\gc_cntrl_inst|pwe_inst|clk_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[2]~16_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(2));

-- Location: LCCOMB_X45_Y59_N18
\gc_cntrl_inst|pwe_inst|clk_cnt[3]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[3]~18_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(3) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\)) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(3) & ((\gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\) # (GND)))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\ = CARRY((!\gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(3),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[2]~17\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[3]~18_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\);

-- Location: FF_X45_Y59_N19
\gc_cntrl_inst|pwe_inst|clk_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[3]~18_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(3));

-- Location: LCCOMB_X45_Y59_N20
\gc_cntrl_inst|pwe_inst|clk_cnt[4]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|clk_cnt[4]~20_combout\ = (\gc_cntrl_inst|pwe_inst|clk_cnt\(4) & (\gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\ $ (GND))) # (!\gc_cntrl_inst|pwe_inst|clk_cnt\(4) & (!\gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\ & VCC))
-- \gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\ = CARRY((\gc_cntrl_inst|pwe_inst|clk_cnt\(4) & !\gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(4),
	datad => VCC,
	cin => \gc_cntrl_inst|pwe_inst|clk_cnt[3]~19\,
	combout => \gc_cntrl_inst|pwe_inst|clk_cnt[4]~20_combout\,
	cout => \gc_cntrl_inst|pwe_inst|clk_cnt[4]~21\);

-- Location: FF_X45_Y59_N21
\gc_cntrl_inst|pwe_inst|clk_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[4]~20_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(4));

-- Location: FF_X45_Y59_N23
\gc_cntrl_inst|pwe_inst|clk_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|clk_cnt[5]~22_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	sclr => \gc_cntrl_inst|pwe_inst|clk_cnt[7]~15_combout\,
	ena => \gc_cntrl_inst|pwe_inst|WideOr3~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|clk_cnt\(5));

-- Location: LCCOMB_X45_Y59_N10
\gc_cntrl_inst|pwe_inst|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal2~0_combout\ = (!\gc_cntrl_inst|pwe_inst|clk_cnt\(5) & (\gc_cntrl_inst|pwe_inst|clk_cnt\(7) & \gc_cntrl_inst|pwe_inst|clk_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|clk_cnt\(5),
	datac => \gc_cntrl_inst|pwe_inst|clk_cnt\(7),
	datad => \gc_cntrl_inst|pwe_inst|clk_cnt\(2),
	combout => \gc_cntrl_inst|pwe_inst|Equal2~0_combout\);

-- Location: LCCOMB_X45_Y59_N4
\gc_cntrl_inst|pwe_inst|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Equal2~1_combout\ = (\gc_cntrl_inst|pwe_inst|Equal2~0_combout\ & (!\gc_cntrl_inst|pwe_inst|clk_cnt\(6) & \gc_cntrl_inst|pwe_inst|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Equal2~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|clk_cnt\(6),
	datac => \gc_cntrl_inst|pwe_inst|Equal0~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\);

-- Location: LCCOMB_X43_Y59_N4
\gc_cntrl_inst|pwe_inst|Selector6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector6~0_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\ & ((\gc_cntrl_inst|pwe_inst|send_data_reg\(24) & ((\gc_cntrl_inst|pwe_inst|Equal0~2_combout\))) # (!\gc_cntrl_inst|pwe_inst|send_data_reg\(24) & 
-- (\gc_cntrl_inst|pwe_inst|Equal2~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\,
	datab => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datac => \gc_cntrl_inst|pwe_inst|send_data_reg\(24),
	datad => \gc_cntrl_inst|pwe_inst|Equal0~2_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\);

-- Location: LCCOMB_X42_Y59_N12
\gc_cntrl_inst|pwe_inst|Selector3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~9_combout\ = (\gc_cntrl_inst|pwe_inst|data_synced_old~q\ & (!\gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2) & !\gc_cntrl_inst|pwe_inst|state.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \gc_cntrl_inst|pwe_inst|data_synced_old~q\,
	datac => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	datad => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~9_combout\);

-- Location: LCCOMB_X42_Y59_N4
\gc_cntrl_inst|pwe_inst|Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector2~2_combout\ = (!\gc_cntrl_inst|pwe_inst|Selector6~0_combout\ & (!\gc_cntrl_inst|pwe_inst|Selector3~9_combout\ & (\gc_cntrl_inst|pwe_inst|Selector2~0_combout\ & !\gc_cntrl_inst|pwe_inst|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector6~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~9_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector2~0_combout\,
	datad => \gc_cntrl_inst|pwe_inst|Selector2~1_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector2~2_combout\);

-- Location: FF_X42_Y59_N5
\gc_cntrl_inst|pwe_inst|state.SEND\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector2~2_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.SEND~q\);

-- Location: LCCOMB_X43_Y60_N28
\gc_cntrl_inst|pwe_inst|Selector3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~7_combout\ = (\gc_cntrl_inst|pwe_inst|state.SEND~q\ & (!\gc_cntrl_inst|pwe_inst|LessThan0~0_combout\ & ((!\gc_cntrl_inst|pwe_inst|data_cnt\(3)) # (!\gc_cntrl_inst|pwe_inst|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.SEND~q\,
	datab => \gc_cntrl_inst|pwe_inst|LessThan0~1_combout\,
	datac => \gc_cntrl_inst|pwe_inst|data_cnt\(3),
	datad => \gc_cntrl_inst|pwe_inst|LessThan0~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~7_combout\);

-- Location: LCCOMB_X43_Y59_N20
\gc_cntrl_inst|pwe_inst|Selector3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~6_combout\ = (\gc_cntrl_inst|pwe_inst|Selector1~0_combout\ & (!\gc_cntrl_inst|pwe_inst|Selector3~10_combout\ & (!\gc_cntrl_inst|pwe_inst|Selector3~5_combout\ & \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector1~0_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Selector3~5_combout\,
	datad => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~6_combout\);

-- Location: LCCOMB_X43_Y59_N10
\gc_cntrl_inst|pwe_inst|Selector3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector3~8_combout\ = (\gc_cntrl_inst|pwe_inst|Selector3~6_combout\) # ((\gc_cntrl_inst|pwe_inst|Selector3~7_combout\ & (!\gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\ & !\gc_cntrl_inst|pwe_inst|Selector3~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|Selector3~7_combout\,
	datab => \gc_cntrl_inst|pwe_inst|Selector3~6_combout\,
	datac => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	datad => \gc_cntrl_inst|pwe_inst|Selector3~10_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector3~8_combout\);

-- Location: FF_X43_Y59_N11
\gc_cntrl_inst|pwe_inst|state.SEND_LOW\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector3~8_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|state.SEND_LOW~q\);

-- Location: LCCOMB_X58_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|data_sync_inst|sync\(2),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[0]~feeder_combout\);

-- Location: FF_X58_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(0));

-- Location: LCCOMB_X58_Y69_N30
\gc_cntrl_inst|pwe_inst|recveived_reg[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(0),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[1]~feeder_combout\);

-- Location: FF_X58_Y69_N31
\gc_cntrl_inst|pwe_inst|recveived_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(1));

-- Location: LCCOMB_X61_Y69_N0
\gc_cntrl_inst|button_reg.trigger_r[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(1),
	combout => \gc_cntrl_inst|button_reg.trigger_r[0]~feeder_combout\);

-- Location: LCCOMB_X43_Y59_N16
\gc_cntrl_inst|pwe_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector0~0_combout\ = (\gc_cntrl_inst|pwe_inst|received_valid_reg~q\ & ((\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\) # (\gc_cntrl_inst|pwe_inst|state.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datac => \gc_cntrl_inst|pwe_inst|state.IDLE~q\,
	datad => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	combout => \gc_cntrl_inst|pwe_inst|Selector0~0_combout\);

-- Location: LCCOMB_X43_Y59_N24
\gc_cntrl_inst|pwe_inst|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|Selector0~1_combout\ = (\gc_cntrl_inst|pwe_inst|Selector0~0_combout\) # ((\gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\ & (\gc_cntrl_inst|pwe_inst|Equal2~1_combout\ & !\gc_cntrl_inst|pwe_inst|sync~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \gc_cntrl_inst|pwe_inst|state.WAIT_FOR_FALLING~q\,
	datab => \gc_cntrl_inst|pwe_inst|Selector0~0_combout\,
	datac => \gc_cntrl_inst|pwe_inst|Equal2~1_combout\,
	datad => \gc_cntrl_inst|pwe_inst|sync~0_combout\,
	combout => \gc_cntrl_inst|pwe_inst|Selector0~1_combout\);

-- Location: FF_X43_Y59_N25
\gc_cntrl_inst|pwe_inst|received_valid_reg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|Selector0~1_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\);

-- Location: FF_X61_Y69_N1
\gc_cntrl_inst|button_reg.trigger_r[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(0));

-- Location: LCCOMB_X61_Y69_N16
\gc_cntrl_inst|pwe_inst|recveived_reg[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[2]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(1),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[2]~feeder_combout\);

-- Location: FF_X61_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[2]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(2));

-- Location: LCCOMB_X61_Y69_N2
\gc_cntrl_inst|button_reg.trigger_r[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(2),
	combout => \gc_cntrl_inst|button_reg.trigger_r[1]~feeder_combout\);

-- Location: FF_X61_Y69_N3
\gc_cntrl_inst|button_reg.trigger_r[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(1));

-- Location: LCCOMB_X61_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[3]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(2),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[3]~feeder_combout\);

-- Location: FF_X61_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[3]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(3));

-- Location: LCCOMB_X84_Y69_N24
\gc_cntrl_inst|button_reg.trigger_r[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[2]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(3),
	combout => \gc_cntrl_inst|button_reg.trigger_r[2]~feeder_combout\);

-- Location: FF_X84_Y69_N25
\gc_cntrl_inst|button_reg.trigger_r[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[2]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(2));

-- Location: LCCOMB_X84_Y69_N16
\gc_cntrl_inst|pwe_inst|recveived_reg[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(3),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[4]~feeder_combout\);

-- Location: FF_X84_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(4));

-- Location: LCCOMB_X84_Y69_N26
\gc_cntrl_inst|button_reg.trigger_r[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[3]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(4),
	combout => \gc_cntrl_inst|button_reg.trigger_r[3]~feeder_combout\);

-- Location: FF_X84_Y69_N27
\gc_cntrl_inst|button_reg.trigger_r[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[3]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(3));

-- Location: LCCOMB_X84_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(4),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[5]~feeder_combout\);

-- Location: FF_X84_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(5));

-- Location: LCCOMB_X84_Y69_N12
\gc_cntrl_inst|button_reg.trigger_r[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(5),
	combout => \gc_cntrl_inst|button_reg.trigger_r[4]~feeder_combout\);

-- Location: FF_X84_Y69_N13
\gc_cntrl_inst|button_reg.trigger_r[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(4));

-- Location: LCCOMB_X84_Y69_N20
\gc_cntrl_inst|pwe_inst|recveived_reg[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(5),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[6]~feeder_combout\);

-- Location: FF_X84_Y69_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(6));

-- Location: LCCOMB_X84_Y69_N22
\gc_cntrl_inst|button_reg.trigger_r[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(6),
	combout => \gc_cntrl_inst|button_reg.trigger_r[5]~feeder_combout\);

-- Location: FF_X84_Y69_N23
\gc_cntrl_inst|button_reg.trigger_r[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(5));

-- Location: LCCOMB_X84_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[7]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(6),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[7]~feeder_combout\);

-- Location: FF_X84_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[7]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(7));

-- Location: LCCOMB_X84_Y69_N0
\gc_cntrl_inst|button_reg.trigger_r[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_r[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(7),
	combout => \gc_cntrl_inst|button_reg.trigger_r[6]~feeder_combout\);

-- Location: FF_X84_Y69_N1
\gc_cntrl_inst|button_reg.trigger_r[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_r[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(6));

-- Location: LCCOMB_X84_Y69_N8
\gc_cntrl_inst|pwe_inst|recveived_reg[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[8]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(7),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[8]~feeder_combout\);

-- Location: FF_X84_Y69_N9
\gc_cntrl_inst|pwe_inst|recveived_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[8]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(8));

-- Location: FF_X84_Y69_N3
\gc_cntrl_inst|button_reg.trigger_r[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(8),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_r\(7));

-- Location: FF_X84_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(8),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(9));

-- Location: LCCOMB_X84_Y69_N4
\gc_cntrl_inst|button_reg.trigger_l[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(9),
	combout => \gc_cntrl_inst|button_reg.trigger_l[0]~feeder_combout\);

-- Location: FF_X84_Y69_N5
\gc_cntrl_inst|button_reg.trigger_l[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(0));

-- Location: LCCOMB_X84_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[10]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(9),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[10]~feeder_combout\);

-- Location: FF_X84_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[10]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(10));

-- Location: LCCOMB_X84_Y69_N14
\gc_cntrl_inst|button_reg.trigger_l[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(10),
	combout => \gc_cntrl_inst|button_reg.trigger_l[1]~feeder_combout\);

-- Location: FF_X84_Y69_N15
\gc_cntrl_inst|button_reg.trigger_l[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(1));

-- Location: LCCOMB_X84_Y69_N30
\gc_cntrl_inst|pwe_inst|recveived_reg[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[11]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(10),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[11]~feeder_combout\);

-- Location: FF_X84_Y69_N31
\gc_cntrl_inst|pwe_inst|recveived_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[11]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(11));

-- Location: FF_X114_Y44_N17
\gc_cntrl_inst|button_reg.trigger_l[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(11),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(2));

-- Location: FF_X114_Y44_N27
\gc_cntrl_inst|pwe_inst|recveived_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(11),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(12));

-- Location: FF_X114_Y44_N3
\gc_cntrl_inst|button_reg.trigger_l[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(12),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(3));

-- Location: FF_X114_Y44_N13
\gc_cntrl_inst|pwe_inst|recveived_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(12),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(13));

-- Location: LCCOMB_X114_Y44_N20
\gc_cntrl_inst|button_reg.trigger_l[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(13),
	combout => \gc_cntrl_inst|button_reg.trigger_l[4]~feeder_combout\);

-- Location: FF_X114_Y44_N21
\gc_cntrl_inst|button_reg.trigger_l[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(4));

-- Location: LCCOMB_X114_Y44_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[14]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[14]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(13),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[14]~feeder_combout\);

-- Location: FF_X114_Y44_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[14]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(14));

-- Location: LCCOMB_X114_Y44_N14
\gc_cntrl_inst|button_reg.trigger_l[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(14),
	combout => \gc_cntrl_inst|button_reg.trigger_l[5]~feeder_combout\);

-- Location: FF_X114_Y44_N15
\gc_cntrl_inst|button_reg.trigger_l[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(5));

-- Location: LCCOMB_X114_Y44_N24
\gc_cntrl_inst|pwe_inst|recveived_reg[15]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[15]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(14),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[15]~feeder_combout\);

-- Location: FF_X114_Y44_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[15]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(15));

-- Location: LCCOMB_X114_Y44_N8
\gc_cntrl_inst|button_reg.trigger_l[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(15),
	combout => \gc_cntrl_inst|button_reg.trigger_l[6]~feeder_combout\);

-- Location: FF_X114_Y44_N9
\gc_cntrl_inst|button_reg.trigger_l[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(6));

-- Location: LCCOMB_X114_Y44_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[16]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[16]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(15)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(15),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[16]~feeder_combout\);

-- Location: FF_X114_Y44_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[16]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(16));

-- Location: LCCOMB_X114_Y45_N0
\gc_cntrl_inst|button_reg.trigger_l[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.trigger_l[7]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(16),
	combout => \gc_cntrl_inst|button_reg.trigger_l[7]~feeder_combout\);

-- Location: FF_X114_Y45_N1
\gc_cntrl_inst|button_reg.trigger_l[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.trigger_l[7]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.trigger_l\(7));

-- Location: LCCOMB_X114_Y45_N16
\gc_cntrl_inst|pwe_inst|recveived_reg[17]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[17]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(16)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(16),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[17]~feeder_combout\);

-- Location: FF_X114_Y45_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[17]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(17));

-- Location: LCCOMB_X114_Y45_N18
\gc_cntrl_inst|button_reg.c_y[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(17),
	combout => \gc_cntrl_inst|button_reg.c_y[0]~feeder_combout\);

-- Location: FF_X114_Y45_N19
\gc_cntrl_inst|button_reg.c_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(0));

-- Location: LCCOMB_X114_Y45_N2
\gc_cntrl_inst|pwe_inst|recveived_reg[18]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[18]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(17)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(17),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[18]~feeder_combout\);

-- Location: FF_X114_Y45_N3
\gc_cntrl_inst|pwe_inst|recveived_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[18]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(18));

-- Location: LCCOMB_X114_Y45_N4
\gc_cntrl_inst|button_reg.c_y[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(18),
	combout => \gc_cntrl_inst|button_reg.c_y[1]~feeder_combout\);

-- Location: FF_X114_Y45_N5
\gc_cntrl_inst|button_reg.c_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(1));

-- Location: LCCOMB_X114_Y45_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[19]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[19]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(18)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(18),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[19]~feeder_combout\);

-- Location: FF_X114_Y45_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[19]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(19));

-- Location: LCCOMB_X114_Y45_N22
\gc_cntrl_inst|button_reg.c_y[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[2]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(19),
	combout => \gc_cntrl_inst|button_reg.c_y[2]~feeder_combout\);

-- Location: FF_X114_Y45_N23
\gc_cntrl_inst|button_reg.c_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[2]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(2));

-- Location: LCCOMB_X114_Y45_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[20]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[20]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(19)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(19),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[20]~feeder_combout\);

-- Location: FF_X114_Y45_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[20]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(20));

-- Location: LCCOMB_X114_Y45_N8
\gc_cntrl_inst|button_reg.c_y[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[3]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(20),
	combout => \gc_cntrl_inst|button_reg.c_y[3]~feeder_combout\);

-- Location: FF_X114_Y45_N9
\gc_cntrl_inst|button_reg.c_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[3]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(3));

-- Location: LCCOMB_X114_Y45_N24
\gc_cntrl_inst|pwe_inst|recveived_reg[21]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[21]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(20)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(20),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[21]~feeder_combout\);

-- Location: FF_X114_Y45_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[21]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(21));

-- Location: LCCOMB_X114_Y45_N26
\gc_cntrl_inst|button_reg.c_y[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(21),
	combout => \gc_cntrl_inst|button_reg.c_y[4]~feeder_combout\);

-- Location: FF_X114_Y45_N27
\gc_cntrl_inst|button_reg.c_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(4));

-- Location: LCCOMB_X114_Y45_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[22]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[22]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(21)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(21),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[22]~feeder_combout\);

-- Location: FF_X114_Y45_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[22]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(22));

-- Location: LCCOMB_X114_Y45_N12
\gc_cntrl_inst|button_reg.c_y[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(22),
	combout => \gc_cntrl_inst|button_reg.c_y[5]~feeder_combout\);

-- Location: FF_X114_Y45_N13
\gc_cntrl_inst|button_reg.c_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(5));

-- Location: LCCOMB_X114_Y45_N20
\gc_cntrl_inst|pwe_inst|recveived_reg[23]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[23]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(22)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(22),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[23]~feeder_combout\);

-- Location: FF_X114_Y45_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[23]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(23));

-- Location: LCCOMB_X114_Y45_N14
\gc_cntrl_inst|button_reg.c_y[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_y[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(23),
	combout => \gc_cntrl_inst|button_reg.c_y[6]~feeder_combout\);

-- Location: FF_X114_Y45_N15
\gc_cntrl_inst|button_reg.c_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_y[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(6));

-- Location: LCCOMB_X114_Y45_N30
\gc_cntrl_inst|pwe_inst|recveived_reg[24]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[24]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(23)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(23),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[24]~feeder_combout\);

-- Location: FF_X114_Y45_N31
\gc_cntrl_inst|pwe_inst|recveived_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[24]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(24));

-- Location: FF_X58_Y69_N1
\gc_cntrl_inst|button_reg.c_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(24),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_y\(7));

-- Location: FF_X58_Y69_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(24),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(25));

-- Location: LCCOMB_X58_Y69_N2
\gc_cntrl_inst|button_reg.c_x[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(25),
	combout => \gc_cntrl_inst|button_reg.c_x[0]~feeder_combout\);

-- Location: FF_X58_Y69_N3
\gc_cntrl_inst|button_reg.c_x[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(0));

-- Location: LCCOMB_X58_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[26]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[26]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(25)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(25),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[26]~feeder_combout\);

-- Location: FF_X58_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[26]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(26));

-- Location: LCCOMB_X58_Y69_N20
\gc_cntrl_inst|button_reg.c_x[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(26)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(26),
	combout => \gc_cntrl_inst|button_reg.c_x[1]~feeder_combout\);

-- Location: FF_X58_Y69_N21
\gc_cntrl_inst|button_reg.c_x[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(1));

-- Location: LCCOMB_X58_Y69_N12
\gc_cntrl_inst|pwe_inst|recveived_reg[27]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[27]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(26)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(26),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[27]~feeder_combout\);

-- Location: FF_X58_Y69_N13
\gc_cntrl_inst|pwe_inst|recveived_reg[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[27]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(27));

-- Location: LCCOMB_X58_Y69_N14
\gc_cntrl_inst|button_reg.c_x[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[2]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(27),
	combout => \gc_cntrl_inst|button_reg.c_x[2]~feeder_combout\);

-- Location: FF_X58_Y69_N15
\gc_cntrl_inst|button_reg.c_x[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[2]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(2));

-- Location: LCCOMB_X58_Y69_N22
\gc_cntrl_inst|pwe_inst|recveived_reg[28]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[28]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(27)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(27),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[28]~feeder_combout\);

-- Location: FF_X58_Y69_N23
\gc_cntrl_inst|pwe_inst|recveived_reg[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[28]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(28));

-- Location: FF_X58_Y69_N9
\gc_cntrl_inst|button_reg.c_x[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(28),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(3));

-- Location: FF_X58_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(28),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(29));

-- Location: LCCOMB_X58_Y69_N26
\gc_cntrl_inst|button_reg.c_x[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(29)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(29),
	combout => \gc_cntrl_inst|button_reg.c_x[4]~feeder_combout\);

-- Location: FF_X58_Y69_N27
\gc_cntrl_inst|button_reg.c_x[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(4));

-- Location: LCCOMB_X58_Y69_N18
\gc_cntrl_inst|pwe_inst|recveived_reg[30]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[30]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(29)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(29),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[30]~feeder_combout\);

-- Location: FF_X58_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[30]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(30));

-- Location: LCCOMB_X58_Y69_N4
\gc_cntrl_inst|button_reg.c_x[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(30)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(30),
	combout => \gc_cntrl_inst|button_reg.c_x[5]~feeder_combout\);

-- Location: FF_X58_Y69_N5
\gc_cntrl_inst|button_reg.c_x[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(5));

-- Location: LCCOMB_X58_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[31]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(30)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(30),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[31]~feeder_combout\);

-- Location: FF_X58_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[31]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(31));

-- Location: LCCOMB_X69_Y69_N0
\gc_cntrl_inst|button_reg.c_x[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(31),
	combout => \gc_cntrl_inst|button_reg.c_x[6]~feeder_combout\);

-- Location: FF_X69_Y69_N1
\gc_cntrl_inst|button_reg.c_x[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(6));

-- Location: LCCOMB_X69_Y69_N24
\gc_cntrl_inst|pwe_inst|recveived_reg[32]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[32]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(31)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(31),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[32]~feeder_combout\);

-- Location: FF_X69_Y69_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[32]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(32));

-- Location: LCCOMB_X69_Y69_N26
\gc_cntrl_inst|button_reg.c_x[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.c_x[7]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(32)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(32),
	combout => \gc_cntrl_inst|button_reg.c_x[7]~feeder_combout\);

-- Location: FF_X69_Y69_N27
\gc_cntrl_inst|button_reg.c_x[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.c_x[7]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.c_x\(7));

-- Location: LCCOMB_X69_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[33]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[33]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(32)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(32),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[33]~feeder_combout\);

-- Location: FF_X69_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[33]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(33));

-- Location: LCCOMB_X69_Y69_N4
\gc_cntrl_inst|button_reg.joy_y[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(33)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(33),
	combout => \gc_cntrl_inst|button_reg.joy_y[0]~feeder_combout\);

-- Location: FF_X69_Y69_N5
\gc_cntrl_inst|button_reg.joy_y[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(0));

-- Location: LCCOMB_X69_Y69_N20
\gc_cntrl_inst|pwe_inst|recveived_reg[34]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[34]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(33)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(33),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[34]~feeder_combout\);

-- Location: FF_X69_Y69_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[34]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(34));

-- Location: LCCOMB_X69_Y69_N14
\gc_cntrl_inst|button_reg.joy_y[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(34)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(34),
	combout => \gc_cntrl_inst|button_reg.joy_y[1]~feeder_combout\);

-- Location: FF_X69_Y69_N15
\gc_cntrl_inst|button_reg.joy_y[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(1));

-- Location: LCCOMB_X69_Y69_N30
\gc_cntrl_inst|pwe_inst|recveived_reg[35]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[35]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(34)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(34),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[35]~feeder_combout\);

-- Location: FF_X69_Y69_N31
\gc_cntrl_inst|pwe_inst|recveived_reg[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[35]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(35));

-- Location: FF_X69_Y69_N9
\gc_cntrl_inst|button_reg.joy_y[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(35),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(2));

-- Location: FF_X69_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(35),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(36));

-- Location: LCCOMB_X69_Y69_N2
\gc_cntrl_inst|button_reg.joy_y[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[3]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(36)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(36),
	combout => \gc_cntrl_inst|button_reg.joy_y[3]~feeder_combout\);

-- Location: FF_X69_Y69_N3
\gc_cntrl_inst|button_reg.joy_y[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[3]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(3));

-- Location: LCCOMB_X69_Y69_N18
\gc_cntrl_inst|pwe_inst|recveived_reg[37]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[37]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(36)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(36),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[37]~feeder_combout\);

-- Location: FF_X69_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[37]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(37));

-- Location: LCCOMB_X69_Y69_N12
\gc_cntrl_inst|button_reg.joy_y[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(37)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(37),
	combout => \gc_cntrl_inst|button_reg.joy_y[4]~feeder_combout\);

-- Location: FF_X69_Y69_N13
\gc_cntrl_inst|button_reg.joy_y[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(4));

-- Location: LCCOMB_X69_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[38]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[38]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(37)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(37),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[38]~feeder_combout\);

-- Location: FF_X69_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[38]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(38));

-- Location: LCCOMB_X69_Y69_N22
\gc_cntrl_inst|button_reg.joy_y[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(38)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(38),
	combout => \gc_cntrl_inst|button_reg.joy_y[5]~feeder_combout\);

-- Location: FF_X69_Y69_N23
\gc_cntrl_inst|button_reg.joy_y[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(5));

-- Location: LCCOMB_X69_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[39]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[39]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(38)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(38),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[39]~feeder_combout\);

-- Location: FF_X69_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[39]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(39));

-- Location: LCCOMB_X73_Y69_N0
\gc_cntrl_inst|button_reg.joy_y[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(39)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(39),
	combout => \gc_cntrl_inst|button_reg.joy_y[6]~feeder_combout\);

-- Location: FF_X73_Y69_N1
\gc_cntrl_inst|button_reg.joy_y[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(6));

-- Location: LCCOMB_X73_Y69_N16
\gc_cntrl_inst|pwe_inst|recveived_reg[40]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[40]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(39)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(39),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[40]~feeder_combout\);

-- Location: FF_X73_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[40]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(40));

-- Location: LCCOMB_X73_Y69_N2
\gc_cntrl_inst|button_reg.joy_y[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_y[7]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(40)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(40),
	combout => \gc_cntrl_inst|button_reg.joy_y[7]~feeder_combout\);

-- Location: FF_X73_Y69_N3
\gc_cntrl_inst|button_reg.joy_y[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_y[7]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_y\(7));

-- Location: LCCOMB_X73_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[41]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[41]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(40)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(40),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[41]~feeder_combout\);

-- Location: FF_X73_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[41]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(41));

-- Location: LCCOMB_X73_Y69_N4
\gc_cntrl_inst|button_reg.joy_x[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[0]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(41)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(41),
	combout => \gc_cntrl_inst|button_reg.joy_x[0]~feeder_combout\);

-- Location: FF_X73_Y69_N5
\gc_cntrl_inst|button_reg.joy_x[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[0]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(0));

-- Location: LCCOMB_X73_Y69_N20
\gc_cntrl_inst|pwe_inst|recveived_reg[42]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[42]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(41)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(41),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[42]~feeder_combout\);

-- Location: FF_X73_Y69_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[42]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(42));

-- Location: LCCOMB_X73_Y69_N14
\gc_cntrl_inst|button_reg.joy_x[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[1]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(42)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(42),
	combout => \gc_cntrl_inst|button_reg.joy_x[1]~feeder_combout\);

-- Location: FF_X73_Y69_N15
\gc_cntrl_inst|button_reg.joy_x[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[1]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(1));

-- Location: LCCOMB_X73_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[43]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[43]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(42)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(42),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[43]~feeder_combout\);

-- Location: FF_X73_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[43]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(43));

-- Location: LCCOMB_X73_Y69_N8
\gc_cntrl_inst|button_reg.joy_x[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[2]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(43)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(43),
	combout => \gc_cntrl_inst|button_reg.joy_x[2]~feeder_combout\);

-- Location: FF_X73_Y69_N9
\gc_cntrl_inst|button_reg.joy_x[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[2]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(2));

-- Location: LCCOMB_X73_Y69_N24
\gc_cntrl_inst|pwe_inst|recveived_reg[44]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[44]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(43)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(43),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[44]~feeder_combout\);

-- Location: FF_X73_Y69_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[44]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(44));

-- Location: LCCOMB_X73_Y69_N26
\gc_cntrl_inst|button_reg.joy_x[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[3]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(44)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(44),
	combout => \gc_cntrl_inst|button_reg.joy_x[3]~feeder_combout\);

-- Location: FF_X73_Y69_N27
\gc_cntrl_inst|button_reg.joy_x[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[3]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(3));

-- Location: LCCOMB_X73_Y69_N18
\gc_cntrl_inst|pwe_inst|recveived_reg[45]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[45]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(44)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(44),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[45]~feeder_combout\);

-- Location: FF_X73_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[45]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(45));

-- Location: LCCOMB_X73_Y69_N12
\gc_cntrl_inst|button_reg.joy_x[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[4]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(45)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(45),
	combout => \gc_cntrl_inst|button_reg.joy_x[4]~feeder_combout\);

-- Location: FF_X73_Y69_N13
\gc_cntrl_inst|button_reg.joy_x[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[4]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(4));

-- Location: LCCOMB_X73_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[46]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[46]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(45)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(45),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[46]~feeder_combout\);

-- Location: FF_X73_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[46]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(46));

-- Location: LCCOMB_X73_Y69_N30
\gc_cntrl_inst|button_reg.joy_x[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[5]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(46)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(46),
	combout => \gc_cntrl_inst|button_reg.joy_x[5]~feeder_combout\);

-- Location: FF_X73_Y69_N31
\gc_cntrl_inst|button_reg.joy_x[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[5]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(5));

-- Location: FF_X79_Y69_N1
\gc_cntrl_inst|pwe_inst|recveived_reg[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(46),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(47));

-- Location: LCCOMB_X79_Y69_N8
\gc_cntrl_inst|button_reg.joy_x[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[6]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(47)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(47),
	combout => \gc_cntrl_inst|button_reg.joy_x[6]~feeder_combout\);

-- Location: FF_X79_Y69_N9
\gc_cntrl_inst|button_reg.joy_x[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[6]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(6));

-- Location: LCCOMB_X79_Y69_N10
\gc_cntrl_inst|pwe_inst|recveived_reg[48]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[48]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(47)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(47),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[48]~feeder_combout\);

-- Location: FF_X79_Y69_N11
\gc_cntrl_inst|pwe_inst|recveived_reg[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[48]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(48));

-- Location: LCCOMB_X79_Y69_N26
\gc_cntrl_inst|button_reg.joy_x[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.joy_x[7]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(48)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(48),
	combout => \gc_cntrl_inst|button_reg.joy_x[7]~feeder_combout\);

-- Location: FF_X79_Y69_N27
\gc_cntrl_inst|button_reg.joy_x[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.joy_x[7]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.joy_x\(7));

-- Location: LCCOMB_X79_Y69_N20
\gc_cntrl_inst|pwe_inst|recveived_reg[49]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[49]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(48)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(48),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[49]~feeder_combout\);

-- Location: FF_X79_Y69_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[49]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(49));

-- Location: LCCOMB_X79_Y69_N4
\gc_cntrl_inst|button_reg.btn_left~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_left~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(49)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(49),
	combout => \gc_cntrl_inst|button_reg.btn_left~feeder_combout\);

-- Location: FF_X79_Y69_N5
\gc_cntrl_inst|button_reg.btn_left\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_left~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_left~q\);

-- Location: LCCOMB_X79_Y69_N22
\gc_cntrl_inst|pwe_inst|recveived_reg[50]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[50]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(49)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(49),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[50]~feeder_combout\);

-- Location: FF_X79_Y69_N23
\gc_cntrl_inst|pwe_inst|recveived_reg[50]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[50]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(50));

-- Location: FF_X79_Y69_N31
\gc_cntrl_inst|button_reg.btn_right\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(50),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_right~q\);

-- Location: FF_X79_Y69_N17
\gc_cntrl_inst|pwe_inst|recveived_reg[51]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(50),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(51));

-- Location: LCCOMB_X79_Y69_N24
\gc_cntrl_inst|button_reg.btn_down~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_down~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(51)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(51),
	combout => \gc_cntrl_inst|button_reg.btn_down~feeder_combout\);

-- Location: FF_X79_Y69_N25
\gc_cntrl_inst|button_reg.btn_down\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_down~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_down~q\);

-- Location: LCCOMB_X79_Y69_N18
\gc_cntrl_inst|pwe_inst|recveived_reg[52]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[52]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(51)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(51),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[52]~feeder_combout\);

-- Location: FF_X79_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[52]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[52]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(52));

-- Location: LCCOMB_X79_Y69_N2
\gc_cntrl_inst|button_reg.btn_up~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_up~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(52)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(52),
	combout => \gc_cntrl_inst|button_reg.btn_up~feeder_combout\);

-- Location: FF_X79_Y69_N3
\gc_cntrl_inst|button_reg.btn_up\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_up~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_up~q\);

-- Location: LCCOMB_X79_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[53]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[53]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(52)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(52),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[53]~feeder_combout\);

-- Location: FF_X79_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[53]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[53]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(53));

-- Location: LCCOMB_X79_Y69_N12
\gc_cntrl_inst|button_reg.btn_z~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_z~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(53)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(53),
	combout => \gc_cntrl_inst|button_reg.btn_z~feeder_combout\);

-- Location: FF_X79_Y69_N13
\gc_cntrl_inst|button_reg.btn_z\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_z~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_z~q\);

-- Location: LCCOMB_X79_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[54]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[54]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(53)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(53),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[54]~feeder_combout\);

-- Location: FF_X79_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[54]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[54]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(54));

-- Location: LCCOMB_X79_Y69_N14
\gc_cntrl_inst|button_reg.btn_r~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_r~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(54)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(54),
	combout => \gc_cntrl_inst|button_reg.btn_r~feeder_combout\);

-- Location: FF_X79_Y69_N15
\gc_cntrl_inst|button_reg.btn_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_r~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_r~q\);

-- Location: LCCOMB_X73_Y69_N22
\gc_cntrl_inst|pwe_inst|recveived_reg[55]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[55]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(54)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(54),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[55]~feeder_combout\);

-- Location: FF_X73_Y69_N23
\gc_cntrl_inst|pwe_inst|recveived_reg[55]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[55]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(55));

-- Location: LCCOMB_X61_Y69_N4
\gc_cntrl_inst|button_reg.btn_l~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_l~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(55)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(55),
	combout => \gc_cntrl_inst|button_reg.btn_l~feeder_combout\);

-- Location: FF_X61_Y69_N5
\gc_cntrl_inst|button_reg.btn_l\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_l~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_l~q\);

-- Location: LCCOMB_X61_Y69_N30
\gc_cntrl_inst|pwe_inst|recveived_reg[56]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[56]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(55)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(55),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[56]~feeder_combout\);

-- Location: FF_X61_Y69_N31
\gc_cntrl_inst|pwe_inst|recveived_reg[56]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[56]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(56));

-- Location: FF_X61_Y69_N21
\gc_cntrl_inst|pwe_inst|recveived_reg[57]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \gc_cntrl_inst|pwe_inst|recveived_reg\(56),
	clrn => \res_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(57));

-- Location: LCCOMB_X61_Y69_N14
\gc_cntrl_inst|button_reg.btn_a~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_a~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(57)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(57),
	combout => \gc_cntrl_inst|button_reg.btn_a~feeder_combout\);

-- Location: FF_X61_Y69_N15
\gc_cntrl_inst|button_reg.btn_a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_a~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_a~q\);

-- Location: LCCOMB_X61_Y69_N6
\gc_cntrl_inst|pwe_inst|recveived_reg[58]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[58]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(57)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(57),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[58]~feeder_combout\);

-- Location: FF_X61_Y69_N7
\gc_cntrl_inst|pwe_inst|recveived_reg[58]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[58]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(58));

-- Location: LCCOMB_X61_Y69_N8
\gc_cntrl_inst|button_reg.btn_b~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_b~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(58)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(58),
	combout => \gc_cntrl_inst|button_reg.btn_b~feeder_combout\);

-- Location: FF_X61_Y69_N9
\gc_cntrl_inst|button_reg.btn_b\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_b~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_b~q\);

-- Location: LCCOMB_X61_Y69_N24
\gc_cntrl_inst|pwe_inst|recveived_reg[59]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[59]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(58)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(58),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[59]~feeder_combout\);

-- Location: FF_X61_Y69_N25
\gc_cntrl_inst|pwe_inst|recveived_reg[59]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[59]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(59));

-- Location: LCCOMB_X61_Y69_N26
\gc_cntrl_inst|button_reg.btn_x~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_x~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(59)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(59),
	combout => \gc_cntrl_inst|button_reg.btn_x~feeder_combout\);

-- Location: FF_X61_Y69_N27
\gc_cntrl_inst|button_reg.btn_x\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_x~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_x~q\);

-- Location: LCCOMB_X61_Y69_N18
\gc_cntrl_inst|pwe_inst|recveived_reg[60]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[60]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(59)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(59),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[60]~feeder_combout\);

-- Location: FF_X61_Y69_N19
\gc_cntrl_inst|pwe_inst|recveived_reg[60]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[60]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(60));

-- Location: LCCOMB_X61_Y69_N12
\gc_cntrl_inst|button_reg.btn_y~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_y~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(60)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(60),
	combout => \gc_cntrl_inst|button_reg.btn_y~feeder_combout\);

-- Location: FF_X61_Y69_N13
\gc_cntrl_inst|button_reg.btn_y\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_y~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_y~q\);

-- Location: LCCOMB_X61_Y69_N28
\gc_cntrl_inst|pwe_inst|recveived_reg[61]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|pwe_inst|recveived_reg[61]~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(60)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(60),
	combout => \gc_cntrl_inst|pwe_inst|recveived_reg[61]~feeder_combout\);

-- Location: FF_X61_Y69_N29
\gc_cntrl_inst|pwe_inst|recveived_reg[61]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|pwe_inst|recveived_reg[61]~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|state.SAMPLE_DATA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|pwe_inst|recveived_reg\(61));

-- Location: LCCOMB_X61_Y69_N22
\gc_cntrl_inst|button_reg.btn_start~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \gc_cntrl_inst|button_reg.btn_start~feeder_combout\ = \gc_cntrl_inst|pwe_inst|recveived_reg\(61)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \gc_cntrl_inst|pwe_inst|recveived_reg\(61),
	combout => \gc_cntrl_inst|button_reg.btn_start~feeder_combout\);

-- Location: FF_X61_Y69_N23
\gc_cntrl_inst|button_reg.btn_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \gc_cntrl_inst|button_reg.btn_start~feeder_combout\,
	clrn => \res_n~inputclkctrl_outclk\,
	ena => \gc_cntrl_inst|pwe_inst|received_valid_reg~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gc_cntrl_inst|button_reg.btn_start~q\);

ww_cntrl_state(0) <= \cntrl_state[0]~output_o\;

ww_cntrl_state(1) <= \cntrl_state[1]~output_o\;

ww_cntrl_state(2) <= \cntrl_state[2]~output_o\;

ww_cntrl_state(3) <= \cntrl_state[3]~output_o\;

ww_cntrl_state(4) <= \cntrl_state[4]~output_o\;

ww_cntrl_state(5) <= \cntrl_state[5]~output_o\;

ww_cntrl_state(6) <= \cntrl_state[6]~output_o\;

ww_cntrl_state(7) <= \cntrl_state[7]~output_o\;

ww_cntrl_state(8) <= \cntrl_state[8]~output_o\;

ww_cntrl_state(9) <= \cntrl_state[9]~output_o\;

ww_cntrl_state(10) <= \cntrl_state[10]~output_o\;

ww_cntrl_state(11) <= \cntrl_state[11]~output_o\;

ww_cntrl_state(12) <= \cntrl_state[12]~output_o\;

ww_cntrl_state(13) <= \cntrl_state[13]~output_o\;

ww_cntrl_state(14) <= \cntrl_state[14]~output_o\;

ww_cntrl_state(15) <= \cntrl_state[15]~output_o\;

ww_cntrl_state(16) <= \cntrl_state[16]~output_o\;

ww_cntrl_state(17) <= \cntrl_state[17]~output_o\;

ww_cntrl_state(18) <= \cntrl_state[18]~output_o\;

ww_cntrl_state(19) <= \cntrl_state[19]~output_o\;

ww_cntrl_state(20) <= \cntrl_state[20]~output_o\;

ww_cntrl_state(21) <= \cntrl_state[21]~output_o\;

ww_cntrl_state(22) <= \cntrl_state[22]~output_o\;

ww_cntrl_state(23) <= \cntrl_state[23]~output_o\;

ww_cntrl_state(24) <= \cntrl_state[24]~output_o\;

ww_cntrl_state(25) <= \cntrl_state[25]~output_o\;

ww_cntrl_state(26) <= \cntrl_state[26]~output_o\;

ww_cntrl_state(27) <= \cntrl_state[27]~output_o\;

ww_cntrl_state(28) <= \cntrl_state[28]~output_o\;

ww_cntrl_state(29) <= \cntrl_state[29]~output_o\;

ww_cntrl_state(30) <= \cntrl_state[30]~output_o\;

ww_cntrl_state(31) <= \cntrl_state[31]~output_o\;

ww_cntrl_state(32) <= \cntrl_state[32]~output_o\;

ww_cntrl_state(33) <= \cntrl_state[33]~output_o\;

ww_cntrl_state(34) <= \cntrl_state[34]~output_o\;

ww_cntrl_state(35) <= \cntrl_state[35]~output_o\;

ww_cntrl_state(36) <= \cntrl_state[36]~output_o\;

ww_cntrl_state(37) <= \cntrl_state[37]~output_o\;

ww_cntrl_state(38) <= \cntrl_state[38]~output_o\;

ww_cntrl_state(39) <= \cntrl_state[39]~output_o\;

ww_cntrl_state(40) <= \cntrl_state[40]~output_o\;

ww_cntrl_state(41) <= \cntrl_state[41]~output_o\;

ww_cntrl_state(42) <= \cntrl_state[42]~output_o\;

ww_cntrl_state(43) <= \cntrl_state[43]~output_o\;

ww_cntrl_state(44) <= \cntrl_state[44]~output_o\;

ww_cntrl_state(45) <= \cntrl_state[45]~output_o\;

ww_cntrl_state(46) <= \cntrl_state[46]~output_o\;

ww_cntrl_state(47) <= \cntrl_state[47]~output_o\;

ww_cntrl_state(48) <= \cntrl_state[48]~output_o\;

ww_cntrl_state(49) <= \cntrl_state[49]~output_o\;

ww_cntrl_state(50) <= \cntrl_state[50]~output_o\;

ww_cntrl_state(51) <= \cntrl_state[51]~output_o\;

ww_cntrl_state(52) <= \cntrl_state[52]~output_o\;

ww_cntrl_state(53) <= \cntrl_state[53]~output_o\;

ww_cntrl_state(54) <= \cntrl_state[54]~output_o\;

ww_cntrl_state(55) <= \cntrl_state[55]~output_o\;

ww_cntrl_state(56) <= \cntrl_state[56]~output_o\;

ww_cntrl_state(57) <= \cntrl_state[57]~output_o\;

ww_cntrl_state(58) <= \cntrl_state[58]~output_o\;

ww_cntrl_state(59) <= \cntrl_state[59]~output_o\;

ww_cntrl_state(60) <= \cntrl_state[60]~output_o\;

ww_cntrl_state(61) <= \cntrl_state[61]~output_o\;

ww_cntrl_state(62) <= \cntrl_state[62]~output_o\;

ww_cntrl_state(63) <= \cntrl_state[63]~output_o\;

data <= \data~output_o\;
END structure;


