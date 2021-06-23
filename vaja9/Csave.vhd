----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:28:25 05/05/2021 
-- Design Name: 
-- Module Name:    Csave - Behavioral 
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

entity Csave is
	generic (size:integer;
				sizePS:integer;
				sizeSC:integer);
    Port ( op1, op2, op3 : in  STD_LOGIC_VECTOR (size-1 downto 0);
           ps : out  STD_LOGIC_VECTOR (sizePS-1 downto 0);
			  sc : out  STD_LOGIC_VECTOR (sizeSC-1 downto 0));
end Csave;

architecture Behavioral of Csave is

begin

	ps <= op1 XOR op2 XOR op3;
	
	sc <=(op1 AND op2)OR(op1 AND op3) OR (op2 AND op3 );

end Behavioral;

