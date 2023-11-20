LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY stim_gen IS
    PORT (clk, res, enab : OUT std_logic);
END stim_gen;

ARCHITECTURE clk_gen_behav OF stim_gen IS
    SIGNAL dummy : std_logic := '1';
BEGIN 
    cgen : PROCESS
    BEGIN  --  PROCESS gen 
        WAIT FOR 25 ns;
        dummy <= NOT dummy;
    END PROCESS cgen;

    clk <= dummy;

    rgen : PROCESS
    BEGIN  --  PROCESS gen 
        res <= '0';
        enab <= '1';
        WAIT FOR 250 ns;
        res <= '1';
        WAIT FOR 100 ns;
        res <= '0';
        WAIT FOR 900 ns;
        WHILE true LOOP
            enab <= '0';
            WAIT FOR 200 ns;
            enab <= '1';
            WAIT FOR 700 ns;
        END LOOP;
    END PROCESS rgen;

END clk_gen_behav;
