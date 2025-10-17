-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
  port(
    instruction : in std_logic_vector(17 downto 0);                 -- instrução para executar
    zr          : out std_logic := '0';                             -- valores zr(se zero)
    ng          : out std_logic := '0';                             -- ng (se negativo) da ALU
    muxS        : out std_logic := '0';                             -- mux que seleciona entre reg. S e reg D para ALU -----------> novo
    muxALUI_A   : out std_logic := '0';                             -- mux que seleciona entre instrução e ALU para reg. A
    muxAM       : out std_logic := '0';                             -- mux que seleciona entre reg. A e Mem. RAM para ALU
    zx          : out std_logic := '0';                             -- sinais de controle da ALU --
    nx          : out std_logic := '0';                             -- sinais de controle da ALU --
    zy          : out std_logic := '0';                             -- sinais de controle da ALU --
    ny          : out std_logic := '0';                             -- sinais de controle da ALU --
    f           : out std_logic := '0';                             -- sinais de controle da ALU --
    no          : out std_logic := '0';                             -- sinais de controle da ALU --
    loadA       : out std_logic := '0';                             -- sinal de load do reg. A
    loadD       : out std_logic := '0';                             -- sinal de load do reg. D
    loadS       : out std_logic := '0';                             -- sinal de load do reg. S -----------------------------------> novo
    loadM       : out std_logic := '0';                             -- sinal de load da Mem. RAM
    loadPC      : out std_logic := '0'                              -- sinal de load do Program Counter
  );
end entity;

architecture arch of ControlUnit is
  
  signal dois_bits_ms : std_logic_vector(1 downto 0);
  signal j : std_logic_vector(2 downto 0);
  
begin
  dois_bits_ms <= instruction(17 downto 16);
  j <= instruction(2 downto 0);

  case dois_bits_ms is
    when "00" =>                                                    -- grava no registrador A
      loadA      <= '1';
      mux_ALUI_A <= '1';

    when "01" =>                                                    -- grava no registrador S
      loadS      <= '1';

    when "10" => 
      loadS <= '1';
      muxS  <= instruction(14);

      muxAM <= instruction(13);

      zx    <= instruction(12);
      nx    <= instruction(11);
      zy    <= instruction(10);
      ny    <= instruction(9);
      f     <= instruction(8);
      no    <= instruction(7);

      loadM <= instruction(5);
      loadD <= instruction(4);
      loadA <= instruction(3);

      if (
        (j = "001" and zr = '0' and ng = '0') or                    -- JGT
        (j = "010" and zr = '1') or                                 -- JEQ
        (j = "011" and (zr = '1' or (zr = '0' and ng = '0'))) or    -- JGE
        (j = "100" and ng = '1') or                                 -- JLT
        (j = "101" and zr = '0') or                                 -- JNE
        (j = "110" and (ng = '1' or zr = '1')) or                   -- JLE
        (j = "111")                                                 -- JMP always
      ) then
        loadPC <= '1';
      else
        loadPC <= '0';
      end if;

    when others =>                                                  -- seguranca
      null;

end architecture;