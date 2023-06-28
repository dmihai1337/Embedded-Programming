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
	alias cpu_to_cache : mem_out_type is mem_out_cpu; 
	alias cache_to_cpu : mem_in_type is mem_in_cpu;   
	alias cache_to_mem : mem_out_type is mem_out_mem; 
	alias mem_to_cache : mem_in_type is mem_in_mem;  

	type fsm_state_t is (IDLE, READ_CACHE, READ_MEM_START, READ_MEM, WRITE_BACK_START, WRITE_BACK);

	type state_t is record
		fsm_state : fsm_state_t;
		cpu_to_cache : mem_out_type;
		tag_wb : c_tag_type;
	end record;

	signal state, state_nxt : state_t := (IDLE, MEM_OUT_NOP, (others => '0'));

	signal index : c_index_type;
	signal wr_mgmt, wr_data : std_logic;
	signal byteena : mem_byteena_type;
	signal data_in, data_out : mem_data_type;
	signal valid_in, valid_out, dirty_in, dirty_out, hit : std_logic;
	signal way_out : c_way_type;
	signal tag_out : c_tag_type;
	signal rd : std_logic;
begin

	mgmt_st_inst : entity work.mgmt_st
    generic map(
      	SETS_LD => SETS_LD
    )
    port map(
		clk => clk,
		res_n => res_n,
		index => cpu_to_cache.address(2 downto 0),
		wr => wr_mgmt,
		rd => '0',
		valid_in => valid_in,
		dirty_in => dirty_in,
		tag_in => cpu_to_cache.address(ADDR_WIDTH - 1 downto 3),
		way_out => open,
		valid_out => valid_out,
		dirty_out => dirty_out,
		tag_out => tag_out,
		hit_out => hit
    );

	data_st_inst : entity work.data_st
    generic map(
      	SETS_LD => SETS_LD
    )
    port map(
		clk => clk,
		we => wr_data,
		rd => rd,
		way => (others => '0'),
		index => index,
		byteena => byteena,
		data_in => data_in,
		data_out => data_out
    );

	sync : process(clk, res_n)
	begin
		if res_n = '0' then
			state <= (IDLE, MEM_OUT_NOP, (others => '0'));
		elsif rising_edge(clk) then
			state <= state_nxt;
		end if;
	end process;
	
	logic : process(all)
	begin

		-- DEFAULT VALUES

		state_nxt <= state;
		rd <= '0';
		wr_mgmt <= '0';
		wr_data <= '0';
		valid_in <= '0';
		dirty_in <= '0';
		index <= (others => '0');
		data_in <= (others => '0');
		byteena <= (others => '0');

		cache_to_mem <= MEM_OUT_NOP;
		cache_to_cpu <= MEM_IN_NOP;

		-- HANDLING WRITING TO THE CACHE 

		if cpu_to_cache.wr = '1' then
			if hit = '1' then
				wr_mgmt <= '1';
				wr_data <= '1';
				valid_in <= '1';
				dirty_in <= '1';
				index <= cpu_to_cache.address(2 downto 0);
				byteena <= cpu_to_cache.byteena;
				data_in <= cpu_to_cache.wrdata;
			else
				cache_to_mem <= cpu_to_cache;
			end if;
		end if;

		case state.fsm_state is

			-- HANDLING READ REQUESTS

			when IDLE =>

				if cpu_to_cache.rd = '1' then
					state_nxt.cpu_to_cache <= cpu_to_cache;
					index <= cpu_to_cache.address(2 downto 0);
					rd <= '1';

					cache_to_cpu <= ('1', (others => '0'));

					state_nxt.fsm_state <= READ_CACHE;
				end if;

			when READ_CACHE =>

				if hit = '1' then
					cache_to_cpu <= ('0', data_out);

					state_nxt.fsm_state <= IDLE;
				else
					state_nxt.fsm_state <= READ_MEM_START;
					cache_to_cpu <= ('1', (others => '0'));

					if valid_out = '1' then
						if dirty_out = '1' then
							state_nxt.tag_wb <= tag_out;
							state_nxt.fsm_state <= WRITE_BACK_START;
							rd <= '1';
							index <= cpu_to_cache.address(2 downto 0);
						end if;

						wr_mgmt <= '1';
						valid_in <= '0';
						dirty_in <= '0';
					end if;
				end if;
				
			when READ_MEM_START =>

				cache_to_cpu <= ('1', (others => '0'));
				cache_to_mem <= (state.cpu_to_cache.address, '1', '0', (others => '0'), (others => '0'));

				state_nxt.fsm_state <= READ_MEM;

			when READ_MEM =>

				if mem_to_cache.busy = '0' then
					wr_mgmt <= '1';
					wr_data <= '1';
					valid_in <= '1';
					dirty_in <= '0';
					index <= state.cpu_to_cache.address(2 downto 0);
					byteena <= "1111";
					data_in <= mem_to_cache.rddata;

					state_nxt.fsm_state <= IDLE;

					cache_to_cpu <= ('0', mem_to_cache.rddata);
				else
					cache_to_cpu <= ('1', (others => '0'));
				end if;

			-- HANDLING WRITE_BACK IN CASE OF DIRTY EVICTED MEMORY BLOCK

			when WRITE_BACK_START =>
				
				cache_to_cpu <= ('1', (others => '0'));
				cache_to_mem <= (state.tag_wb & state.cpu_to_cache.address(2 downto 0), '0', '1', "1111", data_out);

				state_nxt.fsm_state <= WRITE_BACK;

			when WRITE_BACK =>

				cache_to_cpu <= ('1', (others => '0'));
					
				if mem_to_cache.busy = '0' then
					state_nxt.fsm_state <= READ_MEM_START;
				end if;

		end case;

		-- CACHE BYPASS FOR DEVICE ACCESS (e.g., UART)

		if (cpu_to_cache.address or ADDR_MASK) /= ADDR_MASK then
			cache_to_mem <= cpu_to_cache; 
			cache_to_cpu <= mem_to_cache; 
			state_nxt <= state;
			rd <= '0';
			wr_mgmt <= '0';
			wr_data <= '0';
			valid_in <= '0';
			dirty_in <= '0';
			index <= (others => '0');
			data_in <= (others => '0');
			byteena <= (others => '0');
	  	end if;

	end process;
end architecture;
