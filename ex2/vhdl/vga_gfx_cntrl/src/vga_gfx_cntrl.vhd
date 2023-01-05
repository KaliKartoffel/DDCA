
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

use work.math_pkg.all;
use work.ram_pkg.all;
use work.vga_gfx_cntrl_pkg.all;

entity vga_gfx_cntrl is
	port (
		clk   : in std_logic;
		res_n : in std_logic;
		
		display_clk   : in std_logic;
		display_res_n : in std_logic;
	
		--instruction interface
		gfx_instr       : in std_logic_vector(15 downto 0);
		gfx_instr_wr    : in std_logic;
		gfx_instr_full  : out std_logic;
		gfx_frame_sync  : out std_logic;
		
		--external interface to SRAM
		sram_dq : inout std_logic_vector(15 downto 0);
		sram_addr : out std_logic_vector(19 downto 0);
		sram_ub_n : out std_logic;
		sram_lb_n : out std_logic;
		sram_we_n : out std_logic;
		sram_ce_n : out std_logic;
		sram_oe_n : out std_logic;
		
		-- connection to VGA connector/DAC
		vga_hsync       : out std_logic;
		vga_vsync       : out std_logic;
		vga_dac_clk     : out std_logic;
		vga_dac_blank_n : out std_logic;
		vga_dac_sync_n  : out std_logic;
		vga_dac_r       : out std_logic_vector(7 downto 0);
		vga_dac_g       : out std_logic_vector(7 downto 0);
		vga_dac_b       : out std_logic_vector(7 downto 0)
	);
end entity;


architecture arch of vga_gfx_cntrl is
	signal prepare_frame_start, pix_ack, prepare_frame_start_next, pix_ack_next:  std_logic := '0';
	signal pix_data_r, pix_data_g, pix_data_b : std_logic_vector(7 downto 0);
	signal vga_hsync_next, vga_vsync_next : std_logic;
	
	signal count_x : integer := -40;
	signal count_y,count_x_next, count_y_next : integer := 0;
	
	signal vga_dac_blank_n_next : std_logic;
	
	signal set_x, set_y : boolean;
	
	begin
	
	
 	
	sync : process(clk, res_n, display_clk)
	begin
		if (res_n = '0') then
			count_x <= -40;
			count_y <= 0;
		elsif (rising_edge(display_clk)) then
			count_x <= count_x_next;
			count_y <= count_y_next;
		end if;
	end process;
	
	main : process(all)
	begin
		count_x_next <= count_x;
		count_y_next <= count_y;
		--prepare_frame_start_next <= prepare_frame_start;
		--pix_ack_next <= pix_ack;
		
		vga_dac_blank_n <= '0';
		
		vga_dac_clk <= display_clk;
		vga_dac_sync_n <= '1';
		
		pix_ack <= '0';
		
		vga_dac_r <= "00000000";
		vga_dac_g <= "00000000";
		vga_dac_b <= "00000000";
		
		vga_hsync <= '1';
		vga_vsync <= '1';
		
		set_x <= false;
		set_y <= false;
		
		prepare_frame_start <= '0';
		
		count_x_next <= count_x+1;
		if (count_x = -36) then
			prepare_frame_start <= '1';
		elsif (count_x <= 0) then
		elsif (count_x >= 640+16+96+48) then 
			count_x_next <= 0;
			count_y_next <= count_y + 1;
		elsif (count_x >= 640+16+96+2) then --D
		elsif (count_x >= 640+16+2) then --C
			vga_hsync <= '0';
		elsif (count_x >= 641) then --B
		else --A
			set_x <= true;
		end if;	
		
		if (count_y >= 480+10+2+33) then 
			count_y_next <= 0;
		elsif (count_y >= 480+10+2) then
		elsif (count_y >= 480+10) then
			vga_vsync <= '0';
		elsif (count_y >= 480) then
		else
			set_y <= true;
		end if;
		
		if (set_x and set_y) then
			pix_ack <= '1';
			vga_dac_blank_n <= '1';
			vga_dac_r <= pix_data_r;
			vga_dac_g <= pix_data_g;
			vga_dac_b <= pix_data_b;
			--vga_dac_blank_n <= '1';
		end if;
		
		if (count_y = 480+10+2+15 and count_x = 0) then
			prepare_frame_start <= '1';
		end if;
		
	end process;
	
	
	tpg_inst : tpg 
	generic map (
		WIDTH => 640,
		HEIGHT => 480
	)
	port map (
		clk => display_clk,
		res_n => res_n,
		
		prepare_frame_start => prepare_frame_start,
		pix_ack => pix_ack,
		pix_data_r => pix_data_r,
		pix_data_g => pix_data_g,
		pix_data_b => pix_data_b
	);


end architecture;
