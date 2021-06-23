----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:07:16 04/28/2021 
-- Design Name: 
-- Module Name:    SUM8 - Behavioral 
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

entity SUM8 is
    Port ( op1, op2 : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (8 downto 0));
end SUM8;

architecture Behavioral of SUM8 is
COMPONENT ADD2
	PORT(
		op1 : IN std_logic_vector(1 downto 0);
		op2 : IN std_logic_vector(1 downto 0);
		c_in : IN std_logic;          
		s : OUT std_logic_vector(1 downto 0);
		c_out : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT mux2_1
	PORT(
		in_0 : IN std_logic_vector(1 downto 0);
		in_1 : IN std_logic_vector(1 downto 0);
		mux_select : IN std_logic;          
		mux_out : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	
	
	signal c2:STD_LOGIC;
	signal c4:STD_LOGIC;
	
	signal c1:STD_LOGIC; --cary od ADD2 prvega
	signal c3:STD_LOGIC; -- cary od add2 drugega
	signal c_4:STD_LOGIC; -- cary od add2 štiri
	signal c5:STD_LOGIC; -- cary od add2 pet
	signal c6:STD_LOGIC; -- cary od add2 šest
	signal c7:STD_LOGIC; -- cary 
	signal c8:STD_LOGIC; -- cary 

	
	signal mux_in0_0:STD_LOGIC_VECTOR(1 downto 0);
	signal mux_in1_0:STD_LOGIC_VECTOR(1 downto 0);
	
	signal mux_in0_1:STD_LOGIC_VECTOR(1 downto 0);
	signal mux_in1_1:STD_LOGIC_VECTOR(1 downto 0);
	signal mux_select_1:STD_LOGIC;
	signal mux_out_1:STD_LOGIC_VECTOR(1 downto 0);
	
	signal mux_in0_2:STD_LOGIC_VECTOR(1 downto 0);
	signal mux_select_2:STD_LOGIC;
	signal mux_out_2:STD_LOGIC_VECTOR(1 downto 0);
	
	signal konk_0:STD_LOGIC_VECTOR(3 downto 0);
	signal konk_1:STD_LOGIC_VECTOR(3 downto 0);
	
	signal add2_3_s:STD_logic_vector(1 downto 0);
	signal add2_4_s:STD_logic_vector(1 downto 0);
	
begin
Inst_ADD2_0: ADD2 PORT MAP(
		op1 =>op1(1 downto 0) ,
		op2 =>op2(1 downto 0) ,
		c_in => '0' ,
		s =>s(1 downto 0) ,
		c_out => c2
	);
Inst_ADD2_1: ADD2 PORT MAP(
		op1 =>op1(3 downto 2),
		op2 =>op2(3 downto 2) ,
		c_in => '1' ,
		s => mux_in1_0 ,
		c_out =>c1
	);
	
	Inst_mux2_1_0: mux2_1 PORT MAP(
		in_0 =>  mux_in0_0 ,
		in_1 =>  mux_in1_0,
		mux_select =>c2 ,
		mux_out =>s(3 downto 2) 
	);
	
Inst_ADD2_2: ADD2 PORT MAP(
		op1 =>op1(3 downto 2),
		op2 =>op2(3 downto 2) ,
		c_in => '0' ,
		s => mux_in0_0 ,
		c_out => c3
	);
	
	c4 <= c3 when c2='0' else c1;
	
Inst_ADD2_3: ADD2 PORT MAP(
		op1 =>op1(5 downto 4),
		op2 =>op2(5 downto 4) ,
		c_in => '1',
		s =>add2_3_s ,
		c_out => mux_select_1
	);
	
	Inst_mux2_1_1: mux2_1 PORT MAP(
		in_0 =>  mux_in0_1 ,
		in_1 =>  mux_in1_1,
		mux_select =>mux_select_1 ,
		mux_out =>mux_out_1
	);
	
	konk_0 <=mux_out_1 & add2_3_s;
	
Inst_ADD2_4: ADD2 PORT MAP(
		op1 =>op1(5 downto 4),
		op2 =>op2(5 downto 4) ,
		c_in => '0',
		s =>add2_4_s ,
		c_out => c_4
	);
Inst_ADD2_5: ADD2 PORT MAP(
		op1 =>op1(7 downto 6),
		op2 =>op2(7 downto 6) ,
		c_in => '1' ,
		s =>  mux_in1_1,
		c_out => c5
	);
Inst_mux2_1_2: mux2_1 PORT MAP(
		in_0 =>  mux_in0_1 ,
		in_1 =>  mux_in1_1,
		mux_select =>c_4 ,
		mux_out =>mux_out_2
	);
konk_1<= mux_out_2 & add2_4_s;

Inst_ADD2_6: ADD2 PORT MAP(
		op1 =>op1(7 downto 6),
		op2 =>op2(7 downto 6) ,
		c_in => '0',
		s =>  mux_in0_1,
		c_out => c6
	);
c8<= c6 when c_4='0' else c5;
c7 <= c6 when  mux_select_1='0' else c5;
s(7 downto 4) <= konk_1 when c4='0' else konk_0;
s(8) <= c8 when c4 ='0' else c7;







end Behavioral;

