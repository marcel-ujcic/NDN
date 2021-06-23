----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:21:07 05/21/2021 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_divider is
Generic ( divider : natural := 10417);
    Port ( CLK,RST : in  STD_LOGIC;
           CE : out STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
	 SIGNAL counter:STD_LOGIC_VECTOR(12 downto 0);
	 signal rest:STD_LOGIC;

begin

process(CLK)
	begin
		if rising_edge(CLK) then
			
			if RST='1' then
				counter <= (others => '0');
			elsif counter = divider - 1 then
					counter <=(others => '0');
			else
				counter <= counter + 1;
			end if;
		end if;

end process;

CE <= '1' when counter= divider else '0';


end Behavioral;

