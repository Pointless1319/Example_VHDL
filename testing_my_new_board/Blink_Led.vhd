----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 03:14:23 PM
-- Design Name: 
-- Module Name: Blink_Led - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Blink_Led is
    Generic(
        NUM_LEDS        : integer := 4; --number of LEDs
        CLK_RATE        : integer := 100000000;
        BLINK_RATE      : integer := 2
    );
    Port ( 
        Led_Out         : out std_logic_vector (NUM_LEDS -1 downto 0);
        Clk             : in std_logic;
        Reset           : in std_logic --Active low    
    );
end Blink_Led;

architecture Behavioral of Blink_Led is

-- Calculate blinking
constant MAX_VAL : integer := CLK_RATE/BLINK_RATE;

constant BIT_DEPTH : integer := integer(ceil(log2(real(MAX_VAL))));

signal count_reg : unsigned(BIT_DEPTH -1 downto 0) := (others => '0');

signal led_reg  : std_logic_vector (NUM_LEDS -1 downto 0) := "0000";

begin

Led_Out <= led_reg;

-- process that incremets the counter
count_proc: process(Clk)
begin
    if rising_edge(Clk) then
        if(Reset = '0') or (count_reg = MAX_VAL) then
            count_reg <= (others => '0');
        else
            count_reg <= count_reg +1;
        end if;
    
    end if;
end process count_proc;

--process that will toggle the Led_out everytime it hits max value
output_proc: process(Clk)
begin
    if (rising_edge(clk)) then
        if(count_reg = MAX_VAL) then
            led_reg <= NOT led_reg;
        end if;
    end if;
end process output_proc;


end Behavioral;
