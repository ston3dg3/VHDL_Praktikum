LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ingress_tb IS
END ingress_tb;

ARCHITECTURE stimul OF ingress_tb IS
COMPONENT ingress IS
PORT(	d_clk : IN std_logic;
	res: IN std_logic;
	set_header : IN std_logic;
	header : IN std_logic_vector(31 DOWNTO 0);
	data : IN std_logic;
	ready : OUT std_logic;
	we_fifo : OUT std_logic;
	fifo_data : OUT std_logic_vector(7 DOWNTO 0));
END COMPONENT;
	SIGNAL clk : std_logic := '0';
	SIGNAL res : std_logic := '0';
	SIGNAL sh : std_logic := '0';
	SIGNAL d : std_logic := '0';
	SIGNAL rdy, we_fifo : std_logic;
	SIGNAL header : std_logic_vector(31 DOWNTO 0) := "00001010101011110000111100000000";
	SIGNAL fifo_data : std_logic_vector(7 DOWNTO 0);
	
	CONSTANT CLOCK_HALF_PERIOD : time := 50 ns;

BEGIN
	mut: ingress PORT MAP(	d_clk => clk,
				res => res,
				set_header  => sh,
				header => header,
				data => d,
				ready => rdy,
				we_fifo => we_fifo,
				fifo_data => fifo_data);
	c: PROCESS
	BEGIN
		WAIT FOR CLOCK_HALF_PERIOD;
		clk <= NOT clk;
	END PROCESS;
	dp: PROCESS
	BEGIN
		WAIT FOR 130 ns;
		res <= '1';
		WAIT FOR 150 ns;
		res <= '0';
		WAIT FOR 140 ns;
		sh <= '1';
		WAIT for 100 ns;
		sh <= '0';
		WAIT;
	END PROCESS;
	
	dg: PROCESS
		VARIABLE n : integer;
	BEGIN
    		WAIT until rdy='1';
		WAIT FOR 50 ns;
		lp1: FOR h IN 1 TO 10 LOOP           --  10 Durchlaeufe
			lp2: FOR i IN 1 TO 255 LOOP         --  255 Bytes
				n:=i;
				lp3: FOR j IN 7 DOWNTO 0 LOOP    --  8 Bits
					IF n/(2**j)=1 THEN 
						d <= '1';
						n:=n-(2**j);
					ELSE
						d <= '0';
					END IF ;  
					WAIT FOR 2*CLOCK_HALF_PERIOD;
				END LOOP ;
			END LOOP ;
		END LOOP ;
	END PROCESS ;
  
END stimul;