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
-- CREATED		"Thu Jun 27 19:52:35 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY motor IS 
	PORT
	(
		remote :  IN  STD_LOGIC;
		local :  IN  STD_LOGIC;
		clk_fpga :  IN  STD_LOGIC;
		door :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		trigger :  IN  STD_LOGIC;
		duty_cycle :  OUT  STD_LOGIC;
		in1 :  OUT  STD_LOGIC;
		in0 :  OUT  STD_LOGIC;
		buzzer :  OUT  STD_LOGIC;
		led_door :  OUT  STD_LOGIC
	);
END motor;

ARCHITECTURE bdf_type OF motor IS 

COMPONENT controlador_e
	PORT(en4 : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 remote : IN STD_LOGIC;
		 local : IN STD_LOGIC;
		 door_state : IN STD_LOGIC;
		 sp : OUT STD_LOGIC;
		 rt : OUT STD_LOGIC;
		 load : OUT STD_LOGIC;
		 en_count : OUT STD_LOGIC;
		 led_enable : OUT STD_LOGIC;
		 led_door : OUT STD_LOGIC;
		 speed_high : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 speed_low : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_timer
	PORT(clk : IN STD_LOGIC;
		 trig : IN STD_LOGIC;
		 buz : OUT STD_LOGIC
	);
END COMPONENT;

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

COMPONENT demux_rotation
	PORT(selectRot : IN STD_LOGIC;
		 enable_rot : IN STD_LOGIC;
		 in0 : OUT STD_LOGIC;
		 in1 : OUT STD_LOGIC;
		 led_in0 : OUT STD_LOGIC;
		 led_in1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT comparador_e
	PORT(en : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ls : OUT STD_LOGIC;
		 led_ls : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT div_freq
	PORT(clk_50MHz : IN STD_LOGIC;
		 clk_1KHz : OUT STD_LOGIC;
		 clk_30KHz : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_mux0
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : controlador_e
PORT MAP(en4 => enable,
		 clk => SYNTHESIZED_WIRE_15,
		 remote => remote,
		 local => local,
		 door_state => door,
		 sp => SYNTHESIZED_WIRE_12,
		 rt => SYNTHESIZED_WIRE_7,
		 load => SYNTHESIZED_WIRE_4,
		 en_count => SYNTHESIZED_WIRE_16,
		 led_door => led_door,
		 speed_high => SYNTHESIZED_WIRE_13,
		 speed_low => SYNTHESIZED_WIRE_14);


b2v_inst1 : dsf_timer
PORT MAP(clk => SYNTHESIZED_WIRE_1,
		 trig => trigger,
		 buz => buzzer);


b2v_inst10 : lpm_counter0
PORT MAP(clock => SYNTHESIZED_WIRE_15,
		 cnt_en => SYNTHESIZED_WIRE_16,
		 q => SYNTHESIZED_WIRE_11);


b2v_inst2 : dsf_shiftregister
PORT MAP(load => SYNTHESIZED_WIRE_4,
		 clk => SYNTHESIZED_WIRE_15,
		 data => SYNTHESIZED_WIRE_6,
		 speed_register => SYNTHESIZED_WIRE_10);


b2v_inst3 : demux_rotation
PORT MAP(selectRot => SYNTHESIZED_WIRE_7,
		 enable_rot => SYNTHESIZED_WIRE_16,
		 in0 => in0,
		 in1 => in1);


b2v_inst4 : comparador_e
PORT MAP(en => SYNTHESIZED_WIRE_16,
		 a => SYNTHESIZED_WIRE_10,
		 b => SYNTHESIZED_WIRE_11,
		 ls => duty_cycle);


b2v_inst5 : div_freq
PORT MAP(clk_50MHz => clk_fpga,
		 clk_1KHz => SYNTHESIZED_WIRE_1,
		 clk_30KHz => SYNTHESIZED_WIRE_15);


b2v_inst9 : lpm_mux0
PORT MAP(sel => SYNTHESIZED_WIRE_12,
		 data0x => SYNTHESIZED_WIRE_13,
		 data1x => SYNTHESIZED_WIRE_14,
		 result => SYNTHESIZED_WIRE_6);


END bdf_type;