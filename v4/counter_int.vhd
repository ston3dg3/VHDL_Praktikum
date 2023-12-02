----------------------------------------------------------------------------------
-- Engineer: Franciszek Hordejuk
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity counter_int is
  generic
  (
    constant count_size : integer := 25
  );

  port
  (
    enab, res, clk : in std_logic;
    cnt_val        : out std_logic_vector(4 downto 0)
  );
end counter_int;

architecture Behavioral of counter_int is

  variable count : integer range 0 to count_size := 0;

begin

  -- control process for the counter
  process (clk)

  begin
    if (clk'EVENT and clk = '1') then
      if (res = '1' or count = 24) then
        count := 0;
      elsif (enab = '1') then
        count := count + 1;
      end if;

      -- report "curerent count: " & integer'image(count);

      -- put the value of count at the output with proper conversion:
      cnt_val <= std_logic_vector(to_unsigned(count, 5));
    end if;
  end process;

end Behavioral;