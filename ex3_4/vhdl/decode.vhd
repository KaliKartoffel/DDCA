library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;

entity decode is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- from fetch
		pc_in      : in  pc_type;
		instr      : in  instr_type;

		-- from writeback
		reg_write  : in reg_write_type;

		-- towards next stages
		pc_out     : out pc_type;
		exec_op    : out exec_op_type;
		mem_op     : out mem_op_type;
		wb_op      : out wb_op_type;

		-- exceptions
		exc_dec    : out std_logic
	);
end entity;

architecture rtl of decode is

	type opcode_t is (OPC_LOAD, OPC_STORE, OPC_BRANCH, OPC_JALR, OPC_JAL, OPC_OP_IMM, OPC_OP, OPC_AUIPC, OPC_LUI, NOP);
	type instr_format_t is (R,I,S,B,U,J);

	signal instr_input : instr_type := NOP_INST;
	signal opcode : opcode_t := nop;
	signal instr_fmt : instr_format_t := r;
	signal exec    : exec_op_type:= EXEC_NOP;
	signal mem     : mem_op_type;
	signal wb      : wb_op_type;



	signal pc : std_logic_vector(PC_WIDTH-1 downto 0) := (others => '0');
	signal funct3 : std_logic_vector(2 downto 0):= (others => '0');
	signal funct7 : std_logic_vector(6 downto 0):= (others => '0');
	signal rs1, rs2, rd : REG_ADR_TYPE := (others => '0'); -- 5 bit
	signal imm : DATA_TYPE := (others => '0');
	signal rs1_data,rs2_data: DATA_TYPE := (others => '0');	-- 32 bit

	signal exc_opcode,exc_table : std_logic:= '0';

	constant twelve : std_logic_vector(3 downto 0) := "1100";
begin

	sync_input: process(all)
	begin
		if res_n = '0' then
			-- res_n signals here
			--instr_input <= NOP_INST;
			instr_input <= NOP_INST;
			pc_out <= (others => '0');
			pc <= (others => '0');

			-- exec_op.aluop <= ALU_NOP;
			-- exec_op.alusrc1 <= '0';
			-- exec_op.alusrc2 <= '0';
			-- exec_op.alusrc3 <= '0';
			-- exec_op.rs1 <= rs1;
			-- exec_op.rs2 <= rs2;
			-- exec_op.imm <= imm;
			-- mem_op  <= mem_nop ;
			-- wb_op   <= wb_nop  ;

		elsif rising_edge(clk) then
			if flush = '1' then
				-- NOP instruction
				instr_input <= NOP_INST;

			elsif stall = '0' then
				instr_input <= instr;
				pc_out <= pc_in;
				pc	<= pc_in;

				-- exec_op.aluop <= exec.aluop;
				-- exec_op.alusrc1 <= exec.alusrc1;
				-- exec_op.alusrc2 <= exec.alusrc2;
				-- exec_op.alusrc3 <= exec.alusrc3;
				-- exec_op.rs1 <= exec.rs1;
				-- exec_op.rs2 <= exec.rs2;
				-- exec_op.imm <= exec.imm;
				-- mem_op  <= mem;
				-- wb_op   <= wb;
	
			end if;				
		end if;
	end process;


	exec_op.aluop <= exec.aluop;
	exec_op.alusrc1 <= exec.alusrc1;
	exec_op.alusrc2 <= exec.alusrc2;
	exec_op.alusrc3 <= exec.alusrc3;
	exec_op.readdata1 <= rs1_data; -- !!!!!!!!!!!!
	exec_op.readdata2 <= rs2_data; -- !!!!!!!!!!!!
	exec_op.rs1 <= exec.rs1;
	exec_op.rs2 <= exec.rs2;
	exec_op.imm <= exec.imm;
	mem_op  <= mem;
	wb_op   <= wb;

	exception_sig: process(all)
	begin
		if res_n = '0' then
			exc_dec <= '0';

		elsif rising_edge(clk) then
			exc_dec <= '0';

			if exc_opcode = '1' or exc_table = '1' then
				exc_dec <= '1';
			end if;
		end if;
	end process;


	-- defining the OPCODE and the INSTRUCTION_FORMAT of the current instruction
	main:process(all)
	begin
		-- default
		exc_opcode <= '0';
		opcode <= NOP;
		instr_fmt <= I;

		case instr_input(6 downto 0) is
		when "0000011" =>
			opcode <= OPC_LOAD;
			instr_fmt <= I;
		when "0100011" =>
			opcode <= OPC_STORE;
			instr_fmt <= S;
		when "1100011" =>
			opcode <= OPC_BRANCH;
			instr_fmt <= B;
		when "1100111" =>
			opcode <= OPC_JALR;
			instr_fmt <= I;
		when "1101111" =>
			opcode <= OPC_JAL;
			instr_fmt <= J;
		when "0010011" =>
			opcode <= OPC_OP_IMM;
			instr_fmt <= I;
		when "0110011" =>
			opcode <= OPC_OP;
			instr_fmt <= R;
		when "0010111" =>
			opcode <= OPC_AUIPC;
			instr_fmt <= U;
		when "0110111" =>
			opcode <= OPC_LUI;
			instr_fmt <= U;
		when "0001111" =>
			opcode <= NOP;
			instr_fmt <= I;
		when others =>
			exc_opcode <= '1';
		end case;
	end process;


		-----------------------------------------------------
		--		extract_instr_data
		-----------------------------------------------------

	extract_instr_data: process(all)
	begin
		funct7 <= (others => '1');
		rs1 <= (others => '0');
		rs2 <= (others => '0');
		rd <= (others => '0');
		funct3 <= (others => '0');
		imm <= (others => '0');
			
		case instr_fmt is
		when R =>
			funct7 <= instr_input(31 downto 25);
			rs2 <= instr_input(24 downto 20);
			rs1 <= instr_input(19 downto 15);
			funct3 <= instr_input(14 downto 12);
			rd <= instr_input(11 downto 7);

			imm <= (others => '0');
		when I =>
			rs1 <= instr_input(19 downto 15);
			funct3 <= instr_input(14 downto 12);
			rd <= instr_input(11 downto 7);

			imm(31 downto 11) <= (others => instr_input(31));
			imm(10 downto 0) <= instr_input(30 downto 20);
		when S =>
			rs2 <= instr_input(24 downto 20);
			rs1 <= instr_input(19 downto 15);
			funct3 <= instr_input(14 downto 12);

			imm(31 downto 11) <= (others => instr_input(31));
			imm(10 downto 5) <= instr_input(30 downto 25);
			imm(4 downto 0) <= instr_input(11 downto 7);
		when B =>
			rs2 <= instr_input(24 downto 20);
			rs1 <= instr_input(19 downto 15);
			funct3 <= instr_input(14 downto 12);

			imm(31 downto 12) <= (others => instr_input(31));
			imm(11) <= instr_input(7);
			imm(10 downto 5) <= instr_input(30 downto 25);
			imm(4 downto 1) <= instr_input(11 downto 8);
			imm(0) <= '0';
		when U =>
			rd <= instr_input(11 downto 7);

			imm(31 downto 12) <= instr_input(31 downto 12);
			imm(11 downto 0) <= (others => '0');
		when J =>
			rd <= instr_input(11 downto 7);

			imm(31 downto 20) <= (others => instr_input(31));
			imm(19 downto 12) <= instr_input(19 downto 12);
			imm(11) <= instr_input(20);
			imm(10 downto 1) <= instr_input(30 downto 21);
			imm(0) <= '0';
		when others =>
		end case;
	end process;




	table_3_7: process(all)
	begin
		-----------------------------------------------------
		--		TABLE 4.7
		-----------------------------------------------------
		mem <= MEM_NOP;
		exec <= EXEC_NOP;
		
		-- default
		exc_table <= '0';

		-- default
		-- MEM_OP_TYPE
		mem.branch <= BR_NOP;
		mem.mem.memwrite <= '0';
		mem.mem.memread <= '0';

		-- EXEC_OP_TYPE
		exec.aluop <= ALU_NOP;
		exec.alusrc1 <= '0';
		exec.alusrc2 <= '0';
		exec.alusrc3 <= '0';
		exec.rs1 <= rs1;
		exec.rs2 <= rs2;
		exec.readdata1 <= rs1_data; -- !!!!!!!!!!!!
		exec.readdata2 <= rs2_data; -- !!!!!!!!!!!!
		exec.imm <= imm;

		case opcode is
		when OPC_LUI => 
			exec.alusrc3 <= '1';

		when OPC_AUIPC =>
			exec.aluop <= ALU_ADD;
			exec.readdata1 <= (others => '0');
			exec.readdata1(PC_WIDTH - 1 downto 0) <= pc;
			exec.alusrc1 <= '1';
			exec.alusrc3 <= '1';

		when OPC_JAL =>
			exec.aluop <= ALU_ADD;
			
			exec.alusrc3 <= '1';

			mem.branch <= BR_BR;

		when OPC_JALR =>
			if funct3 = "000" then
				exec.aluop <= ALU_ADD;

				mem.branch <= BR_BR;
				exec.alusrc1 <= '1';
				exec.alusrc3 <= '1';
			else
				exc_table <= '1';
			end if;

		when OPC_BRANCH =>
			exec.alusrc1 <= '1';
			exec.alusrc2 <= '1';
			-- exec.alusrc3 <= '1';

			case funct3 is
			when "000" =>
				exec.aluop <= ALU_SUB;
				mem.branch <= BR_CND;
			when "001" =>
				exec.aluop <= ALU_SUB;
				mem.branch <= BR_CNDI;
			when "100" =>
				exec.aluop <= ALU_SLT;
				mem.branch <= BR_CNDI;
			when "101" =>
				exec.aluop <= ALU_SLT;
				mem.branch <= BR_CND;
			when "110" =>
				exec.aluop <= ALU_SLTU;
				mem.branch <= BR_CNDI;
			when "111" =>
				exec.aluop <= ALU_SLTU;
				mem.branch <= BR_CND;
			when others =>
				exc_table <= '1';
			end case;

		when OPC_LOAD =>
			-- exec_TYPE
			exec.aluop <= ALU_ADD;
			exec.alusrc1 <= '1';
			exec.alusrc3 <= '1';

			-- mem_TYPE
			mem.mem.memwrite <= '0';
			mem.mem.memread <= '1';

			case funct3 is
			when "000" =>
				mem.mem.memtype <= MEM_B;
			when "001" =>
				mem.mem.memtype <= MEM_H;
			when "010" =>
				mem.mem.memtype <= MEM_W;
			when "100" =>
				mem.mem.memtype <= MEM_BU;
			when "101" =>
				mem.mem.memtype <= MEM_HU;
			when others =>
				exc_table <= '1';
			end case;

		when OPC_STORE =>
			-- EXEC_OP_TYPE
			exec.aluop <= ALU_ADD;

			exec.alusrc1 <= '1';
			-- exec.alusrc2 <= '1';
			exec.alusrc3 <= '1';

			-- mem_TYPE
			mem.mem.memwrite <= '1';
			mem.mem.memread <= '0';
			exec.readdata2 <= (others => '0');
			

			case funct3 is
			when "000" =>
				exec.readdata2(7 downto 0) <= rs2_data(7 downto 0);
				-- exec.wrdata(7 downto 0) <= rs2_data(7 downto 0);

				mem.mem.memtype <= MEM_B;
			when "001" =>
				exec.readdata2(15 downto 0) <= rs2_data(15 downto 0);
				-- exec.wrdata(15 downto 0) <= rs2_data(15 downto 0);

				mem.mem.memtype <= MEM_H;
			when "010" =>
				exec.readdata2 <= rs2_data;
				-- exec.wrdata <= rs2_data;
				
				mem.mem.memtype <= MEM_W;
			when others =>
				exc_table <= '1';
			end case;

		-----------------------------------------------------
		--		OPC_OP_IMM - I
		-----------------------------------------------------
		when OPC_OP_IMM =>

			exec.alusrc1 <= '1';
			exec.alusrc3 <= '1';

			case funct3 is
			when "000" =>
					exec.aluop <= ALU_ADD;
			when "010" =>
					exec.aluop <= ALU_SLT;
					exec.readdata1 <= std_logic_vector(signed(rs1_data));
			when "011" =>
					exec.aluop <= ALU_SLTU;
					exec.readdata1 <= std_logic_vector(unsigned(rs1_data));
			when "100" =>
					exec.aluop <= ALU_XOR;
			when "110" =>
					exec.aluop <= ALU_OR;
			when "111" =>
					exec.aluop <= ALU_AND;
			when "001" =>
					if imm(10) = '0'then
						exec.aluop <= ALU_SLL;
						exec.imm <= (others => '0');
						exec.imm(4 downto 0) <= imm(4 downto 0);
					end if;
			when "101" =>
					-- default
					exec.imm <= (others => '0');
					exec.imm(4 downto 0) <= imm(4 downto 0);

					if imm(10) = '0' then
						exec.aluop <= ALU_SRL;
						exec.readdata1 <= std_logic_vector(unsigned(rs1_data));
					else
						exec.aluop <= ALU_SRA;
						exec.readdata1 <= std_logic_vector(signed(rs1_data));
					end if;
			when others => -- there is no other possibility
			end case;				

		-----------------------------------------------------
		--		OPC_OP - R
		-----------------------------------------------------
		when OPC_OP =>
			exec.alusrc1 <= '1';
			exec.alusrc2 <= '1';

			case funct3 is
			when "000" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_ADD;
				elsif funct7 = "0100000" then
					exec.aluop <= ALU_SUB;
				else
					exc_table <= '1';
				end if;
			when "001" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_SLL;

					exec.readdata2 <= (others => '0'); 
					exec.readdata2(4 downto 0) <= rs2_data(4 downto 0); 
				else
					exc_table <= '1';
				end if;
			when "010" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_SLT;
					exec.readdata1 <= std_logic_vector(signed(rs1_data));
					exec.readdata2 <= std_logic_vector(signed(rs2_data));
				else
					exc_table <= '1';
				end if;
			when "011" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_SLTU;
					exec.readdata1 <= std_logic_vector(unsigned(rs1_data));
					exec.readdata2 <= std_logic_vector(unsigned(rs2_data));
				else
					exc_table <= '1';
				end if;
			when "100" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_XOR;
				else
					exc_table <= '1';
				end if;
			when "101" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_SRL;
					exec.readdata1 <= std_logic_vector(unsigned(rs1_data));

					exec.readdata2 <= (others => '0'); 
					exec.readdata2(4 downto 0) 	<= rs2_data(4 downto 0); 
				elsif funct7 = "0100000" then
					exec.aluop <= ALU_SRA;
					exec.readdata1 <= std_logic_vector(signed(rs1_data));

					exec.readdata2 <= (others => '0'); 
					exec.readdata2(4 downto 0) 	<= rs2_data(4 downto 0); 
				else
					exc_table <= '1';
				end if;
			when "110" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_OR;
				else
					exc_table <= '1';
				end if;
			when "111" =>
				if funct7 = "0000000" then
					exec.aluop <= ALU_AND;
				else
					exc_table <= '1';
				end if;
			when others =>
			end case;

		when NOP =>
			if funct3 = "000" then
				-- default is alusrc1/2/3 = '0'
				mem <= MEM_NOP;
				exec <= EXEC_NOP;
			else
				exc_table <= '1';
			end if;
		when others =>
		end case;

	end process;

	WB_OP_TYPE: process(all)
	begin
		-----------------------------------------------------
		--		WB_OP_TYPE
		-----------------------------------------------------
		-- default
		
		wb <= wb_NOP;
		
		wb.rd <= rd;

		case opcode is
		when NOP =>
			wb <= WB_NOP;
		when OPC_OP =>
			wb.write <= '1';
			wb.src <= WBS_ALU;
		when OPC_OP_IMM =>
			wb.write <= '1';
			wb.src <= WBS_ALU;
		when OPC_STORE =>
			-- wb.rd <= rs2; -- storing rs2
			wb.write <= '0';
			-- wb.src <= WBS_MEM; -- egal weil write = '0'
		when OPC_LOAD =>
			wb.write <= '1';
			wb.src <= WBS_MEM;
		when OPC_BRANCH =>
			wb.write <= '0';
			wb.src <= WBS_ALU;
		when OPC_JALR =>
			wb.write <= '1';
			wb.src <= WBS_OPC;
		when OPC_JAL =>
			wb.write <= '1';
			wb.src <= WBS_OPC;
		when OPC_AUIPC =>
			wb.write <= '1';
			wb.src <= WBS_ALU;
		when OPC_LUI =>
			wb.write <= '1';
			wb.src <= WBS_ALU;
		when others =>
		end case;
	end process;
	

	regfile_inst : entity work.regfile
	port map (
		clk => clk,
		res_n => res_n,
		stall => stall,
		rdaddr1 => instr(19 downto 15),
		rdaddr2 => instr(24 downto 20),
		rddata1 => rs1_data,
		rddata2 => rs2_data,
		wraddr => reg_write.reg,
		wrdata => reg_write.data,
		regwrite => reg_write.write
	);
end architecture;