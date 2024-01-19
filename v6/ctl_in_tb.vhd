library IEEE;
use IEEE.std_logic_1164.all;

entity ctl_in_tb is
end ctl_in_tb;

architecture stimul of ctl_in_tb is
  component ctl_in
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
  end component;

  signal clk, res, hg_done                                         : std_logic := '0';
  signal ready, output_head, inc_aal1, we_fifo                     : std_logic;
  signal sel                                                       : std_logic_vector(1 downto 0);
  signal ready_soll, output_head_soll, inc_aal1_soll, we_fifo_soll : std_logic                    := '0';
  signal sel_soll                                                  : std_logic_vector(1 downto 0) := "00";

begin
  c : ctl_in port map
  (
    clk         => clk,
    hg_done     => hg_done,
    res         => res,
    inc_aal1    => inc_aal1,
    we_fifo     => we_fifo,
    ready       => ready,
    output_head => output_head,
    sel         => sel);

  cp : process
  begin
    wait for 10 ns;
    clk <= not clk;
  end process cp;

  st : process
  begin
    wait for 60 ns;
    res <= '1';
    wait for 20 ns;
    res <= '0';
    wait for 60 ns;
    hg_done <= '1';
    wait for 20 ns;
    hg_done <= '0';
    wait;
  end process st;

  soll : process
  begin
    wait for 150 ns;
    ready_soll       <= '1';
    output_head_soll <= '1';
    wait for 20 ns;
    while true loop
      sel_soll     <= "10";
      we_fifo_soll <= '1';
      wait for 80 ns;
      output_head_soll <= '0';
      inc_aal1_soll    <= '1';
      wait for 20 ns;
      inc_aal1_soll <= '0';
      sel_soll      <= "01";
      wait for 20 ns;
      sel_soll     <= "00";
      we_fifo_soll <= '0';
      wait for 20 ns;
      we_fifo_soll <= '1';
      wait for 20 ns;
      we_fifo_soll <= '0';
      for i in 1 to 46 loop
        wait for 140 ns;
        we_fifo_soll <= '1';
        if i = 46 then
          output_head_soll <= '1';
        end if;
        wait for 20 ns;
        we_fifo_soll <= '0';
      end loop;
    end loop;
  end process soll;

end stimul;