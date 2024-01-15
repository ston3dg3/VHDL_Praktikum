library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity head_gen is
  port
  (
    clk         : in std_logic;
    res         : in std_logic;
    set_head    : in std_logic;
    head_in     : in std_logic_vector(31 downto 0);
    output_head : in std_logic;
    head_data   : out std_logic_vector(7 downto 0);
    hg_done     : out std_logic);
end head_gen;

architecture struct of head_gen is
  component hec_gen
    port
    (
      data, clk, res, enab : in std_logic;
      hec                  : out std_logic_vector(7 downto 0));
  end component;

  -- weitere Deklarationen
  signal hg_cnt_val  : std_logic_vector(5 downto 0) := (others => '0'); -- Zähler für Head-Generator (generierung dauert 34 Taktzyklen)
  signal out_cnt_val : std_logic_vector(2 downto 0) := (others => '0'); -- Zähler für Ausgabe (Ausgabe dauert 8 Taktzyklen)

  -- internal connections
  signal hec_res         : std_logic                     := '0'; -- Reset-Signal für HEC-Generator coming from hg_cnt
  signal hec_enable      : std_logic                     := '0'; -- Enable-Signal für HEC-Generator coming from hg_cnt
  signal head_intern     : std_logic_vector(31 downto 0) := (others => '0'); -- internes Signal für Header (thats h_reg)
  signal hec_val         : std_logic_vector(7 downto 0)  := (others => '0'); -- internes Signal für HEC
  signal current_hec_bit : std_logic                     := '0'; -- internes Signal für aktuelles HEC-Bit der aus h_reg gelesen wird

begin
  -- Prozesse, Instanziierungen, nebenläufige Signalzuweisungen

  -- ================================== initialize hec_gen component ==============
  hec_gen_inst : hec_gen
  port map
  (
    data => current_hec_bit,
    clk  => clk,
    res  => res or hec_res,
    enab => hec_enable,
    hec  => hec_val
  );

  -- ======================================== MULTIPLEXERS =========================
  -- set hec_enable to 1 between the current values of hg_cnt_val: 1 and 32 inclusive. Otherwise set it to 0.
  -- set hg_done to 1 on the last Taktzyklus, otherwise set it to 0.

  with to_integer(unsigned(hg_cnt_val)) select
  hec_enable <=
    '1' when 0 | 33,
    '0' when others;

  with to_integer(unsigned(hg_cnt_val)) select
  hg_done <=
    '1' when 33,
    '0' when others;

  -- get the first 4 bits of the head_intern register and assign them to head_data if out_cnt_val is between 0 and 3 inclusive, when its 4, set to HEC, otherwise set to 0
  with to_integer(unsigned(out_cnt_val)) select
  head_data <=
    head_intern(31 downto 24) when 0,
    head_intern(23 downto 16) when 1,
    head_intern(15 downto 8) when 2,
    head_intern(7 downto 0) when 3,
    hec_val when 4,
    (others => '0') when others;

  -- ========================================= PROCESSES ==========================

  -- read the next bit from the register head_intern and assign it to current_hec_bit
  -- keep in mind to read the bits from the register in reverse order (start with bit 31, finish with bit 0)
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (hec_enable = '1') then
        current_hec_bit <= head_intern(31 - (to_integer(unsigned(hg_cnt_val)) - 1));
      end if;
    end if;
  end process;

  -- reset counters and the internal head data register
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (res = '1') then
        head_intern <= (others => '0');
        out_cnt_val <= (others => '0');
        hg_cnt_val  <= (others => '0');
      end if;
    end if;
  end process;

  -- import head data to an internal register head_intern, reset HEC generator, reset counter
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (set_head = '1') then
        hg_cnt_val  <= (others => '0');
        head_intern <= head_in;
        hec_res     <= '1';
        -- reset counter
        hg_cnt_val <= (others => '0');
      else
        hec_res <= '0';
      end if;
    end if;
  end process;

  -- reset output counter if output_head is on
  process (clk)
  begin
    if (clk'event and clk = '1') then
      if (output_head'event and output_head = '1') then
        out_cnt_val <= (others => '0');
      end if;
    end if;
  end process;

  -- increment counters
  process (clk)
  begin
    if (clk'event and clk = '1') then
      -- increment input counter always (we always reset before using the counter anyway)
      out_cnt_val <= std_logic_vector(unsigned(out_cnt_val) + 1);
      hg_cnt_val  <= std_logic_vector(unsigned(hg_cnt_val) + 1);
    end if;
  end process;

end struct;