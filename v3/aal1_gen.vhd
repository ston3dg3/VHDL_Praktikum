----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2023 06:42:39 PM
-- Design Name: 
-- Module Name: aal1_gen - behav
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

entity aal1_gen is
  port
  (
    clk, cnt_enab, res : in std_logic;
    aal1               : out std_logic_vector(7 downto 0));
end aal1_gen;

architecture behav of aal1_gen is

  component aal1_crc_gen
    port
    (
      CSI_bit : in std_logic;
      SN      : in std_logic_vector(2 downto 0);
      SNP     : out std_logic_vector(3 downto 0));
  end component;

  component sn_cnt
    port
    (
      clk, reset, enable : in std_logic;
      cnt                : out std_logic_vector(2 downto 0));
  end component;

  signal SN_out       : std_logic_vector(2 downto 0);
  constant CSI_bit_in : std_logic := '0';
  signal SNP_out      : std_logic_vector(3 downto 0);
  signal aal1_out     : std_logic_vector(7 downto 0);
begin

  counter : sn_cnt port map
    (clk => clk, reset => res, enable => cnt_enab, cnt => SN_out);
  crc_gen : aal1_crc_gen port
  map (CSI_bit => CSI_bit_in, SN => SN_out, SNP => SNP_out);

  aal1_out(7)          <= CSI_bit_in;
  aal1_out(6 downto 4) <= SN_out;
  aal1_out(3 downto 0) <= SNP_out;

  aal1 <= aal1_out;

end behav;