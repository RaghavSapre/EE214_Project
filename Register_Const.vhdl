library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Register_Const is
    Port (
        clk         : in STD_LOGIC;
        reset       : in STD_LOGIC;
        readEnable  : in STD_LOGIC;
        writeEnable : in STD_LOGIC;
        writeData1   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData2   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData3   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData4   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData5   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData6   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData7   : in STD_LOGIC_VECTOR(31 downto 0);
		  writeData8   : in STD_LOGIC_VECTOR(31 downto 0);
        readData1   : out STD_LOGIC_VECTOR(31 downto 0);
        readData2   : out STD_LOGIC_VECTOR(31 downto 0);
        readData3   : out STD_LOGIC_VECTOR(31 downto 0);
        readData4   : out STD_LOGIC_VECTOR(31 downto 0);
		  readData5   : out STD_LOGIC_VECTOR(31 downto 0);
        readData6   : out STD_LOGIC_VECTOR(31 downto 0);
        readData7   : out STD_LOGIC_VECTOR(31 downto 0);
        readData8   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end Register_Const;

architecture Behavioral of Register_Const is
    type RegisterArray is array (0 to 7) of STD_LOGIC_VECTOR(31 downto 0);
    signal registers : RegisterArray := (
        0  => X"6a09e667",
        1  => X"bb67ae85",
        2  => X"3c6ef372",
        3  => X"a54ff53a",
        4  => X"510e527f",
        5  => X"9b05688c",
        6  => X"1f83d9ab",
        7  => X"5be0cd19");
		  

begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset all registers to zero
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            -- Read operations
            if readEnable = '1' then
                readData1 <= registers(0);
                readData2 <= registers(1);
                readData3 <= registers(2);
                readData4 <= registers(3);
					 readData5 <= registers(4);
                readData6 <= registers(5);
                readData7 <= registers(6);
                readData8 <= registers(7);
            end if;
		  elsif falling_edge(clk) then
            -- Write operation
            if writeEnable = '1' then
                registers(0) <= writeData1;
					 registers(1) <= writeData2;
					 registers(2) <= writeData3;
					 registers(3) <= writeData4;
					 registers(4) <= writeData5;
					 registers(5) <= writeData6;
					 registers(6) <= writeData7;
					 registers(7) <= writeData8;
            end if;
        end if;
    end process;
end Behavioral;