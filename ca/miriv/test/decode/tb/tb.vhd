library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std; -- for Printing
use std.textio.all;

use work.mem_pkg.all;
use work.op_pkg.all;
use work.core_pkg.all;
use work.tb_util_pkg.all;

entity tb is
end entity;

architecture bench of tb is
	constant CLK_PERIOD : time := 10 ns;

	signal clk : std_logic;
	signal res_n : std_logic := '0';
	signal stop : boolean := false;
	
	file input_file : text;
	file output_ref_file : text;

	subtype addr is std_logic_vector(REG_BITS-1 downto 0);
	subtype data is std_logic_vector(DATA_WIDTH-1 downto 0);

	type input_t is
	record
		stall     : std_logic;
		flush     : std_logic;
		pc_in     : pc_type;
		instr     : instr_type;
		reg_write : reg_write_type;
	end record;

	constant REG_WRITE_ZERO : reg_write_type := (
		write => '0',
		reg => ZERO_REG,
		data => ZERO_DATA
	);

	type output_t is
	record
		pc_out    : pc_type;
		exec_op   : exec_op_type;
		mem_op    : mem_op_type;
		wb_op     : wb_op_type;
		exc_dec  : std_logic;
	end record;

	signal inp  : input_t := (
		'0',
		'0',
		(others => '0'),
		(others => '0'),
		REG_WRITE_ZERO
	);
	signal outp : output_t;

	impure function read_next_input(file f : text) return input_t is
		variable l : line;
		variable result : input_t;
	begin
		l := get_next_valid_line(f);
		result.stall := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.flush := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.pc_in := bin_to_slv(l.all, pc_type'length);

		l := get_next_valid_line(f);
		result.instr := bin_to_slv(l.all, instr_type'length);

		l := get_next_valid_line(f);
		result.reg_write.write := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.reg_write.reg := bin_to_slv(l.all, reg_adr_type'length);

		l := get_next_valid_line(f);
		result.reg_write.data := bin_to_slv(l.all, data_type'length);

		return result;
	end function;

	impure function str_to_branch_type(str : string) return branch_type is
	begin
		if str = "BR_NOP" then
			return BR_NOP;
		elsif str = "BR_BR" then
			return BR_BR;
		elsif str = "BR_CND" then
			return BR_CND;
		elsif str = "BR_CNDI" then
			return BR_CNDI;
		else
			-- This shouldn't happen
			report "Unknown op-code '" & str & "' -- defaulting to WBS_ALU" severity warning;
			return BR_NOP;
		end if;
	end function;

	impure function read_next_output(file f : text) return output_t is
		variable l : line;
		variable result : output_t;
	begin
		l := get_next_valid_line(f);
		result.pc_out := bin_to_slv(l.all, pc_type'length);

		l := get_next_valid_line(f);
		result.exec_op.aluop := str_to_alu_op(l.all);
		l := get_next_valid_line(f);
		result.exec_op.alusrc1 := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.exec_op.alusrc2 := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.exec_op.alusrc3 := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.exec_op.rs1 := bin_to_slv(l.all, reg_adr_type'length);
		l := get_next_valid_line(f);
		result.exec_op.rs2 := bin_to_slv(l.all, reg_adr_type'length);
		l := get_next_valid_line(f);
		result.exec_op.readdata1 := bin_to_slv(l.all, data_type'length);
		l := get_next_valid_line(f);
		result.exec_op.readdata2 := bin_to_slv(l.all, data_type'length);
		l := get_next_valid_line(f);
		result.exec_op.imm := bin_to_slv(l.all, data_type'length);
		
		l := get_next_valid_line(f);
		result.mem_op.branch := str_to_branch_type(l.all);
		l := get_next_valid_line(f);
		result.mem_op.mem.memread := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.mem_op.mem.memwrite := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.mem_op.mem.memtype := str_to_mem_op(l.all);

		l := get_next_valid_line(f);
		result.wb_op.rd := bin_to_slv(l.all, reg_adr_type'length);
		l := get_next_valid_line(f);
		result.wb_op.write := str_to_sl(l(1));
		l := get_next_valid_line(f);
		result.wb_op.src := str_to_wbs_op(l.all);

		l := get_next_valid_line(f);
		result.exc_dec := str_to_sl(l(1));

		return result;
	end function;

	procedure check_output(output_ref : output_t) is
		variable passed : boolean;

		function to_string(val : exec_op_type) return string is
		begin
			return "[aluop=" & to_string(val.aluop) & ",alusrc1="
			& to_string(val.alusrc1) & ",alusrc2="
			& to_string(val.alusrc2) & ",alusrc3="
			& to_string(val.alusrc3) & ",rs1="
			& to_string(val.rs1) & ",rs2="
			& to_string(val.rs2) & ",readdata1="
			& to_string(val.readdata1) & ",readdata2="
			& to_string(val.readdata2) & ",imm="
			& to_string(val.imm)
			& "]";
		end function;

		function to_string(val : mem_op_type) return string is
		begin
			return "[branch=" & to_string(val.branch)
			& ", mem.memread=" & to_string(val.mem.memread)
			& ", mem.memwrite=" & to_string(val.mem.memwrite)
			& ", mem.memtype=" & to_string(val.mem.memtype) & "]";
		end function;

		function to_string(val : wb_op_type) return string is
		begin
			return "[rd=" & to_string(val.rd)
			& ", write=" & to_string(val.write)
			& ", src=" & to_string(val.src) & "]";
		end function;
	begin
		passed := (outp = output_ref);

		if passed then
			report " PASSED: "
			& "stall="     & to_string(inp.stall)
			& " flush="  & to_string(inp.flush)
			& " pc_in="  & to_string(inp.pc_in)
			& " instr="   & to_string(inp.instr) & lf
			severity note;
		else
			report "FAILED: "
			& "stall="     & to_string(inp.stall)
			& " flush="  & to_string(inp.flush)
			& " pc_in="  & to_string(inp.pc_in)
			& " instr="   & to_string(inp.instr) & lf
			& "**     expected: pc_out=" & to_string(output_ref.pc_out) & lf
			& "**        exec_op=" & to_string(output_ref.exec_op) & lf
			& "**        mem_op=" & to_string(output_ref.mem_op) & lf
			& "**        wb_op=" & to_string(output_ref.wb_op) & lf
			& "**        exc_dec=" & to_string(output_ref.exc_dec) & lf
			& "**     actual:   pc_out=" & to_string(outp.pc_out) & lf
			& "**        exec_op=" & to_string(outp.exec_op) & lf
			& "**        mem_op=" & to_string(outp.mem_op) & lf
			& "**        wb_op=" & to_string(outp.wb_op) & lf
			& "**        exc_dec=" & to_string(outp.exc_dec) & lf
			severity error;
		end if;
	end procedure;

begin

	uut : entity work.decode
	port map (
		clk       => clk,
		res_n     => res_n,
		stall     => inp.stall,
		flush     => inp.flush,
		pc_in     => inp.pc_in,
		instr     => inp.instr,

		reg_write => inp.reg_write,

		pc_out    => outp.pc_out,
		exec_op   => outp.exec_op,
		mem_op    => outp.mem_op,
		wb_op     => outp.wb_op,
		exc_dec  => outp.exc_dec
	);

	stimulus : process
		variable fstatus: file_open_status;
	begin
		res_n <= '0';
		wait until rising_edge(clk);
		res_n <= '1';
		
		file_open(fstatus, input_file, "testdata/input.txt", READ_MODE);
		
		timeout(1, CLK_PERIOD);

		while not endfile(input_file) loop
			inp <= read_next_input(input_file);
			timeout(1, CLK_PERIOD);
		end loop;
		
		wait;
	end process;

	output_checker : process
		variable fstatus: file_open_status;
		variable output_ref : output_t;
	begin
		file_open(fstatus, output_ref_file, "testdata/output.txt", READ_MODE);

		wait until res_n = '1';
		timeout(1, CLK_PERIOD);

		while not endfile(output_ref_file) loop
			output_ref := read_next_output(output_ref_file);

			wait until falling_edge(clk);
			check_output(output_ref);
			wait until rising_edge(clk);
		end loop;
		stop <= true;
		
		wait;
	end process;

	generate_clk : process
	begin
		clk_generate(clk, CLK_PERIOD, stop);
		wait;
	end process;

end architecture;
