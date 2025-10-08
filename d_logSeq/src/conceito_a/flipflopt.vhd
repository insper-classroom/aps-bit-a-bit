-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is

	signal q_int: std_logic:= '0';

begin
	process(clock)
	begin
		if rising_edge(clock) then
			case t is
				when '0' =>
					null;
				when others =>
					q_int <= not(q_int);
			end case;
		end if;
	end process;

	q		<= q_int;
	notq	<= not(q_int);

end architecture;