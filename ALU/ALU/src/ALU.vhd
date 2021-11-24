library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --for adding vectors
use ieee.numeric_std.all; --for conversion to integer and signed
use alu_pack.all; 

entity alu_entity is
	port(a,b:in std_logic_vector(7 downto 0);
	sel:in alu_type;
	z:out std_logic_vector(7 downto 0));
end alu_entity;			   

architecture alu_arch of alu_entity is
begin
	process(a,b,sel)
	begin
		case sel is
			when no =>
			z<=a;
			when add =>
			z<= a+b;
			when sub =>
			z<=a-b;
			when inc =>
			z<=a+"00000001";
			when dec =>
			z<=a-"00000001";
			when zero =>
			z<=(others=>'0');
			when shl =>
			z<=to_StdLogicVector(to_bitvector(a) sll to_integer(signed(b)));
			when shr =>
			z<=to_StdLogicVector(to_bitvector(a) srl to_integer(signed(b)));
			when rotl =>
			z<=to_StdLogicVector(to_bitvector(a) rol to_integer(signed(b)));
			when rotr =>
			z<=to_StdLogicVector(to_bitvector(a) ror to_integer(signed(b)));
		end case;
	end process;
end alu_arch;
