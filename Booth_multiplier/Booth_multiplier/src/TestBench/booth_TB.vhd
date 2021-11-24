library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity booth_tb is
end booth_tb;
architecture TB_ARCHITECTURE of booth_tb is
-- Component declaration of the tested unit
component booth
port(
m : in SIGNED(7 downto 0);
q : in SIGNED(7 downto 0);
p : out SIGNED(15 downto 0) );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal m : SIGNED(7 downto 0);
signal q : SIGNED(7 downto 0);
-- Observed signals - signals mapped to the output ports of tested entity
signal p : SIGNED(15 downto 0);
-- Add your code here ...
begin
-- Unit Under Test port map
UUT : booth
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
configuration TESTBENCH_FOR_booth of booth_tb is
for TB_ARCHITECTURE
for UUT : booth
use entity work.booth(behavioral);
end for;
end for;
end TESTBENCH_FOR_booth;