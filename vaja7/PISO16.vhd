----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:59:52 04/21/2021 
-- Design Name: 
-- Module Name:    PISO16 - Behavioral 
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
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PISO16 is
    Port ( CLK, CE, RST : in  STD_LOGIC;
           SERIAL_IN : in  STD_LOGIC;
           PARALLEL_IN : in  STD_LOGIC_VECTOR (15 downto 0);
           PARALLEL_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           SERIAL_OUT : out  STD_LOGIC;
           DONE : out  STD_LOGIC);
end PISO16;

architecture Behavioral of PISO16 is
	signal position : STD_LOGIC_VECTOR(4 downto 0);
	signal q:STD_LOGIC_VECTOR(15 downto 0);
begin

 process(CLK)
	begin
		if rising_edge(CLK) then
			if RST='1' then
				position <= (others => '0');
				q <= PARALLEL_IN;
			elsif CE ='1' then
				q <= q(14 downto 0) & SERIAL_IN;
				position <= position + 1;
			end if;
		end if;
	end process;			
	SERIAL_OUT <= q(15);
	DONE <= '1' when position = 16 else '0'; 

end Behavioral;

