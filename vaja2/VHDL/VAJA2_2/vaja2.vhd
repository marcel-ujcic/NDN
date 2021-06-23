library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity vaja2 is
    Port ( BIN : in  STD_LOGIC_VECTOR (13 downto 0);
           DIGIT_SELECT : in  STD_LOGIC_VECTOR (1 downto 0);
			  LED : out  STD_LOGIC_VECTOR (6 downto 0);
			  nDIGIT : out  STD_LOGIC_VECTOR (7 downto 0));			  
end vaja2;

architecture Behavioral of vaja2 is

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
	
	signal bin4bcd: STD_LOGIC_VECTOR (13 downto 0) ;
	--signal bin4led: STD_LOGIC_VECTOR (3 downto 0) ;
		
	signal data0: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data1: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data2: STD_LOGIC_VECTOR (3 downto 0) ;
	signal data3: STD_LOGIC_VECTOR (3 downto 0) ;
	
	

	
	
	signal result: STD_LOGIC_VECTOR (3 downto 0) ;



	

begin
	
	bin4bcd <= BIN;
	
	Inst_BIN2BCD: BIN2BCD PORT MAP(
		BIN =>bin4bcd ,
		T =>data0,
		S =>data1,
		D =>data2,
		E =>data3 
	);
	
	result <= data3 when DIGIT_SELECT = "00" else
				 data2 when DIGIT_SELECT = "01" else
				 data1 when DIGIT_SELECT = "10" else
				 data0;

	Inst_bin2led: bin2led PORT MAP(
		BIN => result,
		DIGIT =>"00000001",
		LED =>LED,
		nDIGIT =>nDIGIT 
	);


end Behavioral;

