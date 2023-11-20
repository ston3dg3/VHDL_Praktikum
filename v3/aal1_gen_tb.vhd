LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY aal1_gen_tb IS
END aal1_gen_tb;
  

ARCHITECTURE stimul OF aal1_gen_tb IS
  COMPONENT aal1_gen
    PORT (clk, cnt_enab, res : IN std_logic;
        aal1 : OUT std_logic_vector(7 DOWNTO 0));
  END COMPONENT ;
  
  SIGNAL clk, cnt_enab : std_logic := '0';
  SIGNAL res : std_logic := '0';
  SIGNAL aal1 : std_logic_vector(7 DOWNTO 0);
  SIGNAL aal1_soll : std_logic_vector(7 DOWNTO 0) := "00000000";
BEGIN
  uut: aal1_gen PORT MAP 
	(clk=>clk,
	res=>res,
	cnt_enab=>cnt_enab,
	aal1=>aal1);

  c: PROCESS
  BEGIN
    WAIT FOR 50 ns;
    clk <= NOT clk;
  END PROCESS c;

  d: PROCESS
  BEGIN
    WAIT FOR 120 ns;
    res <= '1';
    WAIT FOR 100 ns;
    res <= '0';
    WAIT FOR 90 ns;
    cnt_enab <= '1';
    WAIT ;
  END PROCESS d;

  soll_6: PROCESS
  BEGIN
      WAIT FOR 650 ns;
      WHILE true LOOP
	  aal1_soll(6) <= NOT aal1_soll(6);
	  WAIT FOR 400 ns;
      END LOOP;
  END PROCESS soll_6;
  soll_5: PROCESS
  BEGIN
      WAIT FOR 450 ns;
      WHILE true LOOP
	  aal1_soll(5) <= NOT aal1_soll(5);
	  WAIT FOR 200 ns;
      END LOOP;
  END PROCESS soll_5;
  soll_4: PROCESS
  BEGIN
      WAIT FOR 350 ns;
      WHILE true LOOP
	  aal1_soll(4) <= NOT aal1_soll(4);
	  WAIT FOR 100 ns;
      END LOOP;
  END PROCESS soll_4;
  soll_3: PROCESS
  BEGIN
      WAIT FOR 450 ns;
      WHILE true LOOP
	  aal1_soll(3) <= NOT aal1_soll(3);
	  WAIT FOR 400 ns;
      END LOOP;
  END PROCESS soll_3;
  soll_2: PROCESS
  BEGIN
      WAIT FOR 350 ns;
      WHILE true LOOP
	  aal1_soll(2) <= NOT aal1_soll(2);
	  WAIT FOR 200 ns;
	  aal1_soll(2) <= NOT aal1_soll(2);
	  WAIT FOR 100 ns;
	  aal1_soll(2) <= NOT aal1_soll(2);
	  WAIT FOR 100 ns;
      END LOOP;
  END PROCESS soll_2;
  soll_1: PROCESS
  BEGIN
      WAIT FOR 350 ns;
      WHILE true LOOP
	  aal1_soll(1) <= NOT aal1_soll(1);
	  WAIT FOR 100 ns;
	  aal1_soll(1) <= NOT aal1_soll(1);
	  WAIT FOR 100 ns;
	  aal1_soll(1) <= NOT aal1_soll(1);
	  WAIT FOR 200 ns;
      END LOOP;
  END PROCESS soll_1;
  soll_0: PROCESS
  BEGIN
      WAIT FOR 350 ns;
      WHILE true LOOP
	  aal1_soll(0) <= NOT aal1_soll(0);
	  WAIT FOR 200 ns;
      END LOOP;
  END PROCESS soll_0;
      
END stimul;  

