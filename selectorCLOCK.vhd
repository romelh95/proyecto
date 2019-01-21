LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY selectorCLOCK IS
PORT(SEL, NORMAL, MANUAL:IN STD_LOGIC;DOUT:OUT STD_LOGIC);
END selectorCLOCK ;
ARCHITECTURE BEH123 OF selectorCLOCK IS
BEGIN
PROCESS(SEL,NORMAL,MANUAL)
BEGIN
CASE SEL IS
WHEN '0' => DOUT<=NORMAL;
WHEN '1' => DOUT<=MANUAL;
end case;
END PROCESS;
END BEH123;