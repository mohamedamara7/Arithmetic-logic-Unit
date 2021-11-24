library ieee;
use ieee.std_logic_1164.all;

entity r_cnt is
	port(
	clk,clr:in std_logic ;
	cout:inout std_logic_vector(3 downto 0));
end r_cnt;

architecture structural of r_cnt is	
--tff operates with inverted clock
component tff is
	port(t,clk,clr:in std_logic;
	q:inout std_logic);
end component;	  
 
begin 	  
	ff0:tff port map('1',clk,clr,cout(0));
	ff1:tff port map('1',cout(0),clr,cout(1));
	ff2:tff port map('1',cout(1),clr,cout(2));
	ff3:tff port map('1',cout(2),clr,cout(3));
end structural;