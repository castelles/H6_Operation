library ieee;
use ieee.std_logic_1164.all;

entity div_freq_1KHz is
	port (
			clk_50MHz  : in std_logic;	
			clk_1KHz	  : buffer std_logic := '0'
	);
end div_freq_1KHz;

architecture arch of div_freq_1KHz is
begin
	process(clk_50MHz)
	variable c_1KHz  : integer range 0 to 50000 := 0;
	begin
	
		if rising_edge(clk_50MHz) then
			c_1KHz  := c_1KHz  + 1;
		
			if c_1KHz >= 50000 then
				clk_1KHz <= not clk_1KHz;
				c_1KHz := 0;
			end if;
		
		end if;
	end process;
end arch;