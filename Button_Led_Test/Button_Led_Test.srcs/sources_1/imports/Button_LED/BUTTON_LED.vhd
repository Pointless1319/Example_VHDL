-------------------------------------------------------------------------------
-- COMPANY: 	 FEDEVEL
--
-- ENGINEER:	 Jordan Christman
--
-- MODULE NAME:  BUTTON_LED
--
-- DESCRIPTION:  This design will light up the onboard LED's when the specific
--				 button has been pressed. If the input 'Enable' signal is '0'
--				 then the button presses will effect the output on the LEDs.
--				 Otherwise the LED's will not light up.
--
-- REVISION:	 1.0 - 11/20/2017 File Created.
--
-- COMMENTS:	 The Button Inputs will correspond to LED outputs as shown
--				 below:
--				 Button_In(0) --> Led_Out(0)
--				 Button_In(1) --> Led_Out(1)
--				 Button_In(n) --> Led_Out(n)
--
--				 To change which buttons set which LEDs, the constraints / pin
--				 mapping file will need to be modified.
-------------------------------------------------------------------------------

-- Libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity
entity BUTTON_LED is
	Generic (
		NUM_BUTTONS 	: integer := 4);		
	Port (
		Led_Out			: out std_logic_vector(NUM_BUTTONS - 1 downto 0);
		Button_In		: in std_logic_vector(NUM_BUTTONS - 1 downto 0);
		Enable			: in std_logic);	-- Active Low
end BUTTON_LED;

-- Architecture
architecture behavior of BUTTON_LED is
	
begin
	-- Set output of LED's
	Led_Out <= Button_In when Enable = '0' else (others => '0');

end behavior;
