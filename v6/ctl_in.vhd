----------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctl_in is
  port
  (
    clk         : in std_logic;
    res         : in std_logic;
    hg_done     : in std_logic;
    ready       : out std_logic;
    output_head : out std_logic;
    inc_aal1    : out std_logic;
    sel         : out std_logic_vector(1 downto 0);
    we_fifo     : out std_logic);
end entity ctl_in;

architecture rtl of ctl_in is

  -- define data counter
  signal data_cnt : std_logic_vector(8 downto 0) := (others => '0');

  -- define states for the FSM
  type state is (init, start, head_write, new_aal1, aal1_write, waiting, data_write, last_byte);

  -- FSM signals
  signal cur_state  : state := init; -- init is the safe reset state
  signal next_state : state := init; -- system stays in init when reset

begin

  -- =================== p1 current state process  ======================

  p1 : process (cur_state, data_cnt, hg_done)
  begin
    case cur_state is

        -- init state (1 branch)
      when init =>
        if (hg_done = '1') then
          next_state <= start;
          report "going to start state";
        else
          next_state <= init;
          report "staying in init state";
        end if;

        -- start state (no branches)
      when start =>
        next_state <= head_write;
        report "going to head_write state";

        -- head_write state (one branch)
      when head_write =>
        if (to_integer(unsigned(data_cnt)) = 4) then
          next_state <= new_aal1;
          report "going to new_aal1 state";
        else
          next_state <= head_write;
          report "staying in head_write state";
        end if;

        -- new_aal1 state (no branches)
      when new_aal1 =>
        next_state <= aal1_write;
        report "going to aal1_write state";

        -- aal1_write state (no branches)
      when aal1_write =>
        next_state <= waiting;
        report "going to waiting state";

        -- waiting state (two branches)
      when waiting =>
        if (data_cnt(2 downto 0) = "111") then
          if (to_integer(unsigned(data_cnt)) = 375) then
            next_state <= last_byte;
            report "going to last_byte state";
          else
            next_state <= data_write;
            report "going to data_write state";
          end if;
        end if;

        -- data_write state (no branches)
      when data_write =>
        next_state <= waiting;
        report "going to waiting state";

        -- last_byte state (no branches)
      when last_byte =>
        next_state <= head_write;
        report "NEW AAL1 WRITE: going to head_write state";

        -- undefined behaviour (go back to init state)
      when others =>
        next_state <= init;
        report "ERROR, going to init state";

    end case;

    -- ==================== Ausgangslogik ===============================

    case cur_state is

        -- init Steuersignale (Ausgangslogik)
      when init =>
        ready       <= '0';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00"; -- egal
        we_fifo     <= '0';

        -- start Steuersignale (Ausgangslogik)
      when start =>
        ready       <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "00"; -- egal
        we_fifo     <= '0';

        -- head_write Steuersignale (Ausgangslogik)
      when head_write =>
        ready       <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "10"; -- Ausgabe der Daten des Header Generators
        we_fifo     <= '1';

        -- new_aal1 Steuersignale (Ausgangslogik)
      when new_aal1 =>
        ready       <= '1';
        output_head <= '0';
        inc_aal1    <= '1';
        sel         <= "10"; -- Ausgabe der Daten des Header Generators
        we_fifo     <= '1';

        -- aal1_write Steuersignale (Ausgangslogik)
      when aal1_write =>
        ready       <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "01"; -- Ausgabe der Daten des AAL1 Generators
        we_fifo     <= '1';

        -- waiting Steuersignale (Ausgangslogik)
      when waiting =>
        ready       <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00"; -- egal
        we_fifo     <= '0';

        -- data_write Steuersignale (Ausgangslogik)
      when data_write =>
        ready       <= '1';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00"; -- Ausgabe der Daten vom S/P Wandler
        we_fifo     <= '1';

        -- last_byte Steuersignale (Ausgangslogik)
      when last_byte =>
        ready       <= '1';
        output_head <= '1';
        inc_aal1    <= '0';
        sel         <= "00"; -- Ausgabe der Daten vom S/P Wandler
        we_fifo     <= '1';

        -- undefined behaviour (go back to init state)
      when others =>
        ready       <= '0';
        output_head <= '0';
        inc_aal1    <= '0';
        sel         <= "00"; -- egal
        we_fifo     <= '0';

    end case;
  end process p1;

  -- ==================== p2 next state process ====================

  p2 : process (clk)
  begin
    if clk'EVENT and clk = '1' then
      if res = '1' then
        cur_state <= init;
        data_cnt  <= (others => '0');
      else

        -- update current state
        cur_state <= next_state;

        -- increment data counter if bit was received
        if to_integer(unsigned(data_cnt)) = 375 then
          data_cnt <= (others => '0');
        elsif cur_state /= init then
          data_cnt <= std_logic_vector(to_unsigned(to_integer(unsigned(data_cnt)) + 1, data_cnt'length));

        end if;
      end if;
    end if;
  end process p2;

  -- I have dedided to put data counter increment logic in the p2 process
  -- because it has almost the same structure as p2 process (it requires to check reset signal)

  -- ====================== p3 data counter process =================

  -- OLD CODE:

  -- p3 : process (clk)
  -- begin
  --   -- increment data counter if bit was received
  --   if clk'EVENT and clk = '1' then
  --     if to_integer(unsigned(data_cnt)) = 375 then
  --       data_cnt <= (others => '0');
  --     elsif cur_state /= init then
  --       data_cnt <= std_logic_vector(to_unsigned(to_integer(unsigned(data_cnt)) + 1, data_cnt'length));
  --     end if;
  --   end if;

  -- end process p3;

end architecture;