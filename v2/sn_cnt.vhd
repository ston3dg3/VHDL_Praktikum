----------------------------------------------------------------------------------
-- Company: huh??
-- Engineer: me !!!
-- 
-- Create Date: 10/24/2023 12:11:39 AM
-- Design Name: very cool design
-- Module Name: sn_cnt - Behavioral
-- Project Name: project vhdl
-- Target Devices: smart fridge
-- Tool Versions: 1
-- Description: sn_cnt something
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

entity sn_cnt is
    port(clk, reset, enable: in std_logic;
         cnt: out std_logic_vector(2 downto 0));
end sn_cnt;

architecture Behavioral of sn_cnt is
    
    component my_dff_re
        port (d, clk, res, en: in std_logic;
              q, qb: out std_logic);
    end component;
    
    component my_and2
        port (a, b: in std_logic;
              y: out std_logic);
    end component;
    
    component my_and3
        port (a, b, c: in std_logic;
              y: out std_logic);
    end component;
    
    component my_nand2
        port (a, b: in std_logic;
              y: out std_logic);
    end component;
    
    component my_or2
        port (a, b: in std_logic;
              y: out std_logic);
    end component;
    
    
    signal cnt_temp0, cnt_temp1, cnt_temp2: std_logic;
    signal qcnt_temp0, qcnt_temp1, qcnt_temp2: std_logic;
    signal and11out, and12out, and21out, and22out: std_logic;
    signal nand0out: std_logic;
    signal or1out, or2out: std_logic;
    

begin
    dff1: my_dff_re port map (clk=>clk, res=>reset, en=>enable, q=>cnt_temp0, qb=>qcnt_temp0, d=>qcnt_temp0);
    
    cnt(0) <= cnt_temp0;
    
    and11: my_and2 port map (a=>qcnt_temp1, b=>cnt_temp0, y=>and11out);
    and12: my_and2 port map (a=>qcnt_temp0, b=>cnt_temp1, y=>and12out);
    or1: my_or2 port map (a=>and11out, b=>and12out, y=>or1out);
    dff2: my_dff_re port map (clk=>clk, res=>reset, en=>enable, q=>cnt_temp1, qb=>qcnt_temp1, d=>or1out);
    
    cnt(1) <= cnt_temp1;
    
    nand0: my_nand2 port map (a=>cnt_temp0, b=>cnt_temp1, y=>nand0out);
    and21: my_and2 port map (a=>cnt_temp2, b=>nand0out, y=>and21out);
    and22: my_and3 port map (a=>cnt_temp0, b=>cnt_temp1, c=>qcnt_temp2, y=>and22out);
    or2: my_or2 port map(a=>and21out, b=>and22out, y=>or2out);
    dff3: my_dff_re port map (clk=>clk, res=>reset, en=>enable, q=>cnt_temp2, qb=>qcnt_temp2, d=>or2out);
    
    cnt(2) <= cnt_temp2;
    
end Behavioral;
