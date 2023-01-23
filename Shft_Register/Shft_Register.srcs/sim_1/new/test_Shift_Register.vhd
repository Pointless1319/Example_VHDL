----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2022 09:23:16 AM
-- Design Name: 
-- Module Name: test_Shift_Register - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_Shift_Register is
--  Port ( );
end test_Shift_Register;

architecture Behavioral of test_Shift_Register is
    component Shft_Register
    Port (
          data_in : in std_logic;
          clk     : in std_logic;
          rst     : in std_logic;
          A_out   : out std_logic;
          B_out   : out std_logic;  
          C_out   : out std_logic;  
          D_out   : out std_logic    
     );
  end component;
  
  signal data_in: std_logic := '0';
  signal clk: std_logic := '1';
  signal rst: std_logic := '0';
  signal A_out: std_logic;
  signal B_out: std_logic;
  signal C_out: std_logic;
  signal D_out: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin
    uut: Shft_Register port map ( data_in => data_in,
                                clk     => clk,
                                rst     => rst,
                                A_out   => A_out,
                                B_out   => B_out,
                                C_out   => C_out,
                                D_out   => D_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 40 ns;
    data_in <= not data_in;
    wait for 150 ns;

    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end Behavioral;
