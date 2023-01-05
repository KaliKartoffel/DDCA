library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


use work.vga_gfx_cntrl_pkg.all;
use work.gfx_util_pkg.all;
use work.vga_gfx_cntrl_pkg.all;
use work.bb_rom_pkg.all;
use work.decimal_printer_pkg.all;

entity decimal_printer_tb is
end entity;

architecture bench of decimal_printer_tb is

  signal clk            : std_logic;
  signal res_n          : std_logic                                    := '0';
  signal gfx_instr      : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0) := (others => '0');
  signal gfx_instr_wr   : std_logic                                    := '0';
  signal gfx_instr_full : std_logic                                    := '0';
  signal gfx_frame_sync : std_logic                                    := '0';
  signal start          : std_logic                                    := '0';
  signal busy           : std_logic                                    := '0';
  signal x              : std_logic_vector(15 downto 0)                := x"000a";
  signal y              : std_logic_vector(15 downto 0)                := x"000b";
  signal number         : std_logic_vector(15 downto 0)                := (others => '0');

  signal dump_frame : std_logic := '0';

  signal init_gfx_instr    : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0) := (others => '0');
  signal init_gfx_instr_wr : std_logic                                    := '0';
begin


  -- TODO:
  -- kein x 
  uut : decimal_printer
    port map (
      clk            => clk,
      res_n          => res_n,
      gfx_instr      => gfx_instr,
      gfx_instr_wr   => gfx_instr_wr,
      gfx_instr_full => gfx_instr_full,
      start          => start,
      busy           => busy,
      x              => x,
      y              => y,
      number         => number
      );

  reseting : process
  begin
    res_n <= '1';
    wait for 20 ns;
    res_n <= '0';
    wait for 20 ns;
    res_n <= '1';
    wait;
  end process;

  stimulus : process
  begin


    start <= '0';

    wait for 30 ns;
    --sending palett
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '1';
    init_gfx_instr    <= gfx_instr_load_palette(0);
    wait until rising_edge(clk);
    init_gfx_instr    <= x"ffff";
    wait until rising_edge(clk);
    init_gfx_instr    <= x"07e0";       --grün
    wait until rising_edge(clk);
    init_gfx_instr    <= x"001f";
    wait until rising_edge(clk);
    init_gfx_instr    <= x"f800";
    wait until rising_edge(clk);
    init_gfx_instr    <= x"0000";
    for i in 5 to 17 loop
      wait until rising_edge(clk);
    end loop;
    init_gfx_instr    <= x"0000";
    init_gfx_instr_wr <= '0';


    --palette
    wait for 1 us;
    wait until rising_edge(clk);

    number <= std_logic_vector(to_unsigned(11825350, 16));
    wait for 3 us;



    report "start";
    --wait until rising_edge(clk);
    --init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    start <= '1';
--              init_gfx_instr_wr <= '0';
    wait until rising_edge(clk);
    start <= '0';


    wait for 20 us;
    dump_frame <= '1';
    wait for 1 us;
    dump_frame <= '0';

    wait for 1 us;
    --res_n <= '1';
    number <= std_logic_vector(to_unsigned(0, 16));
    wait for 3 us;

    wait until rising_edge(clk);

    start <= '1';

    wait until rising_edge(clk);
    start <= '0';

    wait for 20 us;
    dump_frame <= '1';
    wait for 1 us;
    dump_frame <= '0';

    wait for 1 us;
    --DEBUG STOP
    --res_n <= '1';
    number <= std_logic_vector(to_unsigned(12345, 16));
    wait for 3 us;

    wait until rising_edge(clk);

    start <= '1';

    wait until rising_edge(clk);
    start <= '0';

    wait for 20 us;
    dump_frame <= '1';
    wait for 1 us;
    dump_frame <= '0';

    wait for 1 us;
    --res_n <= '1';
    number <= std_logic_vector(to_unsigned(11825350, 16));
    wait for 3 us;

    wait until rising_edge(clk);

    start <= '1';
    wait until rising_edge(clk);
    start <= '0';

    wait for 10 us;
	  init_gfx_instr    <= x"9" & x"070";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";
	 wait for 100 ns;
    init_gfx_instr    <= x"4" & x"0" & x"00";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";
    wait for 100 ns;
    init_gfx_instr    <= x"2" & x"f" & x"0" & "1000";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";
    wait for 100 ns;
    init_gfx_instr    <= x"2" & x"f" & x"0" & "1100";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";
    wait for 100 ns;
    init_gfx_instr    <= x"2" & x"f" & x"0" & "0100";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";
    wait for 100 ns;
    init_gfx_instr    <= x"2" & x"f" & x"0" & "1000";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";

    init_gfx_instr    <= x"5" & "0000" & "0000" & "1100";
    init_gfx_instr_wr <= '1';
    wait until rising_edge(clk);
    --wait until rising_edge(clk);
    init_gfx_instr_wr <= '1';
    init_gfx_instr    <= x"0002";       --x
    --wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '1';
    init_gfx_instr    <= x"0000";       --y
    --wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '1';
    init_gfx_instr    <= x"000c";       --w
    --wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '1';
    init_gfx_instr    <= x"000c";       -- h
    --wait until rising_edge(clk);
    wait until rising_edge(clk);
    init_gfx_instr_wr <= '0';
    init_gfx_instr    <= x"0000";       -- h

    wait for 5 us;
    dump_frame <= '1';
    wait for 1 us;
    dump_frame <= '0';

    wait;
  end process;

  clock : process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process;

  interpreter : block
    signal interpreter_gfx_instr : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
  begin
    interpreter_gfx_instr <= gfx_instr when gfx_instr_wr = '1' else init_gfx_instr;

    gfx_instr_interpreter_inst : entity work.gfx_instr_interpreter
      generic map (
        OUTPUT_DIR => "./",
        BB_ROM     => MEMORY_CONTENTS
        )
      port map (
        clk            => clk,
        gfx_instr      => interpreter_gfx_instr,
        gfx_instr_wr   => gfx_instr_wr or init_gfx_instr_wr,
        gfx_frame_sync => gfx_frame_sync,
        dump_frame     => dump_frame
        );
  end block;

end architecture;

