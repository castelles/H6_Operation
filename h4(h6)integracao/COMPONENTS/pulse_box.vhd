library ieee;
use ieee.std_logic_1164.all;

entity pulse_box is
	port (
			clk        : in std_logic;
			eot   	  : in std_logic;
			trig_pulse : buffer std_logic
	);
end pulse_box;

architecture arch of pulse_box is
begin	
	process(clk,eot)
	begin
		if clk'event and clk = '0' and eot = '1' then 
			trig_pulse <= '1';
		elsif clk'event and clk = '0' and trig_pulse = '1' then
			trig_pulse <= '0';
		end if;
	end process;
end arch;