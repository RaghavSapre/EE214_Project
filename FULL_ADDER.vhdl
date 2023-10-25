library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity FULL_ADDER_1  is
  port (A, B, Cin: in std_logic; SUM, CARRY: out std_logic);
end entity ;

architecture Struct of FULL_ADDER_1 is
	signal S, C1, C2 : std_logic;
begin
  -- component instances
  HA1: HALF_ADDER port map (A => A, B => B, S => S, C => C1);
  HA2: HALF_ADDER port map (A => S, B => Cin, S => SUM, C => C2);
  OR1: OR_2 port map (A => C1, B => C2, Y => CARRY);
end Struct;
