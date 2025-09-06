library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4way is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			d:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC);
end entity;

architecture arch of mux4way is
begin
	q <= a when sel = "00" else '0';
	q <= b when sel = "01" else '0';
	q <= c when sel = "10" else '0';
	q <= d when sel = "11" else '0';
end architecture;
