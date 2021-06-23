library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity led_control is
    Port ( CLK, RST: in STD_LOGIC;
			  BIN : in  STD_LOGIC_VECTOR (13 downto 0);
			  LED : out  STD_LOGIC_VECTOR (6 downto 0);
			  nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));			  
end led_control;

architecture Behavioral of led_control is

COMPONENT bin2led
	PORT(
		BIN : IN std_logic_vector(3 downto 0);
		DIGIT : IN std_logic_vector(7 downto 0);          
		LED : OUT std_logic_vector(6 downto 0);
		nDIGIT : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	
	COMPONENT BIN2BCD
	PORT(
		BIN : IN std_logic_vector(13 downto 0);          
		T : OUT std_logic_vector(3 downto 0);
		S : OUT std_logic_vector(3 downto 0);
		D : OUT std_logic_vector(3 downto 0);
		E : OUT std_logic_vector(3 downto 0)
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
	
	signal bin4bcd: STD_LOGIC_VECTOR (13 downto 0) ;
		
	signal data0: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data1: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data2: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data3: STD_LOGIC_VECTOR (3 downto 0) ;
	
	signal result: STD_LOGIC_VECTOR (3 downto 0) ;
	
	signal digitLED : STD_LOGIC_VECTOR (3 downto 0) ;
	
	signal CE: STD_LOGIC;
	
begin
	 bin4bcd <= BIN;
	
	Inst_BIN2BCD: BIN2BCD PORT MAP(
		BIN =>bin4bcd ,
		T =>data0,
		S =>data1,
		D =>data2,
		E =>data3 
	);
	
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
		T =>data0,
		S =>data1,
		D =>data2,
		E =>data3,
		CODE => result
	);

  Inst_bin2led: bin2led PORT MAP(
		BIN => result,
		DIGIT => "0000" & digitLED,
		LED =>LED,
		nDIGIT =>nDIGIT 
	);

end Behavioral;

