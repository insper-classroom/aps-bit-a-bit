-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0) 
    );
end entity;

architecture arch of PC is

  signal muxOut : std_logic_vector(15 downto 0);
  signal muxin0 : std_logic_vector(15 downto 0);
  signal outputReg : std_logic_vector(15 downto 0);
  signal load_reg: std_logic;
  signal sel_mux: std_logic;

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Register16 is
      port(
          clock:   in STD_LOGIC;
          input:   in STD_LOGIC_VECTOR(15 downto 0);
          load:    in STD_LOGIC;
          output: out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    component Mux16 is
		port (
			a:   in STD_LOGIC_VECTOR(15 downto 0);
			b:   in STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0)
            );
	end component;


begin

  -- calcular pc + 1
  u_inc: Inc16
    port map(
      a => outputReg,
      q => pc_inc
    );

  -- mux entre manter pc (outputReg) e pc_inc (increment)
  u_mux_inc: Mux16
    port map(
      a   => outputReg,
      b   => pc_inc,
      sel => increment,
      q   => muxOut
    );

  -- mux entre resultado anterior (muxOut) e input (load)
  u_mux_load: Mux16
    port map(
      a   => muxOut,
      b   => input,
      sel => load,
      q   => pc_load
    );

  -- mux de reset: se reset='1' => zero, else pega pc_load
  u_mux_reset: Mux16
    port map(
      a   => (others => '0'),
      b   => pc_load,
      sel => reset,
      q   => muxin0
    );

  -- faz o registrador carregar sempre o valor calculado (comportamento de D-register)
  load_reg <= '1';
  sel_mux  <= increment; -- mantido por compatibilidade com template

  u_reg: Register16
    port map(
      clock  => clock,
      input  => muxin0,
      load   => load_reg,
      output => outputReg
    );

  -- expõe o valor do PC
  output <= outputReg;

end architecture;