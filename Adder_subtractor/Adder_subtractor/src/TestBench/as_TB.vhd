library ieee;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity as_tb is
end as_tb;
architecture TB_ARCHITECTURE of as_tb is
-- Component declaration of the tested unit
component as
port(
a : in STD_LOGIC_VECTOR(7 downto 0);
b : in STD_LOGIC_VECTOR(7 downto 0);
op : in STD_LOGIC;
s : out STD_LOGIC_VECTOR(7 downto 0);
overflow : out STD_LOGIC;
cout : out STD_LOGIC );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal a : STD_LOGIC_VECTOR(7 downto 0);
signal b : STD_LOGIC_VECTOR(7 downto 0);
signal op : STD_LOGIC;
-- Observed signals - signals mapped to the output ports of tested entity
signal s : STD_LOGIC_VECTOR(7 downto 0);
signal overflow : STD_LOGIC;
signal cout : STD_LOGIC;
-- Add your code here ...
begin
-- Unit Under Test port map
	UUT : as
	port map (
	a => a,
	b => b,
	op => op,
	s => s,
	overflow => overflow,
	cout => cout
	);
-- Add your stimulus here ...
process
	begin
	a<="00010100";
	b<="00100010";
	op<='0';
	wait for 10ns;
	a<="00010100";
	b<="00100010";
	op<='1';
	wait for 10ns;
	a<="00010100";
	b<="00101110";
	op<='0';
	wait for 10ns;
	a<="00010100";
	b<="00101110";
	op<='1';
	wait for 10ns;
	end process;
end TB_ARCHITECTURE;
configuration TESTBENCH_FOR_as of as_tb is
for TB_ARCHITECTURE
for UUT : as
use entity work.as(structural);
end for;
end for;
end TESTBENCH_FOR_as;