----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:31 04/06/2021 
-- Design Name: 
-- Module Name:    DEBOUNCE - Behavioral 
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

entity DEBOUNCE is
	Generic ( deltaT : natural := 500000);
    Port ( CLK : in  STD_LOGIC;
           BTN : in  STD_LOGIC;
           PULSE : out  STD_LOGIC);
end DEBOUNCE;

architecture Behavioral of DEBOUNCE is
signal q:STD_LOGIC_VECTOR(18 downto 0):= (others => '0');
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if BTN = '0' then
				q <=(others => '0');
			elsif q /= deltaT-1 then
				q <= q + 1;
			end if;
		end if;
	end process;
		PULSE <= '1' when q = deltaT - 1 else '0';
end Behavioral;

