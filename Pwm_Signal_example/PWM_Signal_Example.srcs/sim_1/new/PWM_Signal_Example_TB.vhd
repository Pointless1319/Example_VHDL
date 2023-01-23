-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PWM_Signal_Example_tb is
end;

architecture bench of PWM_Signal_Example_tb is

  component PWM_Signal_Example
      Generic(
          BIT_DEPTH   : integer := 8;
          INPUT_CLK   : integer := 50000000;
          FREQ        : integer := 50
      );
      Port (
          Pwm_Out     : out std_logic;
          Duty_Cycle  : in std_logic_vector(BIT_DEPTH - 1 downto 0);
          Clk         : in std_logic;
          Enable      : in std_logic
       );
  end component;

  signal Pwm_Out: std_logic;
  signal Duty_Cycle: std_logic_vector(BIT_DEPTH - 1 downto 0);
  signal Clk: std_logic;
  signal Enable: std_logic ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: PWM_Signal_Example generic map ( BIT_DEPTH  => ,
                                        INPUT_CLK  => ,
                                        FREQ       =>  )
                             port map ( Pwm_Out    => Pwm_Out,
                                        Duty_Cycle => Duty_Cycle,
                                        Clk        => Clk,
                                        Enable     => Enable );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;