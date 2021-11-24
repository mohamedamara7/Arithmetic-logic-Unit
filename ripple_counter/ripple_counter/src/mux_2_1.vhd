library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(in0,in1,selector:in std_logic;
	output:out std_logic);
end mux;

architecture dataflow of mux is
begin
output<=not (in0) when selector='0' else 
        not (in1) when selector='1' else 
		'X';
end dataflow;

	