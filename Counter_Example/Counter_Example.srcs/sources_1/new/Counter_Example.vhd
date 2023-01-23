----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/23/2022 01:41:45 PM
-- Design Name: 
-- Module Name: Counter_Example - Behavioral
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
use IEEE.math_real.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_Example is
    Generic(
        MAX_VAL     : integer := 2**30;
        SYN_RESET   : boolean := true
    );
    Port (
        Max_count   : out std_logic;
        Clk         : in std_logic;
        Reset       : in std_logic
    );
end Counter_Example;

architecture Behavioral of Counter_Example is

    constant bit_depth  : integer := integer(ceil(log2(real(MAX_VAL))));
    signal Count_reg    : unsigned(bit_depth - 1 downto 0) := (others => '0');
    
begin
    sync_rst: if SYN_RESET = true generate
        Count_proc: process(Clk)
        begin
            if rising_edge(Clk) then
                if(Reset = '1') or (Count_reg = MAX_VAL) then
                    Count_reg <= (others => '0');
                else
                    Count_reg <= Count_reg +1;
                end if;
            end if;
        end process;
    end generate;
    async_rst: if SYN_RESET = false generate
        Count_proc: process(Clk,Reset)
        begin
            if(Reset = '0') then
                Count_reg <= (others => '0');
            elsif rising_edge(Clk) then
                if(Count_reg = MAX_VAL) then
                    Count_reg <= (others => '0');
                else
                    Count_reg <= Count_reg +1;
                end if;
            end if;
        end process;
    end generate;
    
    output_proc: process(Count_reg)
    begin
        Max_Count <= '0';
        if(Count_reg = MAX_VAL) then
            Max_count <= '1';
        end if;
    end process;
    
end Behavioral;
