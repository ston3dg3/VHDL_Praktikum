LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL ;

ENTITY out_path_tb IS
END out_path_tb;

ARCHITECTURE stimul OF out_path_tb IS
	COMPONENT out_path
		PORT(net_clk : IN std_logic;
			res : IN std_logic;
			cell_start : IN std_logic;
			level_reached : IN std_logic;
			cell_clk : OUT std_logic;
			fifo_read_enab : OUT std_logic;
			fifo_data : IN std_logic_vector(7 DOWNTO 0);
			atm_data : OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL net_clk : std_logic := '0';
	SIGNAL res : std_logic := '0';
	SIGNAL cell_start : std_logic := '0';
	SIGNAL level_reached : std_logic := '0';
	SIGNAL fifo_data : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

	SIGNAL cell_clk : std_logic;
	SIGNAL fifo_read_enab : std_logic;
	SIGNAL atm_data : std_logic_vector(7 DOWNTO 0);

BEGIN
	mut: out_path PORT MAP(
		net_clk => net_clk,
			res => res,
			cell_start => cell_start,
			level_reached => level_reached,
			cell_clk => cell_clk,
			fifo_read_enab => fifo_read_enab,
			fifo_data => fifo_data,
			atm_data => atm_data);

	net_clk <= NOT net_clk AFTER 10 ns;

	s: PROCESS
	BEGIN
		WAIT FOR 40 ns;
		res <= '1';
		WAIT FOR 40 ns;
		res <= '0';
		WAIT FOR 120 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
		WAIT FOR 52*20 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
		WAIT FOR 22*20 ns;
		level_reached <= '1';
		WAIT FOR 30*20 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
		WAIT FOR 22*20 ns;
		level_reached <= '0';
		WAIT FOR 30*20 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
		WAIT FOR 52*20 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
		WAIT FOR 52*20 ns;
		cell_start <= '1';
		WAIT FOR 20 ns;
		cell_start <= '0';
	END PROCESS s;
END stimul;

