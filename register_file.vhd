library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  
-- VHDL code for the register file of the MIPS Processor
entity register_file is
port (
 clk: in std_logic;
 reg_write_dest_C: in std_logic_vector(1 downto 0);--address of result
 reg_write_data_C: in std_logic_vector(7 downto 0);-- result of ALU
 reg_read_addr_A: in std_logic_vector(1 downto 0);
 reg_read_data_A: out std_logic_vector(7 downto 0);
 reg_read_addr_B: in std_logic_vector(1 downto 0);
 reg_read_data_B: out std_logic_vector(7 downto 0)
);
end register_file;

architecture Behavioral of register_file is
type reg_type is array (0 to 3 ) of std_logic_vector (7 downto 0);
signal reg_array: reg_type:=(
 "10000001",   --11010101   /
   "00101100", --10000010  / 10000001 /01010110
   "11000100",   
   "00010001"
);
begin
 process(clk) 
 begin
 if(falling_edge(clk)) then
   
    reg_array(to_integer(unsigned(reg_write_dest_C))) <= reg_write_data_C;
   
 end if;
 end process;

 reg_read_data_A <= reg_array(to_integer(unsigned(reg_read_addr_A)));
 reg_read_data_B <=  reg_array(to_integer(unsigned(reg_read_addr_B)));

end Behavioral;