Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;
		soma,vaium: out STD_LOGIC
	);
end entity;

architecture rtl of FullAdder is
begin
  soma <= a xor b xor c;
  vaium <= (a and b) or (b and c) or (a and c);
end architecture;