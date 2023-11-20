
---------- Schieberegister 
ENTITY shift4 IS
	PORT(	data_in : IN bit;
		clk : IN bit;
		y0 : OUT bit;
		y1 : OUT bit;
		y2 : OUT bit;
		y3 : OUT bit);
END shift4;

ARCHITECTURE struct OF shift4 IS
	-- Komponentendekklaration
	COMPONENT dff
		PORT (d, clk : IN bit;
		      q      : OUT bit);
	END COMPONENT;
	
	-- temporaere Signale
	SIGNAL tmp0, tmp1, tmp2 : bit;
	
BEGIN
	
	-- Instanziierung der FlipFlops und Verdrahtung
	dff0: dff PORT MAP (d=>data_in, clk=>clk, q=>tmp0);
	dff1: dff PORT MAP (d=>tmp0, clk=>clk, q=>tmp1);
	dff2: dff PORT MAP (d=>tmp1, clk=>clk, q=>tmp2);
	dff3: dff PORT MAP (d=>tmp2, clk=>clk, q=>y3);
	
	-- Ausgaenge zuweisen
	y0 <= tmp0;
	y1 <= tmp1;
	y2 <= tmp2;

END struct; 

