library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of not16 is
begin
	gen_bits: for i in 0 to 15 generate
		q(i) <= not a(i);
	end generate;
end architecture;