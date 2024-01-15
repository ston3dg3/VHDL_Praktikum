-----------------------------------------------------------------------------------------
-- Author: Franciszek Hordejuk
-----------------------------------------------------------------------------------------
-- This file is the HEC generator entity for the ATP header generator.
-- The Polynom is: g(x) = x^8 + x^2 + x + 1
-- The generator is a 8-bit shift register with XOR gates on the 8th, 2nd, 1st and 0th bit.
-- The generator is initialized with 0x00.
-----------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hec_gen is
  port
  (
    clk  : in std_logic; -- clock
    res  : in std_logic; -- sets the generator register to 0x00 (set to 1 before calucations)
    enab : in std_logic; -- decides if we shift or not (set to 0 after calucations)
    data : in std_logic; -- input bit which is sequentially shifted through the register
    hec  : out std_logic_vector(7 downto 0) -- the HEC output of the generator
  );
end entity hec_gen;

architecture rtl of hec_gen is

  -- declare the component for the DFF used in the register
  component myDFF is
    port
    (
      d, clk, en, res : in std_logic;
      q, qb           : out std_logic);
  end component myDFF;

  -- helper signal for the shift register
  signal crc : std_logic_vector(7 downto 0) := (others => '0');

begin

  -- generate the shift register structure from DFFs
  generator : for i in 0 to 7 generate

    -- first dff
    dff0 : if i = 0 generate
      dff_0 : myDFF port map
        (d => (data xor crc(7)), clk => clk, en => enab, res => res, q => crc(i), qb => open);
    end generate;

    -- second dff
    dff1 : if i = 1 generate
      dff_1 : myDFF port
      map
      (d => (crc(0) xor (data xor crc(7))), clk => clk, en => enab, res => res, q => crc(i), qb => open);
    end generate;

    -- third dff
    dff2 : if i = 2 generate
      dff_2 : myDFF port
      map
      (d => (crc(1) xor (data xor crc(7))), clk => clk, en => enab, res => res, q => crc(i), qb => open);
    end generate;

    -- all dff in between (3 to 6)
    dff3to6 : if i > 2 and i < 7 generate
      dff_3to6 : myDFF port
      map
      (d => crc(i - 1), clk => clk, en => enab, res => res, q => crc(i), qb => open);
    end generate;

    -- last dff (7)
    dff7 : if i = 7 generate
      dff_7 : myDFF port
      map
      (d => crc(i - 1), clk => clk, en => enab, res => res, q => crc(i), qb => open);
    end generate;

  end generate;

  -- assign the output XORed with 0x55
  hec <= crc xor X"55";
  -- hec <= crc xor "01010101";

end architecture;