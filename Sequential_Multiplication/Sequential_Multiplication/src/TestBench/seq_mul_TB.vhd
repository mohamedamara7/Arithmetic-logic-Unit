library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity seq_mul_tb is
end seq_mul_tb;
architecture TB_ARCHITECTURE of seq_mul_tb is
-- Component declaration of the tested unit
component seq_mul
port(
m : in UNSIGNED(7 downto 0);
q : in UNSIGNED(7 downto 0);
p : out UNSIGNED(15 downto 0) );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal m : UNSIGNED(7 downto 0);
signal q : UNSIGNED(7 downto 0);
-- Observed signals - signals mapped to the output ports of tested entity
signal p : UNSIGNED(15 downto 0);
-- Add your code here ...
begin
-- Unit Under Test port map
UUT : seq_mul
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
configuration TESTBENCH_FOR_seq_mul of seq_mul_tb is
for TB_ARCHITECTURE
for UUT : seq_mul
use entity work.seq_mul(behavioral);
end for;
end for;
end TESTBENCH_FOR_seq_mul;
