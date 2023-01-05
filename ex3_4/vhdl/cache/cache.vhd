library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

use work.mem_pkg.all;
use work.cache_pkg.all;

entity cache is
	generic (
		SETS_LD   : natural          := SETS_LD;
		WAYS_LD   : natural          := WAYS_LD;
		ADDR_MASK : mem_address_type := (others => '1')
	);
	port (
		clk   : in std_logic;
		res_n : in std_logic;

		mem_out_cpu : in  mem_out_type;
		mem_in_cpu  : out mem_in_type;
		mem_out_mem : out mem_out_type;
		mem_in_mem  : in  mem_in_type
	);
end entity;

architecture bypass of cache is --bypass cache for exIII and testing
	alias cpu_to_cache : mem_out_type is mem_out_cpu; 
	alias cache_to_cpu : mem_in_type is mem_in_cpu;   
	alias cache_to_mem : mem_out_type is mem_out_mem; 
	alias mem_to_cache : mem_in_type is mem_in_mem;   
begin
	cache_to_mem <= cpu_to_cache; 
	cache_to_cpu <= mem_to_cache; 
end architecture;

architecture impl of cache is
	type state_t is (IDLE, READ_CACHE, READ_MEM_START, READ_MEM, WRITE_BACK_START, WRITE_BACK);
	signal state, state_nxt : state_t := IDLE;
begin
	sync: process(clk, res_n)
	begin
		if res_n = '0' then
			state <= IDLE;

		elsif rising_edge(clk) then
			state <= state_nxt;

		end if;
	end process;

	logical_stuff: process(all)
	begin

		state_nxt <= state;

		case state is
		when IDLE =>
			-- No memory operation ongoing (i.e., no memory request from the processor).

		when READ_CACHE =>
			-- Read access to the cache.
		
		when READ_MEM_START =>
			-- First cycle of the memory read (assert the read line to the memory).
		
		when READ_MEM =>
			-- Waiting for the memory request to nish and write the result in the cache.
		
		when WRITE_BACK_START =>
			-- First cycle of the memory write if the evicted cache location was dirty.
		
		when WRITE_BACK =>
			-- Finishing the write operation.
		
		when others =>
		end case;

	end process;

end architecture;
