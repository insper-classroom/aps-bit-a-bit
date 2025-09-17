library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity zerador16 is
  port(
        z   : in STD_LOGIC;
	      a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
end zerador16;

architecture rtl of zerador16 is
  signal zero: STD_LOGIC_VECTOR(15 downto 0);

begin
  zero <= "0000000000000000";
  with z select
    y <=  a when '0',
          zero when others;

end architecture;