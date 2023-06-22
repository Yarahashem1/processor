--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux1 is
	port ( 
		sel: in std_logic;
		a,b: std_logic_vector(1 downto 0);
		F : out std_logic_vector(1 downto 0)
); 
 end mux1;


architecture mux1_struc of mux1 is
	begin
	process(sel,a,b) 
 begin
 if(sel ='0') then    -- store in B instead of c
   f<=a;
	else               --store in c
	f<=b;
   
 end if;
 end process;

end mux1_struc;