library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor3 is
	port ( 
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			c:   in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture rtl of xor3 is
    component mux8way
        port (
                a1:   in  STD_LOGIC;
			    b1:   in  STD_LOGIC;
			    c1:   in  STD_LOGIC;
			    d1:   in  STD_LOGIC;
			    e1:   in  STD_LOGIC;
			    f1:   in  STD_LOGIC;
			    g1:   in  STD_LOGIC;
			    h1:   in  STD_LOGIC;
			    sel1: in  STD_LOGIC_VECTOR(2 downto 0);
			    q1:   out STD_LOGIC
            );
    end component;
begin
    troco: mux8way
        port map (
            a1 => '0',
            b1 => '1',
            c1 => '1',
            d1 => '0',
            e1 => '1',
            f1 => '0',
            g1 => '0',
            h1 => '1',
            sel1 => a & b & c,
            q1 => q
        );
end architecture;