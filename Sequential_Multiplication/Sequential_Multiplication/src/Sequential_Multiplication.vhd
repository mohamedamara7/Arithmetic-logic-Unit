library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;	

entity seq_mul is
	port(m,q:in unsigned(7 downto 0);
	p:out unsigned(15 downto 0));
end seq_mul;	

architecture behavioral of seq_mul is
begin
	process(m,q)
		variable a,m_temp:unsigned(8 downto 0);
		variable q_temp:unsigned(7 downto 0);
		begin
		q_temp:=q;
		a:=(others=>'0');
		m_temp:='0'&m;
		for i in 0 to 7 loop
			if (q_temp(0)='1') then
				a:=a+m_temp;
			end if;
			q_temp:=a(0)&q_temp(7 downto 1);
			a:='0'&a(8 downto 1);
		end loop;
		p<=a(7 downto 0)&q_temp;
	end process;
end behavioral;