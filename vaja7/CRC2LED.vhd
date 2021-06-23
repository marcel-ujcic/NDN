----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:19:20 04/21/2021 
-- Design Name: 
-- Module Name:    CRC2LED - Behavioral 
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

entity CRC2LED is
    Port ( CLK, RST, TRIGGER : in  STD_LOGIC;
           SW : in  STD_LOGIC_VECTOR (15 downto 0);
           DONE : out  STD_LOGIC;
           SERIAL_OUT : out  STD_LOGIC;
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0);
           LED : out  STD_LOGIC_VECTOR (6 downto 0));
end CRC2LED;

architecture Behavioral of CRC2LED is
COMPONENT LFSR
	PORT(
		CLK : IN std_logic;
		CE : IN std_logic;
		data_in : IN std_logic;
		RST : IN std_logic;          
		REG_OUT : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT DEBOUNCE
	PORT(
		CLK : IN std_logic;
		BTN : IN std_logic;          
		PULSE : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT led_control_basic
	PORT(
		BIN : IN std_logic_vector(15 downto 0);
		CLK : IN std_logic;
		RST : IN std_logic;          
		LED : OUT std_logic_vector(6 downto 0);
		nDIGIT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT PISO16
	PORT(
		CLK : IN std_logic;
		CE : IN std_logic;
		RST : IN std_logic;
		SERIAL_IN : IN std_logic;
		PARALLEL_IN : IN std_logic_vector(15 downto 0);          
		PARALLEL_OUT : OUT std_logic_vector(15 downto 0);
		SERIAL_OUT : OUT std_logic;
		DONE : OUT std_logic
		);
	END COMPONENT;
	signal utrip : STD_LOGIC;
	SIGNAL LFSR_out2BIN :  std_logic_vector(15 downto 0);
	signal piso2lfsr: STD_LOGIC;
begin
	SERIAL_OUT <= piso2lfsr;
	
	Inst_LFSR: LFSR PORT MAP(
		CLK => clk ,
		CE => utrip ,
		data_in =>piso2lfsr ,
		RST => RST,
		REG_OUT => LFSR_out2BIN
	);
	
	Inst_DEBOUNCE: DEBOUNCE PORT MAP(
		CLK => clk ,
		BTN => trigger ,
		PULSE => utrip
	);
	
	Inst_led_control_basic: led_control_basic PORT MAP(
		BIN => LFSR_out2BIN,
		CLK => clk ,
		RST => RST,
		LED => LED,
		nDIGIT => nDIGIT
	);
	
	Inst_PISO16: PISO16 PORT MAP(
		CLK =>CLK ,
		CE => utrip ,
		RST =>RST ,
		SERIAL_IN =>'0' ,
		PARALLEL_IN =>SW,
		PARALLEL_OUT => open,
		SERIAL_OUT =>piso2lfsr ,
		DONE => DONE
	);

end Behavioral;
