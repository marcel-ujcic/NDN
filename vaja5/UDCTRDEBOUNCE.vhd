----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:04 04/06/2021 
-- Design Name: 
-- Module Name:    UDCTRDEBOUNCE - Behavioral 
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

entity UDCTRDEBOUNCE is
    Port ( DOWN, CLK, RST, UP : in  STD_LOGIC;
           CTR : out  STD_LOGIC_VECTOR (7 downto 0));
end UDCTRDEBOUNCE;

architecture Behavioral of UDCTRDEBOUNCE is

COMPONENT DEBOUNCE
	PORT(
		CLK : IN std_logic;
		BTN : IN std_logic;          
		PULSE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT UDCOUNTER
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		UP : IN std_logic;
		DOWN : IN std_logic;          
		CTR : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	signal deB1Up: STD_LOGIC;
	signal deB1Down: STD_LOGIC;
begin

	Inst_DEBOUNCE1: DEBOUNCE PORT MAP(
		CLK => CLK,
		BTN => UP ,
		PULSE => deB1Up
	);
	Inst_DEBOUNCE2: DEBOUNCE PORT MAP(
		CLK => CLK ,
		BTN => DOWN,
		PULSE =>deB1Down 
	);

	Inst_UDCOUNTER: UDCOUNTER PORT MAP(
		CLK => CLK ,
		RST => RST ,
		UP => deB1Up,
		DOWN =>deB1Down ,
		CTR =>  CTR
	);

	

end Behavioral;

