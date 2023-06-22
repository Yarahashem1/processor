--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux2 is
	port ( 
		sel: in std_logic;
		a,b: std_logic_vector(7 downto 0);
		F : out std_logic_vector(7 downto 0)
); 
 end mux2;


architecture mux2_struc of mux2 is
	begin
	process(sel,a,b) 
 begin
 if(sel ='0') then     -- add B
   f<=a;
	else                -- add c after sign extention
	f<=b;
   
 end if;
 end process;

end mux2_struc;