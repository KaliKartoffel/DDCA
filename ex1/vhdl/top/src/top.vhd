

library ieee;
use ieee.std_logic_1164.all;

-- import all required packages
use work.sync_pkg.all;
use work.audio_cntrl_pkg.all;
use work.gc_cntrl_pkg.all;
use work.vga_gfx_cntrl_pkg.all;
--use work.gc_cntrl.all;



entity top is
	port (
		--50 MHz clock input
		clk : in  std_logic;

		-- push buttons and switches
		keys     : in std_logic_vector(3 downto 0);
		switches : in std_logic_vector(17 downto 0);

		--Seven segment displays
		hex0 : out std_logic_vector(6 downto 0);
		hex1 : out std_logic_vector(6 downto 0);
		hex2 : out std_logic_vector(6 downto 0);
		hex3 : out std_logic_vector(6 downto 0);
		hex4 : out std_logic_vector(6 downto 0);
		hex5 : out std_logic_vector(6 downto 0);
		hex6 : out std_logic_vector(6 downto 0);
		hex7 : out std_logic_vector(6 downto 0);

		-- the LEDs (green and red)
		ledg : out std_logic_vector(8 downto 0);
		ledr : out std_logic_vector(17 downto 0);

		-- UART
		rx : in std_logic;
		tx : out std_logic;

		-- GameCube controller
		gc_data : inout std_logic;
		emulated_gc_data : inout std_logic;

		--interface to SRAM
		sram_dq : inout std_logic_vector(15 downto 0);
		sram_addr : out std_logic_vector(19 downto 0);
		sram_ub_n : out std_logic;
		sram_lb_n : out std_logic;
		sram_we_n : out std_logic;
		sram_ce_n : out std_logic;
		sram_oe_n : out std_logic;

		-- audio interface
		wm8731_xck     : out std_logic;
		wm8731_sdat : inout std_logic;
		wm8731_sclk : inout std_logic;
		wm8731_dacdat  : out std_logic;
		wm8731_daclrck : out std_logic;
		wm8731_bclk    : out std_logic;

		--some auxilary output for performing measurements
		aux : out std_logic_vector(15 downto 0);

		-- interface to ADV7123 and VGA connector
		vga_dac_r : out std_logic_vector(7 downto 0);
		vga_dac_g : out std_logic_vector(7 downto 0);
		vga_dac_b : out std_logic_vector(7 downto 0);
		vga_dac_clk : out std_logic;
		vga_dac_sync_n : out std_logic;
		vga_dac_blank_n : out std_logic;
		vga_hsync : out std_logic;
		vga_vsync : out std_logic
	);
end entity;


architecture arch of top is

	function to_segs(value : in std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		case value is
			when x"0" => return "1000000";
			when x"1" => return "1111001";
			when x"2" => return "0100100";
			when x"3" => return "0110000";
			when x"4" => return "0011001";
			when x"5" => return "0010010";
			when x"6" => return "0000010";
			when x"7" => return "1111000";
			when x"8" => return "0000000";
			when x"9" => return "0010000";
			when x"A" => return "0001000";
			when x"B" => return "0000011";
			when x"C" => return "1000110";
			when x"D" => return "0100001";
			when x"E" => return "0000110";
			when x"F" => return "0001110";
			when others => return "1111111";
		end case;
	end function;


	constant SYNC_STAGES : integer := 2;
	
	-- internal clock and reset signals
	signal audio_clk : std_logic;
	signal display_clk : std_logic;

	signal sw_reset : std_logic;
	signal system_res_n : std_logic;
	signal res_n : std_logic;
	signal audio_res_n : std_logic;
	signal display_res_n : std_logic;

	-- we use these signals instead of the port signals keys and switches
	signal switches_int : std_logic_vector(17 downto 0);
	signal keys_int : std_logic_vector(3 downto 0);
	
	--signal between the tetris_game module and the audio_cntrl
	signal synth_cntrl : synth_cntrl_vec_t(0 to 1);

	-- gfx instruction related signals
	signal gisc : std_logic; --graphics instruction source control
	
	signal gfx_instr : std_logic_vector(15 downto 0);
	signal gfx_instr_wr : std_logic;
	signal gfx_instr_full : std_logic;
	signal gfx_frame_sync : std_logic;
	
	signal game_gfx_instr : std_logic_vector(15 downto 0);
	signal game_gfx_instr_wr : std_logic;
	
	signal dbg_gfx_instr : std_logic_vector(15 downto 0);
	signal dbg_gfx_instr_wr : std_logic;
	
	--signals between the tetris_game module and the gc_cntrl
	signal gcc : gc_cntrl_state_t;
	signal rumble : std_logic;
	
	component PLL
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC ;
		c1		: OUT STD_LOGIC 
	);
	end component;
	
begin
	--TODO: add an appropriate PLL instance
	PLL_inst : PLL
	port map (
		inclk0 => clk,
		c0 => audio_clk,
		c1 => display_clk
	);
	
	
	system_res_n <= keys_int(0) and sw_reset;

	reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => res_n
	);

	audio_reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => audio_clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => audio_res_n
	);

	display_reset_sync : sync
	generic map (
		SYNC_STAGES => SYNC_STAGES,
		RESET_VALUE => '0'
	)
	port map (
		clk => display_clk,
		res_n => '1',
		data_in => system_res_n,
		data_out => display_res_n
	);

	audio_cntrl_2s_inst : audio_cntrl_2s
	port map (
		clk            => audio_clk,
		res_n          => audio_res_n,
		wm8731_sdat    => wm8731_sdat,
		wm8731_sclk    => wm8731_sclk,
		wm8731_xck     => wm8731_xck,
		wm8731_dacdat  => wm8731_dacdat,
		wm8731_daclrck => wm8731_daclrck,
		wm8731_bclk    => wm8731_bclk,
		synth_cntrl    => synth_cntrl
	);

	vga_gfx_cntrl_inst : precompiled_vga_gfx_cntrl
	port map (
		clk             => clk,
		res_n           => res_n,
		display_clk     => display_clk,
		display_res_n   => display_res_n,
		gfx_instr       => gfx_instr,
		gfx_instr_wr    => gfx_instr_wr,
		gfx_instr_full  => gfx_instr_full,
		gfx_frame_sync  => gfx_frame_sync,
		sram_dq         => sram_dq,
		sram_addr       => sram_addr,
		sram_ub_n       => sram_ub_n,
		sram_lb_n       => sram_lb_n,
		sram_we_n       => sram_we_n,
		sram_ce_n       => sram_ce_n,
		sram_oe_n       => sram_oe_n,
		vga_hsync       => vga_hsync,
		vga_vsync       => vga_vsync,
		vga_dac_clk     => vga_dac_clk,
		vga_dac_blank_n => vga_dac_blank_n,
		vga_dac_sync_n  => vga_dac_sync_n,
		vga_dac_r       => vga_dac_r,
		vga_dac_g       => vga_dac_g,
		vga_dac_b       => vga_dac_b
	);

	gc_cntrl_inst : gc_cntrl
	generic map	(
			SYNC_STAGES 		=> SYNC_STAGES,
			CLK_FREQ 			=> 50_000_000, --unit Hz
			REFRESH_TIMEOUT 	=> 300_000
	)
	port map (
		clk         => clk,
		res_n       => res_n,
		data        => gc_data,
		cntrl_state => gcc,
		rumble      => rumble
	);
	
	-- instantiates tetris_game and uses ex1 as the architecture
	tetris_game_inst : entity work.tetris_game(ex1)
	port map (
		clk             => clk,
		res_n           => res_n,
		gfx_instr       => game_gfx_instr,
		gfx_instr_wr    => game_gfx_instr_wr,
		gfx_instr_full  => gfx_instr_full,
		gfx_frame_sync  => gfx_frame_sync,
		synth_cntrl     => synth_cntrl,
		gc_cntrl_state  => gcc,
		gc_cntrl_rumble => rumble
	);

	gfx_mux : process(all)
	begin
		if (gisc = '1') then
			gfx_instr <= dbg_gfx_instr;
			gfx_instr_wr <= dbg_gfx_instr_wr;
		else
			gfx_instr <= game_gfx_instr;
			gfx_instr_wr <= game_gfx_instr_wr;
		end if;
	end process;

	hex0 <= to_segs(gcc.c_y(3 downto 0));
	hex1 <= to_segs(gcc.c_y(7 downto 4));
	hex2 <= to_segs(gcc.c_x(3 downto 0));
	hex3 <= to_segs(gcc.c_x(7 downto 4));
	hex4 <= to_segs(gcc.joy_y(3 downto 0));
	hex5 <= to_segs(gcc.joy_y(7 downto 4));
	hex6 <= to_segs(gcc.joy_x(3 downto 0));
	hex7 <= to_segs(gcc.joy_x(7 downto 4));

	ledg(0) <= gcc.btn_a;
	ledg(1) <= gcc.btn_b;
	ledg(2) <= gcc.btn_x;
	ledg(3) <= gcc.btn_y;
	ledg(4) <= gcc.btn_up;
	ledg(5) <= gcc.btn_down;
	ledg(6) <= gcc.btn_left;
	ledg(7) <= gcc.btn_right;
	ledg(8) <= gisc;

	ledr <= switches_int;

	aux <= (others=>'0');
--------------------------------------------------------------------------------
--       ██████╗ ██████╗  ██████╗      ██████╗ ██████╗ ██████╗ ███████╗       --
--       ██╔══██╗██╔══██╗██╔════╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝       --
--       ██║  ██║██████╔╝██║  ███╗    ██║     ██║   ██║██████╔╝█████╗         --
--       ██║  ██║██╔══██╗██║   ██║    ██║     ██║   ██║██╔══██╗██╔══╝         --
--       ██████╔╝██████╔╝╚██████╔╝    ╚██████╗╚██████╔╝██║  ██║███████╗       --
--       ╚═════╝ ╚═════╝  ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝       --
--------------------------------------------------------------------------------
	dbg: block
		signal dbg_ledr : std_logic_vector(ledr'range);
		signal dbg_ledg : std_logic_vector(ledg'range);

		signal dbg_hex0 : std_logic_vector(6 downto 0);
		signal dbg_hex1 : std_logic_vector(6 downto 0);
		signal dbg_hex2 : std_logic_vector(6 downto 0);
		signal dbg_hex3 : std_logic_vector(6 downto 0);
		signal dbg_hex4 : std_logic_vector(6 downto 0);
		signal dbg_hex5 : std_logic_vector(6 downto 0);
		signal dbg_hex6 : std_logic_vector(6 downto 0);
		signal dbg_hex7 : std_logic_vector(6 downto 0);
	begin
		
		dbg_ledr <= ledr;
		dbg_ledg <= ledg;
		
		dbg_hex0 <= hex0;
		dbg_hex1 <= hex1;
		dbg_hex2 <= hex2;
		dbg_hex3 <= hex3;
		dbg_hex4 <= hex4;
		dbg_hex5 <= hex5;
		dbg_hex6 <= hex6;
		dbg_hex7 <= hex7;
		
		dbg_port_inst : entity work.dbg_port
		port map (
			clk                 => clk,
			res_n               => keys(0),
			rx                  => rx,
			tx                  => tx,
			hw_switches         => switches,
			hw_keys             => keys,
			switches            => switches_int,
			keys                => keys_int,
			ledr                => dbg_ledr,
			ledg                => dbg_ledg,
			emulated_gc_data => emulated_gc_data,
			gfx_instr => dbg_gfx_instr,
			gfx_instr_wr => dbg_gfx_instr_wr,
			gfx_instr_full => gfx_instr_full,
			hex0 => dbg_hex0,
			hex1 => dbg_hex1,
			hex2 => dbg_hex2,
			hex3 => dbg_hex3,
			hex4 => dbg_hex4,
			hex5 => dbg_hex5,
			hex6 => dbg_hex6,
			hex7 => dbg_hex7,
			gisc => gisc,
			sw_reset => sw_reset
		);
	end block;
end architecture;
