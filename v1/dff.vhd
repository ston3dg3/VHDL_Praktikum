
-- D-FlipFlop

ENTITY dff IS
	PORT (d, clk : IN bit;
	      q      : OUT bit);
END dff;

ARCHITECTURE behav OF dff IS
BEGIN
	PROCESS(clk)
	BEGIN
		IF (clk'EVENT AND clk='1') THEN
			q <= d;
		END IF ;
	END PROCESS ;
END behav ;
