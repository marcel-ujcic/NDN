----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:00 05/28/2021 
-- Design Name: 
-- Module Name:    SIPO - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIPO is
    Port ( CLK,RST,SE : in  STD_LOGIC;
           SERIAL_IN : in  STD_LOGIC;
           PARALEL_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end SIPO;

architecture Behavioral of SIPO is
	signal position : STD_LOGIC_VECTOR(4 downto 0);
	signal q:STD_LOGIC_VECTOR(7 downto 0);
begin
	process(CLK)
		begin
			if rising_edge(CLK) then
				if RST='1' then
					q <= (others => '1');
				elsif SE ='1' then
					q<= SERIAL_IN & q(7 downto 1);
				end if;
			end if;
		end process;			
		PARALEL_OUT <= q;
end Behavioral;




