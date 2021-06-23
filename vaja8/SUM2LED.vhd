----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:30:57 04/28/2021 
-- Design Name: 
-- Module Name:    SUM2LED - Behavioral 
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

entity SUM2LED is
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (6 downto 0);
			  CLK, RST: in std_logic;
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end SUM2LED;

architecture Behavioral of SUM2LED is
COMPONENT SUM8
	PORT(
		op1 : IN std_logic_vector(7 downto 0);
		op2 : IN std_logic_vector(7 downto 0);
		s : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	signal sum8_out:STD_LOGIC_VECTOR(8 downto 0);
	COMPONENT led_control
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		BIN : IN std_logic_vector(13 downto 0);          
		LED : OUT std_logic_vector(6 downto 0);
		nDIGIT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	

begin

Inst_SUM8: SUM8 PORT MAP(
		op1 =>op1 ,
		op2 =>op2,
		s => sum8_out
	);
	
	Inst_led_control: led_control PORT MAP(
		CLK => CLK ,
		RST => RST ,
		BIN =>"00000" & sum8_out,
		LED =>LED ,
		nDIGIT =>nDIGIT 
	);


end Behavioral;

