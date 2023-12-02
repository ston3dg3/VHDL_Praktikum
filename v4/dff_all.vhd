
-- D-FlipFlop

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff_all is
  port
  (
    d, clk, res : in std_logic;
    q           : out std_logic);
end dff_all;

architecture behav of dff_all is
begin
  process (clk)
  begin
    if (clk'EVENT and clk = '1') then
      if (res = '1') then
        q <= '0';
      elsif () then
        q <= d;
      end if;
    end if;
  end process;
end behav;