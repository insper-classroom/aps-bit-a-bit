library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity detectordemoedas is
	port (
    Q,D,N : in  STD_LOGIC;
    cents     : out STD_LOGIC_VECTOR(4 downto 0));
end entity;

architecture arch of detectordemoedas is
    signal sel: STD_LOGIC_VECTOR(2 downto 0);
begin
    sel <= Q & D & N;
    cents <= "00000" when sel = "000" else   
             "00101" when sel = "001" else
             "01010" when sel = "010" else
             "11001";
end architecture;