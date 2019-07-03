use ieee.std_logic_1164.all;

entity pulse_box is
	port (
			clk        : in std_logic;
			eot   	  : in std_logic;
			trig_pulse 	  : buffer std_logic
	);
end pulse_box;

architecture arch of pulse_box is
begin
	process(clk,eot)
	variable charged : boolean := false;
	begin
		if clk'event and clk = '0' and eot = '0' then
			charged := false;
		end if;

		if clk'event and clk = '0' and eot = '1' and charged = false then
			trig_pulse <= '1';
			charged := true;
		elsif clk'event and clk = '0' and charged = true then
			trig_pulse <= '0';
		end if;
	end process;
end arch;
