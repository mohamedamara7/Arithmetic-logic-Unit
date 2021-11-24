library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity non_res_tb is
end non_res_tb;
architecture TB_ARCHITECTURE of non_res_tb is
-- Component declaration of the tested unit
component non_res
port(
m : in UNSIGNED(7 downto 0);
q : in UNSIGNED(7 downto 0);
qoutient : out UNSIGNED(7 downto 0);
remainder : out UNSIGNED(8 downto 0) );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal m : UNSIGNED(7 downto 0);
signal q : UNSIGNED(7 downto 0);
-- Observed signals - signals mapped to the output ports of tested entity
signal qoutient : UNSIGNED(7 downto 0);
signal remainder : UNSIGNED(8 downto 0);
-- Add your code here ...
begin
-- Unit Under Test port map
UUT : non_res
port map (
m => m,
q => q,
qoutient => qoutient,
remainder => remainder
);
-- Add your stimulus here ...
	process
	begin
		m <= "00000100";
		q <= "00000010";
		wait for 10 ns;
		m <= "00000011";
		q <= "00001000";
		wait for 10 ns;
		m <= "11000100";
		q <= "00000100";
		wait for 10 ns;
		m <= "10000100";
		q <= "10000010";
		wait for 10 ns;
	end process;
end TB_ARCHITECTURE;
configuration TESTBENCH_FOR_non_res of non_res_tb is
for TB_ARCHITECTURE
for UUT : non_res
use entity work.non_res(behavioral);
end for;
end for;
end TESTBENCH_FOR_non_res;