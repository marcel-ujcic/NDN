----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:08 05/05/2021 
-- Design Name: 
-- Module Name:    SUM4_4 - Behavioral 
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

entity SUM4_4 is
    Port ( op1,op2,op3,op4 : in  STD_LOGIC_VECTOR (3 downto 0);
           sum : out  STD_LOGIC_VECTOR (8 downto 0));
end SUM4_4;

architecture Behavioral of SUM4_4 is
COMPONENT WALLACE4
	PORT(
		op1 : IN std_logic_vector(3 downto 0);
		op2 : IN std_logic_vector(3 downto 0);
		op3 : IN std_logic_vector(3 downto 0);
		op4 : IN std_logic_vector(3 downto 0);          
		ps : OUT std_logic_vector(4 downto 0);
		sc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
COMPONENT SUM8
	PORT(
		op1 : IN std_logic_vector(7 downto 0);
		op2 : IN std_logic_vector(7 downto 0);          
		s : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	signal ps_out:std_logic_vector(4 downto 0);
	signal sc_out:std_logic_vector(3 downto 0);

begin

Inst_WALLACE4: WALLACE4 PORT MAP(
		op1 =>op1 ,
		op2 =>op2 ,
		op3 =>op3 ,
		op4 =>op4 ,
		ps =>ps_out ,
		sc =>sc_out 
	);
	
	Inst_SUM8: SUM8 PORT MAP(
		op1 =>"000" & ps_out ,
		op2 =>"0000" & sc_out ,
		s =>sum 
	);



end Behavioral;

