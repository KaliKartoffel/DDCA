library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;
use work.mem_pkg.all;

entity wb is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- from MEM
		op         : in  wb_op_type;
		aluresult  : in  data_type;
		memresult  : in  data_type;
		pc_old_in  : in  pc_type;

		-- to FWD and DEC
		reg_write  : out reg_write_type
	);
end entity;

architecture rtl of wb is
	signal op_input : wb_op_type := WB_NOP;
	signal aluresult_in : data_type := ZERO_DATA;
	signal memresult_in : data_type := ZERO_DATA;
	signal pc_old : pc_type := ZERO_PC;
	
begin
	sync : process (clk, res_n, flush, stall)
	begin
		if res_n = '0' then
			op_input <= WB_NOP;
			aluresult_in <= ZERO_DATA;
			memresult_in <= ZERO_DATA;
			pc_old <= ZERO_PC;
			
		elsif rising_edge(clk) then
			if flush = '1' then
				op_input <= WB_NOP;
				aluresult_in <= ZERO_DATA;
				memresult_in <= ZERO_DATA;
				pc_old <= ZERO_PC; -- should we also flush this value?
				
			elsif stall = '0' then
				op_input <= op;
				aluresult_in <= aluresult;
				memresult_in <= memresult;
				pc_old <= pc_old_in;
			end if;
		end if;
	end process;
	
	wrbck : process (all)
	begin
		
		reg_write.write <= op_input.write;
		reg_write.reg <= op_input.rd;
		
		case op_input.src is
		when WBS_ALU => 
			reg_write.data <= aluresult_in;
		
		when WBS_MEM => 
			reg_write.data <= memresult_in;
		
		when WBS_OPC =>
			reg_write.data <= std_logic_vector(resize(unsigned(pc_old) + 4, DATA_WIDTH));
			
		end case;
	end process;
end architecture;
