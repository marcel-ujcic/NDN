----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:33 05/28/2021 
-- Design Name: 
-- Module Name:    UART_RX_FSM - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_RX_FSM is
    Port ( RST,CLK,RX,CLK_UART : in  STD_LOGIC;
           RST_CLK_DIV : out  STD_LOGIC;
           RECEIVING : out  STD_LOGIC;
           DONE_OUT : out  STD_LOGIC);
end UART_RX_FSM;

architecture Behavioral of UART_RX_FSM is

type jumper is (Idle,PRE_RCV,RCV_START, RX_Data_Bits,DONE);
signal skakac : jumper := Idle;
signal bit_index:STD_LOGIC_VECTOR(4 downto 0);

begin
	

process(CLK)
	begin
		if rising_edge(CLK) then
		
			case skakac is
			
				when Idle =>
					RST_CLK_DIV <='0';
					DONE_OUT <= '0';
					RECEIVING <='0';
					bit_index <=(others => '0');
					if RX= '1' then
						skakac <= PRE_RCV;
					end if;
					
				when PRE_RCV =>
					RST_CLK_DIV <='1';
					DONE_OUT <='0';
					RECEIVING <='0';
					if CLK_UART ='1' then
						skakac <= RCV_START;
					end if;
				
				when RCV_START =>
					RST_CLK_DIV <='1';
					DONE_OUT <='0';
					RECEIVING <='1';
					if CLK_UART ='1' then
						skakac <= RX_Data_Bits;
					end if;
					
				when RX_Data_Bits =>
						RST_CLK_DIV <='1';
						DONE_OUT <='0';
						RECEIVING <='1';
						bit_index <= bit_index + 1;
						
						if CLK_UART ='1'  and bit_index <8 then
						skakac <= RX_Data_Bits;
						else
							skakac <= DONE;
						end if;
					
				when DONE =>
					DONE_OUT <='1';
					RECEIVING <='0';
					RST_CLK_DIV <='0';
					skakac <= Idle;
			end case;
		end if;
end process;
end Behavioral;

