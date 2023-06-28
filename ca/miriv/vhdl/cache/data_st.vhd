library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pkg.all;
use work.cache_pkg.all;
use work.single_clock_rw_ram_pkg.all;

entity data_st is
	generic (
		SETS_LD  : natural := SETS_LD;
		WAYS_LD  : natural := WAYS_LD
	);
	port (
		clk        : in std_logic;

		we         : in std_logic;
		rd         : in std_logic;
		way        : in c_way_type;
		index      : in c_index_type;
		byteena    : in mem_byteena_type;

		data_in    : in mem_data_type;
		data_out   : out mem_data_type
);
end entity;

architecture impl of data_st is

	-- have to wait for a clock cycle before reading in order for the address register of the RAM unit 
	-- to update to the value of the input read address, i.e. index

	type data_in_filtered_array is array(3 downto 0) of std_logic_vector(7 downto 0);
	type data_out_filtered_array is array(3 downto 0) of std_logic_vector(7 downto 0);
	type we_filtered_array is array(3 downto 0) of std_logic;

	signal data_in_filtered : data_in_filtered_array := (others => (others => '0'));
	signal data_out_filtered : data_out_filtered_array := (others => (others => '0'));
	signal we_filtered : we_filtered_array := (others => '0');
	signal rd_filtered, rd_filtered_next : std_logic := '0';
begin

	gen : for i in 0 to 3 generate
		single_clock_rw_ram_inst : entity work.single_clock_rw_ram(rtl)
		generic map (
			ADDR_WIDTH     => INDEX_SIZE,
			DATA_WIDTH     => DATA_WIDTH / 4
		)
		port map (
			clk            => clk,
			data_in        => data_in_filtered(i),
			write_address  => index,
			read_address   => index,
			we             => we_filtered(i),
			data_out       => data_out_filtered(i)
		);
	end generate;

	read_at_next_cycle : process(clk)
	begin
		if rising_edge(clk) then
			rd_filtered <= rd_filtered_next;
		end if;
	end process;

	logic : process(all)
	begin

		data_in_filtered <= (others => (others => '0'));
		we_filtered <= (others => '0');

		-- READ CONTROL
		if rd = '1' then
			rd_filtered_next <= '1';
		else
			rd_filtered_next <= '0';
		end if;

		if rd_filtered = '1' then
			data_out <= data_out_filtered(0) & data_out_filtered(1) & data_out_filtered(2) & data_out_filtered(3);
		else
			data_out <= (others => '0');
		end if;

		-- WRITE CONTROL
		if we = '1' then
			case byteena is
				when "0001" => 
					data_in_filtered(3) <= data_in(7 downto 0);
					we_filtered(3) <= '1';
				when "0010" => 
					data_in_filtered(2) <= data_in(15 downto 8);
					we_filtered(2) <= '1';
				when "0100" => 
					data_in_filtered(1) <= data_in(23 downto 16);
					we_filtered(1) <= '1';
				when "1000" => 
					data_in_filtered(0) <= data_in(31 downto 24);
					we_filtered(0) <= '1';
				when "1100" => 
					data_in_filtered(0) <= data_in(31 downto 24);
					data_in_filtered(1) <= data_in(23 downto 16);
					we_filtered(0) <= '1';
					we_filtered(1) <= '1';
				when "0011" => 
					data_in_filtered(2) <= data_in(15 downto 8);
					data_in_filtered(3) <= data_in(7 downto 0);
					we_filtered(2) <= '1';
					we_filtered(3) <= '1';
				when "1111" =>
					data_in_filtered(0) <= data_in(31 downto 24);
					data_in_filtered(1) <= data_in(23 downto 16);
					data_in_filtered(2) <= data_in(15 downto 8);
					data_in_filtered(3) <= data_in(7 downto 0);
					we_filtered(0) <= '1';
					we_filtered(1) <= '1';
					we_filtered(2) <= '1';
					we_filtered(3) <= '1';
				when others => -- invalid
			end case;
		else
			we_filtered <= (others => '0');
		end if;
	end process;
end architecture;
