-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Mon Jan 29 17:57:49 2024
-- Host        : prakt14 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl /home/ge42hux/praktikum_vhdl/Praktikum_VHDL/versuche/v7/fifo_syn.vhdl
-- Design      : fifo_syn
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity fifo_syn is
  port (
    clk_in : in STD_LOGIC;
    clk_out : in STD_LOGIC;
    res : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    we : in STD_LOGIC;
    re : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 7 downto 0 );
    empty : out STD_LOGIC;
    full : out STD_LOGIC;
    level_reached : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of fifo_syn : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of fifo_syn : entity is "1612cf73";
  attribute ld_depth : integer;
  attribute ld_depth of fifo_syn : entity is 3;
  attribute level : integer;
  attribute level of fifo_syn : entity is 5;
end fifo_syn;

architecture STRUCTURE of fifo_syn is
  signal Mem_reg_0_7_0_5_i_1_n_0 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_0 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_1 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_2 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_3 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_4 : STD_LOGIC;
  signal Mem_reg_0_7_0_5_n_5 : STD_LOGIC;
  signal Mem_reg_0_7_6_7_n_0 : STD_LOGIC;
  signal Mem_reg_0_7_6_7_n_1 : STD_LOGIC;
  signal clk_in_IBUF : STD_LOGIC;
  signal clk_in_IBUF_BUFG : STD_LOGIC;
  signal clk_out_IBUF : STD_LOGIC;
  signal clk_out_IBUF_BUFG : STD_LOGIC;
  signal data_in_IBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal data_out1 : STD_LOGIC;
  signal \data_out[7]_i_1_n_0\ : STD_LOGIC;
  signal data_out_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal empty_OBUF : STD_LOGIC;
  signal empty_flag1 : STD_LOGIC;
  signal full_OBUF : STD_LOGIC;
  signal full_flag1 : STD_LOGIC;
  signal level_reached_OBUF : STD_LOGIC;
  signal level_reached_OBUF_inst_i_2_n_0 : STD_LOGIC;
  signal level_reached_OBUF_inst_i_3_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \p_0_in__1\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_4_out : STD_LOGIC;
  signal re_IBUF : STD_LOGIC;
  signal read_add1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \read_add1[3]_i_1_n_0\ : STD_LOGIC;
  signal read_ptr_reg : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \read_ptr_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_ptr_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_ptr_reg_n_0_[2]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[0]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[2]\ : STD_LOGIC;
  signal \read_ptr_sync_reg_n_0_[3]\ : STD_LOGIC;
  signal res_IBUF : STD_LOGIC;
  signal we_IBUF : STD_LOGIC;
  signal write_add1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal write_ptr_reg : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \write_ptr_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_ptr_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_ptr_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[0]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[1]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[2]\ : STD_LOGIC;
  signal \write_ptr_sync_reg_n_0_[3]\ : STD_LOGIC;
  signal NLW_Mem_reg_0_7_0_5_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Mem_reg_0_7_6_7_DOB_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Mem_reg_0_7_6_7_DOC_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_Mem_reg_0_7_6_7_DOD_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of Mem_reg_0_7_0_5 : label is "";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of Mem_reg_0_7_0_5 : label is 64;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of Mem_reg_0_7_0_5 : label is "Mem";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of Mem_reg_0_7_0_5 : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of Mem_reg_0_7_0_5 : label is 7;
  attribute ram_offset : integer;
  attribute ram_offset of Mem_reg_0_7_0_5 : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of Mem_reg_0_7_0_5 : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of Mem_reg_0_7_0_5 : label is 5;
  attribute METHODOLOGY_DRC_VIOS of Mem_reg_0_7_6_7 : label is "";
  attribute RTL_RAM_BITS of Mem_reg_0_7_6_7 : label is 64;
  attribute RTL_RAM_NAME of Mem_reg_0_7_6_7 : label is "Mem";
  attribute ram_addr_begin of Mem_reg_0_7_6_7 : label is 0;
  attribute ram_addr_end of Mem_reg_0_7_6_7 : label is 7;
  attribute ram_offset of Mem_reg_0_7_6_7 : label is 0;
  attribute ram_slice_begin of Mem_reg_0_7_6_7 : label is 6;
  attribute ram_slice_end of Mem_reg_0_7_6_7 : label is 7;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \read_ptr[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \read_ptr[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \read_ptr[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \read_ptr[3]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \write_ptr[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \write_ptr[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \write_ptr[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \write_ptr[3]_i_2\ : label is "soft_lutpair1";
begin
Mem_reg_0_7_0_5: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2) => \read_ptr_reg_n_0_[2]\,
      ADDRA(1) => \read_ptr_reg_n_0_[1]\,
      ADDRA(0) => \read_ptr_reg_n_0_[0]\,
      ADDRB(4 downto 3) => B"00",
      ADDRB(2) => \read_ptr_reg_n_0_[2]\,
      ADDRB(1) => \read_ptr_reg_n_0_[1]\,
      ADDRB(0) => \read_ptr_reg_n_0_[0]\,
      ADDRC(4 downto 3) => B"00",
      ADDRC(2) => \read_ptr_reg_n_0_[2]\,
      ADDRC(1) => \read_ptr_reg_n_0_[1]\,
      ADDRC(0) => \read_ptr_reg_n_0_[0]\,
      ADDRD(4 downto 3) => B"00",
      ADDRD(2) => \write_ptr_reg_n_0_[2]\,
      ADDRD(1) => \write_ptr_reg_n_0_[1]\,
      ADDRD(0) => \write_ptr_reg_n_0_[0]\,
      DIA(1 downto 0) => data_in_IBUF(1 downto 0),
      DIB(1 downto 0) => data_in_IBUF(3 downto 2),
      DIC(1 downto 0) => data_in_IBUF(5 downto 4),
      DID(1 downto 0) => B"00",
      DOA(1) => Mem_reg_0_7_0_5_n_0,
      DOA(0) => Mem_reg_0_7_0_5_n_1,
      DOB(1) => Mem_reg_0_7_0_5_n_2,
      DOB(0) => Mem_reg_0_7_0_5_n_3,
      DOC(1) => Mem_reg_0_7_0_5_n_4,
      DOC(0) => Mem_reg_0_7_0_5_n_5,
      DOD(1 downto 0) => NLW_Mem_reg_0_7_0_5_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_in_IBUF_BUFG,
      WE => Mem_reg_0_7_0_5_i_1_n_0
    );
Mem_reg_0_7_0_5_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00009F00"
    )
        port map (
      I0 => \read_ptr_sync_reg_n_0_[3]\,
      I1 => write_ptr_reg(3),
      I2 => full_flag1,
      I3 => we_IBUF,
      I4 => res_IBUF,
      O => Mem_reg_0_7_0_5_i_1_n_0
    );
Mem_reg_0_7_6_7: unisim.vcomponents.RAM32M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(4 downto 3) => B"00",
      ADDRA(2) => \read_ptr_reg_n_0_[2]\,
      ADDRA(1) => \read_ptr_reg_n_0_[1]\,
      ADDRA(0) => \read_ptr_reg_n_0_[0]\,
      ADDRB(4 downto 3) => B"00",
      ADDRB(2) => \read_ptr_reg_n_0_[2]\,
      ADDRB(1) => \read_ptr_reg_n_0_[1]\,
      ADDRB(0) => \read_ptr_reg_n_0_[0]\,
      ADDRC(4 downto 3) => B"00",
      ADDRC(2) => \read_ptr_reg_n_0_[2]\,
      ADDRC(1) => \read_ptr_reg_n_0_[1]\,
      ADDRC(0) => \read_ptr_reg_n_0_[0]\,
      ADDRD(4 downto 3) => B"00",
      ADDRD(2) => \write_ptr_reg_n_0_[2]\,
      ADDRD(1) => \write_ptr_reg_n_0_[1]\,
      ADDRD(0) => \write_ptr_reg_n_0_[0]\,
      DIA(1 downto 0) => data_in_IBUF(7 downto 6),
      DIB(1 downto 0) => B"00",
      DIC(1 downto 0) => B"00",
      DID(1 downto 0) => B"00",
      DOA(1) => Mem_reg_0_7_6_7_n_0,
      DOA(0) => Mem_reg_0_7_6_7_n_1,
      DOB(1 downto 0) => NLW_Mem_reg_0_7_6_7_DOB_UNCONNECTED(1 downto 0),
      DOC(1 downto 0) => NLW_Mem_reg_0_7_6_7_DOC_UNCONNECTED(1 downto 0),
      DOD(1 downto 0) => NLW_Mem_reg_0_7_6_7_DOD_UNCONNECTED(1 downto 0),
      WCLK => clk_in_IBUF_BUFG,
      WE => Mem_reg_0_7_0_5_i_1_n_0
    );
clk_in_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_in_IBUF,
      O => clk_in_IBUF_BUFG
    );
clk_in_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in,
      O => clk_in_IBUF
    );
clk_out_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => clk_out_IBUF,
      O => clk_out_IBUF_BUFG
    );
clk_out_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_out,
      O => clk_out_IBUF
    );
\data_in_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(0),
      O => data_in_IBUF(0)
    );
\data_in_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(1),
      O => data_in_IBUF(1)
    );
\data_in_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(2),
      O => data_in_IBUF(2)
    );
\data_in_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(3),
      O => data_in_IBUF(3)
    );
\data_in_IBUF[4]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(4),
      O => data_in_IBUF(4)
    );
\data_in_IBUF[5]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(5),
      O => data_in_IBUF(5)
    );
\data_in_IBUF[6]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(6),
      O => data_in_IBUF(6)
    );
\data_in_IBUF[7]_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in(7),
      O => data_in_IBUF(7)
    );
\data_out[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EF00"
    )
        port map (
      I0 => read_ptr_reg(3),
      I1 => \write_ptr_sync_reg_n_0_[3]\,
      I2 => empty_flag1,
      I3 => re_IBUF,
      I4 => res_IBUF,
      O => \data_out[7]_i_1_n_0\
    );
\data_out_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(0),
      O => data_out(0)
    );
\data_out_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(1),
      O => data_out(1)
    );
\data_out_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(2),
      O => data_out(2)
    );
\data_out_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(3),
      O => data_out(3)
    );
\data_out_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(4),
      O => data_out(4)
    );
\data_out_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(5),
      O => data_out(5)
    );
\data_out_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(6),
      O => data_out(6)
    );
\data_out_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_OBUF(7),
      O => data_out(7)
    );
\data_out_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_1,
      Q => data_out_OBUF(0),
      R => '0'
    );
\data_out_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_0,
      Q => data_out_OBUF(1),
      R => '0'
    );
\data_out_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_3,
      Q => data_out_OBUF(2),
      R => '0'
    );
\data_out_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_2,
      Q => data_out_OBUF(3),
      R => '0'
    );
\data_out_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_5,
      Q => data_out_OBUF(4),
      R => '0'
    );
\data_out_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_0_5_n_4,
      Q => data_out_OBUF(5),
      R => '0'
    );
\data_out_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_6_7_n_1,
      Q => data_out_OBUF(6),
      R => '0'
    );
\data_out_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \data_out[7]_i_1_n_0\,
      D => Mem_reg_0_7_6_7_n_0,
      Q => data_out_OBUF(7),
      R => '0'
    );
empty_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => empty_OBUF,
      O => empty
    );
empty_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF10"
    )
        port map (
      I0 => read_ptr_reg(3),
      I1 => \write_ptr_sync_reg_n_0_[3]\,
      I2 => empty_flag1,
      I3 => res_IBUF,
      O => empty_OBUF
    );
empty_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[0]\,
      I1 => \write_ptr_sync_reg_n_0_[0]\,
      I2 => \write_ptr_sync_reg_n_0_[2]\,
      I3 => \read_ptr_reg_n_0_[2]\,
      I4 => \write_ptr_sync_reg_n_0_[1]\,
      I5 => \read_ptr_reg_n_0_[1]\,
      O => empty_flag1
    );
full_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => full_OBUF,
      O => full
    );
full_OBUF_inst_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0060"
    )
        port map (
      I0 => \read_ptr_sync_reg_n_0_[3]\,
      I1 => write_ptr_reg(3),
      I2 => full_flag1,
      I3 => res_IBUF,
      O => full_OBUF
    );
full_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[0]\,
      I1 => \read_ptr_sync_reg_n_0_[0]\,
      I2 => \read_ptr_sync_reg_n_0_[2]\,
      I3 => \write_ptr_reg_n_0_[2]\,
      I4 => \read_ptr_sync_reg_n_0_[1]\,
      I5 => \write_ptr_reg_n_0_[1]\,
      O => full_flag1
    );
level_reached_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => level_reached_OBUF,
      O => level_reached
    );
level_reached_OBUF_inst_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"14415555"
    )
        port map (
      I0 => res_IBUF,
      I1 => level_reached_OBUF_inst_i_2_n_0,
      I2 => read_ptr_reg(3),
      I3 => \write_ptr_sync_reg_n_0_[3]\,
      I4 => level_reached_OBUF_inst_i_3_n_0,
      O => level_reached_OBUF
    );
level_reached_OBUF_inst_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"D4DD4444DDDDD4DD"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[2]\,
      I1 => \write_ptr_sync_reg_n_0_[2]\,
      I2 => \write_ptr_sync_reg_n_0_[0]\,
      I3 => \read_ptr_reg_n_0_[0]\,
      I4 => \write_ptr_sync_reg_n_0_[1]\,
      I5 => \read_ptr_reg_n_0_[1]\,
      O => level_reached_OBUF_inst_i_2_n_0
    );
level_reached_OBUF_inst_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F96F99696966F96F"
    )
        port map (
      I0 => \write_ptr_sync_reg_n_0_[2]\,
      I1 => \read_ptr_reg_n_0_[2]\,
      I2 => \read_ptr_reg_n_0_[1]\,
      I3 => \write_ptr_sync_reg_n_0_[1]\,
      I4 => \read_ptr_reg_n_0_[0]\,
      I5 => \write_ptr_sync_reg_n_0_[0]\,
      O => level_reached_OBUF_inst_i_3_n_0
    );
re_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => re,
      O => re_IBUF
    );
\read_add1[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => res_IBUF,
      O => \read_add1[3]_i_1_n_0\
    );
\read_add1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \read_ptr_reg_n_0_[0]\,
      Q => read_add1(0),
      R => '0'
    );
\read_add1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \read_ptr_reg_n_0_[1]\,
      Q => read_add1(1),
      R => '0'
    );
\read_add1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \read_ptr_reg_n_0_[2]\,
      Q => read_add1(2),
      R => '0'
    );
\read_add1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => read_ptr_reg(3),
      Q => read_add1(3),
      R => '0'
    );
\read_ptr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\read_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[0]\,
      I1 => \read_ptr_reg_n_0_[1]\,
      O => \p_0_in__0\(1)
    );
\read_ptr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[0]\,
      I1 => \read_ptr_reg_n_0_[1]\,
      I2 => \read_ptr_reg_n_0_[2]\,
      O => \p_0_in__0\(2)
    );
\read_ptr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"22222202"
    )
        port map (
      I0 => re_IBUF,
      I1 => res_IBUF,
      I2 => empty_flag1,
      I3 => \write_ptr_sync_reg_n_0_[3]\,
      I4 => read_ptr_reg(3),
      O => data_out1
    );
\read_ptr[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \read_ptr_reg_n_0_[1]\,
      I1 => \read_ptr_reg_n_0_[0]\,
      I2 => \read_ptr_reg_n_0_[2]\,
      I3 => read_ptr_reg(3),
      O => \p_0_in__0\(3)
    );
\read_ptr_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data_out1,
      CLR => res_IBUF,
      D => p_0_in(0),
      Q => \read_ptr_reg_n_0_[0]\
    );
\read_ptr_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data_out1,
      CLR => res_IBUF,
      D => \p_0_in__0\(1),
      Q => \read_ptr_reg_n_0_[1]\
    );
\read_ptr_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data_out1,
      CLR => res_IBUF,
      D => \p_0_in__0\(2),
      Q => \read_ptr_reg_n_0_[2]\
    );
\read_ptr_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => data_out1,
      CLR => res_IBUF,
      D => \p_0_in__0\(3),
      Q => read_ptr_reg(3)
    );
\read_ptr_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => read_add1(0),
      Q => \read_ptr_sync_reg_n_0_[0]\,
      R => '0'
    );
\read_ptr_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => read_add1(1),
      Q => \read_ptr_sync_reg_n_0_[1]\,
      R => '0'
    );
\read_ptr_sync_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => read_add1(2),
      Q => \read_ptr_sync_reg_n_0_[2]\,
      R => '0'
    );
\read_ptr_sync_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => read_add1(3),
      Q => \read_ptr_sync_reg_n_0_[3]\,
      R => '0'
    );
res_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => res,
      O => res_IBUF
    );
we_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => we,
      O => we_IBUF
    );
\write_add1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \write_ptr_reg_n_0_[0]\,
      Q => write_add1(0),
      R => '0'
    );
\write_add1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \write_ptr_reg_n_0_[1]\,
      Q => write_add1(1),
      R => '0'
    );
\write_add1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => \write_ptr_reg_n_0_[2]\,
      Q => write_add1(2),
      R => '0'
    );
\write_add1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => write_ptr_reg(3),
      Q => write_add1(3),
      R => '0'
    );
\write_ptr[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[0]\,
      O => \p_0_in__1\(0)
    );
\write_ptr[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[0]\,
      I1 => \write_ptr_reg_n_0_[1]\,
      O => \p_0_in__1\(1)
    );
\write_ptr[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[0]\,
      I1 => \write_ptr_reg_n_0_[1]\,
      I2 => \write_ptr_reg_n_0_[2]\,
      O => \p_0_in__1\(2)
    );
\write_ptr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA8A8AAA"
    )
        port map (
      I0 => we_IBUF,
      I1 => res_IBUF,
      I2 => full_flag1,
      I3 => write_ptr_reg(3),
      I4 => \read_ptr_sync_reg_n_0_[3]\,
      O => p_4_out
    );
\write_ptr[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \write_ptr_reg_n_0_[1]\,
      I1 => \write_ptr_reg_n_0_[0]\,
      I2 => \write_ptr_reg_n_0_[2]\,
      I3 => write_ptr_reg(3),
      O => \p_0_in__1\(3)
    );
\write_ptr_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_4_out,
      CLR => res_IBUF,
      D => \p_0_in__1\(0),
      Q => \write_ptr_reg_n_0_[0]\
    );
\write_ptr_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_4_out,
      CLR => res_IBUF,
      D => \p_0_in__1\(1),
      Q => \write_ptr_reg_n_0_[1]\
    );
\write_ptr_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_4_out,
      CLR => res_IBUF,
      D => \p_0_in__1\(2),
      Q => \write_ptr_reg_n_0_[2]\
    );
\write_ptr_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_in_IBUF_BUFG,
      CE => p_4_out,
      CLR => res_IBUF,
      D => \p_0_in__1\(3),
      Q => write_ptr_reg(3)
    );
\write_ptr_sync_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => write_add1(0),
      Q => \write_ptr_sync_reg_n_0_[0]\,
      R => '0'
    );
\write_ptr_sync_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => write_add1(1),
      Q => \write_ptr_sync_reg_n_0_[1]\,
      R => '0'
    );
\write_ptr_sync_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => write_add1(2),
      Q => \write_ptr_sync_reg_n_0_[2]\,
      R => '0'
    );
\write_ptr_sync_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out_IBUF_BUFG,
      CE => \read_add1[3]_i_1_n_0\,
      D => write_add1(3),
      Q => \write_ptr_sync_reg_n_0_[3]\,
      R => '0'
    );
end STRUCTURE;
