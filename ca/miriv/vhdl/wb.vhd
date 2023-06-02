library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.mem_pkg.all;
use work.core_pkg.all;
use work.op_pkg.all;

entity wb is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- from MEM
		op         : in  wb_op_type;
		aluresult  : in  data_type;
		memresult  : in  data_type;
		pc_old_in  : in  pc_type;

		-- to FWD and DEC
		reg_write  : out reg_write_type
	);
end entity;

architecture rtl of wb is
	constant REG_WR_RESET : reg_write_type := ('0', ZERO_REG, (others => '0'));
	signal reg_write_reg : reg_write_type := REG_WR_RESET;
begin

	logic : process(clk, res_n)
	begin
		if res_n = '0' then
			reg_write_reg <= REG_WR_RESET;
		elsif rising_edge(clk) and stall = '0' then
			case op.src is
				when WBS_ALU => reg_write_reg.data <= aluresult;
				when WBS_MEM => reg_write_reg.data <= memresult;
				when WBS_OPC => reg_write_reg.data <= std_logic_vector(resize(unsigned(pc_old_in) + 4, DATA_WIDTH));
			end case;
		
			reg_write_reg.reg <= op.rd;
			reg_write_reg.write <= op.write;
		end if;
	end process;
	
	reg_write <= reg_write_reg;

end architecture;
