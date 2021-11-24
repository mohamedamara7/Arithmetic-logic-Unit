library ieee;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity r_cnt_tb is
end r_cnt_tb;

architecture TB_ARCHITECTURE of r_cnt_tb is
	-- Component declaration of the tested unit
	component r_cnt
	port(
		clk : in STD_LOGIC;
		clr : in STD_LOGIC;
		cout : inout STD_LOGIC_VECTOR(3 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal clr : STD_LOGIC;
	signal cout : STD_LOGIC_VECTOR(3 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : r_cnt
		port map (
			clk => clk,
			clr => clr,
			cout => cout
		);

	-- Add your stimulus here ...
	process
	begin	
		clr<='0';
		clk<='-';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		clr<='1';
		clk<='0';
		wait for 10ns;
		clr<='1';
		clk<='1';
		wait for 10ns;
		
		
	end process;
	

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_r_cnt of r_cnt_tb is
	for TB_ARCHITECTURE
		for UUT : r_cnt
			use entity work.r_cnt(structural);
		end for;
	end for;
end TESTBENCH_FOR_r_cnt;

