-----------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- FIFO entity for storing incoming packets
entity fifo is
  generic
  (
    ld_depth : integer := 3; -- size of the fifo storage is 2^ld_depth
    level    : integer := 5 -- level at which the level_reached flag is set (one whole packet has been read)
  );
  port
  (
    clk_in        : in std_logic; -- clock (clock 1 for writing the data)
    clk_out       : in std_logic; -- clock out (clock 2 for reading the data)
    res           : in std_logic; -- reset
    data_in       : in std_logic_vector(7 downto 0); -- incoming packet data (1 Byte per clock)
    we            : in std_logic; -- write enable
    re            : in std_logic; -- read enable
    data_out      : out std_logic_vector(7 downto 0); -- outgoing packet data (1 Byte per clock)\
    empty         : out std_logic; -- empty flag
    full          : out std_logic; -- full flag
    level_reached : out std_logic -- level reached flag
  );
end fifo;

architecture rtl of fifo is

  -- ====================================== CONSTANTS ======================================

  constant pointer_reset : integer := 2 ** (ld_depth + 1); -- size of the whole FIFO

  -- ======================================== SIGNALS ========================================

  -- declare Byte data type that corresponds to 8-bit std_logic_vector
  subtype Byte is std_logic_vector(7 downto 0);

  -- Memory for storing the data (size is 2^ld_depth)
  type memory is array(0 to 2 ** ld_depth - 1) of Byte;
  signal Mem : memory;

  -- write and read pointers (size is one bit larger to detect the full/empty states)
  signal write_ptr : std_logic_vector(ld_depth downto 0);
  signal read_ptr  : std_logic_vector(ld_depth downto 0);

  -- intermediate sync signals (same as write_ptr/read_ptr but used for syncying clk_in and clk_out)
  signal read_add1  : std_logic_vector(ld_depth downto 0);
  signal write_add1 : std_logic_vector(ld_depth downto 0);

  -- synced signals for read and write pointer updates:
  signal read_ptr_sync  : std_logic_vector(ld_depth downto 0); -- synced with clk_out
  signal write_ptr_sync : std_logic_vector(ld_depth downto 0);

  -- flags (all flags are already synced with clk_in/clk_out)
  signal empty_flag         : std_logic := '1'; -- comparator output (takes in read_ptr and synced write_ptr)
  signal full_flag          : std_logic := '0'; -- comparator output (takes in write_ptr and synced read_ptr)
  signal level_reached_flag : std_logic := '0'; -- might be unncecessary since we only output this signal, never write

  -- ======================================== PROCESSES ========================================

begin

  -- connect the output to its signal (for flags)
  level_reached <= level_reached_flag;
  full          <= full_flag;
  empty         <= empty_flag;

  -- combinatorial process for the comparator (outputs flags)
  -- comp is treated as one element for both clk_in and clk_out
  comp : process (res, write_ptr, read_ptr_sync, read_ptr, write_ptr_sync)
  begin
    if res = '1' then -- async reset
      full_flag          <= '0'; -- synced with clk_in
      empty_flag         <= '1'; -- synced with clk_out
      level_reached_flag <= '0'; -- synced with clk_out
    else

      -- detect if we have read a whole packet
      if (to_integer(unsigned(write_ptr_sync) - unsigned(read_ptr)) < level) then
        level_reached_flag <= '0';
      else
        level_reached_flag <= '1';
      end if;

      -- if both pointers are equal, when MSB is 1 then FIFO is full
      if write_ptr(ld_depth - 1 downto 0) = read_ptr_sync(ld_depth - 1 downto 0) then
        if ((write_ptr(ld_depth) xor read_ptr_sync(ld_depth))) = '1' then
          full_flag <= '1';
        else
          full_flag <= '0';
        end if;
      else
        full_flag <= '0';
      end if;

      -- if both pointers are equal, when MSB is 0 then FIFO is empty
      if read_ptr(ld_depth - 1 downto 0) = write_ptr_sync(ld_depth - 1 downto 0) then
        if ((read_ptr(ld_depth) nor write_ptr_sync(ld_depth))) = '1' then
          empty_flag <= '1';
        else
          empty_flag <= '0';
        end if;
      else
        empty_flag <= '0';
      end if;

    end if;
  end process comp;

  -- read process with takt clk_out
  read_proc : process (clk_out, res)
  begin
    if res = '1' then -- async reset
      read_ptr <= (others => '0');
    elsif rising_edge(clk_out) then
      write_add1     <= write_ptr; -- update syncing signal
      write_ptr_sync <= write_add1; -- update synced signal
      if re = '1' and empty_flag = '0' then
        data_out <= Mem(to_integer(unsigned(read_ptr(ld_depth - 1 downto 0)))); -- get the Mem content at address read_ptr to output
        read_ptr <= std_logic_vector(to_unsigned((to_integer(unsigned(read_ptr)) + 1) mod pointer_reset, read_ptr'length)); -- update read_ptr
      end if;
    end if;
  end process read_proc;

  -- write process with takt clk_in
  write_proc : process (clk_in, res)
  begin
    if res = '1' then -- async reset
      write_ptr <= (others => '0');
    elsif rising_edge(clk_in) then
      read_add1     <= read_ptr; -- update syncing signal
      read_ptr_sync <= read_add1; -- update synced signal
      if we = '1' and full_flag = '0' then
        Mem(to_integer(unsigned(write_ptr(ld_depth - 1 downto 0)))) <= data_in; -- write data_in to Mem at address write_ptr
        write_ptr                                                   <= std_logic_vector(to_unsigned((to_integer(unsigned(write_ptr)) + 1) mod pointer_reset, write_ptr'length)); -- update write_ptr
      end if;
    end if;
  end process write_proc;

end architecture;