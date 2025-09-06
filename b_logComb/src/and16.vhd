library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of and16 is
begin
	gen_bits: for i in 0 to 15 generate
		q(i) <= a(i) and b(i);
	end generate;
end architecture;