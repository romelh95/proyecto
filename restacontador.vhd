library IEEE;
     use IEEE.STD_LOGIC_1164.all;
     use IEEE.NUMERIC_STD.all;
     use ieee.std_logic_unsigned.all;
ENTITY restacontador IS
       GENeric (n:INTEGER:=8); 
       PORT (a : IN std_logic_vector(n-1 DOWNTO 0); 
             salida : OUT std_logic_vector(n-1 DOWNTO 0));
     END restacontador;
 
     ARCHITECTURE synth OF restacontador IS
     BEGIN
 
       PROCESS (a) IS
       BEGIN
         salida <= std_logic_vector(UNSIGNED(a) - "00000001");
       END PROCESS;
     END synth;
