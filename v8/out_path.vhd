LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL ;

ENTITY out_path IS
	PORT(net_clk : IN std_logic;
		res : IN std_logic;
		cell_start : IN std_logic;
		level_reached : IN std_logic;
		cell_clk : OUT std_logic;
		fifo_read_enab : OUT std_logic;
		fifo_data : IN std_logic_vector(7 DOWNTO 0);
		atm_data : OUT std_logic_vector(7 DOWNTO 0));
END out_path;

ARCHITECTURE behav OF out_path IS
	SIGNAL lzg_start : std_logic;
	SIGNAL cell_start_delayed : std_logic;

	-- more declarations

BEGIN
	p1:PROCESS (net_clk)
	BEGIN
		IF net_clk'EVENT AND net_clk = '1' THEN
			IF res='1' THEN
				cell_clk <= '0';
				cell_start_delayed <= '0';
			ELSE
				cell_start_delayed <= cell_start;
				cell_clk <= cell_start_delayed;
			END IF;
		END IF;
	END PROCESS p1;

	lzg_start <= cell_start_delayed;
	
	-- more processes
	

END behav;
