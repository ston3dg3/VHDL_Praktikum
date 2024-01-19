----------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
----------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity ingress_tb is
end ingress_tb;

architecture stimul of ingress_tb is
  component ingress is
    port
    (
      d_clk      : in std_logic;
      res        : in std_logic;
      set_header : in std_logic;
      header     : in std_logic_vector(31 downto 0);
      data       : in std_logic;
      ready      : out std_logic;
      we_fifo    : out std_logic;
      fifo_data  : out std_logic_vector(7 downto 0));
  end component;
  signal clk          : std_logic := '0';
  signal res          : std_logic := '0';
  signal sh           : std_logic := '0';
  signal d            : std_logic := '0';
  signal rdy, we_fifo : std_logic;
  signal header       : std_logic_vector(31 downto 0) := "00001010101011110000111100000000";
  signal fifo_data    : std_logic_vector(7 downto 0);

  constant CLOCK_HALF_PERIOD : time := 50 ns;

begin
  mut : ingress port map
  (
    d_clk      => clk,
    res        => res,
    set_header => sh,
    header     => header,
    data       => d,
    ready      => rdy,
    we_fifo    => we_fifo,
    fifo_data  => fifo_data);
  c : process
  begin
    wait for CLOCK_HALF_PERIOD;
    clk <= not clk;
  end process;
  dp : process
  begin
    wait for 130 ns;
    res <= '1';
    wait for 150 ns;
    res <= '0';
    wait for 140 ns;
    sh <= '1';
    wait for 100 ns;
    sh <= '0';
    wait;
  end process;

  dg : process
    variable n : integer;
  begin
    wait until rdy = '1';
    wait for 50 ns;
    lp1 : for h in 1 to 10 loop --  10 Durchlaeufe
      lp2 : for i in 1 to 255 loop --  255 Bytes
        n := i;
        lp3 : for j in 7 downto 0 loop --  8 Bits
          if n/(2 ** j) = 1 then
            d <= '1';
            n := n - (2 ** j);
          else
            d <= '0';
          end if;
          wait for 2 * CLOCK_HALF_PERIOD;
        end loop;
      end loop;
    end loop;
  end process;

end stimul;