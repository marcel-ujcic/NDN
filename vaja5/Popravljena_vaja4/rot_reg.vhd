library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity rot_reg is
	Generic ( size : natural := 4);
    Port ( CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
			  CE : in STD_LOGIC;
           DATA_o : out  STD_LOGIC_VECTOR (size-1 downto 0));
end rot_reg;

architecture Behavioral of rot_reg is

 signal q:STD_LOGIC_VECTOR(3 downto 0):="0001";
 
 begin
	
		DATA_o <= q;
		
		process(CLK)
		begin
			if rising_edge(CLK) then
				if RST ='1' then
					q <= "0001";
				elsif CE = '1' then
					q <= q(0) & q(3 downto 1);
				end if;
			end if;
			
		end process;

end Behavioral;

