library ieee;
use ieee.std_logic_1164.all;	 

entity cell_entity is
		port(m,q,previous_pp,cin:in std_logic;
		sum,carry:out std_logic);
end cell_entity;
architecture cell_architecture of cell_entity is	
	component fa is
		port(x,y,cin:in std_logic;
		s,cout: out std_logic);
	end component;	
	signal temp:std_logic;
begin				 
	temp<=q and m;
	fa0: fa port map(temp,previous_pp,cin,sum,carry);
end cell_architecture;