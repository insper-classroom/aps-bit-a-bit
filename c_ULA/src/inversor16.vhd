-- Elementos de Sistemas
-- by Luciano Soares
-- Inversor16.vhd

-- Implementa Inversor 16

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inversor16 is
  port(
        z   : in STD_LOGIC;
        a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
end entity;

architecture rtl of inversor16 is
begin
  with z select
    y <= a when '0',
    not(a) when others;

end architecture;