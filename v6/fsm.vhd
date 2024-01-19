----------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fsm is
  port
  (
    clk, res, in1, in2 : in bit;
    output_val         : out
    bit_vector(2 downto 0));
end fsm;

architecture two_proc of fsm is
  type state is (S0, S1, S2);
  signal cur_state, nex_state : state;
begin
  p1 : process (cur_state, in1, in2)
  begin
    -- Next-State-Logik
    case cur_state is
      when S0 =>
        if in1 = '1' and in2 = '0' then
          nex_state <= S1;
        elsif in1 = '0' and in2 = '1' then
          nex_state <= S2;
        else
          nex_state <= S0;
        end if;
      when S1 =>
        if in1 = '1' and in2 = '0' then
          nex_state <= S2;
        elsif in1 = '0' and in2 = '1' then
          nex_state <= S0;
        else
          nex_state <= S1;
        end if;
      when S2 =>
        if in1 = '1' and in2 = '0' then
          nex_state <= S0;
        elsif in1 = '0' and in2 = '1' then
          nex_state <= S1;
        else
          nex_state <= S2;
        end if;
    end case;

    -- Ausgangslogik
    case cur_state is
      when S0 =>
        output_val <= "001";
      when S1 =>
        output_val <= "010";
      when S2 =>
        output_val <= "110";
    end case;

  end process p1;

  p2 : process (clk)
  begin
    if clk'EVENT and clk = '1' then
      if res = '1' then
        cur_state <= S0;
      else
        cur_state <= nex_state;
      end if;
    end if;
  end process p2;

end two_proc;