----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:10:24 04/06/2021 
-- Design Name: 
-- Module Name:    UDCTRDEBOUNCE2LED - Behavioral 
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

entity UDCTRDEBOUNCE2LED is
    Port ( RST, CLK, UP, DOWN : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (6 downto 0);
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end UDCTRDEBOUNCE2LED;

architecture Behavioral of UDCTRDEBOUNCE2LED is

	COMPONENT UDCTRDEBOUNCE
	PORT(
		DOWN : IN std_logic;
		CLK : IN std_logic;
		RST : IN std_logic;
		UP : IN std_logic;          
		CTR : OUT std_logic_vector(7 downto 0)
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

	signal bin: STD_LOGIC_VECTOR (7 downto 0);

	
begin

Inst_UDCTRDEBOUNCE: UDCTRDEBOUNCE PORT MAP(
		DOWN => DOWN ,
		CLK => CLK,
		RST => RST,
		UP => UP,
		CTR => bin
	);
	
Inst_led_control: led_control PORT MAP(
		CLK => CLK ,
		RST => RST,
		BIN => "000000"& bin ,
		LED =>LED ,
		nDIGIT =>nDIGIT 
	);


end Behavioral;

