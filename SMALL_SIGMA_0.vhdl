library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SMALL_SIGMA_0 is 
port (x: in std_logic_vector(31 downto 0); y: out std_logic_vector(31 downto 0));
end entity SMALL_SIGMA_0;

architecture bhv of SMALL_SIGMA_0 is	
signal S1,S2,S3: std_logic_vector(31 downto 0);
begin
ROT1:for i in 0 to 31 generate
	SH11:if (i<25) generate
		S1(i) <= x(7+i);
	end generate;
	SH12:if (i>24) generate
		S1(i) <= x(i-25);
	end generate;
end generate;

ROT2:for i in 0 to 31 generate
	SH21:if (i<14) generate
		S2(i) <= x(18+i);
	end generate;
	SH22:if (i>13) generate
		S2(i) <= x(i-14);
	end generate;
end generate;
 
ROT3:for i in 0 to 31 generate
	SH31:if (i<29) generate
		S3(i) <= x(3+i);
	end generate;
	SH32:if (i>28) generate
		S3(i) <= '0';
	end generate;
end generate;

FIN:for i in 0 to 31 generate
y(i) <= S1(i) xor S2(i) xor S3(i);
end generate;

end architecture;