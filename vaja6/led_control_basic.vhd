----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:40 04/12/2021 
-- Design Name: 
-- Module Name:    led_control_basic - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_control_basic is
    Port ( BIN : in  STD_LOGIC_VECTOR (15 downto 0);
           CLK, RST : in  STD_LOGIC;
           LED : out  STD_LOGIC_VECTOR (6 downto 0);
           nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));
end led_control_basic;

architecture Behavioral of led_control_basic is
COMPONENT bin2led
	PORT(
		BIN : IN std_logic_vector(3 downto 0);
		DIGIT : IN std_logic_vector(7 downto 0);          
		LED : OUT std_logic_vector(6 downto 0);
		nDIGIT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	

	
	COMPONENT rot_reg
	PORT(
		CLK : IN std_logic;
		CE  : IN std_logic;
		RST : IN std_logic;          
		DATA_o : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT digit_selector
	PORT(
		SEL : IN std_logic_vector(3 downto 0);
		T : IN std_logic_vector(3 downto 0);
		S : IN std_logic_vector(3 downto 0);
		D : IN std_logic_vector(3 downto 0);
		E : IN std_logic_vector(3 downto 0);          
		CODE : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT clock_divider
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;          
		CE : OUT std_logic
		);
	END COMPONENT;
	
	
	
	signal result: STD_LOGIC_VECTOR (3 downto 0) ;
	
	signal digitLED : STD_LOGIC_VECTOR (3 downto 0) ;
	
	signal CE: STD_LOGIC;
	
begin
	 
	
	
	Inst_clock_divider: clock_divider PORT MAP(
		clk => CLK,
		rst => RST,
		CE => CE
	);
	
	Inst_rot_reg: rot_reg PORT MAP(
		
		CLK => CLK ,
		RST => RST,
		CE => CE,
		DATA_o => digitLED
	);

	Inst_digit_selector: digit_selector PORT MAP(
		SEL => digitLED,
		T =>BIN (15 downto 12),
		S =>BIN (11 downto 8),
		D =>BIN (7 downto 4),
		E =>BIN (3 downto 0),
		CODE => result
	);

  Inst_bin2led: bin2led PORT MAP(
		BIN => result,
		DIGIT => "0000" & digitLED,
		LED =>LED,
		nDIGIT =>nDIGIT 
	);


end Behavioral;

