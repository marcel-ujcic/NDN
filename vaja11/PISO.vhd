----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:29 05/21/2021 
-- Design Name: 
-- Module Name:    PISO - Behavioral 
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

entity PISO is
    Port ( RST,CLK,SE, LOAD : in  STD_LOGIC;
           PARALLEL_IN : in  STD_LOGIC_VECTOR (9 downto 0);
           SERIAL_OUT : out  STD_LOGIC);
end PISO;

architecture Behavioral of PISO is
	signal position : STD_LOGIC_VECTOR(4 downto 0);
	signal q:STD_LOGIC_VECTOR(9 downto 0);
begin
	process(CLK)
		begin
			if rising_edge(CLK) then
				if RST='1' then
					q <= (others => '1');
					
				elsif LOAD ='1' then
					q <= PARALLEL_IN;
				elsif SE ='1' then
					q<= '1' & q(9 downto 1);
				end if;
			end if;
		end process;			
		SERIAL_OUT <= q(0);
	

end Behavioral;

