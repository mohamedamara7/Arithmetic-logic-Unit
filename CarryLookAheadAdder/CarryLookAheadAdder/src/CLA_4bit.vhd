library ieee;
use ieee.std_logic_1164.all;

entity cla_4b is
	port(c0:in std_logic;
	a,b:in std_logic_vector(3 downto 0);
	s:out std_logic_vector(3 downto 0);
	p_par,g_par:out std_logic);
end cla_4b;
architecture structural of cla_4b is
	component bc is
		port(x,y,c:in std_logic;
		p:inout std_logic;
		g,s: out std_logic);
	end component;
	component clag3 is
		port(p,g:in std_logic_vector(3 downto 0);
		c0:in std_logic;
		c:out std_logic_vector(3 downto 1);
		g_par,p_par:out std_logic);
	end component;
	signal temp_p,temp_g:std_logic_vector(3 downto 0);
	signal temp_c:std_logic_vector(3 downto 1);
begin
	bc0: bc port map(a(0),b(0),c0,temp_p(0),temp_g(0),s(0));
	bc1: bc port map(a(1),b(1),temp_c(1),temp_p(1),temp_g(1),s(1));
	bc2: bc port map(a(2),b(2),temp_c(2),temp_p(2),temp_g(2),s(2));
	bc3: bc port map(a(3),b(3),temp_c(3),temp_p(3),temp_g(3),s(3));
	clag: clag3 port map(temp_p,temp_g,c0,temp_c,g_par,p_par);
end structural;
