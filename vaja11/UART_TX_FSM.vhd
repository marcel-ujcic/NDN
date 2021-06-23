----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:00:01 05/21/2021 
-- Design Name: 
-- Module Name:    UART_TX_FSM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_TX_FSM is
    Port ( CLK,RST,CLK_UART,DATA_RDY : in  STD_LOGIC;
           DONE_OUT,SHIFT_OUT : out  STD_LOGIC);
end UART_TX_FSM;

architecture Behavioral of UART_TX_FSM is

type jumper is (Idle,PRE_SEND,SEND_START, TX_Data_Bits,DONE);
signal skakac : jumper := Idle;
signal bit_index:STD_LOGIC_VECTOR(4 downto 0);
begin
	

process(CLK)
	begin
		if rising_edge(CLK) then
			case skakac is
			
				when Idle =>
					SHIFT_OUT <='0';
					DONE_OUT <= '0';
					bit_index <=(others => '0');
					if DATA_RDY= '1' then
						skakac <= PRE_SEND;
					end if;
					
				when PRE_SEND =>
					SHIFT_OUT <='1';
					DONE_OUT <='0';
					if CLK_UART ='1' then
						skakac <= SEND_START;
					end if;
				
				when SEND_START =>
					SHIFT_OUT <='1';
					DONE_OUT <='0';
					if CLK_UART ='1' then
						skakac <= TX_Data_Bits;
					end if;
					
				when TX_Data_Bits =>
						SHIFT_OUT <='1';
						DONE_OUT <='0';
						bit_index <= bit_index + 1;
						
						if CLK_UART ='1'  and bit_index <8 then
						skakac <= TX_Data_Bits;
						else
							skakac <= DONE;
						end if;
					
				when DONE =>
					DONE_OUT <='1';
					skakac <= Idle;
			end case;
		end if;
end process;

end Behavioral;

