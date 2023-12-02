----------------------------------------------------------------------------------
-- Engineer: Franciszek Hordejuk
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_int is
  --   generic
  --   (
  --     count_size : integer;
  --   );
  port
  (
    enab, res, clk : in std_logic;
    cnt_val        : out integer);
end counter_int;

architecture Behavioral of counter_int is

  component dff is
    port
    (
      d, clk : in std_logic;
      q      : out std_logic);
  end component;

  constant count_size : integer := 25;
  signal cnt_out      : std_logic;
  signal s            : std_logic_vector(count_size - 1 downto 0) := (others => '0');

begin
  dff1 : for i in 0 to count_size generate
    i_in : if i = 0 generate
      s(i) <= enab;
    end generate;
    i_mid : if i < count_size generate
      fm : dff port map
        (d => s(i), clk => clk, q => s(i + 1));
    end generate;
    i_out : if i = count_size generate
      fo : dff port
      map(d => s(i), clk => clk, q => cnt_out);
    end generate;
  end generate;
  cnt_val <= to_integer(signed(s));
  end Behavioral;