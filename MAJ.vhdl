library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity MAJ is
	port (X, Y, Z: in std_logic_vector(31 downto 0); OUTPUT: out std_logic_vector(31 downto 0));
end entity MAJ;

architecture Struct of MAJ is
begin
	OUTPUT <= (X and Y) xor (Y and Z) xor (Z and X);
end Struct;