----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:07 04/06/2021 
-- Design Name: 
-- Module Name:    UDCOUNTER - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UDCOUNTER is
    Port ( CLK, RST, UP, DOWN : in  STD_LOGIC;
           CTR : out  STD_LOGIC_VECTOR (7 downto 0));
end UDCOUNTER;

architecture Behavioral of UDCOUNTER is
 signal c:STD_LOGIC_VECTOR(7 downto 0):= x"00";
 signal U:STD_LOGIC;
 signal D:STD_LOGIC;
begin
		
		process(CLK)
		begin
			if rising_edge(CLK) then
				if RST = '1' then
					c <= x"00";
				elsif (UP = '1') then
					
					c <= c + 1;
				elsif (UP='0') AND (DOWN = '1') then  
					c <= c -1;
				end if;
			end if;
		end process;
		CTR <= c;

end Behavioral;

