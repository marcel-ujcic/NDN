----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:40:20 05/05/2021 
-- Design Name: 
-- Module Name:    WALLACE4 - Behavioral 
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

entity WALLACE4 is
    Port ( op1,op2,op3,op4 : in  STD_LOGIC_VECTOR (3 downto 0);
           ps : OUT std_logic_vector(4 downto 0);
				sc : OUT std_logic_vector(3 downto 0));
end WALLACE4;

architecture Behavioral of WALLACE4 is
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
	
	
	signal s3:std_logic_vector(3 downto 0);
	
	
	signal c3:std_logic_vector(3 downto 0);
	
	
	
	signal ps_out:std_logic_vector(3 downto 0);
	
begin
	Inst_Csave_1_3: Csave
	generic map (size  => 4,
					 sizePS => 4,
					 sizeSC  => 4)
	PORT MAP(
		op1 =>op1 ,
		op2 =>op2 ,
		op3 =>op3 ,
		ps =>s3 ,
		sc =>c3 
	);
	
	Inst_Csave_1_2: Csave
	generic map (size  => 4,
					 sizePS => 4,
					 sizeSC  => 4)
	 PORT MAP(
		op1 =>c3 ,
		op2 =>s3 ,
		op3 =>op4 ,
		ps =>  ps_out ,
		sc =>sc 
	);
	ps <= '0'&ps_out;
--	
--	Inst_Csave_1_1: Csave PORT MAP(
--		op1 =>op1(1) ,
--		op2 =>op2(1) ,
--		op3 =>op3(1) ,
--		ps =>s1 ,
--		sc =>c1 
--	);
--	
--	Inst_Csave_1_0: Csave PORT MAP(
--		op1 =>op1(0) ,
--		op2 =>op2(0) ,
--		op3 =>op3(0) ,
--		ps =>s0 ,
--		sc =>c0 
--	);
--	
--	
--	Inst_Csave_2_3: Csave PORT MAP(
--		op1 =>op4(3) ,
--		op2 =>s3(3) ,
--		op3 =>c2(3) ,
--		ps =>s_3 ,
--		sc =>c_3 
--	);
--	
--	Inst_Csave_2_2: Csave PORT MAP(
--		op1 =>op4(2) ,
--		op2 =>s2(2) ,
--		op3 =>c1(2) ,
--		ps =>s_2 ,
--		sc =>c_2 
--	);
--	
--	Inst_Csave_2_1: Csave PORT MAP(
--		op1 =>op4(1) ,
--		op2 =>s1(1) ,
--		op3 =>c0(1) ,
--		ps =>s_1 ,
--		sc =>c_1 
--	);
--	
--	Inst_Csave_2_0: Csave PORT MAP(
--		op1 =>op4(0) ,
--		op2 =>s0(0) ,
--		op3 =>'0' ,
--		ps =>s_0 ,
--		sc =>c_0 
--	);
end Behavioral;

