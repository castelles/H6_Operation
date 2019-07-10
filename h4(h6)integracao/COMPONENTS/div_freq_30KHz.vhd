library ieee;
use ieee.std_logic_1164.all;

entity div_freq_30KHz is
	port (
			clk_50MHz  : in std_logic;	
			clk_30KHz  : buffer std_logic := '0'
	);
end div_freq_30KHz;

architecture arch of div_freq_30KHz is
begin
	process(clk_50MHz)
	variable c_30KHz : integer range 0 to 1670  := 0;
	begin
	
		if rising_edge(clk_50MHz) then
			c_30KHz := c_30KHz + 1;
		
			if c_30KHz >= 1670 then
				clk_30KHz <= not clk_30KHz;
				c_30KHz := 0;
			end if;

		end if;
	end process;
end arch;