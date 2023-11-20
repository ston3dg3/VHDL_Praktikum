----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2023 04:27:57 PM
-- Design Name: 
-- Module Name: aal1_crc_gen - behav
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aal1_crc_gen is

    port (CSI_bit: in std_logic;
          SN: in std_logic_vector(2 downto 0);
          SNP: out std_logic_vector(3 downto 0));

end aal1_crc_gen;

architecture behav of aal1_crc_gen is

    signal SNP_out: std_logic_vector(3 downto 0);

begin
        
    SNP_out(1) <= SN(2) XOR SN(0);
    SNP_out(2) <= (SN(2) AND SN(1)AND SN(0)) OR (SN(2) AND NOT SN(1) AND NOT SN(0)) OR (NOT SN(2) AND SN(1) AND NOT SN(0)) OR (NOT SN(2) AND NOT SN(1) AND SN(0));
    SNP_out(3) <= SN(2) XOR SN(1);
    SNP_out(0) <= CSI_bit XOR SN(2) XOR SN(1) XOR SN(0) XOR SNP_out(3) XOR SNP_out(2) XOR SNP_out(1);

    SNP <= SNP_out;

end behav;
