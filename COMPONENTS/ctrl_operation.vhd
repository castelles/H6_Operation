library ieee;
use ieee.std_logic_1164.all;

entity ctrl_operation is
	port (
			clk       	 : in std_logic;
			eot   	 	 : in std_logic;	  -- vem do temporizador da H5
			start2   	 : in std_logic;    -- vem da edicao 
			cancel2		 : in std_logic;	  -- vem da edicao
			c2,c3,c8,c9	 : in std_logic_vector(3 downto 0);  -- tipos de cozimento
			en6,en4		 : out std_logic;   -- en4 liga o controlador do motor
													  -- en6 conecta no temporizador da temporizacao (H5)
			rst			 : out std_logic;	  -- rst conecta no temporizador da temporizacao (H5)
			int 			 : out std_logic;	  -- pwm
			o7				 : out std_logic;   -- conecta no dec. operacao do lcd (H1)
			sent6			 : out std_logic;	  -- sent6 na H4
			trig			 : out std_logic;	  -- dispara o buzz
			led			 : out BIT
	);
end ctrl_operation;

architecture arch of ctrl_operation is
begin

end arch;
