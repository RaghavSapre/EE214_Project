library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Register_W is
    Port (
        clk         : in STD_LOGIC;
        reset       : in STD_LOGIC;
        readEnable  : in STD_LOGIC;
        writeEnable : in STD_LOGIC;
        writeData   : in STD_LOGIC_VECTOR(31 downto 0);
        readData_j2   : out STD_LOGIC_VECTOR(31 downto 0);
        readData_j7   : out STD_LOGIC_VECTOR(31 downto 0);
        readData_j15   : out STD_LOGIC_VECTOR(31 downto 0);
        readData_j16   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end Register_W;

architecture Behavioral of Register_W is
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
                readData_j2 <= registers(14);
                readData_j7 <= registers(9);
                readData_j15 <= registers(1);
                readData_j16 <= registers(0);
            end if;
		  elsif falling_edge(clk) then
            -- Write operation
            if writeEnable = '1' then
					  LP: for i in 1 to 15 loop
								registers(i-1) <= registers(i);
					  end loop;
                registers(15) <= writeData;
            end if;
        end if;
    end process;
end Behavioral;