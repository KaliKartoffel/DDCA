library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.vga_gfx_cntrl_pkg.all;
use work.math_pkg.all;
use work.gc_cntrl_pkg.all;
use work.audio_cntrl_pkg.all;
use work.ram_pkg.all;
use work.tetris_util_pkg.all;
use work.decimal_printer_pkg.all;

architecture ex2 of tetris_game is

	type gfx_instr_array_t is array(natural range<>) of std_logic_vector;
	constant DISPLAY_WIDTH : integer := 320;
	constant DISPLAY_HEIGHT : integer := 240;
	constant BLOCK_SIZE : integer := 12; 
	constant BLOCK_SIZE_SLV : std_logic_vector(3 downto 0) := std_logic_vector(to_unsigned(BLOCK_SIZE, log2c(BLOCK_SIZE)));
	constant BLOCKS_X : integer := 10;
	constant BLOCKS_Y : integer := 20;

	--decimal printer signals
	signal dp_gfx_instr : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
	signal dp_gfx_instr_wr : std_logic;
	signal dp_start : std_logic;
	signal dp_busy : std_logic;

	signal gfx_initializer_start : std_logic;
	signal gfx_initializer_busy : std_logic;
	signal gfx_initializer_instr : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
	signal gfx_initializer_instr_wr : std_logic;
	
	signal td_start : std_logic;
	signal td_x : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0); --signed
	signal td_y : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0); --signed
	signal td_busy : std_logic;
	signal td_gfx_instr : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
	signal td_gfx_instr_wr : std_logic;

	signal tc_start : std_logic;
	signal tc_busy : std_logic;
	signal tc_collision_detected :  std_logic;
	signal tc_block_map_x : std_logic_vector(log2c(BLOCKS_X)-1 downto 0);
	signal tc_block_map_y : std_logic_vector(log2c(BLOCKS_Y)-1 downto 0);
	signal tc_block_map_rd : std_logic;
	signal tc_block_map_solid : std_logic;

	signal block_map_rd_x : std_logic_vector(log2c(BLOCKS_X)-1 downto 0);
	signal block_map_rd_y : std_logic_vector(log2c(BLOCKS_Y)-1 downto 0);
	signal block_map_rd : std_logic;
	signal block_map_rd_data : std_logic_vector(0 to 3);
	
	signal block_map_wr_x : std_logic_vector(log2c(BLOCKS_X)-1 downto 0);
	signal block_map_wr_y : std_logic_vector(log2c(BLOCKS_Y)-1 downto 0);
	signal block_map_wr : std_logic;
	signal block_map_wr_data : std_logic_vector(3 downto 0);

	signal prng_value : std_logic_vector(2 downto 0);
	signal prng_en : std_logic;
	
	signal debug_int,debug_int_next : integer := 0;
	signal debug_int_converted : std_logic_vector(15 downto 0);
	
	signal draw_blocks_x, draw_blocks_y, draw_blocks_x_next, draw_blocks_y_next : integer := 0;
	
	type int_array is array(0 to 7) of integer;
	
	signal block_map_write_counter_main, block_map_write_counter_main_next : integer := 0;
	signal block_map_write_array, block_map_write_array_next : int_array;
	
	signal fall_down_count_next, fall_down_count, fall_down_flag, fall_down_flag_next : integer := 0;
	
	signal check_line_x, check_line_y, check_line_x_next, check_line_y_next : integer := 0;
	type int_array_4 is array(0 to 3) of integer;
	signal empty_lines, empty_lines_next : int_array_4 := (others => -1);
	
	signal copy_lines_down_save_y, copy_lines_down_save_y_next : integer := 0;
	signal copy_lines_down_block_info, copy_lines_down_block_info_next : std_logic_vector(3 downto 0);
	signal rows_removed, rows_removed_next : integer := 0;
	signal score, score_next : integer := 0;
	signal row_counter_temp, row_counter_temp_next : integer;

	signal dp_x, dp_x_next, dp_y, dp_y_next : std_logic_vector(15 downto 0);

	signal fall_down_speed, fall_down_speed_next : integer;

	signal counter, counter_next : integer := 0;

	signal tetromino_to_draw, tetromino_to_draw_next : std_logic_vector(2 downto 0);
	signal tetromino_to_draw_rot, tetromino_to_draw_rot_next : rotation_t;

	signal game_over, game_over_next : integer := 0;

	type fsm_state_t is (
		RESET, WAIT_INIT, 
		DO_FRAME_SYNC, WAIT_FRAME_SYNC,
		CLEAR_SCREEN,
		TEST_WRITE_BLOCK_MAP,
		PROCESS_INPUT,
		TEST_MOVEMENT, WAIT_CHECK_COLLISION,
		DRAW_TETROMINO, WAIT_DRAW_TETROMINO,
		DRAW_COLLISION_BORDER, 
		DRAW_COLLISION_BORDER_1,
		DRAW_COLLISION_BORDER_2,
		DRAW_COLLISION_BORDER_3, 
		DRAW_COLLISION_BORDER_4,
		DRAW_COLLISION_BORDER_5, 
		DRAW_COLLISION_BORDER_6,
		DRAW_COLLISION_BORDER_7,
		DRAW_COLLISION_BORDER_8, 
		DRAW_COLLISION_BORDER_9,
		DRAW_COLLISION_BORDER_10,
		DRAW_COLLISION_BORDER_11,
		DRAW_COLLISION_BORDER_12,
		DRAW_COLLISION_BORDER_13,
		DRAW_COLLISION_BORDER_14,
		DRAW_COLLISION_BORDER_15,
		DRAW_COLLISION_BORDER_16,
		DRAW_COLLISION_BORDER_17,
		CLEAR_BLOCK_MAP_INIT, CLEAR_BLOCK_MAP_WRITE,
		START_DECIMAL_PRINTER, WAIT_DECIMAL_PRINTER,
		DRAW_BLOCKS_SET_GP_POINTER, SEND_X, SEND_Y, DRAW_BLOCKS_MAIN, SEND_OPERAND_X,
		WRITE_BLOCK_MAP_MAIN, FALL_DOWN,
		CHECK_IF_LINE_FULL, DELL_LINE, COPY_LINES_DOWN,
		CHECK_IF_LINE_FULL_PRE,
		COPY_LINES_DOWN_WAIT,
		DRAW_GUI,
		DRAW_GUI_1,
		DRAW_GUI_2,
		DRAW_GUI_3,
		DRAW_GUI_4,
		DRAW_GUI_5,
		DRAW_GUI_6,
		DRAW_GUI_7,
		DRAW_GUI_8,
		DRAW_GUI_9,
		DRAW_GUI_10,
		DRAW_GUI_11,
		DRAW_GUI_12,
		DRAW_GUI_13,
		DRAW_GUI_14,
		DRAW_GUI_15,
		DRAW_GUI_16,
		DRAW_GUI_17,
		DRAW_GUI_18,
		DRAW_GUI_19,
		DRAW_GUI_20,
		DRAW_GUI_21,
		DRAW_GUI_22,
		DRAW_GUI_23,
		DRAW_GUI_24,
		DRAW_GUI_25,
		DRAW_GUI_26,
		DRAW_GUI_27,
		DRAW_GUI_28,
		DRAW_GUI_29,
		DRAW_GUI_30,
		DRAW_GUI_31,
		DRAW_GUI_32,
		DRAW_GUI_33,
		DRAW_GUI_34,
		DRAW_GUI_35,
		DRAW_GUI_36,
		DRAW_GUI_37,
		DRAW_GUI_38,
		DRAW_GUI_39,
		DRAW_GUI_40,
		DRAW_TETROMINO_2, WAIT_DRAW_TETROMINO_2,
		START_DECIMAL_PRINTER_2, WAIT_DECIMAL_PRINTER_2,
		DRAW_20_WALLS_INSTR, DRAW_20_WALLS_INSTR_2, DRAW_20_WALLS_DATA, DRAW_20_WALLS_DATA_2
	);

	type fsm_state_t_sound is (
		PLAY_GAME_OVER,
		PLAY_ROW,
		WAIT_ON_FSM
	);

	signal state_sound, state_sound_next : fsm_state_t_sound := WAIT_ON_FSM;
	signal counter_sound, counter_sound_next : integer := 0;
	signal row_diff, row_diff_next : integer := 0;

	type state_t is record
		fsm_state : fsm_state_t;
		last_controller_state : gc_cntrl_state_t;
		cur_tetromino_x : std_logic_vector(log2c(BLOCKS_X) downto 0); --signed
		cur_tetromino_y : std_logic_vector(log2c(BLOCKS_Y) downto 0); --signed
		cur_tetromino : tetromino_t;
		cur_rotation : rotation_t;
		
		dest_tetromino_x : std_logic_vector(log2c(BLOCKS_X) downto 0); --signed
		dest_tetromino_y : std_logic_vector(log2c(BLOCKS_Y) downto 0); --signed
		dest_tetromino : tetromino_t;
		dest_rotation : rotation_t;
		
		next_tetromino : tetromino_t;

		row_counter : std_logic_vector(log2c(BLOCKS_Y)-1 downto 0);
		column_counter : std_logic_vector(log2c(BLOCKS_X)-1 downto 0);
	end record;
	
	signal state, state_nxt : state_t;
	
	constant COLLISION_BORDER : gfx_instr_array_t(0 to 17)(GFX_INSTR_WIDTH-1 downto 0) := (
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned(3*BLOCK_SIZE),
		gfx_instr_unsigned(0),
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned(3*BLOCK_SIZE+BLOCK_SIZE*(BLOCKS_X+1)),
		gfx_instr_unsigned(0),
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned(0),
		gfx_instr_unsigned(9*12),
		gfx_instr_draw_line(color=>x"f", movx=>true, movy=>true, relative=>True),
		gfx_instr_unsigned(2*BLOCK_SIZE-1),
		gfx_instr_unsigned(0),
		gfx_instr_draw_line(color=>x"f", movx=>true, movy=>true, relative=>True),
		gfx_instr_unsigned(0),
		gfx_instr_unsigned(BLOCK_SIZE-1),
		gfx_instr_draw_line(color=>x"f", movx=>true, movy=>true, relative=>True),
		gfx_instr_signed(-(2*BLOCK_SIZE-1)),
		gfx_instr_unsigned(0)
	);

	constant GUI : gfx_instr_array_t(0 to 40)(GFX_INSTR_WIDTH-1 downto 0) := (
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned((BLOCKS_X+6)*BLOCK_SIZE),
		gfx_instr_unsigned(1*BLOCK_SIZE),
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(8, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(2, 4)) & std_logic_vector(to_unsigned(1, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(4, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(7, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(4, 4)) & std_logic_vector(to_unsigned(1, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(6, 4)) & std_logic_vector(to_unsigned(3, 4)) & "1100" & "1100",
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned((BLOCKS_X+6)*BLOCK_SIZE),
		gfx_instr_unsigned(4*BLOCK_SIZE),
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(7, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(4, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(2, 4)) & std_logic_vector(to_unsigned(3, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(8, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(6, 4)) & std_logic_vector(to_unsigned(3, 4)) & "1100" & "1100",
		gfx_instr_move_gp(relative=>false),
		gfx_instr_unsigned((BLOCKS_X+6)*BLOCK_SIZE),
		gfx_instr_unsigned(9*BLOCK_SIZE),
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(3, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(4, 4)) & std_logic_vector(to_unsigned(1, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(3, 4)) & std_logic_vector(to_unsigned(3, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(9, 4)) & std_logic_vector(to_unsigned(2, 4)) & "1100" & "1100",
		gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>True, movy=>False),
		std_logic_vector(to_unsigned(6, 4)) & std_logic_vector(to_unsigned(3, 4)) & "1100" & "1100"
	);
	
begin

	sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			state <= (
				fsm_state => RESET,
				last_controller_state => GC_BUTTONS_RESET_VALUE,
				cur_tetromino => TET_Z,
				next_tetromino => TET_I,
				others => (others=>'0')
			);
		elsif (rising_edge(clk)) then
			draw_blocks_x <= draw_blocks_x_next;
			draw_blocks_y <= draw_blocks_y_next;
			state <= state_nxt;
			debug_int <= debug_int_next;
			debug_int_converted <= std_logic_vector(to_unsigned(debug_int_next, 16));
			block_map_write_counter_main <= block_map_write_counter_main_next;
			block_map_write_array <= block_map_write_array_next;
			fall_down_count <= fall_down_count_next;
			check_line_x <= check_line_x_next;
			check_line_y <= check_line_y_next;
			empty_lines <= empty_lines_next;
			copy_lines_down_save_y <= copy_lines_down_save_y_next;
			copy_lines_down_block_info <= copy_lines_down_block_info_next;
			rows_removed <= rows_removed_next;
			score <= score_next;
			row_counter_temp <= row_counter_temp_next;
			dp_x <= dp_x_next;
			dp_y <= dp_y_next;
			fall_down_speed <= fall_down_speed_next;
			counter <= counter_next;
			tetromino_to_draw <= tetromino_to_draw_next;
			tetromino_to_draw_rot <= tetromino_to_draw_rot_next;
			game_over <= game_over_next;
			state_sound <= state_sound_next;
			row_diff <= row_diff_next;
			counter_sound <= counter_sound_next;
			fall_down_flag <= fall_down_flag_next;
		end if;
	end process;

	next_state : process(all)
		variable block_map_write_counter : integer := 0;
		
		procedure write_instr(instr : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0); next_state : fsm_state_t) is
		begin
			if (gfx_instr_full = '0') then
				gfx_instr_wr <= '1';
				gfx_instr <= instr;
				state_nxt.fsm_state <= next_state;
			end if;
		end procedure;
	
	begin
		state_nxt <= state;
		draw_blocks_x_next <= draw_blocks_x;
		draw_blocks_y_next <= draw_blocks_y;
		
		prng_en <= '0';
		dp_start <= '0'; -- decimal printer 
		tc_start <= '0'; -- tetromino collider
		gfx_initializer_start <= '0';

		gfx_instr_wr <= '0';
		gfx_instr <= (others=>'0');

		--tetromino drawer
		td_start <= '0';
		td_x <= (others=>'0');
		td_y <= (others=>'0');
		
		--block map stuff
		block_map_rd_x <= (others=>'0');
		block_map_rd_y <= (others=>'0');
		block_map_rd <= '0';
		block_map_wr <= '0';
		block_map_wr_x <= (others=>'0');
		block_map_wr_y <= (others=>'0');
		block_map_wr_data <= (others=>'0');
		
		--draw blocks stuff
		debug_int_next <= debug_int;
		
		--block map write
		block_map_write_counter_main_next <= block_map_write_counter_main;
		block_map_write_array_next <= block_map_write_array;
		
		-- fall down counter stuff
		fall_down_count_next <= fall_down_count;

		-- full line dete
		check_line_x_next <= check_line_x;
		check_line_y_next <= check_line_y;
		empty_lines_next <= empty_lines;

		-- move lnies down 
		copy_lines_down_save_y_next <= copy_lines_down_save_y;
		copy_lines_down_block_info_next <= copy_lines_down_block_info;

		--score and lines
		rows_removed_next <= rows_removed;
		score_next <= score;
		row_counter_temp_next <= row_counter_temp;
		dp_x_next <= dp_x;
		dp_y_next <= dp_y;

		-- fall speed
		fall_down_speed_next <= fall_down_speed;
		fall_down_flag_next <= fall_down_flag;

		-- alg
		counter_next <= counter;

		-- tetramino drawer 2
		tetromino_to_draw_next <= tetromino_to_draw;
		tetromino_to_draw_rot_next <= tetromino_to_draw_rot;

		-- game over
		game_over_next <= game_over;


		case state.fsm_state is
			when RESET =>
				state_nxt.fsm_state <= WAIT_INIT;
				gfx_initializer_start <= '1';
				gfx_instr <= gfx_initializer_instr;
				gfx_instr_wr <= gfx_initializer_instr_wr;
				draw_blocks_x_next <= 0;
				draw_blocks_y_next <= 0;
				block_map_write_counter := 0;
				fall_down_count_next <= 0;
				score_next <= 0;
				rows_removed_next <= 0; 
				fall_down_speed_next <= 70;
				counter_next <= 0;
				game_over_next <= 0;
				fall_down_flag_next <= 0;
				fall_down_count_next <= 0;
				
			when WAIT_INIT =>
				gfx_instr <= gfx_initializer_instr;
				gfx_instr_wr <= gfx_initializer_instr_wr;
				if (gfx_initializer_busy = '0') then
					state_nxt.fsm_state <= CLEAR_BLOCK_MAP_INIT;
				end if;
			
			when CLEAR_BLOCK_MAP_INIT =>
				state_nxt.cur_tetromino_x <= std_logic_vector(to_unsigned(BLOCKS_X/2-1, state.cur_tetromino_x'length));
				state_nxt.cur_tetromino_y <= (others=>'0');
				state_nxt.row_counter <= (others=>'0');
				state_nxt.column_counter <= (others=>'0');
				state_nxt.fsm_state <= CLEAR_BLOCK_MAP_WRITE;
			
			when CLEAR_BLOCK_MAP_WRITE =>
				if (unsigned(state.column_counter) = BLOCKS_X-1) then
					state_nxt.column_counter <= (others=>'0');
					if (unsigned(state.row_counter) = BLOCKS_Y-1) then
						state_nxt.fsm_state <= DO_FRAME_SYNC;
					else
						state_nxt.row_counter <= std_logic_vector(unsigned(state.row_counter) + 1);
					end if;
				else
					state_nxt.column_counter <= std_logic_vector(unsigned(state.column_counter) + 1);
				end if;
				
				block_map_wr_x <= state.column_counter;
				block_map_wr_y <= state.row_counter;
				block_map_wr_data <= (others=>'0');
				block_map_wr <= '1';
			
			when DO_FRAME_SYNC =>
				if (gfx_instr_full = '0') then
					gfx_instr_wr <= '1';
					gfx_instr <= gfx_instr_frame_sync;
					state_nxt.fsm_state <= WAIT_FRAME_SYNC;

					--generall logic
					row_counter_temp_next <= 0;
				end if;
			
			when WAIT_FRAME_SYNC =>
				if (gfx_frame_sync = '1') then
					state_nxt.fsm_state <= CLEAR_SCREEN;
				end if;
			
			when CLEAR_SCREEN =>
				write_instr(gfx_instr_clear(color=>x"c"), FALL_DOWN);
				
			when FALL_DOWN => 
				state_nxt.fsm_state <= PROCESS_INPUT;
				if (fall_down_count > fall_down_speed and game_over = 0) then
					state_nxt.dest_tetromino_y <= std_logic_vector(signed(state.cur_tetromino_y) + 1);
					state_nxt.fsm_state <= TEST_MOVEMENT;
					fall_down_count_next <= 0;
					fall_down_flag_next <= 1;
				else 
					fall_down_count_next <= fall_down_count + 1;
				end if;

			
			--██╗███╗   ██╗██████╗ ██╗   ██╗████████╗
			--██║████╗  ██║██╔══██╗██║   ██║╚══██╔══╝
			--██║██╔██╗ ██║██████╔╝██║   ██║   ██║   
			--██║██║╚██╗██║██╔═══╝ ██║   ██║   ██║   
			--██║██║ ╚████║██║     ╚██████╔╝   ██║   
			--╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝    ╚═╝   
			when PROCESS_INPUT =>
				if game_over = 0 then
					state_nxt.last_controller_state <= gc_cntrl_state;
					state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
					
					state_nxt.dest_tetromino_x <= state.cur_tetromino_x;
					state_nxt.dest_tetromino_y <= state.cur_tetromino_y;
					state_nxt.dest_tetromino <= state.cur_tetromino;
					state_nxt.dest_rotation <= state.cur_rotation;

					if (gc_cntrl_state.btn_right = '1' and state.last_controller_state.btn_right = '0') then
						state_nxt.dest_tetromino_x <= std_logic_vector(signed(state.cur_tetromino_x) + 1);
						state_nxt.fsm_state <= TEST_MOVEMENT;
					end if;
					if (gc_cntrl_state.btn_left = '1' and state.last_controller_state.btn_left = '0') then
						state_nxt.dest_tetromino_x <= std_logic_vector(signed(state.cur_tetromino_x) - 1);
						state_nxt.fsm_state <= TEST_MOVEMENT;
					end if;
					if (gc_cntrl_state.btn_up = '1' and state.last_controller_state.btn_up = '0') then
						state_nxt.dest_rotation <= std_logic_vector(unsigned(state.cur_rotation) + 1);
						state_nxt.fsm_state <= TEST_MOVEMENT;
					end if;
					if (gc_cntrl_state.btn_down = '1' and state.last_controller_state.btn_down = '0') then
						state_nxt.dest_tetromino_y <= std_logic_vector(signed(state.cur_tetromino_y) + 1);
						state_nxt.fsm_state <= TEST_MOVEMENT;
					end if;
					if (gc_cntrl_state.btn_a = '1' and state.last_controller_state.btn_a = '0') then
						fall_down_speed_next <= 1;
						state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
					end if;
					
					
					if (gc_cntrl_state.btn_b = '1' and state.last_controller_state.btn_b = '0') then
						--keeping in for debuging
						prng_en <= '1';
						state_nxt.cur_tetromino <= state.next_tetromino;
						state_nxt.cur_tetromino_x <= std_logic_vector(to_unsigned(BLOCKS_X/2-1, state.cur_tetromino_x'length));
						state_nxt.cur_tetromino_y <= (others=>'0');
						state_nxt.cur_rotation <= ROT_0;
						state_nxt.next_tetromino <= prng_value;
					end if;
				else 
					if (gc_cntrl_state.btn_start = '1' and state.last_controller_state.btn_start = '0') then
						state_nxt.fsm_state <= RESET;
					else 
						state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
					end if;
					
				end if;

			when TEST_MOVEMENT =>
				tc_start <= '1';
				state_nxt.fsm_state <= WAIT_CHECK_COLLISION;
			
			when WAIT_CHECK_COLLISION =>
				if (tc_busy = '0') then
					if (tc_collision_detected = '0') then
						state_nxt.cur_tetromino_x <= state.dest_tetromino_x;
						state_nxt.cur_tetromino_y <= state.dest_tetromino_y;
						state_nxt.cur_rotation <= state.dest_rotation;
						state_nxt.cur_tetromino <= state.dest_tetromino;
						if (fall_down_flag = 1) then
							fall_down_flag_next <= 0;
							state_nxt.fsm_state <= PROCESS_INPUT;
						else 
							state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
						end if;
					elsif (tc_collision_detected = '1' and to_integer(unsigned(state.cur_tetromino_y)) = 0) then
						if game_over = 0 then
							game_over_next <= 1;
						end if;
						
						state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
						
					elsif (tc_collision_detected = '1' and to_integer(unsigned(state.cur_tetromino_y)) = to_integer(unsigned(state.dest_tetromino_y))-1 and state.cur_tetromino_x = state.dest_tetromino_x) then
						fall_down_speed_next <= 70;
						state_nxt.fsm_state <= WRITE_BLOCK_MAP_MAIN;
						block_map_write_counter := 0;
						for y in 0 to 3 loop
							for x in 0 to 3 loop
								if (is_tetromino_solid_at(state.cur_tetromino, state.cur_rotation, std_logic_vector(to_unsigned(x, 2)), std_logic_vector(to_unsigned(y, 2)))) then
									block_map_write_array_next(block_map_write_counter*2) <= x;
									block_map_write_array_next(block_map_write_counter*2+1) <= y;
									block_map_write_counter := block_map_write_counter + 1;
								end if;
							end loop;
						end loop;
						--block_map_write_counter := 0;
					else 
						if (fall_down_flag = 1) then
							fall_down_flag_next <= 0;
							state_nxt.fsm_state <= PROCESS_INPUT;
						else 
							state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
						end if;
					end if;
					
				end if;
				
			when WRITE_BLOCK_MAP_MAIN =>
				block_map_wr <= '1';
				block_map_wr_x <= std_logic_vector(to_unsigned(block_map_write_array(block_map_write_counter_main*2)+to_integer(signed(state.cur_tetromino_x)), block_map_wr_x'length));
				block_map_wr_y <= std_logic_vector(to_unsigned(block_map_write_array(block_map_write_counter_main*2+1)+to_integer(signed(state.cur_tetromino_y)), block_map_wr_y'length));
				if (state.cur_tetromino = "000") then
					block_map_wr_data <= "1" & "111";
				else 
					block_map_wr_data <= "1" & state.cur_tetromino;
				end if;
				if (block_map_write_counter_main > 3) then
					prng_en <= '1';
					state_nxt.cur_tetromino <= state.next_tetromino;
					state_nxt.cur_tetromino_x <= std_logic_vector(to_unsigned(BLOCKS_X/2-1, state.cur_tetromino_x'length));
					state_nxt.cur_tetromino_y <= (others=>'0');
					state_nxt.cur_rotation <= ROT_0;
					state_nxt.next_tetromino <= prng_value;
					state_nxt.fsm_state <= CHECK_IF_LINE_FULL_PRE;
					draw_blocks_x_next <= 0;
					draw_blocks_y_next <= BLOCKS_Y-1;
					block_map_rd <= '1';

				else
					block_map_write_counter_main_next <= block_map_write_counter_main + 1;
					state_nxt.fsm_state <= WRITE_BLOCK_MAP_MAIN;
				end if;
			
			when CHECK_IF_LINE_FULL_PRE =>
				state_nxt.fsm_state <= CHECK_IF_LINE_FULL;
				block_map_rd <= '1';

			when CHECK_IF_LINE_FULL => 
				if (draw_blocks_y < 0) then
					-- no full lines left
					state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;
					draw_blocks_x_next <= 0;
					draw_blocks_y_next <= 0;
					if row_counter_temp = 1 then
						score_next <= score + 1;
					elsif row_counter_temp = 2 then
						score_next <= score + 3;
					elsif row_counter_temp = 3 then
						score_next <= score + 7;
					elsif row_counter_temp = 4 then
						score_next <= score + 10;
					end if;

				elsif (draw_blocks_x < BLOCKS_X+1) then
					--increment x and check if full
					draw_blocks_x_next <= draw_blocks_x + 1;
					block_map_rd <= '1';
					if (block_map_rd_data = "0000") then
						--empty, goto higher line
						state_nxt.fsm_state <= CHECK_IF_LINE_FULL_PRE;
						draw_blocks_x_next <= 0;
						draw_blocks_y_next <= draw_blocks_y - 1;

					else 
						-- block full, stay in line
						state_nxt.fsm_state <= CHECK_IF_LINE_FULL;
						draw_blocks_x_next <= draw_blocks_x + 1;

					end if;
				else
					-- line full
					rows_removed_next <= rows_removed + 1;
					row_counter_temp_next <= row_counter_temp + 1;
					draw_blocks_x_next <= 0;
					state_nxt.fsm_state <= DELL_LINE;--DRAW_BLOCKS_SET_GP_POINTER; --DO_FRAME_SYNC;
				end if;
			
			when DELL_LINE =>
				if (draw_blocks_x < BLOCKS_X) then
					--increment x and dell
					block_map_wr <= '1';
					block_map_wr_x <= std_logic_vector(to_unsigned(draw_blocks_x, block_map_wr_x'length));
					block_map_wr_y <= std_logic_vector(to_unsigned(draw_blocks_y, block_map_wr_y'length));
					block_map_wr_data <= "0000";
					draw_blocks_x_next <= draw_blocks_x+1;
				else 
					draw_blocks_x_next <= 0;
					block_map_rd <= '1';
					state_nxt.fsm_state <= COPY_LINES_DOWN_WAIT;
					copy_lines_down_save_y_next <= draw_blocks_y;
					draw_blocks_y_next <= draw_blocks_y - 1;
				end if;

			when COPY_LINES_DOWN_WAIT =>
				state_nxt.fsm_state <= COPY_LINES_DOWN;
				block_map_rd <= '1';
				

			when COPY_LINES_DOWN =>
				block_map_rd <= '1';
				if (draw_blocks_y < 0) then
					-- copying done
					state_nxt.fsm_state <= CHECK_IF_LINE_FULL_PRE;
					draw_blocks_x_next <= 0;
					draw_blocks_y_next <= copy_lines_down_save_y;

				elsif (draw_blocks_x < BLOCKS_X) then
					--copy down
					block_map_wr <= '1';
					block_map_wr_x <= std_logic_vector(to_unsigned(draw_blocks_x, block_map_wr_x'length));
					block_map_wr_y <= std_logic_vector(to_unsigned(draw_blocks_y+1, block_map_wr_y'length));
					block_map_wr_data <= block_map_rd_data;
					state_nxt.fsm_state <= COPY_LINES_DOWN_WAIT;
					draw_blocks_x_next <= draw_blocks_x+1;
				else
					-- line done

					draw_blocks_x_next <= 0;
					draw_blocks_y_next <= draw_blocks_y - 1;
					state_nxt.fsm_state <= COPY_LINES_DOWN_WAIT;--DRAW_BLOCKS_SET_GP_POINTER; --DO_FRAME_SYNC;
				end if;
			
			when DRAW_BLOCKS_SET_GP_POINTER => 
				if gfx_instr_full = '0' then
					 state_nxt.fsm_state   <= SEND_X;
					 gfx_instr_wr <= '1';
					 gfx_instr    <= gfx_instr_move_gp(false);  --TODO: IDK
				  else

				end if;
			
			when SEND_X =>
			  if gfx_instr_full = '0' then
				state_nxt.fsm_state   <= SEND_Y;
				gfx_instr_wr <= '1';
				gfx_instr    <= std_logic_vector(to_signed(4*3*4, 16)); --set to consts TODO
			  else

			  end if;

			when SEND_Y =>
			  if gfx_instr_full = '0' then
				 state_nxt.fsm_state   <= DRAW_BLOCKS_MAIN;
				 gfx_instr_wr <= '1';
				 gfx_instr    <= std_logic_vector(to_signed(draw_blocks_y*BLOCK_SIZE, 16)); --set to consts
			  else

			  end if;
				
			when DRAW_BLOCKS_MAIN => 
				if gfx_instr_full = '0' then
					if (draw_blocks_y > BLOCKS_Y) then
						state_nxt.fsm_state <= DRAW_COLLISION_BORDER;
						draw_blocks_x_next <= 0;
						draw_blocks_y_next <= 0;
					elsif (draw_blocks_x < BLOCKS_X) then
						gfx_instr_wr <= '1';
						gfx_instr    <= gfx_instr_compact_bit_blit(true, false, false, true, false);
						draw_blocks_x_next <= draw_blocks_x + 1;
						block_map_rd <= '1';
						state_nxt.fsm_state <= SEND_OPERAND_X;
					else 
						draw_blocks_y_next <= draw_blocks_y + 1;
						draw_blocks_x_next <= 0;
						state_nxt.fsm_state <= DRAW_BLOCKS_SET_GP_POINTER;--DRAW_BLOCKS_SET_GP_POINTER; --DO_FRAME_SYNC;
					end if;
					
				end if;
				
			when SEND_OPERAND_X =>
				if gfx_instr_full = '0' then
					block_map_rd <= '0';
					state_nxt.fsm_state <= DRAW_BLOCKS_MAIN;
					gfx_instr_wr <= '1';
					if (block_map_rd_data(1 to 3) = "111") then
						gfx_instr    <= "0" & "000" & std_logic_vector(to_unsigned(5, 4)) & "1100" & "1100"; --change for right color
					elsif (block_map_rd_data(1 to 3) = "000") then
						gfx_instr    <= "1" & "000" & std_logic_vector(to_unsigned(5, 4)) & "1100" & "1100"; --change for right color
					else 
						gfx_instr    <= "0" & block_map_rd_data(1 to 3) & std_logic_vector(to_unsigned(5, 4)) & "1100" & "1100"; --change for right color
					end if;
					
				end if;
				
				
				
							
			--██████╗  ██████╗ ██████╗ ██████╗ ███████╗██████╗ 
			--██╔══██╗██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
			--██████╔╝██║   ██║██████╔╝██║  ██║█████╗  ██████╔╝
			--██╔══██╗██║   ██║██╔══██╗██║  ██║██╔══╝  ██╔══██╗
			--██████╔╝╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
			--╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
			when DRAW_COLLISION_BORDER => 
				write_instr(COLLISION_BORDER(0), DRAW_COLLISION_BORDER_1);
				block_map_wr <= '0';
				block_map_write_counter_main_next <= 0;
				debug_int_next <= score;
			when DRAW_COLLISION_BORDER_1 => write_instr(COLLISION_BORDER(1), DRAW_COLLISION_BORDER_2);
			when DRAW_COLLISION_BORDER_2 => 
				write_instr(COLLISION_BORDER(2), DRAW_20_WALLS_INSTR); --gp pointer setup done
				counter_next <= 0;

			
			when DRAW_20_WALLS_INSTR =>
				if (counter > 19) then
					state_nxt.fsm_state   <= DRAW_COLLISION_BORDER_3;--DRAW_COLLISION_BORDER_3;
					counter_next <= 0;
				elsif gfx_instr_full = '0' then
					state_nxt.fsm_state   <= DRAW_20_WALLS_DATA;
					gfx_instr_wr <= '1';
					gfx_instr    <= gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>false, movy=>True);  --TODO: IDK
				else

				end if;

			when DRAW_20_WALLS_DATA =>
				if gfx_instr_full = '0' then
					debug_int_next <= debug_int + 1;
					counter_next <= counter + 1;
					state_nxt.fsm_state   <= DRAW_20_WALLS_INSTR;
					gfx_instr_wr <= '1';
					gfx_instr    <= std_logic_vector(to_unsigned(0, 4)) & std_logic_vector(to_unsigned(6, 4)) & "1100" & "1100";  --TODO: IDK
				else

				end if;
			
			when DRAW_COLLISION_BORDER_3 => write_instr(COLLISION_BORDER(3), DRAW_COLLISION_BORDER_4);
			when DRAW_COLLISION_BORDER_4 => write_instr(COLLISION_BORDER(4), DRAW_COLLISION_BORDER_5);
			when DRAW_COLLISION_BORDER_5 => write_instr(COLLISION_BORDER(5), DRAW_20_WALLS_INSTR_2);
			when DRAW_COLLISION_BORDER_6 => write_instr(COLLISION_BORDER(6), DRAW_COLLISION_BORDER_7);
			when DRAW_COLLISION_BORDER_7 => write_instr(COLLISION_BORDER(7), DRAW_COLLISION_BORDER_8);
			when DRAW_COLLISION_BORDER_8 => write_instr(COLLISION_BORDER(8), DRAW_COLLISION_BORDER_9);
			when DRAW_COLLISION_BORDER_9 => write_instr(COLLISION_BORDER(9), DRAW_COLLISION_BORDER_10);
			when DRAW_COLLISION_BORDER_10 => write_instr(COLLISION_BORDER(10), DRAW_COLLISION_BORDER_11);
			when DRAW_COLLISION_BORDER_11 => write_instr(COLLISION_BORDER(11), DRAW_COLLISION_BORDER_12);
			when DRAW_COLLISION_BORDER_12 => write_instr(COLLISION_BORDER(12), DRAW_COLLISION_BORDER_13);
			when DRAW_COLLISION_BORDER_13 => write_instr(COLLISION_BORDER(13), DRAW_COLLISION_BORDER_14);
			when DRAW_COLLISION_BORDER_14 => write_instr(COLLISION_BORDER(14), DRAW_COLLISION_BORDER_15);
			when DRAW_COLLISION_BORDER_15 => write_instr(COLLISION_BORDER(15), DRAW_COLLISION_BORDER_16);
			when DRAW_COLLISION_BORDER_16 => write_instr(COLLISION_BORDER(16), DRAW_COLLISION_BORDER_17);
			when DRAW_COLLISION_BORDER_17 => write_instr(COLLISION_BORDER(17), DRAW_TETROMINO);

			when DRAW_20_WALLS_INSTR_2 =>
				if (counter > 19) then
					state_nxt.fsm_state   <= DRAW_TETROMINO_2;
					counter_next <= 0;
				elsif gfx_instr_full = '0' then
					state_nxt.fsm_state   <= DRAW_20_WALLS_DATA_2;
					gfx_instr_wr <= '1';
					gfx_instr    <= gfx_instr_compact_bit_blit(alpha_mode=>true, hflip=>false, vflip=>false, movx=>false, movy=>True);  --TODO: IDK
				else

				end if;

			when DRAW_20_WALLS_DATA_2 =>
				if gfx_instr_full = '0' then
					counter_next <= counter + 1;
					state_nxt.fsm_state   <= DRAW_20_WALLS_INSTR_2;
					gfx_instr_wr <= '1';
					gfx_instr    <= std_logic_vector(to_unsigned(0, 4)) & std_logic_vector(to_unsigned(6, 4)) & "1100" & "1100";  --TODO: IDK
				else

				end if;

			when DRAW_TETROMINO_2 =>
				td_start <= '1';
				state_nxt.fsm_state <= WAIT_DRAW_TETROMINO_2;
				tetromino_to_draw_next <= state.next_tetromino;
				tetromino_to_draw_rot_next <= ROT_0;
				
				
			when WAIT_DRAW_TETROMINO_2 =>
				td_x <= std_logic_vector(to_signed(18*BLOCK_SIZE, td_x'length));
				td_y <= std_logic_vector(to_signed(12*BLOCK_SIZE, td_y'length));
				
				gfx_instr <= td_gfx_instr;
				gfx_instr_wr <= td_gfx_instr_wr;
				if (td_busy = '0') then
					if (game_over > 60) then
						game_over_next <= game_over + 1;
						dp_x_next <= x"00c8";
						dp_y_next <= x"0014";
						debug_int_next <= score; --TODO
						state_nxt.fsm_state <= START_DECIMAL_PRINTER;
						if (game_over > 120) then
							game_over_next <= 1;
						end if;

					elsif (game_over > 0) then
						state_nxt.fsm_state <= DRAW_TETROMINO;
						game_over_next <= game_over + 1;
					else
						state_nxt.fsm_state <= DRAW_TETROMINO;
					end if;
				end if;

			--██████╗ ██╗      ██████╗  ██████╗██╗  ██╗███████╗
			--██╔══██╗██║     ██╔═══██╗██╔════╝██║ ██╔╝██╔════╝
			--██████╔╝██║     ██║   ██║██║     █████╔╝ ███████╗
			--██╔══██╗██║     ██║   ██║██║     ██╔═██╗ ╚════██║
			--██████╔╝███████╗╚██████╔╝╚██████╗██║  ██╗███████║
			--╚═════╝ ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝
			when DRAW_TETROMINO =>
				td_start <= '1';
				state_nxt.fsm_state <= WAIT_DRAW_TETROMINO;
				tetromino_to_draw_next <= state.cur_tetromino;
				tetromino_to_draw_rot_next <= state.cur_rotation;
				
				
			when WAIT_DRAW_TETROMINO =>
				td_x <= std_logic_vector(resize((signed(state.cur_tetromino_x)+4)*BLOCK_SIZE, td_x'length));
				td_y <= std_logic_vector(resize(signed(state.cur_tetromino_y)*BLOCK_SIZE, td_y'length));
				
				gfx_instr <= td_gfx_instr;
				gfx_instr_wr <= td_gfx_instr_wr;
				if (td_busy = '0') then
					dp_x_next <= x"00c8";
					dp_y_next <= x"0014";
					debug_int_next <= score;
					state_nxt.fsm_state <= START_DECIMAL_PRINTER;
				end if;
			
			--██╗      █████╗ ██████╗ ███████╗██╗     
			--██║     ██╔══██╗██╔══██╗██╔════╝██║     
			--██║     ███████║██████╔╝█████╗  ██║     
			--██║     ██╔══██║██╔══██╗██╔══╝  ██║     
			--███████╗██║  ██║██████╔╝███████╗███████╗
			--╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝
			when START_DECIMAL_PRINTER =>
				dp_start <= '1';
				state_nxt.fsm_state <= WAIT_DECIMAL_PRINTER;
				
			when WAIT_DECIMAL_PRINTER =>
				gfx_instr <= dp_gfx_instr;
				gfx_instr_wr <= dp_gfx_instr_wr;
				if (dp_busy = '0') then
					state_nxt.fsm_state <= START_DECIMAL_PRINTER_2;--DRAW_BLOCKS_SET_GP_POINTER;
					dp_x_next <= x"00c8";
					dp_y_next <= x"0050";
					debug_int_next <= rows_removed;
				end if;

			when START_DECIMAL_PRINTER_2 =>
				dp_start <= '1';
				state_nxt.fsm_state <= WAIT_DECIMAL_PRINTER_2;
				
			when WAIT_DECIMAL_PRINTER_2 =>
				gfx_instr <= dp_gfx_instr;
				gfx_instr_wr <= dp_gfx_instr_wr;
				if (dp_busy = '0') then
					state_nxt.fsm_state <= DRAW_GUI;--DRAW_BLOCKS_SET_GP_POINTER;
				end if;

			-- SCORES:
			when DRAW_GUI => write_instr(GUI(0), DRAW_GUI_1);
			when DRAW_GUI_1 => write_instr(GUI(1), DRAW_GUI_2);
			when DRAW_GUI_2 => write_instr(GUI(2), DRAW_GUI_3);
			when DRAW_GUI_3 => write_instr(GUI(3), DRAW_GUI_4);
			when DRAW_GUI_4 => write_instr(GUI(4), DRAW_GUI_5);
			when DRAW_GUI_5 => write_instr(GUI(5), DRAW_GUI_6);
			when DRAW_GUI_6 => write_instr(GUI(6), DRAW_GUI_7);
			when DRAW_GUI_7 => write_instr(GUI(7), DRAW_GUI_8);
			when DRAW_GUI_8 => write_instr(GUI(8), DRAW_GUI_9);
			when DRAW_GUI_9 => write_instr(GUI(9), DRAW_GUI_10);
			when DRAW_GUI_10 => write_instr(GUI(10), DRAW_GUI_11);
			when DRAW_GUI_11 => write_instr(GUI(11), DRAW_GUI_12);
			when DRAW_GUI_12 => write_instr(GUI(12), DRAW_GUI_13);
			when DRAW_GUI_13 => write_instr(GUI(13), DRAW_GUI_14);
			when DRAW_GUI_14 => write_instr(GUI(14), DRAW_GUI_15);
			when DRAW_GUI_15 => write_instr(GUI(15), DRAW_GUI_16);
			when DRAW_GUI_16 => write_instr(GUI(16), DRAW_GUI_17);
			when DRAW_GUI_17 => write_instr(GUI(17), DRAW_GUI_18);
			when DRAW_GUI_18 => write_instr(GUI(18), DRAW_GUI_19);
			when DRAW_GUI_19 => write_instr(GUI(19), DRAW_GUI_20);
			when DRAW_GUI_20 => write_instr(GUI(20), DRAW_GUI_21);
			when DRAW_GUI_21 => write_instr(GUI(21), DRAW_GUI_22);
			when DRAW_GUI_22 => write_instr(GUI(22), DRAW_GUI_23);
			when DRAW_GUI_23 => write_instr(GUI(23), DRAW_GUI_24);
			when DRAW_GUI_24 => write_instr(GUI(24), DRAW_GUI_25);
			when DRAW_GUI_25 => write_instr(GUI(25), DRAW_GUI_26);
			when DRAW_GUI_26 => write_instr(GUI(26), DRAW_GUI_27);
			when DRAW_GUI_27 => write_instr(GUI(27), DRAW_GUI_28);
			when DRAW_GUI_28 => write_instr(GUI(28), DRAW_GUI_29);
			when DRAW_GUI_29 => write_instr(GUI(29), DRAW_GUI_30);
			when DRAW_GUI_30 => write_instr(GUI(30), DRAW_GUI_31);
			when DRAW_GUI_31 => write_instr(GUI(31), DRAW_GUI_32);
			when DRAW_GUI_32 => write_instr(GUI(32), DRAW_GUI_33);
			when DRAW_GUI_33 => write_instr(GUI(33), DRAW_GUI_34);
			when DRAW_GUI_34 => write_instr(GUI(34), DRAW_GUI_35);
			when DRAW_GUI_35 => write_instr(GUI(35), DRAW_GUI_36);
			when DRAW_GUI_36 => write_instr(GUI(36), DRAW_GUI_37);
			when DRAW_GUI_37 => write_instr(GUI(37), DRAW_GUI_38);
			when DRAW_GUI_38 => write_instr(GUI(38), DRAW_GUI_39);
			when DRAW_GUI_39 => write_instr(GUI(39), DRAW_GUI_40);
			when DRAW_GUI_40 => write_instr(GUI(40), DO_FRAME_SYNC);

				
			
				
			when others =>
				--idk
					
		end case;
	end process;

	sound_and_rumble : process(all)
	begin
		gc_cntrl_rumble <= '0';
		synth_cntrl(0).play <= '0';
		synth_cntrl(1).play <=  '0';
		state_sound_next <= state_sound;
		row_diff_next <= row_diff;
		counter_sound_next <= counter_sound;

		case state_sound is
			when WAIT_ON_FSM =>
				synth_cntrl(0).high_time <= x"30";
				synth_cntrl(0).low_time <= x"30"; 
						
				synth_cntrl(1).high_time <= x"22";
				synth_cntrl(1).low_time <= x"22";
				gc_cntrl_rumble <= '0';
				synth_cntrl(0).play <= '0';
				synth_cntrl(1).play <=  '0';
				counter_sound_next <= 0;
				if (game_over = 0 and game_over_next = 1) then
					state_sound_next <= PLAY_GAME_OVER;
				end if;
				if (rows_removed  < rows_removed_next) then
					state_sound_next <= PLAY_ROW;
					row_diff_next <= rows_removed;
				end if;

			when PLAY_GAME_OVER =>
				synth_cntrl(0).high_time <= x"30";
				synth_cntrl(0).low_time <= x"30"; 
						
				synth_cntrl(1).high_time <= x"22";
				synth_cntrl(1).low_time <= x"22";
				gc_cntrl_rumble <= '1';
				counter_sound_next <= counter_sound + 1;
				

				if (counter_sound > 	12500000*2) then
					state_sound_next <= WAIT_ON_FSM;
					synth_cntrl(0).play <= '0';
					synth_cntrl(1).play <=  '0';
				elsif (counter_sound > 	12500000) then
					synth_cntrl(0).play <= '0';
					synth_cntrl(1).play <=  '1';
				else 
					synth_cntrl(0).play <= '1';
					synth_cntrl(1).play <=  '0';
				end if;
					

			when PLAY_ROW =>
			synth_cntrl(1).high_time <= x"22";
			synth_cntrl(1).low_time <= x"22";
			gc_cntrl_rumble <= '1';
			counter_sound_next <= counter_sound + 1;

			if row_diff = 1 then
				synth_cntrl(0).high_time <= x"30";
				synth_cntrl(0).low_time <= x"30";
			elsif row_diff = 2 then
				synth_cntrl(0).high_time <= x"28";
				synth_cntrl(0).low_time <= x"28";
			elsif row_diff = 3 then
				synth_cntrl(0).high_time <= x"25";
				synth_cntrl(0).low_time <= x"25";
			elsif row_diff = 4 then
				synth_cntrl(0).high_time <= x"22";
				synth_cntrl(0).low_time <= x"22";
			else 
				synth_cntrl(0).high_time <= x"30";
				synth_cntrl(0).low_time <= x"30"; 
						
	
			end if;
			 
			
			
			if (counter_sound > 	12500000*2) then
				state_sound_next <= WAIT_ON_FSM;
				synth_cntrl(0).play <= '0';
				synth_cntrl(1).play <=  '0';
			elsif (counter_sound > 	12500000) then
				synth_cntrl(0).play <= '0';
				synth_cntrl(1).play <=  '0';
			elsif (counter_sound > 	12500) then
				row_diff_next <= rows_removed - row_diff;
				synth_cntrl(0).play <= '1';
				synth_cntrl(1).play <=  '0';
			else 
				synth_cntrl(0).play <= '0';
				synth_cntrl(1).play <=  '0';
			end if;


		end case;
			
	end process;

	gfx_initializer : block 
		constant INIT_INSTR : gfx_instr_array_t(0 to 17+17+3-1) := (
			gfx_instr_load_palette(0),
			x"5bcd", x"642e", x"746f", x"7cd1",
			x"8d32", x"9593", x"a5f4", x"b696",
			x"c6d7", x"c6f7", x"cf17", x"cf38",
			x"d738", x"d779", x"df99", x"ffff",
			gfx_instr_load_palette(1),
			x"0000", x"8000", x"0400", x"8400", 
			x"0010", x"8010", x"0410", x"bdf7",
			x"8410", x"f800", x"07e0", x"ffe0",
			x"001f", x"f81f", x"07ff", x"ffff",
			gfx_instr_cfg(en_db=>true, en_tpg=>false),
			gfx_instr_clear(color=>x"e"),
			gfx_instr_select_palette(alpha_color=>x"f", palette_index=>0)
		);
		
		signal instr_cnt : integer := 0;
		signal instr_cnt_nxt : integer := 0;
	
		signal gfx_initializer_instr_nxt : std_logic_vector(GFX_INSTR_WIDTH-1 downto 0);
		signal instr_busy, instr_busy_nxt : std_logic;
		signal running, running_nxt : std_logic;
	begin
		gfx_initializer_busy <= running;
	
		sync : process(clk, res_n)
		begin
			if (res_n = '0') then
				instr_cnt <= 0;
				gfx_initializer_instr <= (others=>'0');
				running <= '0';
			elsif (rising_edge(clk)) then
				gfx_initializer_instr <= gfx_initializer_instr_nxt;
				instr_cnt <= instr_cnt_nxt;
				running <= running_nxt;
			end if;
		end process;
		
		next_state : process(all)
		begin
			gfx_initializer_instr_wr <= '0';
			
			instr_cnt_nxt <= instr_cnt;
			gfx_initializer_instr_nxt <= gfx_initializer_instr;
			running_nxt <= running;
			
			if (gfx_initializer_start = '1') then
				instr_cnt_nxt <= 1;
				running_nxt <= '1';
				gfx_initializer_instr_nxt <= INIT_INSTR(0);
			end if;
	
			if (running = '1') then
				if (gfx_instr_full = '0') then
					gfx_initializer_instr_wr <= '1';
					
					if (instr_cnt = 0) then
						running_nxt <= '0';
					elsif (instr_cnt = INIT_INSTR'length-1) then
						instr_cnt_nxt <= 0;
						gfx_initializer_instr_nxt <= INIT_INSTR(instr_cnt);
					else
						gfx_initializer_instr_nxt <= INIT_INSTR(instr_cnt);
						instr_cnt_nxt <= instr_cnt + 1;
					end if;
				end if;
			end if;
		end process;
	end block;
	
	tetromino_drawer_inst : tetromino_drawer
	generic map (
		BLOCK_SIZE => BLOCK_SIZE,
		BLOCK_ROW => 5
	)
	port map (
		clk            => clk,
		res_n          => res_n,
		start          => td_start,
		busy           => td_busy,
		x              => td_x,
		y              => td_y,
		tetromino      => tetromino_to_draw,--state.cur_tetromino,
		rotation       => tetromino_to_draw_rot,--state.cur_rotation,
		gfx_instr      => td_gfx_instr,
		gfx_instr_wr   => td_gfx_instr_wr,
		gfx_instr_full => gfx_instr_full
	);

	
	decimal_printer_inst : decimal_printer
	port map (
		clk            => clk,
		res_n          => res_n,
		gfx_instr      => dp_gfx_instr,
		gfx_instr_wr   => dp_gfx_instr_wr,
		gfx_instr_full => gfx_instr_full,
		start          => dp_start,
		busy           => dp_busy,
		x              => dp_x,
		y              => dp_y,
		number         => debug_int_converted
	);
	
	tetromino_collider_inst : tetromino_collider
	generic map (
		BLOCKS_X => BLOCKS_X,
		BLOCKS_Y => BLOCKS_Y
	)
	port map (
		clk                => clk,
		res_n              => res_n,
		start              => tc_start,
		busy               => tc_busy,
		collision_detected => tc_collision_detected,
		tetromino_x        => state.dest_tetromino_x,
		tetromino_y        => state.dest_tetromino_y,
		tetromino          => state.dest_tetromino,
		rotation           => state.dest_rotation,
		block_map_x        => tc_block_map_x,
		block_map_y        => tc_block_map_y,
		block_map_rd       => tc_block_map_rd,
		block_map_solid    => tc_block_map_solid
	);


	block_map : block 
		signal block_map_rd_addr : std_logic_vector(log2c(BLOCKS_X*BLOCKS_Y)-1 downto 0);
		signal block_map_wr_addr : std_logic_vector(log2c(BLOCKS_X*BLOCKS_Y)-1 downto 0);
	begin
		process(all)
		begin
			if tc_busy = '1' then
			block_map_rd_addr <= std_logic_vector(resize(unsigned(block_map_rd_x) + BLOCKS_X * unsigned(block_map_rd_y), block_map_rd_addr'length));
			else 
			block_map_rd_addr <= std_logic_vector(to_unsigned(draw_blocks_x + BLOCKS_X * draw_blocks_y , block_map_rd_addr'length));
			end if;
			block_map_wr_addr <= std_logic_vector(resize(unsigned(block_map_wr_x) + BLOCKS_X * unsigned(block_map_wr_y), block_map_wr_addr'length));		
			if (tc_block_map_rd = '1') then
				block_map_rd_addr <= std_logic_vector(resize(unsigned(tc_block_map_x) + BLOCKS_X * unsigned(tc_block_map_y), block_map_rd_addr'length));
			end if;
		end process;
		
		tc_block_map_solid <= block_map_rd_data(0);
		
		block_map : dp_ram_1c1r1w
		generic map (
			ADDR_WIDTH => log2c(BLOCKS_X*BLOCKS_Y),
			DATA_WIDTH => 4 --4
		)
		port map (
			clk      => clk,
			rd1_addr => block_map_rd_addr,
			rd1_data => block_map_rd_data,
			rd1      => block_map_rd or tc_block_map_rd,
			wr2_addr => block_map_wr_addr,
			wr2_data => block_map_wr_data,
			wr2      => block_map_wr
		);
	end block;




	prng : block
		signal lfsr : std_logic_vector(14 downto 0); --15 bit
	begin
		sync : process(clk, res_n)
		begin
			if (res_n = '0') then
				lfsr <= std_logic_vector(to_unsigned(1234,lfsr'length));
				prng_value <= (others=>'0');
			elsif (rising_edge(clk)) then
				if (prng_en = '1') then
					lfsr(lfsr'length-1 downto 1) <= lfsr(lfsr'length-2 downto 0);
					lfsr(0) <= lfsr(14) xor lfsr(13);
					
					prng_value <= (others=>'0');
					for i in 0 to lfsr'length/3-1 loop
						if (lfsr((i+1)*3-1 downto i*3) /= "111") then
							prng_value <= lfsr((i+1)*3-1 downto i*3);
							exit;
						end if;
					end loop;
				end if;
			end if;
		end process;
	end block;

end architecture;
