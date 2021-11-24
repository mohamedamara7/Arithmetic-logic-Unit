library ieee;
use ieee.std_logic_1164.all;

entity inverter is
	port(a:in std_logic;
	b:out std_logic);
end inverter;

architecture behav of inverter is
signal temp:std_logic;
begin
	b<=not a;
end behav;

			