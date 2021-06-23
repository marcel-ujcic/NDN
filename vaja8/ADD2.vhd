----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:33 04/28/2021 
-- Design Name: 
-- Module Name:    ADD2 - Behavioral 
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

entity ADD2 is
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (1 downto 0);
           c_in : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (1 downto 0);
           c_out : out  STD_LOGIC);
end ADD2;

architecture Behavioral of ADD2 is

signal c1: STD_LOGIC;
begin
	
	s(0) <= (op1(0) XOR op2(0))XOR c_in;
	c1 <= (op1(0) AND op2(0)) OR ((op1(0) OR op2(0)) AND c_in);
	s(1) <= (op1(1) XOR op2(1)) XOR c1;
	
	c_out <= ((op1(1) AND op2(1)) OR op1(1)) OR (op2(1) AND c1);

end Behavioral;

