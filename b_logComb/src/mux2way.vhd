library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2way is
	port ( 
			a:   in  STD_LOGIC; -- entrada a , b de dados . sel é o sinal de controle, ele que decide quem passa
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC);
end entity;

architecture arch of mux2way is
begin
	q <= (a and (not sel)) or (b and sel);
-- a só passa quando sell=0
end architecture;
