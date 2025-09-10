library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor3 is
  port (
    a1 : in  STD_LOGIC;
    b1 : in  STD_LOGIC;
    c1 : in  STD_LOGIC;
    q1 : out STD_LOGIC
  );
end entity xor3;

architecture rtl of xor3 is
  component mux8way
    port (
      a,b,c,d,e,f,g,h : in  STD_LOGIC;
      sel             : in  STD_LOGIC_VECTOR(2 downto 0);
      q               : out STD_LOGIC
    );
  end component;

  signal sel1 : STD_LOGIC_VECTOR(2 downto 0);
begin
  sel1 <= a1 & b1 & c1;

  u: mux8way
    port map (
      a   => '0',
      b   => '1',
      c   => '1',
      d   => '0',
      e   => '1',
      f   => '0',
      g   => '0',
      h   => '1',
      sel => sel1,
      q   => q1
    );
end architecture rtl;
