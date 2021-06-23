----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:58:29 05/13/2021 
-- Design Name: 
-- Module Name:    MULT4 - Behavioral 
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

entity MULT4 is
    Port ( op1,op2 : in  STD_LOGIC_VECTOR (3 downto 0);
           PROD : out  STD_LOGIC_VECTOR (7 downto 0));
end MULT4;

architecture Behavioral of MULT4 is
COMPONENT WALLACE4_MULT
	PORT(
		pp1 : IN std_logic_vector(3 downto 0);
		pp2 : IN std_logic_vector(3 downto 0);
		pp3 : IN std_logic_vector(3 downto 0);
		pp4 : IN std_logic_vector(3 downto 0);          
		PROD : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	COMPONENT PP_GEN
	PORT(
		op1 : IN std_logic_vector(3 downto 0);
		op2 : IN std_logic_vector(3 downto 0);          
		pp1 : OUT std_logic_vector(3 downto 0);
		pp2 : OUT std_logic_vector(3 downto 0);
		pp3 : OUT std_logic_vector(3 downto 0);
		pp4 : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	signal pp1:std_logic_vector(3 downto 0);
	signal pp2:std_logic_vector(3 downto 0);
	signal pp3:std_logic_vector(3 downto 0);
	signal pp4:std_logic_vector(3 downto 0);
	
begin

Inst_WALLACE4_MULT: WALLACE4_MULT PORT MAP(
		pp1 =>pp1 ,
		pp2 =>pp2 ,
		pp3 =>pp3 ,
		pp4 =>pp4 ,
		PROD => PROD
	);
	
	Inst_PP_GEN: PP_GEN PORT MAP(
		op1 =>op1 ,
		op2 =>op2 ,
		pp1 =>pp1 ,
		pp2 =>pp2 ,
		pp3 =>pp3 ,
		pp4 =>pp4 
	);


end Behavioral;

