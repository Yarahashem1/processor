library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

entity Instruction_Memory is
port (
 instruc_add: in std_logic_vector(2 downto 0);
  op: out std_logic_vector(1 downto 0);
   A_address: out std_logic_vector(1 downto 0);
	 B_address: out std_logic_vector(1 downto 0);
	  c_address: out std_logic_vector(1 downto 0)
 
);
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is

 
 type ROM_type is array (0 to 7 ) of std_logic_vector(7 downto 0);
 constant rom_data: ROM_type:=(
    "11000101",
   "10000001",
	"00101100",
   "00010001",
   "11101101",
   "11000000",
   "00000000",
   "00001000"
  );
begin

 op<=rom_data(to_integer(unsigned(instruc_add))) (7 downto 6);
 A_address<=rom_data(to_integer(unsigned(instruc_add))) (5 downto 4);
 B_address<=rom_data(to_integer(unsigned(instruc_add))) (3 downto 2);
 c_address<=rom_data(to_integer(unsigned(instruc_add))) (1 downto 0);

end Behavioral;