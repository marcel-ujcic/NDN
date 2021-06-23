library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity digit_selector is
    Port ( SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           T,S,D,E : in  STD_LOGIC_VECTOR (3 downto 0);
           CODE : out  STD_LOGIC_VECTOR (3 downto 0));
end digit_selector;

architecture Behavioral of digit_selector is

begin
	CODE <=   E when SEL = "0001" else
				 D when SEL = "0010" else
				 S when SEL = "0100" else
				 T;
		
end Behavioral;

