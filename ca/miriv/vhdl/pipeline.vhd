library ieee;
use ieee.std_logic_1164.all;

use work.core_pkg.all;
use work.mem_pkg.all;
use work.op_pkg.all;

entity pipeline is
	port (
		clk    : in  std_logic;
		res_n  : in  std_logic;

		-- instruction interface
		mem_i_out    : out mem_out_type;
		mem_i_in     : in  mem_in_type;

		-- data interface
		mem_d_out    : out mem_out_type;
		mem_d_in     : in  mem_in_type
	);
end entity;

architecture impl of pipeline is
	signal stall : std_logic;
	signal flush : std_logic;

	signal fetch_busy : std_logic;
	signal mem_busy : std_logic;

	-- ctrl out signals
	signal ctrl_stall_dec : std_logic;
	signal ctrl_stall_exec : std_logic;
	signal ctrl_stall_fetch : std_logic;
	signal ctrl_stall_mem : std_logic;
	signal ctrl_stall_wb : std_logic;

	signal ctrl_flush_dec : std_logic;
	signal ctrl_flush_exec : std_logic;
	signal ctrl_flush_fetch : std_logic;
	signal ctrl_flush_mem : std_logic;
	signal ctrl_flush_wb : std_logic;

	-- fetch out signals
	signal fetch_decode_pc : pc_type;
	signal fetch_decode_instr : instr_type;

	-- decode out signals
	signal decode_exec_pc : pc_type;
	signal decode_exec_op : exec_op_type;
	signal decode_exec_mem_op : mem_op_type;
	signal decode_exec_wb_op : wb_op_type;

	-- exec out signals
	signal exec_mem_pc_old : pc_type;
	signal exec_mem_pc_new : pc_type;
	signal exec_mem_aluresult : data_type;
	signal exec_mem_wrdata : data_type;
	signal exec_mem_zero : std_logic;
	signal exec_mem_op : mem_op_type;
	signal exec_mem_wbop : wb_op_type;

	-- mem out signals
	signal mem_fetch_pc_new : pc_type;
	signal mem_fetch_pcsrc : std_logic;
	signal mem_wb_op : wb_op_type;
	signal mem_wb_pc_old : pc_type;
	signal mem_wb_aluresult : data_type;
	signal mem_wb_memresult : data_type;
	signal mem_reg_write : reg_write_type;

	-- writeback out signals
	signal wb_decode_reg_write : reg_write_type;

begin
	flush <= '0';
	stall <= fetch_busy or mem_busy;

	ctrl_inst : entity work.ctrl
	port map (
		clk => clk,
		res_n => res_n,
		stall => stall,
		-- stage stalls
		stall_fetch => ctrl_stall_fetch,
		stall_dec => ctrl_stall_dec,
		stall_exec => ctrl_stall_exec,
		stall_mem => ctrl_stall_mem,
		stall_wb => ctrl_stall_wb,
		-- stage flushes
		flush_fetch => ctrl_flush_fetch,
		flush_dec => ctrl_flush_dec,
		flush_exec => ctrl_flush_exec,
		flush_mem => ctrl_flush_mem,
		flush_wb => ctrl_flush_wb,

		-- from FWD
		wb_op_exec => exec_mem_wbop,
		exec_op_dec => decode_exec_op,

		pcsrc_in => mem_fetch_pcsrc,
		pcsrc_out => open
	);

	fetch_inst : entity work.fetch
	port map (
		clk => clk,
		res_n => res_n,
		stall => ctrl_stall_fetch,
		flush => ctrl_flush_fetch,
		-- to ctrl
		mem_busy => fetch_busy,
		-- from mem
		pcsrc => mem_fetch_pcsrc,
		pc_in => mem_fetch_pc_new,
		-- to decode
		pc_out => fetch_decode_pc,
		instr => fetch_decode_instr,
		-- to external IMEM
		mem_out => mem_i_out, 
		mem_in => mem_i_in
	);

	decode_inst : entity work.decode
	port map (
		clk => clk,
		res_n => res_n,
		stall => ctrl_stall_dec,
		flush => ctrl_flush_dec,
		-- from fetch
		pc_in => fetch_decode_pc,
		instr => fetch_decode_instr,
		-- from writeback
		reg_write => wb_decode_reg_write,
		-- to exec
		pc_out => decode_exec_pc,
		exec_op => decode_exec_op,
		mem_op => decode_exec_mem_op,
		wb_op => decode_exec_wb_op,
		exc_dec => open
	);

	execute_inst : entity work.exec
	port map (
		clk => clk,
		res_n => res_n,
		stall => ctrl_stall_exec,
		flush => ctrl_flush_exec,
		-- from decode
		op => decode_exec_op,
		pc_in => decode_exec_pc,
		memop_in => decode_exec_mem_op,
		wbop_in => decode_exec_wb_op,
		-- to mem
		pc_old_out => exec_mem_pc_old,
		pc_new_out => exec_mem_pc_new,
		aluresult => exec_mem_aluresult,
		wrdata => exec_mem_wrdata,
		zero => exec_mem_zero,
		memop_out => exec_mem_op,
		wbop_out => exec_mem_wbop,
		-- fwd
		exec_op => open,
		reg_write_mem => mem_reg_write,
		reg_write_wr => wb_decode_reg_write
	);

	memory_inst : entity work.mem
	port map (
		clk => clk,
		res_n => res_n,
		stall => ctrl_stall_mem,
		flush => ctrl_flush_mem,
		-- to ctrl
		mem_busy => mem_busy,
		-- from exec
		mem_op => exec_mem_op,
		wbop_in => exec_mem_wbop,
		pc_new_in => exec_mem_pc_new,
		pc_old_in => exec_mem_pc_old,
		aluresult_in => exec_mem_aluresult,
		wrdata => exec_mem_wrdata,
		zero => exec_mem_zero,
		-- to exec (fwd)
		reg_write => mem_reg_write,
		-- to fetch
		pc_new_out => mem_fetch_pc_new,
		pcsrc => mem_fetch_pcsrc,
		-- to writeback 
		wbop_out => mem_wb_op,
		pc_old_out => mem_wb_pc_old,
		aluresult_out => mem_wb_aluresult,
		memresult => mem_wb_memresult,
		-- to external DMEM
		mem_out => mem_d_out,
		mem_in => mem_d_in,
		-- exceptions
		exc_load => open,
		exc_store => open
	);

	writeback_inst : entity work.wb
	port map (
		clk => clk,
		res_n => res_n,
		stall => ctrl_stall_wb,
		flush => ctrl_flush_wb,
		-- from mem
		op => mem_wb_op,
		aluresult => mem_wb_aluresult,
		memresult => mem_wb_memresult,
		pc_old_in => mem_wb_pc_old,
		-- to decode and fwd
		reg_write => wb_decode_reg_write
	);

end architecture;
