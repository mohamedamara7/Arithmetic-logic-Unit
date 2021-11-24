library ieee;
use ieee.std_logic_1164.all;   

entity cla_16b is
	port(c00:in std_logic;
	a,b:in std_logic_vector(15 downto 0);
	s:out std_logic_vector(15 downto 0);
	c16,p_dpar,g_dpar:out std_logic);
end cla_16b;		   

architecture structural of cla_16b is
	component cla_4b is
		port(c0:in std_logic;
		a,b:in std_logic_vector(3 downto 0);
		s:out std_logic_vector(3 downto 0);
		p_par,g_par:out std_logic);
	end component;
	component clag4 is
		port(p,g:in std_logic_vector(3 downto 0);
		c0:in std_logic;
		c:out std_logic_vector(4 downto 1);
		g_par,p_par:out std_logic);
	end component;
	signal temp_p_par,temp_g_par:std_logic_vector(3 downto 0);
	signal temp_c:std_logic_vector(4 downto 1);
begin
	c0: cla_4b port map(c00,a(3 downto 0),b(3 downto 0),s(3 downto
	0),temp_p_par(0),temp_g_par(0));
	c1: cla_4b port map(temp_c(1),a(7 downto 4),b(7 downto 4),s(7 downto
	4),temp_p_par(1),temp_g_par(1));
	c2: cla_4b port map(temp_c(2),a(11 downto 8),b(11 downto 8),s(11 downto
	8),temp_p_par(2),temp_g_par(2));
	c3: cla_4b port map(temp_c(3),a(15 downto 12),b(15 downto 12),s(15 downto
	12),temp_p_par(3),temp_g_par(3));
	clag: clag4 port map(temp_p_par,temp_g_par,c00,temp_c,g_dpar,p_dpar);
	c16<=temp_c(4);
end structural;
