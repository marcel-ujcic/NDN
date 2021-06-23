----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:22:29 05/05/2021 
-- Design Name: 
-- Module Name:    WALLACE2LED - Behavioral 
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

entity WALLACE2LED is
    Port ( op1,op2,op3,op4 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK,RST : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (6 downto 0);
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end WALLACE2LED;

architecture Behavioral of WALLACE2LED is

COMPONENT SUM4_4
	PORT(
		op1 : IN std_logic_vector(3 downto 0);
		op2 : IN std_logic_vector(3 downto 0);
		op3 : IN std_logic_vector(3 downto 0);
		op4 : IN std_logic_vector(3 downto 0);          
		sum : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;
	
	COMPONENT led_control
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		BIN : IN std_logic_vector(13 downto 0);          
		LED : OUT std_logic_vector(6 downto 0);
		nDIGIT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	signal sum_out:std_logic_vector(8 downto 0);


begin
Inst_SUM4_4: SUM4_4 PORT MAP(
		op1 => op1,
		op2 => op2,
		op3 => op3,
		op4 => op4,
		sum =>sum_out 
	);
	
	Inst_led_control: led_control PORT MAP(
		CLK =>CLK ,
		RST =>RST ,
		BIN =>"00000" & sum_out ,
		LED =>LED ,
		nDIGIT =>nDIGIT 
	);


end Behavioral;

