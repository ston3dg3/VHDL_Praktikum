
-- Testbench ohne Ports
ENTITY shift4_tb IS
END shift4_tb;

ARCHITECTURE stimul OF shift4_tb IS
	
	-- Komponentendeklaration
	COMPONENT shift4 
		PORT (	data_in : IN bit;
			clk : IN bit;
			y0 : OUT bit;
			y1 : OUT bit;
			y2 : OUT bit;
			y3 : OUT bit);
	END COMPONENT;	
	
	SIGNAL a_in, clk_in : bit := '0' ;
	SIGNAL y_out0, y_out1, y_out2, y_out3 : bit;

BEGIN
	-- Instanziierung module under test
	mut : shift4 PORT MAP (data_in=>a_in,
				clk=>clk_in, 
				y0=>y_out0,
				y1=>y_out1,
				y2=>y_out2,
				y3=>y_out3);

	-- Taktgenerierung	
	clk_gen : PROCESS
	BEGIN
		WAIT FOR 10 ns;
		clk_in <= NOT clk_in;
	END PROCESS;
	
	-- Generierung Eingangsstimulus
	a_in_gen : PROCESS
	BEGIN
		a_in <= '1' AFTER 20 ns,
			'0' AFTER 40 ns,
			'1' AFTER 60 ns,
			'0' AFTER 80 ns,
			'1' AFTER 100 ns,
			'1' AFTER 120 ns,
			'0' AFTER 140 ns,
			'1' AFTER 160 ns,
			'0' AFTER 180 ns,
			'0' AFTER 200 ns,
			'1' AFTER 220 ns,
			'0' AFTER 240 ns;
		WAIT;
	END PROCESS;
	
END stimul;

