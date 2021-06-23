library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;



entity clock_divider is
	Generic ( divider : natural := 10000);
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           CE : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
	signal q : std_logic_vector (13 downto 0);
begin

	process(clk)
	begin
		if rising_edge(clk) then
			if rst = '1' then
				q <= (others => '0');
			elsif q = divider - 1 then
				q <=(others => '0');
			else
				q <= q + 1;
			end if;
		end if;
	end process;
	CE <= '1' when q = divider/4 else '0';
end Behavioral;

