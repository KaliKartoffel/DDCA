library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;

entity exec is
    port (
        clk           : in  std_logic;
        res_n         : in  std_logic;
        stall         : in  std_logic;
        flush         : in  std_logic;

        -- from DEC
        op            : in  exec_op_type;
        pc_in         : in  pc_type;

        -- to MEM
        pc_old_out    : out pc_type;
        pc_new_out    : out pc_type;
        aluresult     : out data_type;
        wrdata        : out data_type;
        zero          : out std_logic;

        memop_in      : in  mem_op_type;
        memop_out     : out mem_op_type;
        wbop_in       : in  wb_op_type;
        wbop_out      : out wb_op_type;

        -- FWD -- can be ignored for Task 4.3
        exec_op       : out exec_op_type; 
        reg_write_mem : in  reg_write_type;
        reg_write_wr  : in  reg_write_type
    );
end exec;

architecture rtl of exec is
	
	signal alu_in1, alu_in2, R : data_type := ZERO_DATA;
	signal op_input : exec_op_type := EXEC_NOP;
	signal pc : pc_type := ZERO_PC;
	signal pc_new_out_next, pc_new_out_s: pc_type := ZERO_PC;
	signal memop : mem_op_type := MEM_NOP;
	signal wbop_input : wb_op_type := WB_NOP;
	signal fwd_reg1, fwd_reg2 : reg_adr_type := ZERO_REG;
	signal fwd_val1, fwd_val2: data_type :=  ZERO_DATA;
	signal do_fwd1, do_fwd2 : std_logic := '0';
begin

	fwd_inst1: entity work.fwd
	port map(
		-- from Mem
		reg_write_mem => reg_write_mem,

		-- from WB
		reg_write_wb => reg_write_wr,

		-- from/to EXEC
		reg => op.rs1,
		val => fwd_val1,
		do_fwd => do_fwd1
	);

	fwd_inst2: entity work.fwd
	port map(
		-- from Mem
		reg_write_mem => reg_write_mem,

		-- from WB
		reg_write_wb => reg_write_wr,

		-- from/to EXEC
		reg => op.rs2,
		val => fwd_val2,
		do_fwd => do_fwd2
	);

	-- forwarding variable, passing on the op
	exec_op <= op_input;

	sync : process (clk, res_n, flush, stall)
	begin
		if res_n = '0' then
			op_input <= EXEC_NOP;
			pc <= ZERO_PC;
			pc_old_out <= ZERO_PC;
			
			memop_out <= MEM_NOP;
			wbop_out <= WB_NOP;

		elsif rising_edge(clk) then
			if flush = '1' then
				op_input <= EXEC_NOP;
				pc <= ZERO_PC;
				
				memop_out <= MEM_NOP;
				wbop_out <= WB_NOP;
			elsif stall = '0' then
				op_input <= op;
				
				pc <= pc_in;
				pc_old_out <= pc_in;

				memop_out <= memop_in;
				memop <= memop_in;
				
				wbop_out <= wbop_in;
				wbop_input <= wbop_in;
			end if;
		end if;
	end process;


	main: process(all)
		variable tmp : integer := 0;
	begin

		alu_in1 <= (others => '0');
		alu_in2 <= (others => '0');
		pc_new_out <= pc;

		if memop.mem.memwrite = '1' then -- store
			wrdata <= op_input.readdata2;
		else
			wrdata <= (others => '0');
		end if;

		case wbop_input.src is
		when WBS_ALU =>
			-- OPC_LUI		3
			-- OPC_AUIPC,	13
			-- OPC_BRANCH,	12
			-- OPC_STORE	13
			-- OPC_OP_IMM, 	13
			-- OPC_OP,		12
			-- NOP, 		- (weder 1, 2, noch 3)

			if op_input.alusrc1 = '1' then
				alu_in1 <= op_input.readdata1;
			end if;

			if op_input.alusrc2 = '1' then
				alu_in2 <= op_input.readdata2;
			end if;
			
			if op_input.alusrc3 = '1' then
				alu_in2 <= op_input.imm;
			end if;

			-- OPC_LUI	3
				-- if op_input.alusrc1 = '0' and op_input.alusrc2 = '0' and op_input.alusrc3 = '1' then
				-- 	alu_in2 <= op_input.imm;
				-- end if;

				-- OPC_AUIPC
				-- if op_input.alusrc1 = '1' and op_input.alusrc2 = '0' and op_input.alusrc3 = '1' then
				-- 	alu_in1 <= op_input.readdata1;
				-- 	alu_in2 <= op_input.imm;
				-- end if;

				-- OPC_BRANCH
				-- if op_input.alusrc1 = '1' and op_input.alusrc2 = '1' and op_input.alusrc3 = '1' then
				-- end if;

				-- OPC_STORE	2
				-- if op_input.alusrc1 = '0' and op_input.alusrc2 = '1' and op_input.alusrc3 = '0' then
				-- 	alu_in1 <= op_input.readdata1;
				-- 	alu_in2 <= op_input.imm;
				-- end if;


			--------------------------      new_pc_calc      --------------------------
			if memop.branch = BR_CND or memop.branch = BR_CNDI then
				tmp := to_integer(unsigned(pc)) + to_integer(signed(op_input.imm));
				pc_new_out <= std_logic_vector(to_unsigned(tmp, PC_WIDTH));
			end if;

		when WBS_MEM =>
			-- OPC_LOAD
			-- dont care, cause is handled in the memory stage
			alu_in1 <= op_input.readdata1;
			alu_in2 <= op_input.imm;
				

		when WBS_OPC =>
			-- JAL, JALR
			if op_input.alusrc1 = '1' then
				-- JALR
				tmp := to_integer(signed(op_input.imm)) + to_integer(unsigned(op_input.readdata1));
				pc_new_out <= std_logic_vector(to_unsigned(tmp, PC_WIDTH));
				pc_new_out(0) <= '0';
			else
				-- JAL
				tmp := to_integer(unsigned(pc)) + to_integer(signed(op_input.imm));
				pc_new_out <= std_logic_vector(to_unsigned(tmp, PC_WIDTH));
			end if;

		when others =>
		end case;




	end process;

	alu_inst : entity work.alu
	port map(
		op => op_input.aluop,
		A => alu_in1,
		B => alu_in2,
		R => aluresult,
		Z => zero
	);


	
end architecture;