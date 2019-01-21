LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY selectordis IS
PORT(p: IN STD_LOGIC_VECTOR (11 downto 0);
		i0,ii1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11: in STD_LOGIC_VECTOR (3 downto 0);
		inH1,inmin1 : in STD_LOGIC_VECTOR (3 downto 0);
		j0,j1,j2,j3,j4,j5,j6,j7,j8,j9,j10,j11: in STD_LOGIC_VECTOR (3 downto 0);
		inH2,inmin2 : in STD_LOGIC_VECTOR (3 downto 0);
		uno, dos, tres, cuatro: out STD_LOGIC_VECTOR (3 downto 0));
END selectordis;

ARCHITECTURE sol OF selectordis IS
		BEGIN
	   PROCESS (p,i0,ii1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11) IS

		begin 
		CASE p IS

			WHEN "000000000001" => uno<=i0;dos<=j0;tres<="1111"; cuatro<="1111";
			WHEN "000000000010" => uno<=ii1;dos<=j1;tres<="1111"; cuatro<="1111";
			WHEN "000000000100" => uno<=i2;dos<=j2;tres<="1111"; cuatro<="1111";
			WHEN "000000001000" => uno<=i3;dos<=j3;tres<="1111"; cuatro<="1111";
			WHEN "000000010000" => uno<=i4;dos<=j4;tres<="1111"; cuatro<="1111";
			WHEN "000000100000" => uno<=i5;dos<=j5;tres<="1111"; cuatro<="1111";
			WHEN "000001000000" => uno<=i6;dos<=j6;tres<="1111"; cuatro<="1111";
			WHEN "000010000000" => uno<=i7;dos<=j7;tres<="1111"; cuatro<="1111";
			WHEN "000100000000" => uno<=i8;dos<=j8;tres<="1111"; cuatro<="1111";
			WHEN "001000000000" => uno<=i9;dos<=j9;tres<="1111"; cuatro<="1111";
			WHEN "010000000000" => uno<=i10;dos<=j10;tres<="1111"; cuatro<="1111";
			WHEN "100000000000" => uno<=i11;dos<=j11;tres<="1111"; cuatro<="1111";
			WHEN others => uno<=inH1;dos<=inH2;tres<=inmin1; cuatro<=inmin2;
		end case;
		end PROCESS;
end sol;
				