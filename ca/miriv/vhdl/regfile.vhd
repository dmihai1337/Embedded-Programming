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
begin

	logic : process(clk, res_n, stall)
	begin
		if (res_n = '0') then
			regfile <= (others => (others => '0'));
		elsif rising_edge(clk) and stall = '0' then
			rddata1 <= regfile(to_integer(unsigned(rdaddr1)));
			rddata2 <= regfile(to_integer(unsigned(rdaddr2)));

			if wraddr /= ZERO_REG then
				regfile(to_integer(unsigned(wraddr))) <= wrdata;

				if regwrite = '1' then
					if wraddr = rdaddr1 then
						rddata1 <= wrdata;
					end if;
					if wraddr = rdaddr2 then
						rddata2 <= wrdata;
					end if;
				end if;
			end if;
		end if;
	end process;

end architecture;
