library IEEE;
use IEEE.std_logic_1164.all;

entity counter_tb is
end counter_tb;

architecture stimul of counter_tb is
  component counter_int
    port
    (
      clk, enab, res : in std_logic;
      cnt_val        : out std_logic_vector(6 downto 0));
  end component;
  signal c, e, r : std_logic := '0';
  signal c_v     : std_logic_vector(6 downto 0);

begin
  i1 : counter_int port map
    (clk => c, enab => e, res => r, cnt_val => c_v);

  c <= not c after 10 ns;

  process
  begin
    wait for 45 ns;
    r <= '1';
    wait for 20 ns;
    r <= '0';
    wait for 30 ns;
    e <= '1';
    wait for 200 ns;
    e <= '0';
    wait for 20 ns;
    e <= '1';
    wait for 1200 ns;
    wait;
  end process;
end stimul;

-- architecture of unsigend integer counter type
-- architecture stimul_u of counter_tb is
--   component counter_uint
--     port
--     (
--       clk, enab, res : in std_logic;
--       cnt_val        : out std_logic_vector(4 downto 0));
--   end component;
--   signal c, e, r : std_logic := '0';
--   signal c_v     : std_logic_vector(4 downto 0);

-- begin
--   i1 : counter_uint port
--   map
--   (clk => c, enab => e, res => r, cnt_val => c_v);

--   c <= not c after 10 ns;

--   process
--   begin
--     wait for 45 ns;
--     r <= '1';
--     wait for 20 ns;
--     r <= '0';
--     wait for 30 ns;
--     e <= '1';
--     wait for 200 ns;
--     e <= '0';
--     wait for 20 ns;
--     e <= '1';
--     wait for 1200 ns;
--     wait;
--   end process;
-- end stimul_u;