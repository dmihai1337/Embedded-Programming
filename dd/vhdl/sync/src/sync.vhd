library ieee;
use ieee.std_logic_1164.all;


entity sync is
	generic (
		-- number of stages in the input synchronizer
		SYNC_STAGES : integer range 2 to integer'high;
		-- reset value of the output signal
		RESET_VALUE : std_logic
	);
	port (
		clk   : in std_logic;
		res_n : in std_logic;

		data_in   : in std_logic;
		data_out  : out std_logic
	);
end entity;


architecture beh of sync is
	-- synchronizer stages
	signal sync_vec : std_logic_vector(1 to SYNC_STAGES);
begin
	sync_proc : process(clk, res_n)
	begin
		if res_n = '0' then
			sync_vec <= (others => RESET_VALUE);
		elsif rising_edge(clk) then
			sync_vec(1) <= data_in; -- get new data
			-- forward data to next synchronizer stage
			for i in 2 to SYNC_STAGES loop
				sync_vec(i) <= sync_vec(i - 1);
			end loop;
		end if;
	end process;

	-- output synchronized data
	data_out <= sync_vec(SYNC_STAGES);
end architecture;
