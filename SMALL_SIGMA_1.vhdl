library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SMALL_SIGMA_1 is 
port (x: in std_logic_vector(31 downto 0); y: out std_logic_vector(31 downto 0));
end entity SMALL_SIGMA_1;

architecture bhv of SMALL_SIGMA_1 is	
signal S1,S2,S3: std_logic_vector(31 downto 0);
begin
ROT1:for i in 0 to 31 generate
	SH11:if (i<15) generate
		S1(i) <= x(17+i);
	end generate;
	SH12:if (i>14) generate
		S1(i) <= x(i-15);
	end generate;
end generate;

ROT2:for i in 0 to 31 generate
	SH21:if (i<13) generate
		S2(i) <= x(19+i);
	end generate;
	SH22:if (i>12) generate
		S2(i) <= x(i-13);
	end generate;
end generate;
 
ROT3:for i in 0 to 31 generate
	SH31:if (i<22) generate
		S3(i) <= x(10+i);
	end generate;
	SH32:if (i>21) generate
		S3(i) <= '0';
	end generate;
end generate;

FIN:for i in 0 to 31 generate
y(i) <= S1(i) xor S2(i) xor S3(i);
end generate;

end architecture;