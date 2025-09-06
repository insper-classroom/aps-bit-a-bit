library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity barrelshifter16 is
	port ( 
			a:    in  STD_LOGIC_VECTOR(15 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  std_logic_vector(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(15 downto 0));  -- output vector (shifted)
end entity;

architecture rtl of barrelshifter16 is
  	signal l1, l2, l3 : STD_LOGIC_VECTOR(15 downto 0);  -- left
  	signal r1, r2, r3 : STD_LOGIC_VECTOR(15 downto 0);  -- right
begin
  -- left:
  l1 <= a when size(0) = '0' else a(14 downto 0) & '0';
  l2 <= l1 when size(1) = '0' else l1(13 downto 0) & "00";
  l3 <= l2 when size(2) = '0' else l2(11 downto 0) & "0000";

  -- right:
  r1 <= a when size(0) = '0' else '0' & a(15 downto 1);
  r2 <= r1 when size(1) = '0' else "00" & r1(15 downto 2);
  r3 <= r2 when size(2) = '0' else "0000" & r2(15 downto 4);

  q <= l3 when dir = '0' else r3;
end architecture;