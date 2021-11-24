library ieee;
use ieee.std_logic_1164.all;

entity r_cnt is
	port(
	clk,clr:in std_logic ;
	cout:inout std_logic_vector(3 downto 0));
end r_cnt;

architecture structural of r_cnt is	
--tff operates with inverted clock
component dff is
	port(d,clk,clr:in std_logic;
	q:out std_logic);
end component;	  
component inverter is
	port(a:in std_logic;
	b:out std_logic);
end component;
signal temp:std_logic_vector(3 downto 0);
begin
	inv0:inverter port map(cout(0),temp(0));
	inv1:inverter port map(cout(1),temp(1));
	inv2:inverter port map(cout(2),temp(2));
	inv3:inverter port map(cout(3),temp(3));
	ff0:dff port map(temp(0),clk,clr,cout(0));
	ff1:dff port map(temp(1),cout(0),clr,cout(1));
	ff2:dff port map(temp(2),cout(1),clr,cout(2));
	ff3:dff port map(temp(3),cout(2),clr,cout(3));
end structural;