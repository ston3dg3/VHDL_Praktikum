LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ingress IS
PORT(	d_clk : IN std_logic;
	res: IN std_logic;
	set_header : IN std_logic;
	header : IN std_logic_vector(31 DOWNTO 0);
	data : IN std_logic;
	ready : OUT std_logic;
	we_fifo : OUT std_logic;
	fifo_data : OUT std_logic_vector(7 DOWNTO 0));
END ingress;

ARCHITECTURE struct OF ingress IS

	COMPONENT head_gen
	PORT (	clk : IN std_logic;
		res : IN std_logic;
		set_head : IN std_logic;
		head_in : IN std_logic_vector(31 DOWNTO 0);
		output_head : IN std_logic;
		head_data : OUT std_logic_vector(7 DOWNTO 0);
		hg_done : OUT std_logic);
	END COMPONENT;
	COMPONENT aal1_gen
	  PORT (clk : IN std_logic;
	  	cnt_enab : IN std_logic;
		res : IN std_logic;
		aal1 : OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;
	COMPONENT sp_conv
	  PORT (d_in : IN std_logic;
	  	clk : IN std_logic;
		res : IN std_logic;
	        d_out : OUT std_logic_vector(7 DOWNTO 0));
	END COMPONENT;
	COMPONENT ctl_in
	  PORT(	clk : IN std_logic;
	  	res : IN std_logic;
		hg_done : IN std_logic;
		ready : OUT std_logic;
		output_head : OUT std_logic;
		inc_aal1 : OUT std_logic;
		sel : OUT std_logic_vector(1 DOWNTO 0);
		we_fifo :OUT std_logic);
	END COMPONENT;
	
	SIGNAL h, a, s : std_logic_vector(7 DOWNTO 0);
	SIGNAL sel : std_logic_vector (1 DOWNTO 0);
	SIGNAL hg_done, output_head, inc_aal1 : std_logic;
	
BEGIN
	fifo_data <= 	s WHEN sel = "00" ELSE
			a WHEN sel = "01" ELSE
			h WHEN sel = "10" ELSE
			"--------";
	
	hg: head_gen PORT MAP(	clk => d_clk, 
				res => res,
				set_head => set_header,
				head_in => header,
				output_head => output_head,
				head_data => h,
				hg_done => hg_done);
	aal: aal1_gen PORT MAP(	clk => d_clk,
				cnt_enab => inc_aal1,
				res => res,
				aal1 => a);
	sr: sp_conv PORT MAP(	d_in => data,
				clk => d_clk,
				res => res,
				d_out => s);
	c: ctl_in PORT MAP(	clk => d_clk,
				res => res,
				hg_done => hg_done,
				ready => ready,
				output_head => output_head,
				inc_aal1 => inc_aal1,
				sel => sel,
				we_fifo => we_fifo);

END struct;
