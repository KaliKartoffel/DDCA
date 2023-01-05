library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.mem_pkg.all;

entity regfile is
	port (
		clk              : in  std_logic;
		res_n            : in  std_logic;
		stall            : in  std_logic;
		rdaddr1, rdaddr2 : in  reg_adr_type; -- 5 bits
		rddata1, rddata2 : out data_type;
		wraddr           : in  reg_adr_type;
		wrdata           : in  data_type;
		regwrite         : in  std_logic
	);
end entity;

architecture rtl of regfile is
	type regs_t is array (natural range <>) of data_type;

	signal regs : regs_t((2**REG_BITS) -1 downto 0):= (others => (others => '0')); -- 2**5 = 32 einträge

	signal l_value1, l_value2 : data_type := (others => '0');
	-- signal l_value1_nxt, l_value2_nxt : data_type := (others => '0');
begin

	main:process(clk, res_n)
	begin

		if res_n = '0' then
			regs <= (others => (others => '0'));
			rddata1 <= (others => '0');
			rddata2 <= (others => '0');
			l_value1 <= (others => '0');
			l_value2 <= (others => '0');


		elsif rising_edge(clk) then
			--report "THIS IS rdaddr1: " & to_string(rdaddr1);
			--report "THIS IS rddata1: " & to_string(regs(to_integer(unsigned(rdaddr1))));
			

			if stall = '1' then
				rddata1 <= l_value1;

			elsif rdaddr1 = "00000" then
				rddata1 <= (others => '0');
				l_value1 <= (others => '0');

			elsif rdaddr1 = wraddr then
				rddata1 <= wrdata;
				l_value1 <= wrdata;
			else
				rddata1 <= regs(to_integer(unsigned(rdaddr1)));
				l_value1 <= regs(to_integer(unsigned(rdaddr1)));
			end if;


			if stall = '1' then
				rddata2 <= l_value2;

			elsif rdaddr2 = "00000" then
				rddata2 <= (others => '0');
				l_value2 <= (others => '0');
			elsif rdaddr2 = wraddr then
				rddata2 <= wrdata;
				l_value2 <= wrdata;
			else
				rddata2 <= regs(to_integer(unsigned(rdaddr2)));
				l_value2 <= regs(to_integer(unsigned(rdaddr2)));
			end if;


			if stall = '0' and regwrite = '1' and wraddr /= "00000" then
				regs(to_integer(unsigned(wraddr))) <= wrdata;
			end if;
		end if;
	end process;
end architecture;
