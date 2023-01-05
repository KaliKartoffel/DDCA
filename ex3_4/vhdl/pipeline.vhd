library ieee;
use ieee.std_logic_1164.all;

use work.core_pkg.all;
use work.mem_pkg.all;
use work.op_pkg.all;

entity pipeline is
	port (
	clk    : in  std_logic;
	res_n  : in  std_logic;

	-- instruction interface
	mem_i_out    : out mem_out_type;
	mem_i_in     : in  mem_in_type;

	-- data interface
	mem_d_out    : out mem_out_type;
	mem_d_in     : in  mem_in_type
	);
end entity;

architecture impl of pipeline is



	--signal flush : STD_LOGIC := '0';
	
	signal reg_fwd: reg_adr_type;

	signal mem_busy_fetch, stall, zero_exec, mem_busy_mem, pcsrc_mem, do_fwd_fwd :STD_LOGIC;
	--signal exc_dec_decode, exc_load_mem, exc_store_mem :std_logic;
	signal stall_fetch_ctrl,stall_dec_ctrl,stall_exec_ctrl,stall_mem_ctrl,stall_wb_ctrl,flush_fetch_ctrl,flush_dec_ctrl,flush_exec_ctrl,flush_mem_ctrl,flush_wb_ctrl:std_logic;


	signal instr : INSTR_TYPE;

	signal aluresult_exec, wrdata_exec,aluresult_out_mem, memresult_mem, val_fwd : DATA_TYPE;

	signal pc_out_fetch, pc_out_decode, pc_old_out_exec, pc_new_out_exec, pc_new_out_mem, pc_old_out_mem : PC_TYPE;

	signal exec_op_decode : EXEC_OP_TYPE;
	signal exec_op_exec : EXEC_OP_TYPE;

	signal mem_op_decode, mem_op_exec : MEM_OP_TYPE;

	signal wb_op_decode, wb_op_exec,wbop_out_mem : WB_OP_TYPE;

	signal reg_write_mem_exec, reg_write_wr_exec, reg_write_mem, reg_write_wb : REG_WRITE_TYPE;

begin
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

	stalling: process(all)
	begin
		--flush <= '0';
		if mem_busy_fetch = '1' or mem_busy_mem = '1' then
			stall <= '1';
		else
			stall <= '0';
		end if;
	end process;
		

	fetch_inst: entity work.fetch 
	port map(
		clk        => clk,
		res_n      => res_n,
		stall      => stall_fetch_ctrl,
		flush      => flush_fetch_ctrl,

		-- to control
		mem_busy   => mem_busy_fetch,

		pcsrc      => pcsrc_mem,
		pc_in      => pc_new_out_mem,
		pc_out     => pc_out_fetch,
		instr      => instr,

		-- memory controller interface
		mem_out   => mem_i_out,
		mem_in   => mem_i_in
	);

	decode_inst : entity work.decode
	    port map (
		clk	=> clk, 
		res_n   => res_n,
		stall      => stall_dec_ctrl,
		flush      => flush_dec_ctrl,

		-- from fetch
		pc_in      => pc_out_fetch,
		instr      => instr,

		-- from writeback
		reg_write  => reg_write_wb,

		-- towards next stages
		pc_out     => pc_out_decode, 
		exec_op    => exec_op_decode,
		mem_op     => mem_op_decode, 
		wb_op      => wb_op_decode, 

		-- exceptions
		--exc_dec    => exc_dec_decode
	    	exc_dec    => open
	    );

	exec_inst: entity work.exec
	    port map (
		clk           => clk,
		res_n         => res_n,
		stall         => stall_exec_ctrl,
		flush         => flush_exec_ctrl,

		-- from DEC
		op            => exec_op_decode,
		pc_in         => pc_out_decode,

		-- to MEM
		pc_old_out    => pc_old_out_exec, 
		pc_new_out    => pc_new_out_exec, 
		aluresult     => aluresult_exec, 
		wrdata        => wrdata_exec, 
		zero          => zero_exec,

		memop_in      => mem_op_decode,
		memop_out     => mem_op_exec, 
		wbop_in       => wb_op_decode,
		wbop_out      => wb_op_exec, 

		-- FWD
		exec_op       => exec_op_exec, 
		--exec_op       => open, 
		reg_write_mem => reg_write_mem,
		reg_write_wr  => reg_write_wb
	    );

	mem_inst: entity work.mem
	port map (
		clk           => clk,
		res_n         => res_n,
		stall         => stall_mem_ctrl,
		flush         => flush_mem_ctrl,

		-- to Ctrl
		mem_busy      => mem_busy_mem,

		-- from EXEC
		mem_op        => mem_op_exec,
		wbop_in       => wb_op_exec,
		pc_new_in     => pc_new_out_exec,
		pc_old_in     => pc_old_out_exec,
		aluresult_in  => aluresult_exec,
		wrdata        => wrdata_exec,
		zero          => zero_exec,

		-- to EXEC (forwarding)
		reg_write     => reg_write_mem, 

		-- to FETCH
		pc_new_out    => pc_new_out_mem, 
		pcsrc         => pcsrc_mem,

		-- to WB
		wbop_out      => wbop_out_mem, 
		pc_old_out    => pc_old_out_mem, 
		aluresult_out => aluresult_out_mem, 
		memresult     => memresult_mem, 

		-- memory controller interface 
		mem_out       => mem_d_out, 
		mem_in        => mem_d_in,

		-- exceptions
		exc_load      => open,
		exc_store     => open
		--exc_load      => exc_load_mem,
		--exc_store     => exc_store_mem
	);

	wb_inst: entity work.wb
	    port map (
		clk        => clk,
		res_n      => res_n,
		stall      => stall_wb_ctrl,
		flush      => flush_wb_ctrl,

		-- from MEM
		op         => wbop_out_mem,
		aluresult  => aluresult_out_mem,
		memresult  => memresult_mem,
		pc_old_in  => pc_old_out_mem,

		-- to FWD and DEC
		reg_write  => reg_write_wb
	    );

	ctrl_inst: entity work.ctrl
	    port map (
		clk	 		=> clk,
		res_n   	=> res_n,
		stall       => stall,

		stall_fetch => stall_fetch_ctrl,
		stall_dec   => stall_dec_ctrl,
		stall_exec  => stall_exec_ctrl,
		stall_mem   => stall_mem_ctrl,
		stall_wb    => stall_wb_ctrl,

		flush_fetch => flush_fetch_ctrl,
		flush_dec   => flush_dec_ctrl,
		flush_exec  => flush_exec_ctrl,
		flush_mem   => flush_mem_ctrl,
		flush_wb    => flush_wb_ctrl,

		-- from FWD
		wb_op_exec  => wbop_out_mem,
		exec_op_dec => exec_op_exec,

		pcsrc_in  => pcsrc_mem,
		pcsrc_out => open
	    );

end architecture;

