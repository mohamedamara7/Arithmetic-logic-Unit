library ieee;
use ieee.std_logic_1164.all;  

entity bc is
	port(x,y,c:in std_logic;
	p:inout std_logic;
	g,s: out std_logic);
end bc;	

architecture df of bc is
begin
	g<=x and y;
	p<=x xor y;
	s<=p xor c;
end df;