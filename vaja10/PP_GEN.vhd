----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:23:35 05/13/2021 
-- Design Name: 
-- Module Name:    PP_GEN - Behavioral 
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

entity PP_GEN is
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (3 downto 0);
           pp1,pp2,pp3,pp4 : out  STD_LOGIC_VECTOR (3 downto 0));
end PP_GEN;

architecture Behavioral of PP_GEN is

begin
pp1<= op1 when op2(0) = '1' else x"0";
pp2<= op1 when op2(1) = '1' else x"0";
pp3<= op1 when op2(2) = '1' else x"0";
pp4<= op1 when op2(3) = '1' else x"0";

end Behavioral;

