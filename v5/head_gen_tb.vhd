LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL ;

ENTITY head_gen_tb IS
END head_gen_tb;

ARCHITECTURE stimul OF head_gen_tb IS 
    COMPONENT head_gen
	PORT (	clk : IN std_logic;
		res : IN std_logic;
		set_head : IN std_logic;
		head_in : IN std_logic_vector(31 DOWNTO 0);
		output_head : IN std_logic;
		head_data : OUT std_logic_vector(7 DOWNTO 0);
		hg_done : OUT std_logic);
    END COMPONENT;

    SIGNAL clk, o_head, set_head : std_logic :='0';
    SIGNAL res : std_logic := '0';
    SIGNAL header: std_logic_vector(31 DOWNTO 0) := X"0AAF0F00"; -- not allowed in VHDL'87
    SIGNAL head_data : std_logic_vector(7 DOWNTO 0);
    SIGNAL hg_done : std_logic;

BEGIN
    mut: head_gen PORT MAP (clk=>clk,
			res=>res, 
			set_head=>set_head, 
			head_in=>header, 
			output_head=>o_head, 
			head_data=>head_data, 
			hg_done=>hg_done);

    cg: PROCESS        -- Erzeugung Takt
    BEGIN 
	WAIT FOR 400 ns;
	clk <= NOT clk;
    END PROCESS cg;

    dg: PROCESS         -- Erzeugung sonstige Stimuli
    BEGIN
	WAIT FOR 800 ns;
	res <= '1';
	WAIT FOR 800 ns;
	res <= '0';
	WAIT FOR 800 ns;
	set_head <= '1';
	WAIT FOR 800 ns;
	set_head <= '0';
	WAIT UNTIL hg_done = '1';
	WAIT FOR 3680 ns;
	o_head <= '1';
	WAIT FOR 4000 ns;
	o_head <= '0';
	WAIT FOR 6000 ns;
    END PROCESS dg;
END stimul;
