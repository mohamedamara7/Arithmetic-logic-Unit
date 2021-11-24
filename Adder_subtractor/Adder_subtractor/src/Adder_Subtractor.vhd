library ieee;
use ieee.std_logic_1164.all;  

entity as is
	port(a,b:in std_logic_vector(7 downto 0);
	op:in std_logic; --op=0 addition,op=1 subtraction
	s:out std_logic_vector(7 downto 0);
	overflow,cout: out std_logic);
end as;				   

architecture structural of as is
	component fa is
	port(x,y,cin:in std_logic;
	s,cout: out std_logic);
	end component;
	signal c:std_logic_vector(7 downto 0);
	signal temp:std_logic_vector(7 downto 0);
begin
	temp(0)<=b(0) xor op;
	temp(1)<=b(1) xor op;
	temp(2)<=b(2) xor op;
	temp(3)<=b(3) xor op;
	temp(4)<=b(4) xor op;
	temp(5)<=b(5) xor op;
	temp(6)<=b(6) xor op;
	temp(7)<=b(7) xor op;
	fa0: fa port map(a(0),temp(0),op,s(0),c(0));
	fa1: fa port map(a(1),temp(1),c(0),s(1),c(1));
	fa2: fa port map(a(2),temp(2),c(1),s(2),c(2));
	fa3: fa port map(a(3),temp(3),c(2),s(3),c(3));
	fa4: fa port map(a(4),temp(4),c(3),s(4),c(4));
	fa5: fa port map(a(5),temp(5),c(4),s(5),c(5));
	fa6: fa port map(a(6),temp(6),c(5),s(6),c(6));
	fa7: fa port map(a(7),temp(7),c(6),s(7),c(7));
	overflow<= c(7) xor c(6);
	cout<=c(7);
end structural;