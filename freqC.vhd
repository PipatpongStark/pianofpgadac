library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freqC is
    Port (
        clk_in : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end freqC;

architecture Behavioral of freqC is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 191110 := 0;
begin
    frequency_divider: process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = 191110) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;