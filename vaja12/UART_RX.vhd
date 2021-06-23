----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:03 05/28/2021 
-- Design Name: 
-- Module Name:    UART_RX - Behavioral 
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

entity UART_RX is
    Port ( CLK,RST,RX : in  STD_LOGIC;
           DATA : out  STD_LOGIC_VECTOR (7 downto 0);
           DONE : out  STD_LOGIC);
end UART_RX;

architecture Behavioral of UART_RX is
COMPONENT SIPO
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		SE : IN std_logic;
		SERIAL_IN : IN std_logic;          
		PARALEL_OUT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT clock_divider
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;          
		CE : OUT std_logic
		);
	END COMPONENT;


COMPONENT UART_RX_FSM
	PORT(
		RST : IN std_logic;
		CLK : IN std_logic;
		RX : IN std_logic;
		CLK_UART : IN std_logic;          
		RST_CLK_DIV : OUT std_logic;
		RECEIVING : OUT std_logic;
		DONE_OUT : OUT std_logic
		);
	END COMPONENT;
	

	signal clk_div:STD_LOGIC;
	
	signal CE:STD_LOGIC;
	signal RCVING:STD_LOGIC;

begin

	Inst_SIPO: SIPO PORT MAP(
		CLK =>CLK ,
		RST => RST or clk_div,
		SE =>RCVING and CE ,
		SERIAL_IN =>RX ,
		PARALEL_OUT =>DATA 
	);
	
	Inst_clock_divider: clock_divider PORT MAP(
		CLK =>CLK ,
		RST =>clk_div,
		CE =>CE
	);
	
	Inst_UART_RX_FSM: UART_RX_FSM PORT MAP(
		RST =>RST ,
		CLK =>CLK ,
		RX =>RX ,
		CLK_UART => CE,
		RST_CLK_DIV =>clk_div ,
		RECEIVING =>RCVING ,
		DONE_OUT => DONE
	);




end Behavioral;

