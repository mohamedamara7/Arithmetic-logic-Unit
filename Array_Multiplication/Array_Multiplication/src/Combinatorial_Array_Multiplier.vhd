library ieee;
use ieee.std_logic_1164.all;
entity uam is
	port(m,q:in std_logic_vector(7 downto 0);
	p:out std_logic_vector(15 downto 0));
end uam;
architecture df of uam is
	component cell_entity is
		port(m,q,previous_pp,cin:in std_logic;
		sum,carry:out std_logic);
	end component;
	type arr is array (natural range <>, natural range <>) of std_logic;
	signal c:arr(7 downto 0,8 downto 0):=((others=> (others=>'0')));
	signal pp:arr(7 downto 0,7 downto 0);
begin
	l0:for j in 0 to 7 generate
		cell:cell_entity port map(m(j),q(0),'0',c(0,j),pp(0,j),c(0,j+1));
	end generate;
	l2:for i in 1 to 7 generate
		cell:cell_entity port map(m(7),q(i),c(i-1,8),c(i,7),pp(i,7),c(i,8));
	end generate;
	l3:for i in 1 to 7 generate
		l4:for j in 0 to 6 generate
			cell:cell_entity port map(m(j),q(i),pp(i-1,j+1),c(i,j),pp(i,j),c(i,j+1));
		end generate;
	end generate;
	l5:for i in 0 to 7 generate
		p(i)<=pp(i,0);
	end generate;
	l6:for j in 1 to 7 generate
		p(j+7)<=pp(7,j);
	end generate;
	p(15)<=c(7,8);
end df;