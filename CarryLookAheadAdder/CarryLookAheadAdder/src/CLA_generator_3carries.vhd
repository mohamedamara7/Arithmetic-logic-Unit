library ieee;
use ieee.std_logic_1164.all;

--last carry will be produced from another generator
entity clag3 is
	port(p,g:in std_logic_vector(3 downto 0);
	c0:in std_logic;
	c:out std_logic_vector(3 downto 1);
	g_par,p_par:out std_logic);
end clag3;					

architecture df of clag3 is
begin
	c(1)<=g(0) or (p(0) and c0);
	c(2)<=g(1) or (p(1) and g(0)) or (p(1) and p(0) and c0);
	c(3)<=g(2) or (p(2) and g(1)) or (p(2) and p(1) and g(0)) or (p(2) and p(1) and p(0) and c0);
	g_par<=g(3) or (p(3) and g(2)) or (p(3) and p(2) and g(1)) or (p(3) and p(2) and p(1) and g(0));
	p_par<=(p(3) and p(2) and p(1) and p(0) and c0);
end df;