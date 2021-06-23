----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:54 05/21/2021 
-- Design Name: 
-- Module Name:    VAJA11 - Behavioral 
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

entity VAJA11 is
    Port ( RST, CLK, TRIGGER : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (7 downto 0);
           DONE,TX : out  STD_LOGIC);
end VAJA11;

architecture Behavioral of VAJA11 is

COMPONENT UART_TX
	PORT(
		CLK : IN std_logic;
		DATA_RDY : IN std_logic;
		RST : IN std_logic;
		DATA_IN : IN std_logic_vector(7 downto 0);          
		TX : OUT std_logic;
		DONE_OUT : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT DEBOUNCE
	PORT(
		CLK : IN std_logic;
		BTN : IN std_logic;          
		PULSE : OUT std_logic
		);
	END COMPONENT;

	
signal pulse:STD_LOGIC;

begin
Inst_DEBOUNCE: DEBOUNCE PORT MAP(
		CLK =>CLK ,
		BTN =>TRIGGER ,
		PULSE => pulse
	);
Inst_UART_TX: UART_TX PORT MAP(
		CLK =>CLK ,
		DATA_RDY =>pulse ,
		RST =>RST ,
		TX =>TX ,
		DONE_OUT =>DONE ,
		DATA_IN =>SW 
	);

end Behavioral;

