----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:33 04/12/2021 
-- Design Name: 
-- Module Name:    LFSR - Behavioral 
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LFSR is
    Port ( CLK, CE, data_in, RST : in  STD_LOGIC;
           REG_OUT : out  STD_LOGIC_VECTOR (15 downto 0));
end LFSR;

architecture Behavioral of LFSR is
	signal lfsr_reg: STD_LOGIC_VECTOR(15 downto 0);
	--signal xor_in: STD_LOGIC;

begin

	process(CLK)
		begin
		if rising_edge(CLK)then
				if RST='1' then 
					lfsr_reg <= (others=> '1');
				elsif CE ='1' then
					
					lfsr_reg(0) <= lfsr_reg(15) xor data_in;
					lfsr_reg(1) <= lfsr_reg(0);
					lfsr_reg(2) <= lfsr_reg(1);
					lfsr_reg(3) <= lfsr_reg(2);
					lfsr_reg(4) <= lfsr_reg(3);
					lfsr_reg(5) <= lfsr_reg(4) xor lfsr_reg(15) xor data_in;
					
					lfsr_reg(6) <= lfsr_reg(5);
					lfsr_reg(7) <= lfsr_reg(6);
					lfsr_reg(8) <= lfsr_reg(7);
					lfsr_reg(9) <= lfsr_reg(8);
					lfsr_reg(10) <= lfsr_reg(9);
					lfsr_reg(11) <= lfsr_reg(10);
					lfsr_reg(12) <= lfsr_reg(11) xor lfsr_reg(15) xor data_in;
					
					lfsr_reg(13) <= lfsr_reg(12);
					lfsr_reg(14) <= lfsr_reg(13);
					lfsr_reg(15) <= lfsr_reg(14);
					
				end if;
			end if;
		end process;
		REG_OUT <= lfsr_reg;

end Behavioral;

