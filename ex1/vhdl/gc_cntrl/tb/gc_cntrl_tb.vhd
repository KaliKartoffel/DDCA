library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;                 -- for random number generation

use work.sync_pkg.all;
--use work.audio_cntrl_pkg.all;
use work.gc_cntrl_pkg.all;
--use work.vga_gfx_cntrl_pkg.all;

entity gc_cntrl_tb is
end entity;

architecture tb of gc_cntrl_tb is

  signal clk                            : std_logic        := '0';
  signal rumble                         : std_logic        := '0';
  signal res_n                          : std_logic        := '0';
  signal data                           : std_logic        := '0';
  signal cntrl_state, cntrl_state_right : gc_cntrl_state_t := gc_buttons_reset_value;

  signal poll_seq_right : std_logic_vector(24 downto 0) := (others => '0');
  signal data_to_send   : std_logic_vector(63 downto 0) := (others => '0');


begin

  rumble         <= 'H';
  data           <= 'H';
  poll_seq_right <= "0H000000000000HH0000000" & rumble & "H";

  random_vector_generator_demo : process
    variable seed1, seed2            : integer := 11825350;  --use your matriculation number
    impure function rand_slv(slv_len : integer) return std_logic_vector is
      variable r   : real;
      variable slv : std_logic_vector(slv_len - 1 downto 0);
    begin
      for i in 0 to slv_len-1 loop
        uniform(seed1, seed2, r);
        slv(i)                 := 'H';
        if r > 0.5 then slv(i) := '0'; end if;
      end loop;
      return slv;
    end function;


  begin
    --report "some random vectors:";
    --report to_hstring(rand_slv(64));
    --report to_hstring(rand_slv(64));
    --report to_hstring(rand_slv(64));
    --report to_hstring(rand_slv(64));

    --report "some random gc_cntrl_state_t values:";
    --report to_string(to_gc_cntrl_state(rand_slv(64)));
    --report to_string(to_gc_cntrl_state(rand_slv(64)));
    --report to_string(to_gc_cntrl_state(rand_slv(64)));
    --report to_string(to_gc_cntrl_state(rand_slv(64)));


    wait until res_n = '1';

    for cntrl_statement in 7 downto 0 loop
      data_to_send <= rand_slv(64);
      data         <= 'Z';

      for i in 24 downto 0 loop
        report "waiting for 0";
        wait until data = '0';
        report "found 0";

        wait for 2 us;                  --check middle, low is logic 0, high 1

        if poll_seq_right(i) /= data then
          report "polling command wrong" severity error;
        else
          report "polling command right";
        end if;
      end loop;
      wait for 2 us;
      report "poll_cmd read";

      wait for 1 us;
      report "writing data";
      --wait for 0.5 us;
      for i in 63 downto 0 loop
        data <= '0';  --starting with low by protokoll definition


        if data_to_send(i) = '0' then
          wait for 3 us;
          data <= 'H';
          wait for 1 us;
        else
          wait for 1 us;
          data <= 'H';
          wait for 3 us;
        end if;
      end loop;


      cntrl_state_right <= to_gc_cntrl_state(data_to_send);
      --for k in 63 downto 0 loop
      --if 
      --end loop;
      -- stop
      data              <= '0';
      wait for 1 us;
      data              <= 'H';
      wait for 3 us;
      data              <= 'Z';         --done
      --wait for 1 ns;



      if cntrl_state_right /= cntrl_state then
        report "expected state " & to_string(cntrl_state_right) & " is unequal to actual state: " & to_string(cntrl_state) severity error;
      else
        report "state correct";
      end if;

    end loop;
    wait;
  end process;

  -- wait for polling (until refresh_timeout is passed)
  -- send in data in 64 bit form
  -- read cntrl_state from the component

  reset : process
  begin
    res_n <= '0';
    wait for 10 us;                     --TODO: idk
    res_n <= '1';
    wait;
  end process;

  clock : process
  begin
    clk <= '1';
    wait for 10 ns;
    clk <= '0';
    wait for 10 ns;
  end process;




  uut : gc_cntrl
    generic map(
      SYNC_STAGES     => 2,
      CLK_FREQ        => 50_000_000,
      REFRESH_TIMEOUT => 3000
      )
    port map (
      clk         => clk,
      res_n       => res_n,
      data        => data,
      cntrl_state => cntrl_state,
      rumble      => rumble
      );

end architecture;
