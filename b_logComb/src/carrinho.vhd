library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrinho is
	port ( 
			x1:   in  STD_LOGIC;
			x2:   in  STD_LOGIC;
			x3:   in  STD_LOGIC;
			x4:   in  STD_LOGIC;  
            y1:   out STD_LOGIC_VECTOR(1 downto 0);
            y2:   out STD_LOGIC_VECTOR(1 downto 0);
         );
end entity;

architecture rtl of carrinho is
begin
    y1(0) <= (not(x3 or x4)) and (not((not x1) and x2));
    y1(1) <= (not(x1 or x2)) and x3;
    y2(0) <= (not(x3 or x4)) and ((not x1) or x2);
    y2(1) <= (not(x1 or x2)) and x4;
end architecture;