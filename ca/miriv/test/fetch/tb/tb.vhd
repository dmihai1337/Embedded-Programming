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
		pcsrc     : std_logic;
		pc_in     : pc_type;
		mem_in    : mem_in_type;
	end record;

	type output_t is
	record
		mem_busy  : std_logic;
		pc_out    : pc_type;
		instr     : instr_type;
		mem_out   : mem_out_type;
	end record;

	signal inp  : input_t := (
		'0',
		'0',
		'0',
		(others => '0'),
		to_mem_in_type("0" & x"00000000")
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
		result.pcsrc := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.pc_in := bin_to_slv(l.all, PC_WIDTH);

		l := get_next_valid_line(f);
		result.mem_in := to_mem_in_type(bin_to_slv(l.all, mem_in_range_type'high + 1));

		return result;
	end function;

	impure function read_next_output(file f : text) return output_t is
		variable l : line;
		variable result : output_t;
	begin
		l := get_next_valid_line(f);
		result.mem_busy := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.pc_out := bin_to_slv(l.all, PC_WIDTH);

		l := get_next_valid_line(f);
		result.instr := bin_to_slv(l.all, INSTR_WIDTH);

		l := get_next_valid_line(f);
		result.mem_out := to_mem_out_type(bin_to_slv(l.all, mem_out_range_type'high + 1));

		return result;
	end function;

	procedure check_output(output_ref : output_t) is
		variable passed : boolean;
	begin
		passed := (outp = output_ref);

		if passed then
			report " PASSED: "
			& " stall="     & to_string(inp.stall)
			& " flush="     & to_string(inp.flush)
			& " pcsrc="     & to_string(inp.pcsrc)
			& " pc_in="     & to_string(inp.pc_in)
			& " mem_in="    & to_string(to_std_logic_vector(inp.mem_in)) & lf
			severity note;
		else
			report "FAILED: "
			& " stall="     & to_string(inp.stall)
			& " flush="     & to_string(inp.flush)
			& " pcsrc="     & to_string(inp.pcsrc)
			& " pc_in="     & to_string(inp.pc_in)
			& " mem_in="    & to_string(to_std_logic_vector(inp.mem_in)) & lf
			& "**     expected: mem_busy="      & to_string(output_ref.mem_busy) & lf
			& "**               pc_out="        & to_string(output_ref.pc_out) & lf
			& "**               instr="         & to_string(output_ref.instr) & lf
			& "**               mem_out="       & to_string(to_std_logic_vector(output_ref.mem_out)) & lf
			& "**     actual:   mem_busy="      & to_string(outp.mem_busy) & lf
			& "**               pc_out="        & to_string(outp.pc_out) & lf
			& "**               instr="         & to_string(outp.instr) & lf
			& "**               mem_out="       & to_string(to_std_logic_vector(outp.mem_out)) & lf
			severity error;
		end if;
	end procedure;

begin

	fetch_inst : entity work.fetch
	port map (
		clk       => clk,
		res_n     => res_n,
		stall     => inp.stall,
		flush     => inp.flush,
		mem_busy  => outp.mem_busy,
		pcsrc     => inp.pcsrc,
		pc_in     => inp.pc_in,
		pc_out    => outp.pc_out,
		instr     => outp.instr,
		mem_out   => outp.mem_out,
		mem_in    => inp.mem_in
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
