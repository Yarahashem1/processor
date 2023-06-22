
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_Control_VHDL is
port(
  ALUOp : in std_logic_vector(1 downto 0);
  ALU_Control: out std_logic_vector(1 downto 0);
  ALU_scr : out std_logic;  --MUX 2
  ALU_des : out std_logic    --MUX 1
);
end ALU_Control_VHDL;

architecture Behavioral of ALU_Control_VHDL is
begin

with ALUOp select
ALU_Control<= "00" when"00",
        "01" when"01",
         "10" when"10",
          "11" when others;	
		

with ALUOp select
ALU_scr<= '1' when"11",
         '0' when others;


with ALUOp select
ALU_des<= '1' when"11",
         '0' when others;			
   
end Behavioral;