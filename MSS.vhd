--MSS de la tienda

LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

entity MSS is
	port	(	clock, resetn, start, cambioDia: in std_logic;
				Slunes,Smartes,Smiercoles,Sjueves,Sviernes,Ssabado,Sdomingo: out std_logic;
				ENlunes,ENmartes,ENmiercoles,ENjueves,ENviernes,ENsabado,ENdomingo: out std_logic;
				reset_todo: out std_logic);
end MSS;

architecture sol of MSS is
type estado is (ta, tb, tc, tcc, td, tdd, te, tee, tf, tff, tg, tgg, th, thh, ti, tii,est);
signal y: estado;
begin
MSS_transiciones:process(resetn,clock)
	begin
		if (resetn='0') then y<=ta;
		elsif(clock'event and clock='1') then
			case y is
						when ta =>if start='1' then y<=tb;
										else y<=ta;end if;
						when tb =>if start='0' then y<=est;
										else y<=tb;end if;
						when est=> y<=tcc;
						when tcc => y<=tc;
						when tc => if cambioDia='1' then y<=tdd;--lunes
											else y<=tc;end if;
						when tdd => y<=td;
						when td => if cambioDia='1' then y<=tee;--martes
											else y<=td;end if;
						when tee => y<=te;
						when te => if cambioDia='1' then y<=tff;--miercoles
											else y<=te;end if;
						when tff => y<=tf;
						when tf => if cambioDia='1' then y<=tgg;--jueves
											else y<=tf;end if;
						when tgg => y<=tg;
						when tg => if cambioDia='1' then y<=thh;--viernes
											else y<=tg;end if;
						when thh => y<=th;
						when th => if cambioDia='1' then y<=tii;--sabado
											else y<=th;end if;
						when tii => y<=ti;
						when ti => if cambioDia='1' then y<=tb;--domingo
											else y<=ti;end if;
			end case;
		end if;
end process;

MSS_salidas: process (y)
		begin
			Slunes<='0';Smartes<='0';Smiercoles<='0';Sjueves<='0';Sviernes<='0';Ssabado<='0';Sdomingo<='0';reset_todo<='1';
			ENlunes<='0';ENmartes<='0';ENmiercoles<='0';ENjueves<='0';ENviernes<='0';ENsabado<='0';ENdomingo<='0';
		
			case y is 
					when ta =>
					when tb => reset_todo<='0';
					when est=>
					when tcc =>ENlunes<='1';Slunes<='1';
					when tc => ENlunes<='1';----------------lunes
					when tdd =>ENmartes<='1';Smartes<='1';
					when td => ENmartes<='1';---------------martes
					when tee =>ENmiercoles<='1';Smiercoles<='1';
					when te => ENmiercoles<='1';------------miercoles
					when tff =>ENjueves<='1';Sjueves<='1';
					when tf => ENjueves<='1';---------------jueves
					when tgg =>ENviernes<='1';Sviernes<='1';
					when tg => ENviernes<='1';--------------viernes
					when thh =>ENsabado<='1';Ssabado<='1';
					when th => ENsabado<='1';---------------sabado
					when tii =>ENdomingo<='1';Sdomingo<='1';
					when ti => ENdomingo<='1';--------------domingo 
			end case;
end process;
end sol;