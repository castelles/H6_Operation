library ieee;
use ieee.std_logic_1164.all;

entity c_decoder is
	port (
			c2       : in std_logic_vector(3 downto 0);
			c3	  	   : in std_logic_vector(3 downto 0);
			c8   	   : in std_logic_vector(3 downto 0);
			c9			: in std_logic_vector(3 downto 0);
			cooking	: out BIT
	);
end c_decoder;

architecture arch of c_decoder is
begin
	
end arch;