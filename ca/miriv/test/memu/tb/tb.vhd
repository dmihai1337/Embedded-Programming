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

	type input_t is
	record
		op		: memu_op_type;
		A 		: data_type;
		W 		: data_type;
		D 		: mem_in_type;
	end record;

	type output_t is
	record
		R 		: data_type;
		B 		: std_logic;
		XL		: std_logic;
		XS		: std_logic;
		M		: mem_out_type;
	end record;

	signal inp  : input_t := (
		('0', '0', MEM_B),
		(others => '0'),
		(others => '0'),
		to_mem_in_type("0" & x"00000000")
	);
	signal outp : output_t;

	pure function to_memu_op_type(i : std_logic_vector(4 downto 0)) return memu_op_type is
		variable ofs : natural := 0;
		variable ret : memu_op_type;
	begin
		ret.memread := i(ofs);
		ofs := ofs + 1;
		ret.memwrite := i(ofs);
		ofs := ofs + 1;
		
		case i(ofs + 2 downto ofs) is
			when "000" => ret.memtype := MEM_B;
			when "001" => ret.memtype := MEM_BU;
			when "010" => ret.memtype := MEM_H;
			when "011" => ret.memtype := MEM_HU;
			when "100" => ret.memtype := MEM_W;
			when others => -- invalid
		end case;

		return ret;
	end function;

	pure function to_std_logic_vector(i : memu_op_type) return std_logic_vector is
		variable ofs : natural := 0;
		variable ret : std_logic_vector(4 downto 0);
	begin
		ret(ofs) := i.memread;
		ofs := ofs + 1;
		ret(ofs) := i.memwrite;
		ofs := ofs + 1;
		
		case i.memtype is
			when MEM_B => ret(ofs + 2 downto ofs) := "000";
			when MEM_BU => ret(ofs + 2 downto ofs) := "001";
			when MEM_H => ret(ofs + 2 downto ofs) := "010";
			when MEM_HU => ret(ofs + 2 downto ofs) := "011";
			when MEM_W => ret(ofs + 2 downto ofs) := "100";
			when others => -- invalid
		end case;

		return ret;
	end function;

	impure function read_next_input(file f : text) return input_t is
		variable l : line;
		variable result : input_t;
	begin

		l := get_next_valid_line(f);
		result.op := to_memu_op_type(bin_to_slv(l.all, 5));

		l := get_next_valid_line(f);
		result.A := bin_to_slv(l.all, DATA_WIDTH);

		l := get_next_valid_line(f);
		result.W := bin_to_slv(l.all, DATA_WIDTH);

		l := get_next_valid_line(f);
		result.D := to_mem_in_type(bin_to_slv(l.all, mem_in_range_type'high + 1));

		return result;
	end function;

	impure function read_next_output(file f : text) return output_t is
		variable l : line;
		variable result : output_t;
	begin

		l := get_next_valid_line(f);
		result.R := bin_to_slv(l.all, DATA_WIDTH);

		l := get_next_valid_line(f);
		result.B := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.XL := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.XS := str_to_sl(l(1));

		l := get_next_valid_line(f);
		result.M := to_mem_out_type(bin_to_slv(l.all, mem_out_range_type'high + 1));

		return result;
	end function;

	procedure check_output(output_ref : output_t) is
		variable passed : boolean;
	begin
		passed := (outp = output_ref);

		if passed then
			report " PASSED: "
			& "op="     	& to_string(to_std_logic_vector(inp.op))
			& " A="  		& to_string(inp.A)
			& " W=" 		& to_string(inp.W)
			& " D="   		& to_string(to_std_logic_vector(inp.D)) & lf
			severity note;
		else
			report "FAILED: "
			& "op="     	& to_string(to_std_logic_vector(inp.op))
			& " A="  		& to_string(inp.A)
			& " W=" 		& to_string(inp.W)
			& " D="   		& to_string(to_std_logic_vector(inp.D)) & lf
			& "**     expected: R=" 		& to_string(to_std_logic_vector(output_ref.R)) & lf
			& "**               B=" 		& to_string(output_ref.B) & lf
			& "**               XL=" 		& to_string(output_ref.XL) & lf
			& "**               XS=" 		& to_string(output_ref.XS) & lf
			& "**               M=" 		& to_string(to_std_logic_vector(output_ref.M)) & lf
			& "**     actual:   R=" 		& to_string(to_std_logic_vector(outp.R)) & lf
			& "**               B=" 		& to_string(outp.B) & lf
			& "**               XL=" 		& to_string(outp.XL) & lf
			& "**               XS=" 		& to_string(outp.XS) & lf
			& "**               M=" 		& to_string(to_std_logic_vector(outp.M)) & lf
			severity error;
		end if;
	end procedure;

begin

	memu_inst : entity work.memu
	port map (
		op 		=> inp.op,
		A 		=> inp.A,
		W 		=> inp.W,
		D 		=> inp.D,
		R 		=> outp.R,
		B 		=> outp.B,
		XL 		=> outp.XL,
		XS 		=> outp.XS,
		M		=> outp.M
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
