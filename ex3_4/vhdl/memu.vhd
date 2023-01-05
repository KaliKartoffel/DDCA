library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pkg.all;
use work.core_pkg.all;
use work.op_pkg.all;

entity memu is
	port (
		-- to mem
		op   : in  memu_op_type;
		A    : in  data_type;
		W    : in  data_type;
		R    : out data_type := (others => '0');

		B    : out std_logic := '0';
		XL   : out std_logic := '0';
		XS   : out std_logic := '0';

		-- to memory controller
		D    : in  mem_in_type;
		M    : out mem_out_type := MEM_OUT_NOP
	);
end entity;

architecture rtl of memu is
begin



	other_signals: process(all)
	begin

		M.address <= A(15 downto 2); -- stimmt das? welche 13 bits sollen geschrieben werden
		B <= (D.busy or op.memread) and not XL;
		-- B <= D.busy or (op.memread and not XL);

		M.rd <= op.memread and not XL;
		M.wr <= op.memwrite and not XS;

	end process;


	table_3_9: process(all)
	begin
		-- report "In table_3_9";
		M.byteena <= (others => '0');
		M.wrdata <= (others => '0');
		-- report "INFO: op.memtype = " & to_string(op.memtype);


		if op.memtype = MEM_B or op.memtype = MEM_BU then
			-- report "here mem_b or mem_bu";
			
			case A(1 downto 0) is
			when "00" =>
				M.byteena <= "1000";
				M.wrdata(31 downto 24) <= W(7 downto 0);

				-- report "a = 00, w = " & to_string(W(7 downto 0));
			when "01" =>
				M.byteena <= "0100";
				M.wrdata(23 downto 16) <= W(7 downto 0);
			when "10" =>
				M.byteena <= "0010";
				M.wrdata(15 downto 8) <= W(7 downto 0);
			when "11" =>
				M.byteena <= "0001";
				M.wrdata(7 downto 0) <= W(7 downto 0);
			when others =>
			end case;

		elsif op.memtype = MEM_H or op.memtype = MEM_HU then
			
			case A(1 downto 0) is
			when "00" =>
				M.byteena <= "1100";
				M.wrdata(31 downto 16) <= W(7 downto 0) & W(15 downto 8);
			when "01" =>
				M.byteena <= "1100";
				M.wrdata(31 downto 16)  <= W(7 downto 0) & W(15 downto 8);
			when "10" =>
				M.byteena <= "0011";
				M.wrdata(15 downto 0) <= W(7 downto 0) & W(15 downto 8);
			when "11" =>
				M.byteena <= "0011";
				M.wrdata(15 downto 0) <= W(7 downto 0) & W(15 downto 8);
			when others =>
			end case;

		elsif op.memtype = MEM_W then

			M.byteena <= "1111";
			M.wrdata <= W(7 downto 0) & W(15 downto 8) & W(23 downto 16) & W(31 downto 24);

		else 
			-- report "ERROR: op.memtype = " & to_string(op.memtype) severity error;
		end if;


		if A(1 downto 0) /= "00" and A(1 downto 0) /= "01" and A(1 downto 0) /= "10" and A(1 downto 0) /= "11" then
			-- report "A = " & to_string(A(1 downto 0)) severity error;
		end if;

	end process;

	table_3_10: process(all)
		variable b0,b1,b2,b3 : std_logic_vector(7 downto 0) := (others => '0');
	begin
		b3 := D.rddata(31 downto 24);
		b2 := D.rddata(23 downto 16);
		b1 := D.rddata(15 downto 8);
		b0 := D.rddata(7 downto 0);

		R <= (others => '0');

		case op.memtype is
		when MEM_B =>
			case A(1 downto 0) is
			when "00" =>
				R(7 downto 0) <= b3;
				R(31 downto 8) <= (others => D.rddata(31));

			when "01" =>
				R(7 downto 0) <= b2;
				R(31 downto 8) <= (others => D.rddata(23));

			when "10" =>
				R(7 downto 0) <= b1;
				R(31 downto 8) <= (others => D.rddata(15));

			when "11" =>
				R(7 downto 0) <= b0;
				R(31 downto 8) <= (others => D.rddata(7));
			when others =>
			end case;


		when MEM_BU =>
			case A(1 downto 0) is
			when "00" =>
				R(7 downto 0) <= b3;
				R(31 downto 8) <= (others => '0');

			when "01" =>
				R(7 downto 0) <= b2;
				R(31 downto 8) <= (others => '0');

			when "10" =>
				R(7 downto 0) <= b1;
				R(31 downto 8) <= (others => '0');

			when "11" =>
				R(7 downto 0) <= b0;
				R(31 downto 8) <= (others => '0');
			when others =>
			end case;

		when MEM_H =>
			case A(1 downto 0) is
			when "00" =>
				R(15 downto 0) <= b2 & b3;
				R(31 downto 16) <= (others => D.rddata(23));

			when "01" =>
				R(15 downto 0) <= b2 & b3;
				R(31 downto 16) <= (others => D.rddata(23));

			when "10" =>
				R(15 downto 0) <= b0 & b1;
				R(31 downto 16) <= (others => D.rddata(7));

			when "11" =>
				R(15 downto 0) <= b0 & b1;
				R(31 downto 16) <= (others => D.rddata(7));
			when others =>
			end case;

		when MEM_HU =>
			case A(1 downto 0) is
			when "00" =>
				R(15 downto 0) <= b2 & b3;
				R(31 downto 16) <= (others => '0');

			when "01" =>
				R(15 downto 0) <= b2 & b3;
				R(31 downto 16) <= (others => '0');

			when "10" =>
				R(15 downto 0) <= b0 & b1;
				R(31 downto 16) <= (others => '0');

			when "11" =>
				R(15 downto 0) <= b0 & b1;
				R(31 downto 16) <= (others => '0');
			when others =>
			end case;

		when MEM_W =>
			R <= b0 & b1 & b2 & b3;

		end case;

	end process;

	XL_table_3_11: process(all)
	begin

		XL <= '0'; -- default value

		if op.memread = '1' then
			if op.memtype = MEM_H then
				if A(1 downto 0) = "01" or A(1 downto 0) = "11" then
					XL <= '1';
				end if;
			elsif op.memtype = MEM_HU then
				if A(1 downto 0) = "01" or A(1 downto 0) = "11" then
					XL <= '1';
				end if;
			elsif op.memtype = MEM_W then
				if A(1 downto 0) = "01" or A(1 downto 0) = "10" or A(1 downto 0) = "11" then
					XL <= '1';
				end if;
			end if;
		end if;
	end process;

	XS_table_3_12: process(all)
	begin
		XS <= '0'; -- default value


		if op.memwrite = '1' then
			if op.memtype = MEM_H then
				if A(1 downto 0) = "01" or A(1 downto 0) = "11" then
					XS <= '1';
				end if;
			elsif op.memtype = MEM_HU then
				if A(1 downto 0) = "01" or A(1 downto 0) = "11" then
					XS <= '1';
				end if;
			elsif op.memtype = MEM_W then
				if A(1 downto 0) = "01" or A(1 downto 0) = "10" or A(1 downto 0) = "11" then
					XS <= '1';
				end if;
			end if;
		end if;
	end process;

end architecture;
