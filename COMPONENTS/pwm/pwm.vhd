-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Mon Jun 24 10:13:41 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY pwm IS 
	PORT
	(
		load :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		speed :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dutycycle :  OUT  STD_LOGIC
	);
END pwm;

ARCHITECTURE bdf_type OF pwm IS 

COMPONENT lpm_counter0
	PORT(clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_shiftregister
	PORT(load : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 speed_register : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT compare_signal
	PORT(en : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ls : OUT STD_LOGIC;
		 led_ls : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : lpm_counter0
PORT MAP(clock => clk,
		 cnt_en => enable,
		 q => SYNTHESIZED_WIRE_1);


b2v_inst2 : dsf_shiftregister
PORT MAP(load => load,
		 clk => clk,
		 data => speed,
		 speed_register => SYNTHESIZED_WIRE_0);


b2v_inst5 : compare_signal
PORT MAP(en => enable,
		 a => SYNTHESIZED_WIRE_0,
		 b => SYNTHESIZED_WIRE_1,
		 ls => dutycycle);


END bdf_type;