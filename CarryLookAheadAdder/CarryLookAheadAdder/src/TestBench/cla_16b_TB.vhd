library ieee;
use ieee.std_logic_1164.all;
-- Add your library and packages declaration here ...
entity cla_16b_tb is
end cla_16b_tb;
architecture TB_ARCHITECTURE of cla_16b_tb is
-- Component declaration of the tested unit
component cla_16b
port(
c00 : in STD_LOGIC;
a : in STD_LOGIC_VECTOR(15 downto 0);
b : in STD_LOGIC_VECTOR(15 downto 0);
s : out STD_LOGIC_VECTOR(15 downto 0);
c16 : out STD_LOGIC;
p_dpar : out STD_LOGIC;
g_dpar : out STD_LOGIC );
end component;
-- Stimulus signals - signals mapped to the input and inout ports of tested entity
signal c00 : STD_LOGIC;
signal a : STD_LOGIC_VECTOR(15 downto 0);
signal b : STD_LOGIC_VECTOR(15 downto 0);
-- Observed signals - signals mapped to the output ports of tested entity
	signal s : STD_LOGIC_VECTOR(15 downto 0);
signal c16 : STD_LOGIC;
signal p_dpar : STD_LOGIC;
signal g_dpar : STD_LOGIC;
-- Add your code here ...
begin
-- Unit Under Test port map
UUT : cla_16b
port map (
c00 => c00,
a => a,
b => b,
s => s,
c16 => c16,
p_dpar => p_dpar,
g_dpar => g_dpar
);
-- Add your stimulus here ...
	process
	begin
		a<="0000110001100000";
		b<="0000000110000000";
		c00<='0';
		wait for 10ns;
		a<="0000110001100000";
		b<="0000000110000000";
		c00<='1';
		wait for 10ns;
		a<="0000110001100000";
		b<="0110000110000000";
		c00<='0';
		wait for 10ns;
		a<="1000110001100000";
		b<="0000000110000110";
		c00<='0';
		wait for 10ns;
	end process;
end TB_ARCHITECTURE;
configuration TESTBENCH_FOR_cla_16b of cla_16b_tb is
for TB_ARCHITECTURE
for UUT : cla_16b
use entity work.cla_16b(structural);
end for;
end for;
end TESTBENCH_FOR_cla_16b;