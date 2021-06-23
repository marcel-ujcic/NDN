library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BIN2BCD is
    Port ( BIN : in  STD_LOGIC_VECTOR (13 downto 0);
           T,S,D,E : out  STD_LOGIC_VECTOR (3 downto 0));
end BIN2BCD;

architecture arch of BIN2BCD is
signal c01in, c02in, c03in, c04in, c05in, c06in, c07in, c08in, c09in, c10in : STD_LOGIC_VECTOR (3 downto 0);
signal c11in, c12in, c13in, c14in, c15in, c16in, c17in, c18in, c19in, c20in : STD_LOGIC_VECTOR (3 downto 0);
signal c21in, c22in, c23in, c24in : STD_LOGIC_VECTOR (3 downto 0);

signal c01out, c02out, c03out, c04out, c05out, c06out, c07out, c08out, c09out, c10out: STD_LOGIC_VECTOR (3 downto 0);
signal c11out, c12out, c13out, c14out, c15out, c16out, c17out, c18out, c19out, c20out: STD_LOGIC_VECTOR (3 downto 0);
signal c21out, c22out, c23out, c24out : STD_LOGIC_VECTOR (3 downto 0);


COMPONENT ADD3
	PORT(
		A : IN std_logic_vector(3 downto 0);          
		S : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;



begin

c01in <='0' & '0' & BIN(13) & BIN(12);

c02in <= c01out (2) & c01out(1) & c01out(0) & BIN(11);

c03in <= c02out (2) & c02out(1) & c02out(0) & BIN(10);

c04in <= c03out (2) & c03out(1) & c03out(0) & BIN(9);

c05in <= c04out (2) & c04out(1) & c04out(0) & BIN(8);

c06in <= c05out (2) & c05out(1) & c05out(0) & BIN(7);

c07in <= c06out (2) & c06out(1) & c06out(0) & BIN(6);

c08in <= c07out (2) & c07out(1) & c07out(0) & BIN(5);

c09in <= c08out (2) & c08out(1) & c08out(0) & BIN(4);

c10in <= c09out (2) & c09out(1) & c09out(0) & BIN(3);

c11in <= c10out (2) & c10out(1) & c10out(0) & BIN(2);

c12in <= c11out (2) & c11out(1) & c11out(0) & BIN(1);

c13in <= c01out (3) & c02out(3) & c03out(3) & c04out(3);

c14in <= c13out (2) & c13out(1) & c13out(0) & c05out(3);

c15in <= c14out (2) & c14out(1) & c14out(0) & c06out(3);

c16in <= c15out (2) & c15out(1) & c15out(0) & c07out(3);

c17in <= c16out (2) & c16out(1) & c16out(0) & c08out(3);

c18in <= c17out (2) & c17out(1) & c17out(0) & c09out(3);

c19in <= c18out (2) & c18out(1) & c18out(0) & c10out(3);

c20in <= c19out (2) & c19out(1) & c19out(0) & c11out(3);

c21in <= c13out (3) & c14out(3) & c15out(3) & c16out(3);

c22in <= c21out (2) & c21out(1) & c21out(0) & c17out(3);

c23in <= c22out (2) & c22out(1) & c22out(0) & c18out(3);

c24in <= c23out (2) & c23out(1) & c23out(0) & c19out(3);

T <= c21out (3) & c22out(3) & c23out(3) & c24out(3);

S <= c24out (2) & c24out(1) & c24out(0) & c20out(3);

D <= c20out (2) & c20out(1) & c20out(0) & c12out(3);

E <= c12out (2) & c12out(1) & c12out(0) & BIN(0);






c01: ADD3 PORT MAP(
		A =>c01in,
		S => c01out
	);
	
c02: ADD3 PORT MAP(
		A =>c02in,
		S => c02out
	);
	
c03: ADD3 PORT MAP(
		A =>c03in,
		S => c03out
	);	
	
c04: ADD3 PORT MAP(
		A =>c04in,
		S => c04out
	);	
	
c05: ADD3 PORT MAP(
		A =>c05in,
		S => c05out
	);

c06: ADD3 PORT MAP(
		A =>c06in,
		S => c06out
	);

c07: ADD3 PORT MAP(
		A =>c07in,
		S => c07out
	);
	
c08: ADD3 PORT MAP(
		A =>c08in,
		S => c08out
	);

c09: ADD3 PORT MAP(
		A =>c09in,
		S => c09out
	);

c10: ADD3 PORT MAP(
		A =>c10in,
		S => c10out
	);

c11: ADD3 PORT MAP(
		A =>c11in,
		S => c11out
	);

c12: ADD3 PORT MAP(
		A =>c12in,
		S => c12out
	);

c13: ADD3 PORT MAP(
		A =>c13in,
		S => c13out
	);

c14: ADD3 PORT MAP(
		A =>c14in,
		S => c14out
	);

c15: ADD3 PORT MAP(
		A =>c15in,
		S => c15out
	);

c16: ADD3 PORT MAP(
		A =>c16in,
		S => c16out
	);

c17: ADD3 PORT MAP(
		A =>c17in,
		S => c17out
	);

c18: ADD3 PORT MAP(
		A =>c18in,
		S => c18out
	);

c19: ADD3 PORT MAP(
		A =>c19in,
		S => c19out
	);

c20: ADD3 PORT MAP(
		A =>c20in,
		S => c20out
	);
	
c21: ADD3 PORT MAP(
		A =>c21in,
		S => c21out
	);
	
c22: ADD3 PORT MAP(
		A =>c22in,
		S => c22out
	);
	
c23: ADD3 PORT MAP(
		A =>c23in,
		S => c23out
	);

c24: ADD3 PORT MAP(
		A =>c24in,
		S => c24out
	);

end arch;
