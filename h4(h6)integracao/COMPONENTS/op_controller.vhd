library ieee;
use ieee.std_logic_1164.all;

entity op_controller is
	port(
			en4	      : in std_logic;   -- aciona o controlador
			clk         : in std_logic;   
			remote      : in std_logic;   --definido como chave apenas para teste
			local       : in std_logic;	--definido como chave apenas para teste
			door_state	: in std_logic;	-- estado da porta que passa direto pro sinal de saída led_door
			sp 			: out std_logic;  -- define a velocidade
			rt				: out std_logic;  -- define a rotacao
			load   		: out std_logic;  -- carrega o valor da velocidade no registrador
			en_count		: out std_logic;
			speed_low   : out std_logic_vector(7 downto 0) := "01100110";
			speed_high  : out std_logic_vector(7 downto 0) := "11111111";
			led_enable  : out std_logic := '0'; -- led acende quando o microondas estiver ligado
			led_door		: out std_logic   -- led acende quando a porta estiver aberta
		 );
end op_controller;

architecture arq1 of op_controller is
	TYPE State_type IS (standby, hold, set_speed, power_engine);
	signal state_controller : State_type := standby;

begin
		process(clk,en4)
		begin
			if en4 = '0' then
				state_controller <= standby;
				led_enable <= '0';
			elsif rising_edge(clk) then    -- MUDAR PARA BORDA DE DESCIDA!!!!!!!!!
				led_door <= door_state;
				case state_controller is   
					
					when standby => if en4 = '1' and  remote = '0' and local = '0' then    
											sp <= '0';														  
											rt <= '0';														  
											load <= '0';													  
											en_count <= '0';
											led_enable <= '1';
											state_controller <= hold;
										 elsif en4 = '1' and  remote = '1' and local = '0' then
											sp <= '1';
											rt <= '1';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
										 elsif en4 = '1' and remote = '0' and local = '1' then
											sp <= '0';
											rt <= '0';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;	
										 end if;
										 
					when hold => if en4 = '1' and  remote = '1' and local = '0' then
											sp <= '1';
											rt <= '1';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
									 elsif en4 = '1' and remote = '0' and local = '1' then
											sp <= '0';
											rt <= '0';
											load <= '1';
											en_count <= '0';
											led_enable <= '1';
											state_controller <= set_speed;
									elsif en4 = '1' and remote = '0' and local = '0' then
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											led_enable <= '1';
									 elsif en4 = '0' then 
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											led_enable <= '0';
											state_controller <= standby;
									 end if;
					
					when set_speed => en_count <= '1';
											state_controller <= power_engine;
											
					when power_engine => load <='0';                    
												if en4 = '0' then
													sp <= '0';
													rt <= '0';
													load <= '0';
													en_count <= '0';
													led_enable <= '1';
													state_controller <= standby;
												end if;
				 end case;
			end if;
		end process;
end arq1;