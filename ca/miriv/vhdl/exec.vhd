library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;

entity exec is
	port (
		clk           : in  std_logic;
		res_n         : in  std_logic;
		stall         : in  std_logic;
		flush         : in  std_logic;

		-- from DEC
		op            : in  exec_op_type;
		pc_in         : in  pc_type;

		-- to MEM
		pc_old_out    : out pc_type;
		pc_new_out    : out pc_type;
		aluresult     : out data_type;
		wrdata        : out data_type;
		zero          : out std_logic;

		memop_in      : in  mem_op_type;
		memop_out     : out mem_op_type;
		wbop_in       : in  wb_op_type;
		wbop_out      : out wb_op_type;

		-- FWD
		exec_op       : out exec_op_type;
		reg_write_mem : in  reg_write_type;
		reg_write_wr  : in  reg_write_type
	);
end entity;

architecture rtl of exec is
	signal dec_pc_in : pc_type;
	signal dec_execop : exec_op_type;
	signal dec_memop : mem_op_type;
	signal dec_wbop : wb_op_type;

	signal alu_a : data_type;
	signal alu_b : data_type;
	signal alu_r : data_type;
	signal alu_z : std_logic;
begin

	exec_sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			dec_pc_in <= ZERO_PC;
			dec_execop <= EXEC_NOP;
			dec_memop <= MEM_NOP;
			dec_wbop <= WB_NOP;
		elsif rising_edge(clk) then
			if flush = '1' then
				dec_pc_in <= ZERO_PC;
				dec_execop <= EXEC_NOP;
				dec_memop <= MEM_NOP;
				dec_wbop <= WB_NOP;
			elsif stall = '0' then
				dec_pc_in <= pc_in;
				dec_execop <= op;
				dec_memop <= memop_in;
				dec_wbop <= wbop_in;
			end if;
		end if;
	end process;

	exec_output : process(all)
	begin
		-- exec_op not used
		exec_op <= EXEC_NOP;

		-- pass through
		memop_out <= dec_memop;
		wbop_out <= dec_wbop;

		-- store instructions only use rs2
		wrdata <= dec_execop.readdata2;

		-- calculate new pc
		pc_old_out <= std_logic_vector(unsigned(dec_pc_in));

		-- connect alu outputs
		aluresult <= alu_r;
		zero <= alu_z;

		-- connect alu inputs
		if dec_execop.alusrc1 = '0' then
			alu_a <= dec_execop.readdata1;
		else
			alu_a <= std_logic_vector(resize(unsigned(dec_pc_in), alu_a'length));
		end if;

		if dec_execop.alusrc2 = '0' then
			alu_b <= dec_execop.readdata2;
		else
			alu_b <= dec_execop.imm;
		end if;

		if dec_execop.alusrc3 = '0' then
			pc_new_out <= to_pc_type(std_logic_vector(signed(dec_execop.imm) + signed('0' & dec_pc_in)));
		else
			pc_new_out <= to_pc_type(std_logic_vector(signed(dec_execop.imm) + signed(dec_execop.readdata1))) and not (ZERO_PC(pc_type'length-1 downto 1) & '1');
		end if;

	end process;

	alu_inst : entity work.alu
	port map(
		op => dec_execop.aluop,
		A => alu_a,
		B => alu_b,
		R => alu_r,
		Z => alu_z
	);
end architecture;
