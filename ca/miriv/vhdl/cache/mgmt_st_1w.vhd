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
		we_repl	: in std_logic; --ignored for this implementation

		mgmt_info_in  : in c_mgmt_info;
		mgmt_info_out : out c_mgmt_info
	);
end entity;

architecture impl of mgmt_st_1w is
	type mgmt_info_array_t is array (natural range<>) of c_mgmt_info;

	signal mgmt_info : mgmt_info_array_t(sets_range);
begin

	mgmt_st_1w_sync : process(clk, res_n)
	begin
		if res_n = '0' then
			mgmt_info <= (others => (tag => (others => '0'), others => '0'));
		elsif rising_edge(clk) then
			if we = '1' then
				mgmt_info(to_integer(unsigned(index))) <= mgmt_info_in;
			end if;
		end if;
	end process;

	mgmt_st_1w_logic : process(all)
	begin
		mgmt_info_out <= mgmt_info(to_integer(unsigned(index)));
	end process;
end architecture;
