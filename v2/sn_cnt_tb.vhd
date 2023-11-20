----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2023 11:35:11 AM
-- Design Name: 
-- Module Name: sn_cnt_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sn_cnt_tb is
end sn_cnt_tb;

architecture Behavioral of sn_cnt_tb is
  component sn_cnt
    port
    (
      clk, reset, enable : in std_logic;
      cnt                : out std_logic_vector(2 downto 0));
  end component;

  component stim_gen
    port
      (clk, res, enab : out std_logic);
  end component;

  signal clk_in, res_in, en_in : std_logic;
  signal cnt_out               : std_logic_vector(2 downto 0);

begin

  generator : stim_gen port map
    (clk => clk_in, res => res_in, enab => en_in);

  mut : sn_cnt port
  map (clk => clk_in, reset => res_in, enable => en_in,
  cnt(0) => cnt_out(0), cnt(1) => cnt_out(1), cnt(2) => cnt_out(2));

end Behavioral;