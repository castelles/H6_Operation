library ieee;
use ieee.std_logic_1164.all;

entity dsf_timer is
	port (
			clk       : in std_logic;
			trig   	 : in std_logic;
			buz   	 : out std_logic
	);
end dsf_timer;

architecture arch of dsf_timer is
signal buz_output : std_logic := '0';

begin
	process(clk)
	variable counter : integer range 0 to 1000 := 0;
		begin
			if rising_edge(clk) then
				if trig = '1' then
					buz_output <= '1';
				end if;
				if buz_output = '1' and counter < 1000 then
					counter := counter + 1;
				elsif buz_output = '1' and counter >= 1000 then
					counter := 0;
					buz_output <= '0';
				end if;
			end if;
		buz <= buz_output;
		end process;
end arch;