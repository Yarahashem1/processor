--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc is
	port ( 
		clk: in std_logic;
       next_instr: out std_logic_vector(2 downto 0)
); 
 end pc;


architecture pc_struc of pc is
-- to read old pc
  signal current:std_logic_vector(2 downto 0):="000";
	begin
	process(clk)   --synch
	begin
	
	if(falling_edge(clk)) then 
	
	current<=std_logic_vector(unsigned(current)+to_unsigned(1,3));
	end if;
	
	end process;
	 next_instr<=current;
	
end pc_struc;