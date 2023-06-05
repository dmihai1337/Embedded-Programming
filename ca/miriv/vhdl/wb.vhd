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
	type reg_t is record
		op : wb_op_type;
		aluresult : data_type;
		memresult : data_type;
		pc_old_in : pc_type;
	end record;

	constant REG_RESET : reg_t := (WB_NOP, (others => '0'), (others => '0'), (others => '0'));
	signal reg : reg_t := REG_RESET;
begin

	sync : process(clk, res_n, stall)
	begin
		if res_n = '0' then
			reg <= REG_RESET;
		elsif rising_edge(clk) then
			if stall = '0' then
				reg.op <= op;
				reg.aluresult <= aluresult;
				reg.memresult <= memresult;
				reg.pc_old_in <= pc_old_in;
			end if;
		end if;
	end process;

	logic : process(all)
	begin
		case reg.op.src is
			when WBS_ALU => reg_write.data <= reg.aluresult;
			when WBS_MEM => 
				if stall = '0' then
					reg_write.data <= memresult;
				else 
					reg_write.data <= reg.memresult;
				end if;
			when WBS_OPC => reg_write.data <= std_logic_vector(resize(unsigned(reg.pc_old_in) + 4, DATA_WIDTH));
		end case;
		reg_write.reg <= reg.op.rd;
		reg_write.write <= reg.op.write;
	end process;

end architecture;
