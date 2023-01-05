library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.mem_pkg.all;
use work.op_pkg.all;

entity mem is
	port (
		clk           : in  std_logic;
		res_n         : in  std_logic;
		stall         : in  std_logic;
		flush         : in  std_logic;

		-- to Ctrl
		mem_busy      : out std_logic;

		-- from EXEC
		mem_op        : in  mem_op_type;
		wbop_in       : in  wb_op_type;
		pc_new_in     : in  pc_type;
		pc_old_in     : in  pc_type;
		aluresult_in  : in  data_type;
		wrdata        : in  data_type;
		zero          : in  std_logic;

		-- to EXEC (forwarding)
		reg_write     : out reg_write_type;

		-- to FETCH
		pc_new_out    : out pc_type;
		pcsrc         : out std_logic;

		-- to WB
		wbop_out      : out wb_op_type;
		pc_old_out    : out pc_type;
		aluresult_out : out data_type;
		memresult     : out data_type;

		-- memory controller interface
		mem_out       : out mem_out_type;
		mem_in        : in  mem_in_type;

		-- exceptions
		exc_load      : out std_logic;
		exc_store     : out std_logic
	);
end entity;

architecture rtl of mem is
	signal op, op_old   :  memu_op_type := MEMU_NOP;
	signal A, W, R    :  data_type := (others => '0');
	signal B, XL, XS    : std_logic := '0';
	signal d, d_old    :  mem_in_type := MEM_IN_NOP;
	signal M    : mem_out_type := MEM_OUT_NOP;
begin


-- forwarding
reg_write.write <= '0';
reg_write.reg <= ZERO_REG;
reg_write.data <= ZERO_DATA;


-- asynchronous outputs
memresult <= R;
mem_busy <= B;
-- memu OUTPUT
mem_out <= M;


test: process(all)
begin
	d <= mem_in;
	if flush = '1' then
		-- mem_out <= MEM_OUT_NOP;
		--op <= MEMU_NOP;
		d <= mem_in_nop;
	end if;
	if res_n = '0' then
		d <= mem_in_nop;
	end if;
end process;

sync: process(all)
begin
	if res_n = '0' then
		pc_old_out <= ZERO_PC;
		pc_new_out <= ZERO_PC;
		wbop_out <= WB_NOP;
		aluresult_out <= ZERO_DATA;
		op <= MEMU_NOP;
		--d <= mem_in_nop;
		pcsrc <= '0';
		A <= (others => '0');
		W <= (others => '0');
		-- mem_out <= MEM_OUT_NOP;

	
	elsif rising_edge(clk) then
		if flush = '1' then
			-- mem_out <= MEM_OUT_NOP;
			op <= MEMU_NOP;
			--d <= mem_in_nop;

		elsif stall = '1' then
			-- op <= op_old;
			-- d <= d_old;
			op.memread <= '0'; -- overwriting the old value 
			op.memwrite <= '0'; -- overwriting the old value 
		else
			-- memu INPUT
			op <= mem_op.mem;
			-- op_old <= mem_op.mem;

			
			-- d_old <= mem_in;

			pc_old_out <= pc_old_in;
			pc_new_out <= pc_new_in;
			wbop_out <= wbop_in;
			aluresult_out <= aluresult_in;

			A <= aluresult_in;
			W <= wrdata;

			-- setting pcsrc
			pcsrc <= '0';
			case mem_op.branch is
			when BR_NOP =>				-- no branch
				pcsrc <= '0';
			when BR_BR =>				-- branch
				pcsrc <= '1';
			when BR_CND =>				-- branch conditional
				if zero = '1' then 
					pcsrc <= '1';
				end if;
			when BR_CNDI =>				-- branch conditional (condition inverted)
				if zero = '0' then 
					pcsrc <= '1';
				end if;
			when others =>
			end case;
		end if;
	end if;
end process;


memu_inst: entity work.memu
	port map (
		op => op,
		A => A,
		W => W,
		R => R,
		B => B,
		XL => exc_load,
		XS => exc_store,
		D => d,
		M => M
	);
end architecture;
