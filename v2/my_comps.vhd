-- AND mit zwei Eingaengen
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_and2 IS
    PORT (a, b : IN std_logic;
          y : OUT std_logic);
END my_and2;

ARCHITECTURE and2behav OF my_and2 IS
BEGIN
    y <= a AND  b;
END and2behav;
------------------

-- NAND mit zwei Eingangen 
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_nand2 IS
    PORT (a, b : IN std_logic;
          y : OUT std_logic);
END my_nand2;


ARCHITECTURE nand2behav OF my_nand2 IS
BEGIN
    y <= a NAND b;
END nand2behav;
------------------

-- AND mit drei Eingaengen
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_and3 IS
    PORT (a, b, c : IN std_logic;
          y : OUT std_logic);
END my_and3;

ARCHITECTURE and3behav OF my_and3 IS
BEGIN
    y <= a AND  b AND  c;
END and3behav;
------------------

-- OR mit zwei Eingaengen
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_or2 IS
    PORT (a, b : IN std_logic;
          y : OUT std_logic);
END my_or2;

ARCHITECTURE or2behav OF my_or2 IS
BEGIN
    y <= a OR  b;
END or2behav;
------------------

-- D-FlipFlop mit reset und enable
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY my_dff_re IS
    PORT (d, clk, en, res : IN std_logic;
	  q, qb  : OUT std_logic);
END my_dff_re;

ARCHITECTURE behav OF my_dff_re IS
    SIGNAL q_int : std_logic;
BEGIN
    PROCESS(clk)
    BEGIN
	IF (clk'EVENT AND clk='1') THEN
	    IF res = '1' THEN
	        q_int <= '0';
	    ELSIF en = '1' THEN
                q_int <= d;
	    END IF;
	END IF;
    END PROCESS;
    q <= q_int;
    qb <= NOT q_int;
END behav;

