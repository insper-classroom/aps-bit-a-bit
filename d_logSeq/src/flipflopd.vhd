-- Elementos de Sistemas
-- by Luciano Soares
-- FlipFlopD.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD is
	port(
		clock:  in std_logic; -- clock
		d:      in std_logic; -- entrada
		clear:  in std_logic; -- 0 quando o sinal e 1
		preset: in std_logic; 	-- a quando o sinal e 1
		q:      out std_logic := '0'	-- saida
	);
end entity;

architecture arch of FlipFlopD is

begin
	process(clock, clear, preset)
		begin
			if (clear = '1') then
				q <= '0';
			elsif (preset = '1') then
				q <= '1';
			elsif rising_edge(clock) then
				q <= d;
			end if;		
		end process;
end architecture;