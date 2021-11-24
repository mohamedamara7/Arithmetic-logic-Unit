library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity non_res is
	port(m,q:in unsigned(7 downto 0);
	qoutient:out unsigned(7 downto 0);
	remainder:out unsigned(8 downto 0));
end non_res;		 

architecture behavioral of non_res is
begin
	process(m,q)
	variable a,m_temp:unsigned(8 downto 0);
	variable q_temp:unsigned(7 downto 0);
	begin
		a:=(others=>'0');
		q_temp:=q;
		m_temp:=('0'&m);
		for i in 0 to 7 loop
			if (a(8)='0') then
				a:=a(7 downto 0)&q_temp(7);
				q_temp:=q_temp(6 downto 0)&'0';
				a:=a-m_temp;
				q_temp(0):=not(a(8));
			else
				a:=a(7 downto 0)&q_temp(7);
				q_temp:=q_temp(6 downto 0)&'0';
				a:=a+m_temp;
				q_temp(0):=not(a(8));
			end if;
		end loop;
		if (a(8)='1') then
			a:=a+m_temp;
		end if;
		qoutient<=q_temp;
		remainder<=a;
	end process;
end behavioral;
