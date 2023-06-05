library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.op_pkg.all;
use work.core_pkg.all;
use work.mem_pkg.all;

entity mem is
	port (
		clk           : in  std_logic;
		res_n         : in  std_logic;
		stall         : in  std_logic;
		flush         : in  std_logic;

		-- to Ctrl
		mem_busy      : out std_logic;

		-- from EXEC
		mem_op        : in  mem_op_type;
		wbop_in       : in  wb_op_type;
		pc_new_in     : in  pc_type;
		pc_old_in     : in  pc_type;
		aluresult_in  : in  data_type;
		wrdata        : in  data_type;
		zero          : in  std_logic;

		-- to EXEC (forwarding)
		reg_write     : out reg_write_type;

		-- to FETCH
		pc_new_out    : out pc_type;
		pcsrc         : out std_logic;

		-- to WB
		wbop_out      : out wb_op_type;
		pc_old_out    : out pc_type;
		aluresult_out : out data_type;
		memresult     : out data_type;

		-- memory controller interface
		mem_out       : out mem_out_type;
		mem_in        : in  mem_in_type;

		-- exceptions
		exc_load      : out std_logic;
		exc_store     : out std_logic
	);
end entity;

architecture rtl of mem is

	type reg_t is record
		mem_op : mem_op_type;
		wbop : wb_op_type;
		pc_new : pc_type;
		pc_old : pc_type;
		aluresult : data_type;
		zero : std_logic;
		mem_in : mem_in_type;
		wrdata : data_type;
	end record;

	constant REG_RESET : reg_t := (MEM_NOP, WB_NOP, ZERO_PC, ZERO_PC, (others => '0'), 
	                              '0', MEM_IN_NOP, (others => '0'));

	signal reg : reg_t;
begin

	memu_inst : entity work.memu(rtl)
	port map (
		op     => reg.mem_op.mem,
		A      => reg.aluresult,
		W      => reg.wrdata,
		R      => memresult,

		B      => mem_busy,
		XL     => exc_load,
		XS     => exc_store,

		-- to memory controller
		D      => reg.mem_in,
		M      => mem_out
	);

	logic : process(clk, res_n)
	begin
		if res_n = '0' then
			reg <= REG_RESET;
		elsif rising_edge(clk) then
			if stall = '0'then
				reg.pc_new <= pc_new_in;
				reg.pc_old <= pc_old_in;
				reg.aluresult <= aluresult_in;
				reg.zero <= zero;
				reg.mem_in <= mem_in;
				reg.wrdata <= wrdata;

				if flush = '0' then
					reg.mem_op <= mem_op;
					reg.wbop <= wbop_in;
				else
					reg.mem_op <= MEM_NOP;
					reg.wbop <= WB_NOP;
				end if;
			else
				reg.mem_op.mem.memwrite <= '0';
				reg.mem_op.mem.memread <= '0';

				if flush = '1' then
					reg.mem_op <= MEM_NOP;
					reg.wbop <= WB_NOP;
				end if;
			end if;
		end if;
	end process;

	pcsrc <= '1' when ((reg.mem_op.branch = BR_CND) and reg.zero = '1') or  
					  ((reg.mem_op.branch = BR_CNDI) and reg.zero = '0') or 
					  reg.mem_op.branch = BR_BR else '0';
	wbop_out <= reg.wbop;
	pc_new_out <= reg.pc_new;
	pc_old_out <= reg.pc_old;
	aluresult_out <= reg.aluresult;
	reg_write <= ('0', (others => '0'), (others => '0'));

end architecture;
