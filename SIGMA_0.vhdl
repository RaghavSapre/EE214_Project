library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SIGMA_0 is 
port (x: in std_logic_vector(31 downto 0); y: out std_logic_vector(31 downto 0));
end entity SIGMA_0;

architecture bhv of SIGMA_0 is	
signal S1,S2,S3: std_logic_vector(31 downto 0);
begin
ROT1:for i in 0 to 31 generate
	SH11:if (i<30) generate
		S1(i) <= x(2+i);
	end generate;
	SH12:if (i>29) generate
		S1(i) <= x(i-30);
	end generate;
end generate;

ROT2:for i in 0 to 31 generate
	SH21:if (i<19) generate
		S2(i) <= x(13+i);
	end generate;
	SH22:if (i>18) generate
		S2(i) <= x(i-19);
	end generate;
end generate;
 
ROT3:for i in 0 to 31 generate
	SH31:if (i<10) generate
		S3(i) <= x(22+i);
	end generate;
	SH32:if (i>9) generate
		S3(i) <= x(i-10);
	end generate;
end generate;

FIN:for i in 0 to 31 generate
y(i) <= S1(i) xor S2(i) xor S3(i);
end generate;

end architecture;
