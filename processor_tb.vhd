library ieee; 
use ieee.std_logic_1164.all; 
entity processor_tb is 
end processor_tb; 


architecture TB_ARCHITECTURE of processor_tb is
component processor is
	port ( 
	 clk: in std_logic;
 result: out std_logic_vector(7 downto 0)
); 
end component;
 signal clk: std_logic;
 signal result : std_logic_vector(7 downto 0);
begin
-- Design Under Unit Test (UUT) port map
uut: processor
port map(
clk,result
);
-- your stimulus here ...
stim: process -- no sensitivity list found! Why?
begin 

clk <= '1';  wait for 20 ns; 
clk <= '0'; wait for 20 ns; 
clk <= '1';  wait for 20 ns; 
clk <= '0'; wait for 20 ns; 
clk <= '1';  wait for 20 ns; 
clk <= '0'; wait for 20 ns; 
wait; 
end process stim;
 end TB_ARCHITECTURE;
