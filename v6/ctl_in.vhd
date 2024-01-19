----------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctl_in is
  port
  (
    ready      : out std_logic;
    set_header : in std_logic;
    head_in    : in std_logic_vector(31 downto 0);
    d_clk      : in std_logic;
    res        : in std_logic;
    data       : in std_logic;
    we_fifo    : out std_logic;
    fifo_data  : out std_logic_vector(7 downto 0)
  );
end entity ctl_in;

architecture rtl of ctl_in is

  -- define data counter
  signal data_cnt : std_logic_vector(9 downto 0) := (others => '0');

  -- define states for the FSM
  type state is (init, start, head_write, new_aal1, aal1_write, waiting, data_write, last_byte);

  -- FSM signals
  signal cur_state  : state := init; -- init is the safe reset state
  signal next_state : state := init; -- system stays in init when reset

  -- define connection signals
  signal output_head : std_logic                    := '0';
  signal hg_done     : std_logic                    := '0';
  signal inc_aal1    : std_logic                    := '0';
  signal sel         : std_logic_vector(1 downto 0) := (others => '0');
begin

  -- =================== p1 current state process  ======================

  p1 : process (cur_state, data_cnt)
  begin
    case cur_state is

        -- init state (1 branch)
      when init =>
        if (hg_done = '1') then
          next_state <= start;
        else
          next_state <= init;
        end if;

        -- start state (no branches)
      when start =>
        next_state <= head_write;

        -- head_write state (one branch)
      when head_write =>
        if (to_integer(unsigned(data_cnt)) = 4) then
          next_state <= new_aal1;
        else
          next_state <= head_write;
        end if;

        -- new_aal1 state (no branches)
      when new_aal1 =>
        next_state <= aal1_write;

        -- aal1_write state (no branches)
      when aal1_write =>
        next_state <= waiting;

        -- waiting state (two branches)
      when waiting =>
        if (data_cnt(2 downto 0) = "111") then
          if (to_integer(unsigned(data_cnt)) = 375) then
            next_state <= last_byte;
          else
            next_state <= data_write;
          end if;
        end if;

        -- data_write state (no branches)
      when data_write =>
        next_state <= waiting;
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

    end case;
  end process p1;

  -- ==================== p2 next state process ====================

  p2 : process (d_clk)
  begin
    if d_clk'EVENT and d_clk = '1' then
      if res = '1' then
        cur_state <= init;
      else
        cur_state <= next_state;
      end if;
    end if;
  end process p2;

  -- ====================== p3 data counter process =================

  p3 : process (d_clk)
  begin
    -- increment data counter if bit was received
    if (ready) then
      data_cnt <= std_logic_vector(to_unsigned(to_integer(unsigned(data_cnt)) + 1, data_cnt'length));
    else
      data_cnt <= (others => '0');
    end if;
  end process p3;

end architecture;