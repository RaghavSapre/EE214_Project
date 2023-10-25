library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.FULL_ADDER_1;

entity ADDER  is
  port (A, B: in std_logic_vector(31 downto 0); S: out std_logic_vector(31 downto 0));
end entity ;

architecture Struct of ADDER is
	
	signal C: std_logic_vector(31 downto 0);
begin
  -- component instances
  FA0 : FULL_ADDER_1 port map (A=>A(0), B=>B(0), Cin=>'0', SUM=>S(0), CARRY=>C(0));
  RCA: for i in 1 to 31 generate
		FA: FULL_ADDER_1 port map (A=>A(i), B=>B(i), Cin=>C(i-1), SUM=>S(i), CARRY=>C(i));
  end generate;
end Struct;
