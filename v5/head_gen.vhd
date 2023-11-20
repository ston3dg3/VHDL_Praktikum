LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY head_gen IS
	PORT (	clk : IN std_logic;
		res : IN std_logic;
		set_head : IN std_logic;
		head_in : IN std_logic_vector(31 DOWNTO 0);
		output_head : IN std_logic;
		head_data : OUT std_logic_vector(7 DOWNTO 0);
		hg_done : OUT std_logic);
END head_gen;

ARCHITECTURE struct OF head_gen IS
    COMPONENT hec_gen
	PORT (data, clk, res, enab : IN std_logic;
	      hec : OUT std_logic_vector(7 DOWNTO 0));
    END COMPONENT;

    -- weitere Deklarationen

BEGIN 
    -- Prozesse, Instanziierungen, nebenläufige Signalzuweisungen

	 
END struct;
