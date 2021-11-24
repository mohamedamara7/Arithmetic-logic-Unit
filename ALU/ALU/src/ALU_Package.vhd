library ieee;
use ieee.std_logic_1164.all; 

entity alu_pack_entity is
end alu_pack_entity;  

package alu_pack is
	type alu_type is(no,add,sub,inc,dec,zero,shl,shr,rotl,rotr);
end alu_pack; 

architecture alu_pack_arch of alu_pack_entity is
begin
end alu_pack_arch;
