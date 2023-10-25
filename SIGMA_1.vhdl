library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SIGMA_1 is 
port (x: in std_logic_vector(31 downto 0); y: out std_logic_vector(31 downto 0));
end entity SIGMA_1;

architecture bhv of SIGMA_1 is	
signal S1,S2,S3: std_logic_vector(31 downto 0);
begin
ROT1:for i in 0 to 31 generate
	SH11:if (i<26) generate
		S1(i) <= x(6+i);
	end generate;
	SH12:if (i>25) generate
		S1(i) <= x(i-26);
	end generate;
end generate;

ROT2:for i in 0 to 31 generate
	SH21:if (i<21) generate
		S2(i) <= x(11+i);
	end generate;
	SH22:if (i>20) generate
		S2(i) <= x(i-21);
	end generate;
end generate;
 
ROT3:for i in 0 to 31 generate
	SH31:if (i<7) generate
		S3(i) <= x(25+i);
	end generate;
	SH32:if (i>6) generate
		S3(i) <= x(i-7);
	end generate;
end generate;

FIN:for i in 0 to 31 generate
y(i) <= S1(i) xor S2(i) xor S3(i);
end generate;

end architecture;
