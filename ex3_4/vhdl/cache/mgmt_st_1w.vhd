library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pkg.all;
use work.cache_pkg.all;

entity mgmt_st_1w is
	generic (
		SETS_LD  : natural := SETS_LD
	);
	port (
		clk     : in std_logic;
		res_n   : in std_logic;

		index   : in c_index_type;
		we      : in std_logic;
		we_repl	: in std_logic;

		mgmt_info_in  : in c_mgmt_info;
		mgmt_info_out : out c_mgmt_info
	);
end entity;

architecture impl of mgmt_st_1w is
	type MGMT_T is array ((2**SETS_LD)-1 downto 0) of c_mgmt_info;
	signal mgmt : MGMT_T;
	signal index_reg : c_index_type := (others => '0');


begin

	main: process(res_n, clk)
	begin
		if res_n = '0' then
			mgmt <= (others => C_MGMT_NOP);
			index_reg <= (others => '0');

		elsif rising_edge(clk) then
			if we = '1' then
				mgmt(to_integer(unsigned(index))) <= mgmt_info_in;
			end if;

			index_reg <= index;
		end if;
	end process;

	mgmt_info_out <= mgmt(to_integer(unsigned(index_reg)));


end architecture;
