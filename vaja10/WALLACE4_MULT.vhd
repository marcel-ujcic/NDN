----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:26 05/13/2021 
-- Design Name: 
-- Module Name:    WALLACE4_MULT - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WALLACE4_MULT is
    Port ( pp1,pp2,pp3,pp4 : in  STD_LOGIC_VECTOR (3 downto 0);
           PROD : out  STD_LOGIC_VECTOR (7 downto 0));
end WALLACE4_MULT;

architecture Behavioral of WALLACE4_MULT is

COMPONENT Csave
generic (size:integer;
				sizePS:integer;
				sizeSC:integer);
	PORT(
		op1 : IN std_logic_vector(size-1 downto 0);
		op2 : IN std_logic_vector(size-1 downto 0);
		op3 : IN std_logic_vector(size-1 downto 0);          
		ps : OUT std_logic_vector(sizePS-1 downto 0);
		sc : OUT std_logic_vector(sizeSC-1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SUM8
	PORT(
		op1 : IN std_logic_vector(7 downto 0);
		op2 : IN std_logic_vector(7 downto 0);          
		s : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	

	
	
	signal SC1:std_logic_vector(3 downto 0);
	signal PS1:std_logic_vector(3 downto 0);
	
	signal SC2:std_logic_vector(3 downto 0);
	signal PS2:std_logic_vector(3 downto 0);
	
	signal S_OUT:std_logic_vector(8 downto 0);
	
	signal x:std_logic_vector(3 downto 0);
	signal y:std_logic_vector(3 downto 0);
	signal z:std_logic_vector(3 downto 0);
	signal w:std_logic_vector(3 downto 0);
	
	signal x1:std_logic_vector(3 downto 0);
	signal y1:std_logic_vector(7 downto 0);
	signal z1:std_logic_vector(7 downto 0);
	signal w1:std_logic_vector(3 downto 0);
begin

x<='0' &  pp1(3 downto 1);
y<=pp2;
z<=pp3(2 downto 0) & '0';
w<=pp4(2 downto 0) & '0';

x1<=pp3(3) & PS1(3 downto 1);
y1 <="0000" & pp4(3) & PS2(3 downto 1);
z1<="0000" & SC2;

Inst_Csave_1_3: Csave
generic map (size  => 4,
					 sizePS => 4,
					 sizeSC  => 4)
	
	PORT MAP(
		op1 =>x ,
		op2 =>y ,
		op3 =>z ,
		ps =>PS1 ,
		sc =>SC1 
	);
	
	Inst_Csave_1_2: Csave
	generic map (size  => 4,
					 sizePS => 4,
					 sizeSC  => 4)
	
	 PORT MAP(
		op1 =>SC1 ,
		op2 =>x1,
		op3 =>w,
		ps => PS2 ,
		sc =>SC2
	);
	
	Inst_SUM8: SUM8 PORT MAP(
		op1 => y1,
		op2 => z1,
		s =>S_OUT 
	);
	PROD <= S_OUT(4 downto 0) & PS2(0) & PS1(0) & pp1(0);

end Behavioral;

