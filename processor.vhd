--yara hashem madi 220192604
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity processor is
	port ( 
	 clk: in std_logic;
 result: out std_logic_vector(7 downto 0)
); 
 end processor;


architecture processor_struc of processor is
  component ALU
  	port ( 
		A, B : in std_logic_vector(7 downto 0);
		c: std_logic_vector(1 downto 0);
		F : out std_logic_vector(7 downto 0)
);
end component;



component ALU_Control_VHDL 
port(
  ALUOp : in std_logic_vector(1 downto 0);
  ALU_Control: out std_logic_vector(1 downto 0);
  ALU_scr : out std_logic;
  ALU_des : out std_logic
);
end component;



 component pc 
	port ( 
		clk: in std_logic;
       next_instr: out std_logic_vector(2 downto 0)
); 
 end component;
 
 
 
 component Instruction_Memory
port (
 instruc_add: in std_logic_vector(2 downto 0);
  op: out std_logic_vector(1 downto 0);
   A_address: out std_logic_vector(1 downto 0);
	 B_address: out std_logic_vector(1 downto 0);
	  c_address: out std_logic_vector(1 downto 0)
 
);
end component;




component register_file 
port (
 clk: in std_logic;
 reg_write_dest_C: in std_logic_vector(1 downto 0);
 reg_write_data_C: in std_logic_vector(7 downto 0);
 reg_read_addr_A: in std_logic_vector(1 downto 0);
 reg_read_data_A: out std_logic_vector(7 downto 0);
 reg_read_addr_B: in std_logic_vector(1 downto 0);
 reg_read_data_B: out std_logic_vector(7 downto 0)
);
end component;


component mux1 
	port ( 
		sel: in std_logic;
		a,b: std_logic_vector(1 downto 0);
		F : out std_logic_vector(1 downto 0)
); 
 end component;
 
 
 component mux2 
	port ( 
		sel: in std_logic;
		a,b: std_logic_vector(7 downto 0);
		F : out std_logic_vector(7 downto 0)
); 
 end component;
 
 
 
 component sign_extend 
	port ( 
		
		data_in: std_logic_vector(1 downto 0);
		data_out : out std_logic_vector(7 downto 0)
); 
 end component;
 
 
 signal s0:std_logic_vector(2 downto 0);
  signal s1,s2,s3,s4,s5:std_logic_vector(1 downto 0);
   signal sel0,sel1:std_logic;
    signal mu1:std_logic_vector(1 downto 0);
	  signal mu2,sign,regA,regB,regC:std_logic_vector(7 downto 0);
	  
	begin
	
	pc_unit:pc port map(clk,s0);
	IM_unit:Instruction_Memory port map (s0,s1,s2,s3,s4);
	control_unit:ALU_Control_VHDL  port map(s1,s5,sel1,sel0); 
	mux1_unit:mux1 port map(sel0,s4,s3,mu1);
	signextend_unit: sign_extend port map (s4,sign);
	registerfile_unit:register_file  port map(clk,mu1,regC,s2,regA,s3,regB);  --regc
	mux2_unit:mux2 port map(sel1,regB,sign,mu2);
	alu_unit:ALU port map (regA,mu2,s5,regc);
	
	result<=regc;
	
end processor_struc;