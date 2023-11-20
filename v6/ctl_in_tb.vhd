LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ctl_in_tb IS
END ctl_in_tb;

ARCHITECTURE stimul OF ctl_in_tb IS
    COMPONENT ctl_in
      PORT(	clk : IN std_logic;
	res : IN std_logic;
	hg_done : IN std_logic;
	ready : OUT std_logic;
	output_head : OUT std_logic;
	inc_aal1 : OUT std_logic;
	sel : OUT std_logic_vector(1 DOWNTO 0);
	we_fifo : OUT std_logic);
    END COMPONENT;

    SIGNAL clk, res, hg_done : std_logic := '0';
    SIGNAL ready, output_head, inc_aal1, we_fifo : std_logic;
    SIGNAL sel : std_logic_vector(1 DOWNTO 0);
    SIGNAL ready_soll, output_head_soll, inc_aal1_soll, we_fifo_soll : std_logic := '0';
    SIGNAL sel_soll : std_logic_vector(1 DOWNTO 0) := "00";

BEGIN
    c: ctl_in PORT MAP (clk => clk,
			hg_done => hg_done,
			res => res,
			inc_aal1 => inc_aal1,
			we_fifo => we_fifo,
			ready => ready,
			output_head => output_head,
			sel => sel);

    cp: PROCESS
    BEGIN
	WAIT FOR 10 ns;
	clk <= NOT clk;
    END PROCESS cp;

    st: PROCESS
    BEGIN
	WAIT FOR 60 ns;
	res <= '1';
	WAIT FOR 20 ns;
	res <= '0';
	WAIT FOR 60 ns;
	hg_done <= '1';
	WAIT FOR 20 ns;
	hg_done <= '0';
	WAIT;
    END PROCESS st;

    soll: PROCESS
    BEGIN
	WAIT FOR 150 ns;
	ready_soll <= '1';
	output_head_soll <= '1';
	WAIT FOR 20 ns;
	WHILE true LOOP
		sel_soll <= "10";
		we_fifo_soll <= '1';
		WAIT FOR 80 ns;
		output_head_soll <= '0';
		inc_aal1_soll <= '1';
		WAIT FOR 20 ns;
		inc_aal1_soll <= '0';
		sel_soll <= "01";
		WAIT FOR 20 ns;
		sel_soll <= "00";
		we_fifo_soll <= '0';
		WAIT FOR 20 ns;
		we_fifo_soll <= '1';
		WAIT FOR 20 ns;
		we_fifo_soll <= '0';
		FOR i IN 1 TO 46 LOOP
		    WAIT FOR 140 ns;
		    we_fifo_soll <= '1';
		    IF i=46 THEN 
			output_head_soll <= '1';
		    END IF;
		    WAIT FOR 20 ns;
		    we_fifo_soll <= '0';
		END LOOP;
	END LOOP;
    END PROCESS soll;

END stimul;