--tff operates with inverted clock
library ieee;
use ieee.std_logic_1164.all;

entity tff is
	port(t,clk,clr:in std_logic;
	q:inout std_logic);
end tff;

architecture behav of tff is
signal temp:std_logic;
begin
	process(clk,clr)
	begin 
		if (clr='0') then q<='0';
		elsif(falling_edge(clk)) then
			if(t='1') then  q<=not q; 
			end if;
		end if;	
	end process;
end behav;

			