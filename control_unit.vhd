library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
    Port ( opcode      : in  std_logic_vector(3 downto 0);
           alu_op      : out std_logic_vector(2 downto 0);
           mem_write   : out std_logic;
           mem_read    : out std_logic;
           reg_write   : out std_logic;
           reg_dest    : out std_logic;
           mem_to_reg  : out std_logic;
           branch      : out std_logic;
           alu_src     : out std_logic);
end control_unit;

architecture Behavioral of control_unit is
begin
    process (opcode)
    begin
        case opcode is
            when "0000" =>  -- Load immediate
                alu_op     <= "000";
                mem_write  <= '0';
                mem_read   <= '0';
                reg_write  <= '1';
                reg_dest   <= '1';
                mem_to_reg <= '0';
                branch     <= '0';
                alu_src    <= '1';
            when "0001" =>  -- Add
                alu_op     <= "000";
                mem_write  <= '0';
                mem_read   <= '0';
                reg_write  <= '1';
                reg_dest   <= '1';
                mem_to_reg <= '0';
                branch     <= '0';
                alu_src    <= '0';
            when "0010" =>  -- Subtract
                alu_op     <= "001";
                mem_write  <= '0';
                mem_read   <= '0';
                reg_write  <= '1';
                reg_dest   <= '1';
                mem_to_reg <= '0';
                branch     <= '0';
                alu_src    <= '0';
            when "0011" =>  -- Load from memory
                alu_op     <= "000";
                mem_write  <= '0';
                mem_read   <= '1';
                reg_write  <= '1';
                reg_dest   <= '1';
                mem_to_reg <= '1';
                branch     <= '0';
                alu_src    <= '1';
            when "0100" =>  -- Store to memory
                alu_op     <= "000";
                mem_write  <= '1';
                mem_read   <= '0';
                reg_write  <= '0';
                reg_dest   <= '0';
                mem_to_reg <= '0';
                branch     <= '0';
                alu_src    <= '1';
            when "0101" =>  -- Branch if zero
                alu_op     <= "000";
                mem_write  <= '0';
                mem_read   <= '0';
                reg_write  <= '0';
                reg_dest   <= '0';
                mem_to_reg <= '0';
                branch     <= '1';
                alu_src    <= '1';
            when others =>  -- Invalid opcode
                alu_op     <= "000";
                mem_write  <= '0';
                mem_read   <= '0';
                reg_write  <= '0';
                reg_dest   <= '0';
                mem_to_reg <= '0';
                branch     <= '0';
                alu_src    <= '0';
        end case;
    end process;
end Behavioral;