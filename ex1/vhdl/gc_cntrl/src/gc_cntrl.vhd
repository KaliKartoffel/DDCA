-- put your implementation the gc_cntrl here 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.gc_cntrl_pkg.all;
use work.sync_pkg.all;

entity gc_cntrl is
  generic (
    SYNC_STAGES     : integer range 2 to integer'high := 2;
    CLK_FREQ        : integer                         := 50_000_000;  --unit Hz
    REFRESH_TIMEOUT : integer                         := 300_000
    );
  port (
    clk         : in    std_logic        := '0';
    res_n       : in    std_logic        := '0';
    data        : inout std_logic        := '0';
    rumble      : in    std_logic        := '0';
    cntrl_state : out   gc_cntrl_state_t := GC_BUTTONS_RESET_VALUE
    );

end entity;

architecture arch of gc_cntrl is

  type t_State is (WAIT_TIMEOUT, POLL, SEND_LOW, SEND_HIGH,
                   WAIT_SAMPLE, WAIT_FALLING_EDGE_DATA, SAMPLE_DATA);
  signal state : t_State := WAIT_TIMEOUT;

  signal data_synced     : std_logic                     := '0';
  signal data_old        : std_logic                     := '0';
  signal clk_cnt         : integer                       := 0;
  signal data_synced_old : std_logic                     := '0';
  signal poll_cmd        : std_logic_vector(24 downto 0) := (others => '0');
  signal data_cnt        : integer                       := 0;
  signal shiftreg_btns   : std_logic_vector(63 downto 0) := (others => '0');

  signal next_state           : t_state                       := WAIT_TIMEOUT;
  signal next_data_synced     : std_logic                     := '0';
  signal next_data_old        : std_logic                     := '0';
  signal next_clk_cnt         : integer                       := 0;
  signal next_data_synced_old : std_logic                     := '0';
  signal next_poll_cmd        : std_logic_vector(24 downto 0) := (others => '0');
  signal next_data_cnt        : integer                       := 0;
  signal next_shiftreg_btns   : std_logic_vector(63 downto 0) := (others => '0');
  signal next_cntrl_state     : gc_cntrl_state_t              := GC_BUTTONS_RESET_VALUE;
  signal ONE_US               : integer                       := 0;

  signal sync : std_logic_vector(1 to SYNC_STAGES);
begin
  --sync_inst : sync
  --generic map (
  --    SYNC_STAGES => SYNC_STAGES,
  --    RESET_VALUE => '0' -- low active
  --)
  --port map(
  --clk => clk,
  --res_n => res_n,
  --data_in => data,
  --data_out => data_synced
  --);
  sync_proc : process(clk, res_n)
  begin
    if res_n = '0' then
      sync <= (others => '0');
    elsif rising_edge(clk) then
      sync(1) <= data;                  -- get new data
      -- forward data to next synchronizer stage
      for i in 2 to SYNC_STAGES loop
        sync(i) <= sync(i - 1);
      end loop;
    end if;
  end process sync_proc;
  data_synced <= sync(SYNC_STAGES);
  --constant:
  ONE_US      <= CLK_FREQ / 1_000_000;

  reset : process(clk, res_n) is
  begin
    if res_n = '0' then
      -- Reset values
      state           <= WAIT_TIMEOUT;
      cntrl_state     <= GC_BUTTONS_RESET_VALUE;
      clk_cnt         <= 0;
      data_synced_old <= '0';
      poll_cmd        <= (others => '0');
      data_cnt        <= 0;
      shiftreg_btns   <= (others => '0');

    elsif rising_edge(clk) then
      state           <= next_state;
      clk_cnt         <= next_clk_cnt;
      data_cnt        <= next_data_cnt;
      poll_cmd        <= next_poll_cmd;
      shiftreg_btns   <= next_shiftreg_btns;
      data_synced_old <= data_synced;
      cntrl_state     <= next_cntrl_state;
    end if;
  end process;

  main : process(all)
  begin
    next_state         <= state;
    next_cntrl_state   <= cntrl_state;
    next_clk_cnt       <= clk_cnt;
    next_poll_cmd      <= poll_cmd;
    next_data_cnt      <= data_cnt;
    next_shiftreg_btns <= shiftreg_btns;

    case state is
      when WAIT_TIMEOUT =>
        data <= 'Z';
        if (clk_cnt = REFRESH_TIMEOUT) then
          next_clk_cnt  <= 0;
          next_data_cnt <= 0;
          next_poll_cmd <= x"40030" & "000" & rumble & "1";
          next_state    <= POLL;
        else
          next_clk_cnt     <= clk_cnt + 1;
          next_state       <= WAIT_TIMEOUT;
          next_cntrl_state <= to_gc_cntrl_state(shiftreg_btns);
        end if;

      when POLL =>
        data <= 'Z';
        if (data_cnt < 25) then
          next_state <= SEND_LOW;
        else
          next_data_cnt <= 0;
          next_state    <= WAIT_FALLING_EDGE_DATA;
        end if;

      when SEND_LOW =>
        data <= '0';
        if ((poll_cmd(24) = '0' and clk_cnt = 3*ONE_US) or ((poll_cmd(24) = '1' or poll_cmd(24) = 'H') and clk_cnt = ONE_US)) then
          next_clk_cnt <= 0;
          next_state   <= SEND_HIGH;
        else
          next_clk_cnt <= clk_cnt + 1;
          next_state   <= SEND_LOW;
        end if;

      when SEND_HIGH =>
        data <= 'Z';
        if ((poll_cmd(24) = '0' and clk_cnt = ONE_US) or ((poll_cmd(24) = '1' or poll_cmd(24) = 'H') and clk_cnt = 3*ONE_US)) then
          next_poll_cmd <= (poll_cmd(23 downto 0) & poll_cmd(24));
          next_clk_cnt  <= 0;
          next_data_cnt <= data_cnt + 1;
          next_state    <= POLL;
        else
          next_clk_cnt <= clk_cnt + 1;
          next_state   <= SEND_HIGH;
        end if;

      when WAIT_FALLING_EDGE_DATA =>
        data <= 'Z';
        if (data_synced = '0' and (data_synced_old = '1' or data_synced_old = 'H')) then
          next_state <= WAIT_SAMPLE;
        end if;

      when WAIT_SAMPLE =>
        data <= 'Z';
        if (clk_cnt = (3*ONE_US)/2) then
          next_clk_cnt <= 0;
          next_state   <= SAMPLE_DATA;
        else
          next_clk_cnt <= clk_cnt + 1;
          next_state   <= WAIT_SAMPLE;
        end if;

      when SAMPLE_DATA =>
        data               <= 'Z';
        next_shiftreg_btns <= shiftreg_btns(62 downto 0) & data_synced;  --tutor
        if (data_cnt = 63) then
          next_state <= WAIT_TIMEOUT;
        else
          next_data_cnt <= data_cnt + 1;
          next_state    <= WAIT_FALLING_EDGE_DATA;
        end if;

    end case;
  end process;



end architecture;
