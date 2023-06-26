library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;

entity regfile is
	port (
		clk              : in  std_logic;
		res_n            : in  std_logic;
		stall            : in  std_logic;
		rdaddr1, rdaddr2 : in  reg_adr_type;
		rddata1, rddata2 : out data_type;
		wraddr           : in  reg_adr_type;
		wrdata           : in  data_type;
		regwrite         : in  std_logic
	);
end entity;

architecture rtl of regfile is
	type regfile_registers_t is array (natural range <>) of data_type;

	signal regfile : regfile_registers_t(0 to REG_COUNT-1);

	-- Address Registers
	signal rdaddr1_sync : natural range 0 to REG_COUNT-1;
	signal rdaddr2_sync : natural range 0 to REG_COUNT-1; 
begin

	regfile_sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			regfile <= (others => (others => '0'));
			rdaddr1_sync <= 0;
			rdaddr2_sync <= 0;
		elsif rising_edge(clk) then
			if stall = '0' then
				rdaddr1_sync <= to_integer(unsigned(rdaddr1));
				rdaddr2_sync <= to_integer(unsigned(rdaddr2));
			end if;

			-- FWD: Allow writing during stall
			if regwrite = '1' and wraddr /= ZERO_REG then
				regfile(to_integer(unsigned(wraddr))) <= wrdata;
			end if;
		end if;
	end process;

	regfile_logic : process(all)
	begin
		rddata1 <= regfile(rdaddr1_sync);
		rddata2 <= regfile(rdaddr2_sync);

		if stall = '0' and regwrite = '1' and wraddr /= ZERO_REG then
			if to_integer(unsigned(wraddr)) = rdaddr1_sync then
				rddata1 <= wrdata;
			end if;
			if to_integer(unsigned(wraddr)) = rdaddr2_sync then
				rddata2 <= wrdata;
			end if;
		end if;
	end process;


end architecture;
