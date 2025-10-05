-- Elementos de Sistemas
-- by Luciano Soares
-- Register16.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity Register16 is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture arch of Register16 is

	component Register8 is
		port(
			clock:   in STD_LOGIC;
			input:   in STD_LOGIC_VECTOR(7 downto 0);
			load:    in STD_LOGIC;
			output: out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;

begin
	gen_bytes: for i in 0 to 1 generate
    constant hi : integer := i*8 + 7;
    constant lo : integer := i*8;
	begin
    	u_reg: Register8
    		port map(
        		clock  => clock,
        		input  => input(hi downto lo),
        		load   => load,
        		output => output(hi downto lo)
    		);
	end generate;
end architecture;