library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity CH is
	port (X, Y, Z: in std_logic_vector(31 downto 0); OUTPUT: out std_logic_vector(31 downto 0));
end entity CH;

architecture Struct of CH is
begin
	OUTPUT <= (X and Y) xor (Z and X);
end Struct;