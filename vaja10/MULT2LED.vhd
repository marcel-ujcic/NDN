----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:22 05/13/2021 
-- Design Name: 
-- Module Name:    MULT2LED - Behavioral 
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

entity MULT2LED is
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK,RST : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (6 downto 0);
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end MULT2LED;

architecture Behavioral of MULT2LED is

COMPONENT MULT4
	PORT(
		op1 : IN std_logic_vector(3 downto 0);
		op2 : IN std_logic_vector(3 downto 0);          
		PROD : OUT std_logic_vector(7 downto 0)
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

	
signal mult4_out:std_logic_vector(7 downto 0);
	
begin

Inst_MULT4: MULT4 PORT MAP(
		op1 =>op1 ,
		op2 =>op2 ,
		PROD => mult4_out
	);
Inst_led_control: led_control PORT MAP(
		CLK =>CLK ,
		RST =>RST ,
		BIN =>"000000" & mult4_out ,
		LED =>LED ,
		nDIGIT =>nDIGIT 
	);
end Behavioral;

