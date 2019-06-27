LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY debouncer IS
  GENERIC(
    counter_size  :  INTEGER := 19); --Tamanho do Contador (19 bits duram cerca de 10.5ms em 50MHz de clock)
  PORT(
    clk     : IN  STD_LOGIC; 
    button  : IN  STD_LOGIC;  --Sinal de entrada do botão
    result  : OUT STD_LOGIC); --Sinal de saida filtrado
END debouncer;

ARCHITECTURE logic OF debouncer IS
  SIGNAL flipflops   : STD_LOGIC_VECTOR(1 DOWNTO 0); --input flip flops
  SIGNAL counter_set : STD_LOGIC;                    --sync reset to zero
  SIGNAL counter_out : STD_LOGIC_VECTOR(counter_size DOWNTO 0) := (OTHERS => '0'); --counter output
BEGIN

  counter_set <= flipflops(0) xor flipflops(1);   --determina quando iniciar/zerar a contagem
  
  PROCESS(clk)
  BEGIN
    IF(clk'EVENT and clk = '1') THEN
      flipflops(0) <= button;
      flipflops(1) <= flipflops(0);
      If(counter_set = '1') THEN                  --zera a contagem porque o sinal do botão está variando
        counter_out <= (OTHERS => '0');
      ELSIF(counter_out(counter_size) = '0') THEN --ruído do botão ainda ativo
        counter_out <= counter_out + 1;
      ELSE                                        --ruído do botão terminou
        result <= flipflops(1);
      END IF;    
    END IF;
  END PROCESS;
END logic;