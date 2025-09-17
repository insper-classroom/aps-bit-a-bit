-- Elementos de Sistemas
-- by Luciano Soares
-- Inc16.vhd

-- Incrementador de 16 bits

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inc16 is
	port(
		a   : in  STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Inc16 is

  -- Componente Add16 (dependência externa)
  component Add16 is
    port(
      a   : in  STD_LOGIC_VECTOR(15 downto 0);
      b   : in  STD_LOGIC_VECTOR(15 downto 0);
      q   : out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;

signal um : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";

begin

  copia : Add16
    port map (
      a => a,
      b => um,
      q => q
    );

end architecture;
