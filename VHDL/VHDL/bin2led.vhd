library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin2led is
Port (	BIN : in STD_LOGIC_VECTOR (3 downto 0);
		DIGIT : in  STD_LOGIC_VECTOR (7 downto 0);
		LED : out  STD_LOGIC_VECTOR (6 downto 0);
		nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end bin2led;

architecture arch of bin2led is
begin
		LED <= "1000000" when  BIN = "0000" else
						   "1111001" when  BIN = "0001" else
						   "0100100" when BIN =  "0010" else
							"0110000" when BIN = "0011" else
						   "0011001" when BIN =  "0100" else
							"0010010" when BIN =  "0101" else
							"0000010" when BIN =  "0110" else
							"1111000" when BIN =  "0111" else
							"0000000" when BIN =  "1000" else
							"0010000" when BIN =  "1001" else
							"0001000" when BIN =  "1010" else
							"0000011" when BIN =  "1011" else
							"1000110" when BIN =  "1100" else
							"1000110" when BIN =  "1101" else
							"0100001" when BIN =  "1110" else
							"0001110" when BIN =  "1111" ;
							
				nDIGIT <= NOT DIGIT;




end arch;