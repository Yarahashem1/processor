--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity sign_extend is
	port ( 
		
		data_in: std_logic_vector(1 downto 0);
		data_out : out std_logic_vector(7 downto 0)
); 
 end sign_extend;


architecture sign_extend_struc of sign_extend is
	begin
    data_out<= "000000" & data_in;

end sign_extend_struc;