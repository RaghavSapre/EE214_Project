library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MASTER_BLOCK is
port (M: in std_logic_vector(31 downto 0),
		K: in std_logic_vector(31 downto 0),
		R_j2, R_j7,R_j15,R_j16: in std_logic_vector(31 downto 0),
		A_in: in std_logic_vector(31 downto 0),
		B_in: in std_logic_vector(31 downto 0),
		C_in: in std_logic_vector(31 downto 0),
		D_in: in std_logic_vector(31 downto 0),
		E_in: in std_logic_vector(31 downto 0),
		F_in: in std_logic_vector(31 downto 0),
	   G_in: in std_logic_vector(31 downto 0),
		H_in: in std_logic_vector(31 downto 0),
		A_out: out std_logic_vector(31 downto 0),
		B_out: out std_logic_vector(31 downto 0),
		C_out: out std_logic_vector(31 downto 0),
		D_out: out std_logic_vector(31 downto 0),
		E_out: out std_logic_vector(31 downto 0),
		F_out: out std_logic_vector(31 downto 0),
	   G_out: out std_logic_vector(31 downto 0),
		H_out: out std_logic_vector(31 downto 0),
		W_out: out std_logic_vector(31 downto 0),
		MUX_ctrl: in std_logic
		);
end entity MASTER_BLOCK;