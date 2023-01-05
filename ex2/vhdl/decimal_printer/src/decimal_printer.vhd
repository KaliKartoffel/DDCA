

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

use work.vga_gfx_cntrl_pkg.all;
use work.math_pkg.all;

entity decimal_printer is
  port (
    clk   : in std_logic;
    res_n : in std_logic;

    gfx_instr      : out std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
    gfx_instr_wr   : out std_logic;
    gfx_instr_full : in  std_logic;

    start  : in  std_logic;
    busy   : out std_logic;
    x      : in  std_logic_vector(15 downto 0);
    y      : in  std_logic_vector(15 downto 0);
    number : in  std_logic_vector(15 downto 0)
    );
end entity;


architecture arch of decimal_printer is
  constant TWELVE : std_logic_vector(3 downto 0) := "1100";

  type t_State is (WAIT_START, START_GFX_INSTR, SEND_X, SEND_Y, SEND_BLIT_INIT, SEND_BLIT_DATA);
  signal state                                     : t_State := WAIT_START;
  signal next_state                                : t_State := WAIT_START;
  signal counter                                   : integer := 0;
  signal next_counter                              : integer := 0;
  signal number_synced, next_number_synced         : integer := 0;
  signal blit_state, next_blit_state               : integer := 0;
  signal leading_zero_flag, next_leading_zero_flag : boolean := true;
  signal digit_counter, next_digit_counter         : integer := 4;

  function calculate_exponent(exponent : integer) return integer is
  begin
    if exponent = 4 then
      return 10_000;
    elsif exponent = 3 then
      return 1_000;
    elsif exponent = 2 then
      return 100;
    elsif exponent = 1 then
      return 10;
    elsif exponent = 0 then
      return 1;
    else
      return -1;
    end if;
  end function;

  impure function create_gfx_instr(counter : integer; leading_zero_flag_temp : boolean) return std_logic_vector is
    variable ret_val : std_logic_vector(15 downto 0) := (others => '0');
  begin
    if (counter > 0) or (counter = 0 and leading_zero_flag_temp = false) then
      ret_val := std_logic_vector(to_unsigned(counter, 4)) & "0000" & TWELVE & TWELVE;
    else
      -- empty char, 
      ret_val := "1000" & "0011" & TWELVE & TWELVE;
    --ret_val := "0000000000000000";
    end if;
    return ret_val;
  end function;
begin

  reset : process(clk, res_n) is
  begin
    if res_n = '0' then
      -- Reset values
      state             <= WAIT_START;
      counter           <= 0;
      number_synced     <= 0;
      leading_zero_flag <= true;
      blit_state        <= 0;
      digit_counter     <= 4;

    elsif rising_edge(clk) then
      state             <= next_state;
      counter           <= next_counter;
      number_synced     <= next_number_synced;
      leading_zero_flag <= next_leading_zero_flag;
      blit_state        <= next_blit_state;
      digit_counter     <= next_digit_counter;

    end if;
  end process;

  main : process(clk, leading_zero_flag, x, y, blit_state, number_synced, counter, start, number, gfx_instr_full, digit_counter, next_leading_zero_flag, state)
  begin
    next_state             <= state;
    next_counter           <= counter;
    next_number_synced     <= number_synced;
    next_digit_counter     <= digit_counter;
    next_blit_state        <= blit_state;
    gfx_instr              <= (others => '0');
    busy                   <= '1';
    gfx_instr_wr           <= '0';
    next_leading_zero_flag <= leading_zero_flag;

    case state is
      when WAIT_START =>
        next_leading_zero_flag <= true;
        next_digit_counter     <= 4;

        if (start = '1' or start = 'H') then
          next_state         <= START_GFX_INSTR;
          next_number_synced <= to_integer(unsigned(number));
        else
          busy <= '0';
        end if;

      when START_GFX_INSTR =>
        if gfx_instr_full = '0' then
          next_state   <= SEND_X;
          gfx_instr_wr <= '1';
          gfx_instr    <= gfx_instr_move_gp(false);  --TODO: IDK
        else

        end if;

      when SEND_X =>
        if gfx_instr_full = '0' then
          next_state   <= SEND_Y;
          gfx_instr_wr <= '1';
          gfx_instr    <= x;
        else

        end if;

      when SEND_Y =>
        if gfx_instr_full = '0' then
          next_state   <= SEND_BLIT_INIT;
          gfx_instr_wr <= '1';
          gfx_instr    <= y;
        else

        end if;

      when SEND_BLIT_INIT =>
        if gfx_instr_full = '0' then
                                        --init 
                                        --report "digit counter: " & to_string(digit_counter);
          if digit_counter = -1 then
            next_leading_zero_flag <= true;
            next_digit_counter     <= 4;
            next_state             <= WAIT_START;
            next_counter           <= 0;
            next_number_synced     <= 0;

          else
            gfx_instr_wr <= '1';
            gfx_instr    <= gfx_instr_compact_bit_blit(true, false, false, true, false);
            next_counter <= 0;
            next_state   <= SEND_BLIT_DATA;
                                        --next_leading_zero_flag <= true;
          end if;
        end if;


      when SEND_BLIT_DATA =>
        if gfx_instr_full = '0' then
          if number_synced >= calculate_exponent(digit_counter) then
            next_number_synced     <= number_synced - calculate_exponent(digit_counter);
            next_counter           <= counter + 1;
            next_leading_zero_flag <= false;
          else
            gfx_instr_wr <= '1';
                                        --report "digit counter: " & to_string(digit_counter);
            if digit_counter = 0 then
                                        --report "writing 0" & "00000000" & TWELVE & TWELVE;
              gfx_instr <= create_gfx_instr(counter, false);
            else
              gfx_instr <= create_gfx_instr(counter, leading_zero_flag);
            end if;
            next_state         <= SEND_BLIT_INIT;
            next_digit_counter <= digit_counter - 1;
          end if;
        end if;



    end case;
  end process;
--Task 3: add your implementation here
--busy <= '0'; -- set the output to a defined state
end architecture;
