----------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity ingress is
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
end ingress;

architecture struct of ingress is

  component head_gen
    port
    (
      clk         : in std_logic;
      res         : in std_logic;
      set_head    : in std_logic;
      head_in     : in std_logic_vector(31 downto 0);
      output_head : in std_logic;
      head_data   : out std_logic_vector(7 downto 0);
      hg_done     : out std_logic);
  end component;
  component aal1_gen
    port
    (
      clk      : in std_logic;
      cnt_enab : in std_logic;
      res      : in std_logic;
      aal1     : out std_logic_vector(7 downto 0));
  end component;
  component sp_conv
    port
    (
      d_in  : in std_logic;
      clk   : in std_logic;
      res   : in std_logic;
      d_out : out std_logic_vector(7 downto 0));
  end component;
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

  signal h, a, s                        : std_logic_vector(7 downto 0);
  signal sel                            : std_logic_vector (1 downto 0);
  signal hg_done, output_head, inc_aal1 : std_logic;

begin
  fifo_data <= s when sel = "00" else
    a when sel = "01" else
    h when sel = "10" else
    "--------";

    hg : head_gen port map
    (
      clk         => d_clk,
      res         => res,
      set_head    => set_header,
      head_in     => header,
      output_head => output_head,
      head_data   => h,
      hg_done     => hg_done);

  aal : aal1_gen port
  map(clk  => d_clk,
  cnt_enab => inc_aal1,
  res      => res,
  aal1     => a);

  sr : sp_conv port
  map(d_in => data,
  clk      => d_clk,
  res      => res,
  d_out    => s);

  c : ctl_in port
  map(clk     => d_clk,
  res         => res,
  hg_done     => hg_done,
  ready       => ready,
  output_head => output_head,
  inc_aal1    => inc_aal1,
  sel         => sel,
  we_fifo     => we_fifo);

end struct;