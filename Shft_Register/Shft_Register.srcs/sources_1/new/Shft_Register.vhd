----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2022 01:16:00 PM
-- Design Name: Shft_Register
-- Module Name: Shft_Register - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shft_Register is
  Port (
        data_in : in std_logic;
        clk     : in std_logic;
        rst     : in std_logic;
        A_out   : out std_logic;
        B_out   : out std_logic;  
        C_out   : out std_logic;  
        D_out   : out std_logic    
   );
end Shft_Register;

architecture Behavioral of Shft_Register is
-- define signals
signal A_reg, B_reg : std_logic := '0';
signal C_reg, D_reg : std_logic := '0';
begin
    -- signal assingments
    A_out <= A_reg;
    B_out <= B_reg;
    C_out <= C_reg;
    D_out <= D_reg;  
    
    -- process for shifting values
    reg_process: process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                A_reg <= '0';
                B_reg <= '0';
                C_reg <= '0';
                D_reg <= '0';
            else
                A_reg <= data_in;
                B_reg <= A_reg;
                C_reg <= B_reg;
                D_reg <= C_reg;
                
            end if;
        end if;
    
    end process reg_process;


end Behavioral;
