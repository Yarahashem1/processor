--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
	port ( 
		A, B : in std_logic_vector(7 downto 0);
		c: std_logic_vector(1 downto 0);-- type of op
		F : out std_logic_vector(7 downto 0)
); 
 end ALU;


architecture alu1_struc of ALU is
	begin
		F <= 
		std_logic_vector(unsigned(A) +unsigned(B) ) when c="00" else
		std_logic_vector(unsigned(A) -unsigned(B) ) when c="01" else
		A and B when c="10" else
		std_logic_vector(unsigned(A) +unsigned(B) ) when c="11" else
		(others=>'0');
end alu1_struc;