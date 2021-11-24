library ieee;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity uam_tb is
end uam_tb;
architecture TB_ARCHITECTURE of uam_tb is
-- Component declaration of the tested unit
component uam
port(
m : in STD_LOGIC_VECTOR(7 downto 0);
q : in STD_LOGIC_VECTOR(7 downto 0);
p : out STD_LOGIC_VECTOR(15 downto 0) );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal m : STD_LOGIC_VECTOR(7 downto 0);
signal q : STD_LOGIC_VECTOR(7 downto 0);
-- Observed signals - signals mapped to the output ports of tested entity
signal p : STD_LOGIC_VECTOR(15 downto 0);
-- Add your code here ...
begin
-- Unit Under Test port map
UUT : uam
port map (
m => m,
q => q,
p => p
);
-- Add your stimulus here ...
	process
		begin
		m <= "00000100";
		q <= "00000010";
		wait for 10 ns;
		m <= "00000100";
		q <= "00000100";
		wait for 10 ns;
		m <= "11000100";
		q <= "00000100";
		wait for 10 ns;
		m <= "10000100";
		q <= "10000010";
		wait for 10 ns;
	end process;
end TB_ARCHITECTURE;
configuration TESTBENCH_FOR_uam of uam_tb is
for TB_ARCHITECTURE
for UUT : uam
use entity work.uam(df);
end for;
end for;
end TESTBENCH_FOR_uam;