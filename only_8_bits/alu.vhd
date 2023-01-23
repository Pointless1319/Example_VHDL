library library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port(
        clk : in std_logic;
        rst : in std_logic;
        a_input : in std_logic_vector(7 downto 0);
        b_input : in std_logic_vector(7 down to 0);
        control : in std_logic_vector(3 downto 0);
        r_output : out std_logic_vector(7 downto 0)
    );
end alu;

architecture behaviore of alu is
        signal clear_flag : std_logic;
        signal zero_flag : std_logic;
    begin  
        case 



    