library ALU;
use ALU.alu_pack.all;
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

	-- Add your library and packages declaration here ...

entity alu_entity_tb is
end alu_entity_tb;

architecture TB_ARCHITECTURE of alu_entity_tb is
	-- Component declaration of the tested unit
	component alu_entity
	port(
		a : in STD_LOGIC_VECTOR(7 downto 0);
		b : in STD_LOGIC_VECTOR(7 downto 0);
		sel : in alu_type;
		z : out STD_LOGIC_VECTOR(7 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal a : STD_LOGIC_VECTOR(7 downto 0);
	signal b : STD_LOGIC_VECTOR(7 downto 0);
	signal sel : alu_type;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal z : STD_LOGIC_VECTOR(7 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : alu_entity
		port map (
			a => a,
			b => b,
			sel => sel,
			z => z
		);

	-- Add your stimulus here ...
	process
	begin
		sel<=no;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=add;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=sub;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=inc;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=dec;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=zero;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=shl;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=shr;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=rotl;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
		sel<=rotr;
		a<="01010110";
		b<="00000010";
		wait for 5ns;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_alu_entity of alu_entity_tb is
	for TB_ARCHITECTURE
		for UUT : alu_entity
			use entity work.alu_entity(alu_arch);
		end for;
	end for;
end TESTBENCH_FOR_alu_entity;

