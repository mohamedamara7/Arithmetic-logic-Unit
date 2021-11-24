--tff operates with inverted clock
library ieee;
use ieee.std_logic_1164.all;

entity dff is
	port(d,clk,clr:in std_logic;
	q:out std_logic);
end dff;

architecture behav of dff is
signal temp:std_logic;
begin
	process(clk,clr)
	begin 
		if (clr='0') then q<='0';
		elsif(falling_edge(clk)) then
			q<=d; 
		end if;	
	end process;
end behav;

			