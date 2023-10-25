library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Register_M is
    Port (
        clk         : in STD_LOGIC;
        reset       : in STD_LOGIC;
        readEnable  : in STD_LOGIC;
        writeEnable : in STD_LOGIC;
        readAddr   : in STD_LOGIC_VECTOR(3 downto 0);	
        writeAddr   : in STD_LOGIC_VECTOR(3 downto 0);
        writeData   : in STD_LOGIC_VECTOR(31 downto 0);
        readData   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end Register_M;

architecture Behavioral of Register_M is
    type RegisterArray is array (0 to 15) of STD_LOGIC_VECTOR(31 downto 0);
    signal registers : RegisterArray := (others => (others => '0'));

begin
    process(clk, reset)
    begin
        if reset = '1' then
            -- Reset all registers to zero
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            -- Read operations
            if readEnable = '1' then
                readData <= registers(to_integer(unsigned(readAddr)));
            end if;
		  elsif falling_edge(clk) then
            -- Write operation
            if writeEnable = '1' then
                registers(to_integer(unsigned(writeAddr))) <= writeData;
            end if;
        end if;
    end process;
end Behavioral;