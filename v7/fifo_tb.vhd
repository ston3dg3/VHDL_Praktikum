library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fifo_tb is
end fifo_tb;

architecture stimul of fifo_tb is

  -- Component declaration
  -- FIFO entity for storing incoming packets
  component fifo is
    generic
    (
      ld_depth : integer := 3; -- size of the fifo storage is 2^ld_depth
      level    : integer := 5 -- level at which the level_reached flag is set (one whole packet has been read)
    );
    port
    (
      clk_in        : in std_logic; -- clock (clock 1 for writing the data)
      clk_out       : out std_logic; -- clock out (clock 2 for reading the data)
      res           : in std_logic; -- reset
      data_in       : in std_logic_vector(7 downto 0); -- incoming packet data (1 Byte per clock)
      we            : in std_logic; -- write enable
      re            : in std_logic; -- read enable
      data_out      : out std_logic_vector(7 downto 0); -- outgoing packet data (1 Byte per clock)
      empty         : out std_logic; -- empty flag
      full          : out std_logic; -- full flag
      level_reached : out std_logic -- level reached flag
    );
  end component fifo;

  signal clk1, clk2, res : std_logic := '0';
  signal we, re          : std_logic := '0';
  signal full, empty, lr : std_logic;
  signal data1, data2    : std_logic_vector (7 downto 0) := "00000000";
  constant t1            : time                          := 25 ns;
  constant t2            : time                          := 40 ns;

begin

  -- Component instantiation
  mut : fifo
  generic
  map
  (
  ld_depth => 3,
  level    => 5
  )
  port map
  (
    clk_in        => clk1,
    clk_out       => clk2,
    res           => res,
    data_in       => data1,
    we            => we,
    re            => re,
    data_out      => data2,
    empty         => empty,
    full          => full,
    level_reached => lr
  );

  c1 : process
  begin
    wait for t1;
    clk1 <= not clk1;
  end process c1;
  c2 : process
  begin
    wait for t2;
    clk2 <= not clk2;
  end process c2;
  res <= '1' after 30 ns, '0' after 200 ns;

  sw : process
    variable val : unsigned(7 downto 0) := "00000001";
  begin
    while true loop
      wait for 10 * t1;
      we    <= '1';
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      data1 <= std_logic_vector(val);
      val := val + 1;
      wait for 2 * t1;
      we <= '0';
      wait for 8 * t1;
    end loop;
  end process;
  sr : process
  begin
    while true loop
      re <= '0';
      wait for 20 * t2;
      re <= '1';
      wait for 16 * t2;
    end loop;
  end process;

end stimul;