----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:12 05/21/2021 
-- Design Name: 
-- Module Name:    UART_TX - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_TX is
    Port ( CLK,DATA_RDY,RST : in  STD_LOGIC;
           TX, DONE_OUT : out  STD_LOGIC;
			  DATA_IN:STD_LOGIC_VECTOR(7 downto 0));
end UART_TX;

architecture Behavioral of UART_TX is
COMPONENT PISO
	PORT(
		RST : IN std_logic;
		CLK : IN std_logic;
		SE : IN std_logic;
		LOAD : IN std_logic;
		PARALLEL_IN : IN std_logic_vector(9 downto 0);          
		SERIAL_OUT : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT clock_divider
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		CE : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT UART_TX_FSM
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		CLK_UART : IN std_logic;
		DATA_RDY : IN std_logic;          
		DONE_OUT : OUT std_logic;
		SHIFT_OUT : OUT std_logic
		);
	END COMPONENT;

	
	signal CE:STD_LOGIC;
	signal SHOUT:STD_LOGIC;
	signal SE:STD_LOGIC;

	
begin
Inst_clock_divider: clock_divider PORT MAP(
		CLK =>CLK ,
		RST =>RST ,
		CE => CE
	);
	
Inst_UART_TX_FSM: UART_TX_FSM PORT MAP(
		CLK =>CLK ,
		RST =>RST ,
		CLK_UART =>CE ,
		DATA_RDY =>DATA_RDY ,
		DONE_OUT =>DONE_OUT ,
		SHIFT_OUT =>SHOUT
	);
	
	SHOUT<= SE and CE;
Inst_PISO: PISO PORT MAP(
		RST =>RST ,
		CLK =>CLK ,
		SE =>SE ,
		LOAD =>DATA_RDY ,
		PARALLEL_IN => '0' & DATA_IN & '1',
		SERIAL_OUT => TX
	);



end Behavioral;

