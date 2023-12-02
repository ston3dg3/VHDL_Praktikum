----------------------------------------------------------------------------------=
-- Engineer: Franciszek Hordejuk
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity aal1_crc_gen is

  port
  (
    CSI_bit : in std_logic;
    SN      : in std_logic_vector(2 downto 0);
    SNP     : out std_logic_vector(3 downto 0));

end aal1_crc_gen;

architecture behav of aal1_crc_gen is

  signal SNP_out : std_logic_vector(3 downto 0);

begin

  SNP_out(1) <= SN(2) xor SN(0);
  SNP_out(2) <= (SN(2) and SN(1)and SN(0)) or (SN(2) and not SN(1) and not SN(0)) or (not SN(2) and SN(1) and not SN(0)) or (not SN(2) and not SN(1) and SN(0));
  SNP_out(3) <= SN(2) xor SN(1);
  SNP_out(0) <= CSI_bit xor SN(2) xor SN(1) xor SN(0) xor SNP_out(3) xor SNP_out(2) xor SNP_out(1);

  SNP <= SNP_out;

end behav;