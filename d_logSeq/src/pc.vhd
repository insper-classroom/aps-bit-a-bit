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
use ieee.numeric_std.all;

entity PC is
    port(
        clock     : in  std_logic;
        increment : in  std_logic;
        load      : in  std_logic;
        reset     : in  std_logic;
        input     : in  std_logic_vector(15 downto 0);
        output    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of PC is
    signal mux_out   : std_logic_vector(15 downto 0);
    signal mux_out1  : std_logic_vector(15 downto 0);
    signal mux_out2  : std_logic_vector(15 downto 0);
    signal inc_out   : std_logic_vector(15 downto 0);
    signal pc_reg    : std_logic_vector(15 downto 0);
    signal load_reg  : std_logic;

    component Inc16 is
        port(
            a : in  std_logic_vector(15 downto 0);
            q : out std_logic_vector(15 downto 0)
        );
    end component;

    component Register16 is
        port(
            clock  : in  std_logic;
            input  : in  std_logic_vector(15 downto 0);
            load   : in  std_logic;
            output : out std_logic_vector(15 downto 0)
        );
    end component;

    component Mux16 is
        port(
            a   : in  std_logic_vector(15 downto 0);
            b   : in  std_logic_vector(15 downto 0);
            sel : in  std_logic;
            q   : out std_logic_vector(15 downto 0)
        );
    end component;
begin
    load_reg <= (load or increment or reset);

    inc: Inc16 port map(
        a => pc_reg,
        q => inc_out
    );

    mux1: Mux16 port map(
        a   => pc_reg,
        b   => inc_out,
        sel => increment,
        q   => mux_out1
    );

    mux2: Mux16 port map(
        a   => mux_out1,
        b   => input,
        sel => load,
        q   => mux_out2
    );

    mux3: Mux16 port map(
        a   => mux_out2,
        b   => x"0000",
        sel => reset,
        q   => mux_out
    );

    reg16: Register16 port map(
        clock  => clock,
        input  => mux_out,
        load   => load_reg,
        output => pc_reg
    );

    output <= pc_reg;
end architecture;