library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	

entity booth is
	port(m,q:in signed(7 downto 0);
	p:out signed(15 downto 0));
end booth;	   

architecture behavioral of booth is
begin
	process(m,q)
	variable a,q_temp,m_temp:signed(8 downto 0);
	begin
		a:=(others=>'0');
		q_temp:=q&'0';
		m_temp:=m(7)&m;
		for i in 0 to 7 loop
			if (q_temp(1 downto 0)="10") then
				a:=a-m_temp;
			elsif (q_temp(1 downto 0)="01") then
				a:=a+m_temp;
			end if;
			q_temp:=a(0)&q_temp(8 downto 1);
			a:=a(8)&a(8 downto 1);
		end loop;
		p<=a(7 downto 0)&q_temp(8 downto 1);
	end process;
end behavioral;