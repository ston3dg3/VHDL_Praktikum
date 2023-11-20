LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY fifo_tb IS
END fifo_tb;

ARCHITECTURE stimul OF fifo_tb IS

	-- Component declaration
	
	SIGNAL clk1,clk2,res :std_logic := '0';
	SIGNAL we,re :std_logic := '0';
	SIGNAL full,empty,lr : std_logic;
	SIGNAL data1, data2 : std_logic_vector (7 DOWNTO 0):="00000000";
	CONSTANT t1 : time := 25 ns;
	CONSTANT t2 : time := 40 ns;
	
BEGIN

	-- Component instantiation
	mut: ...

	c1: PROCESS
	BEGIN
		WAIT FOR t1;
		clk1 <= NOT clk1;
	END PROCESS c1;
	c2: PROCESS
	BEGIN
		WAIT FOR t2;
		clk2 <= NOT clk2;
	END PROCESS c2;
	res <= '1' AFTER 30 ns, '0' AFTER 200 ns;
	
	sw: PROCESS
		VARIABLE val : unsigned(7 DOWNTO 0) := "00000001";
	BEGIN
	    WHILE true loop
		WAIT FOR 10*t1;
		we <= '1';
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		data1 <= STD_LOGIC_VECTOR(val);
		val := val+1;
		WAIT FOR 2*t1;
		we <= '0';
		WAIT FOR 8*t1;
	    END LOOP;
	END PROCESS;
	sr: PROCESS
	BEGIN
	    WHILE true loop
		re <= '0';
		WAIT FOR 20*t2;
		re <= '1';
		WAIT FOR 16*t2;
	    END LOOP;
	END PROCESS;
	
END stimul;
