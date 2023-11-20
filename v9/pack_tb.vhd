LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL ;


ENTITY pack_tb IS
END pack_tb;
  
ARCHITECTURE stimul OF pack_tb IS
	COMPONENT pack 
		PORT (data, d_clk, net_clk, cell_start, res : IN std_logic;
			set_header : IN std_logic;
			head_in : IN std_logic_vector(31 DOWNTO 0);
			cell_clk : OUT std_logic;
			ready : OUT std_logic;
			atm_data : OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;

	SIGNAL net_clk : std_logic := '1';
	SIGNAL data : std_logic := '0';
	SIGNAL res : std_logic := '0';
	SIGNAL d_clk : std_logic := '1';
	SIGNAL cell_start : std_logic :='0';
	SIGNAL cell_clk :std_logic;
	SIGNAL atm_data : std_logic_vector(7 DOWNTO 0);
	SIGNAL head_in : std_logic_vector(31 DOWNTO 0) := "00001010101011110000111100000000";
	SIGNAL set_header : std_logic := '0'; 
	SIGNAL ready : std_logic;

	CONSTANT td : time := 50 ns;
	CONSTANT tnet : time := 100 ns;

BEGIN
	mut: pack PORT MAP
		(data=>data,
		d_clk=>d_clk,
		net_clk=>net_clk,
		cell_start=>cell_start,
		res=>res,
		cell_clk=>cell_clk,
		atm_data=>atm_data,
		head_in=>head_in,
		set_header=>set_header,
		ready=>ready);

	d_clk <= NOT d_clk AFTER td;
	net_clk <= NOT net_clk AFTER tnet;

	cs_gen: PROCESS(net_clk)
		VARIABLE takt_counter : integer := 45;
	BEGIN
		IF net_clk'EVENT AND net_clk='1' THEN
			takt_counter := takt_counter+1;
			IF takt_counter=52 THEN
				cell_start <= '1' AFTER 0.1*tnet;
			ELSE
				cell_start <= '0' AFTER 0.1*tnet;
			END IF;
			IF takt_counter=53 THEN 
				takt_counter := 0;
			END IF;
		END IF;
	END PROCESS cs_gen;
	

	data_gen: PROCESS
		VARIABLE n : integer;
	BEGIN
		WAIT FOR 2*tnet+2.5*td;
		res <= '1';
		WAIT FOR 2*(td+tnet);
		res <= '0';
		WAIT FOR 2*td;
		set_header <= '1';
		WAIT FOR 2*td;
		set_header <= '0';
		WAIT UNTIL ready = '1';

		WAIT FOR 0.5*td;
		lp1: WHILE true LOOP           --  Endlosschleife
			lp2: FOR i IN 1 TO 255 LOOP         --  255 Bytes
				n:=i;
				lp3: FOR j IN 7 DOWNTO 0 LOOP    --  8 Bits
					IF n/(2**j)=1 THEN 
						data <= '1';
						n:=n-(2**j);
					ELSE
						data <= '0';
					END IF;
					WAIT FOR 2*td;
				END LOOP;
			END LOOP;
		END LOOP;
	END PROCESS data_gen;
END stimul;
