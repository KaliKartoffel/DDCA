library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;
use work.mem_pkg.all;

entity fetch is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;  -- active low
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- to control
		mem_busy   : out std_logic;

		pcsrc      : in  std_logic; -- pc copunter stays the same
		pc_in      : in  pc_type;
		pc_out     : out pc_type := (others => '0');
		instr      : out instr_type;

		-- memory controller interface
		mem_out   : out mem_out_type;
		mem_in    : in  mem_in_type
	);
end entity;

architecture rtl of fetch is

	signal pc_intern, pc_intern_next : pc_type;
	signal instr_intern, instr_intern_next : instr_type;
	signal wait_flag, wait_flag_next : integer := 0;
	constant wait_flag_2 : integer := 1;
	signal flush_saved, flush_saved_next : std_logic := '0';
	
	signal reset_flag : boolean := true;


begin

	mem_out.byteena <= "1111";
	--mem_out.address <= std_logic_vector(resize(unsigned(pc_out(15 downto 2)) + 1,ADDR_WIDTH)); -- eig pc + 4, aber da wir 15 downto 2 haben, ist es +1
	mem_out.wr <= '0';
	mem_out.wrdata <= (others => '0');
	mem_out.rd <= '1';


	reset : process(all) is
		begin
			if res_n = '0' then
				-- Reset values	
				-- addi r0 + 0, func3 = 000, func7 void, I

				-- wait_flag_2 <= 1;
				wait_flag <= 0;
				--flush_saved_next <= '0';
				flush_saved <= '0';
				instr_intern <= (others => '0');
				wait_flag <= 0;
				pc_intern <= (others => '0');


			elsif rising_edge(clk) then
				-- take over next values
				flush_saved <= flush_saved_next;
				instr_intern <= instr_intern_next;
				wait_flag <= wait_flag_next;
				if (stall = '0') then
					pc_intern <= pc_intern_next;
				end if;

				-- report "this is clk";
			end if;
		end process;
  
	  main : process(all)
		  begin
			-- if clk = '1' then
			-- 	report "funny stuff"; --Dont judge @Tutor, it actually does something
			-- end if;
			flush_saved_next <= flush_saved_next;
			flush_saved_next <= flush;
			instr_intern_next <= instr_intern;
			mem_busy <= mem_in.busy;
			wait_flag_next <= wait_flag;
			

			
			pc_intern_next <= pc_intern;
			-- report "86";
			if (wait_flag_2 = 1 and wait_flag = 0) then
				--pc_intern_next <= std_logic_vector(to_unsigned(0, pc_out'length));
				pc_out <= std_logic_vector(to_unsigned(0, pc_out'length));
				pc_intern_next <= std_logic_vector(to_unsigned(0, pc_out'length));
				wait_flag_next <= 1;
				--instr <= "000000000000" & "00000" & "000" & "00000" & "0010011"; -- === nop I hope
				INSTR <= "01000000000000000000000000110011";
				mem_out.address <= (others => '0');
			else 
				-- report "94";
				if (flush = '0' and flush_saved = '0') then
					pc_out <= pc_intern;
				elsif (pcsrc = '0') then
					pc_out <= pc_intern;
				else 
					--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					pc_out <= pc_intern;
				end if;
				if (pcsrc = '0' and flush = '0') then
					report "100";
					mem_out.address <= std_logic_vector(resize(unsigned(pc_out(15 downto 2)) + 1,ADDR_WIDTH)); -- eig pc + 4, aber da wir 15 downto 2 haben, ist es +1

					pc_intern_next <= std_logic_vector(unsigned(pc_intern) + 4);
				elsif (flush = '1' and pcsrc = '0') then
					mem_out.address <= std_logic_vector(resize(unsigned(pc_out(15 downto 2)) + 1,ADDR_WIDTH)); -- eig pc + 4, aber da wir 15 downto 2 haben, ist es +1
					pc_intern_next <= std_logic_vector(unsigned(pc_intern) + 4);
				else
					-- report "104";
					--pc_out <= pc_in;
					mem_out.address <= pc_in(15 downto 2);
					pc_intern_next <= pc_in;

				end if;
				--instr_intern_next <= mem_in.rddata;
				-- instr <= mem_in.rddata;
				instr <= mem_in.rddata(7 downto 0) & mem_in.rddata(15 downto 8) & mem_in.rddata(23 downto 16) & mem_in.rddata(INSTR_WIDTH-1 downto 24);

				if (flush = '1') then
					instr <= "000000000000" & "00000" & "000" & "00000" & "0010011"; -- === nop I hope
				else
				
				end if;
			end if;
		  end process;




	-- main2: process(all)
	-- 	variable tmp_pc : std_logic_vector(PC_WIDTH-1 downto 0) := (others => '0');
	-- begin
	-- 	if res_n = '0' then
	-- 		instr <= NOP_INST;
	-- 		mem_out <= MEM_OUT_NOP;
	-- 		pc_out <= std_logic_vector(to_signed(-4,PC_WIDTH));
	-- 		pc_intern <= std_logic_vector(to_signed(-4,PC_WIDTH));
	-- 		mem_busy <= '0';
	-- 		reset_flag <= true;

	-- 	elsif rising_edge(clk) then
	-- 		if stall = '0' then
	-- 			if flush = '1' or reset_flag then
	-- 				instr <= NOP_INST;	-- branch wurde ausgführt, diese instr muss geflusht werden
	-- 				reset_flag <= false;
	-- 				-- mem_out <= MEM_OUT_NOP;	-- nicht flushen
	-- 				-- pc_out <= (others => '0');	-- nicht flushen
	-- 			else
	-- 				instr <= mem_in.rddata(7 downto 0) & mem_in.rddata(15 downto 8) & mem_in.rddata(23 downto 16) & mem_in.rddata(INSTR_WIDTH-1 downto 24);
	-- 			end if;

	-- 			mem_busy <= mem_in.busy;
				
	-- 			pc_out <= pc_intern; -- printing the last pc value 

	-- 			if pcsrc = '1' then
	-- 				-- pc_intern <= pc_in;
	-- 				tmp_pc := pc_in;
	-- 			else
	-- 				-- pc_intern <= std_logic_vector(unsigned(pc_intern) + 4);
	-- 				tmp_pc := std_logic_vector(unsigned(pc_intern) + 4);
	-- 			end if;

	-- 			pc_intern <= tmp_pc;	-- save this pc, to print it in the next cycle

	-- 			mem_out.address <= tmp_pc(15 downto 2);		-- looking up the adress of the next pc, (current pc + 4 / pc_in)
	-- 			-- mem_out.address <= pc_intern(15 downto 2); -- looking up the adress of the next pc, (current pc + 4 / pc_in)
	-- 			mem_out.wr <= '0';
	-- 			mem_out.rd <= '1';
	-- 			mem_out.byteena <= "1111";
	-- 			mem_out.wrdata <= (others => '0');
	-- 		end if;
	-- 	end if;
	-- end process;

end architecture;