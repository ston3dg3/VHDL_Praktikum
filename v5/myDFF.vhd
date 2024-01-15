-- D-FlipFlop with enable and reset

library ieee;
use ieee.std_logic_1164.all;

entity myDFF is
  port
  (
    d, clk, en, res : in std_logic;
    q, qb           : out std_logic);
end myDFF;

architecture behav of myDFF is
  signal q_int : std_logic;
begin
  process (clk)
  begin
    if (clk'EVENT and clk = '1') then
      if res = '1' then
        q_int <= '0';
      elsif en = '1' then
        q_int <= d;
      end if;
    end if;
  end process;
  q  <= q_int;
  qb <= not q_int;
end behav;