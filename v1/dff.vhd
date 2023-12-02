
-- D-FlipFlop

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff is
  port
  (
    d, clk : in std_logic;
    q      : out std_logic);
end dff;

architecture behav of dff is
begin
  process (clk)
  begin
    if (clk'EVENT and clk = '1') then
      q <= d;
    end if;
  end process;
end behav;