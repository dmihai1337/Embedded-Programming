library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.core_pkg.all;
use work.op_pkg.all;

entity decode is
	port (
		clk        : in  std_logic;
		res_n      : in  std_logic;
		stall      : in  std_logic;
		flush      : in  std_logic;

		-- from fetch
		pc_in      : in  pc_type;
		instr      : in  instr_type;

		-- from writeback
		reg_write  : in reg_write_type;

		-- towards next stages
		pc_out     : out pc_type;
		exec_op    : out exec_op_type;
		mem_op     : out mem_op_type;
		wb_op      : out wb_op_type;

		-- exceptions
		exc_dec    : out std_logic
	);
end entity;

architecture rtl of decode is

	constant OPCODE_WIDTH : natural := 7;
	constant FUNCT3_WIDTH : natural := 3;
	constant FUNCT7_WIDTH : natural := 7;

	subtype opcode_type is std_logic_vector(OPCODE_WIDTH-1 downto 0);
	subtype funct3_type is std_logic_vector(FUNCT3_WIDTH-1 downto 0);
	subtype funct7_type is std_logic_vector(FUNCT7_WIDTH-1 downto 0);

	-- OPCODES
	constant OPC_LOAD   : opcode_type := "0000011";
	constant OPC_STORE  : opcode_type := "0100011";
	constant OPC_BRANCH : opcode_type := "1100011";
	constant OPC_JALR   : opcode_type := "1100111";
	constant OPC_JAL    : opcode_type := "1101111";
	constant OPC_OP_IMM : opcode_type := "0010011";
	constant OPC_OP     : opcode_type := "0110011";
	constant OPC_AUIPC  : opcode_type := "0010111";
	constant OPC_LUI    : opcode_type := "0110111";
	constant OPC_NOP    : opcode_type := "0001111";

	-- regfile signals
	signal reg_rddata1 : data_type;
	signal reg_rddata2 : data_type;

	-- fetch signals
	signal fetch_pc_in : pc_type := ZERO_PC;
	signal fetch_instr : instr_type := NOP_INST;

	-- instr aliases
	alias opcode : opcode_type is fetch_instr(6 downto 0);
	alias rd : reg_adr_type is fetch_instr(11 downto 7);
	alias funct3 : funct3_type is fetch_instr(14 downto 12);
	alias rs1 : reg_adr_type is fetch_instr(19 downto 15);
	alias rs2 : reg_adr_type is fetch_instr(24 downto 20);
	alias funct7 : funct7_type is fetch_instr(31 downto 25);

begin

	decoder_sync : process(clk, res_n)
	begin
		if (res_n = '0') then
			fetch_pc_in <= ZERO_PC;
			fetch_instr <= NOP_INST;
		elsif rising_edge(clk) then
			if flush = '1' then
				fetch_pc_in <= ZERO_PC;
				fetch_instr <= NOP_INST;
			elsif stall = '0' then
				fetch_pc_in <= pc_in;
				fetch_instr <= instr;
			end if;
		end if;
	end process;

	decoder_output : process(all)
		variable imm_i, imm_s, imm_b, imm_u, imm_j : data_type := ZERO_DATA;
	begin
		pc_out <= fetch_pc_in;
		exc_dec <= '0';

		-- imm assignment
		imm_i := std_logic_vector(resize(signed(fetch_instr(31 downto 20)), data_type'length));
		imm_s := std_logic_vector(resize(signed(fetch_instr(31 downto 25) & fetch_instr(11 downto 7)), data_type'length));
		imm_b := std_logic_vector(resize(signed(fetch_instr(31) & fetch_instr(7) & fetch_instr(30 downto 25) & fetch_instr(11 downto 8) & '0'), data_type'length));
		imm_u := std_logic_vector(resize(signed(fetch_instr(31 downto 12) & x"000"), data_type'length));
		imm_j := std_logic_vector(resize(signed(fetch_instr(31) & fetch_instr(19 downto 12) & fetch_instr(20) & fetch_instr(30 downto 21) & '0'), data_type'length));

		-- default exec_op
		exec_op.aluop <= ALU_NOP;
		exec_op.alusrc1 <= '0'; -- MUX for ALU-A; '0' = rddata1, '1' = pc (for AUIPC)
		exec_op.alusrc2 <= '0'; -- MUX for ALU-B; '0' = rddata2, '1' = imm
		exec_op.alusrc3 <= '0'; -- MUX for ALU-Adder Input 2; '0' = pc, '1' = rs1 (for JALR)
		exec_op.rs1 <= rs1;
		exec_op.rs2 <= rs2;
		exec_op.readdata1 <= reg_rddata1;
		exec_op.readdata2 <= reg_rddata2;

		case opcode is
			when OPC_LUI | OPC_AUIPC => exec_op.imm <= imm_u;
			when OPC_JAL => exec_op.imm <= imm_j;
			when OPC_JALR | OPC_LOAD | OPC_OP_IMM | OPC_NOP => exec_op.imm <= imm_i;
			when OPC_BRANCH => exec_op.imm <= imm_b;
			when OPC_STORE => exec_op.imm <= imm_s;
			when others => exec_op.imm <= ZERO_DATA;
		end case;

		-- default mem_op
		mem_op <= MEM_NOP;

		-- default wb_op
		wb_op <= WB_NOP;
		wb_op.rd <= rd;

		case opcode is
			when OPC_LUI =>
				wb_op.write <= '1';
				exec_op.alusrc2 <= '1'; --ALU-B = imm --ALU_NOP returns ALU-B
			when OPC_AUIPC =>
				wb_op.write <= '1';
				exec_op.alusrc1 <= '1'; --ALU-A = pc
				exec_op.alusrc2 <= '1'; --ALU-B = imm
				exec_op.aluop <= ALU_ADD;
			when OPC_JAL =>
				wb_op.src <= WBS_OPC;
				wb_op.write <= '1';
				mem_op.branch <= BR_BR;
			when OPC_JALR =>
				case funct3 is
					when "000" =>
						exec_op.alusrc3 <= '1'; -- ALU-Adder = rs1
						wb_op.src <= WBS_OPC;
						wb_op.write <= '1';
						mem_op.branch <= BR_BR;
					when others => exc_dec <= '1';
				end case;
			when OPC_BRANCH =>
				case funct3 is
					-- Branching depends on zero flag of ALU (ALU-Z)
					-- - using BR_CND branch when ALU-Z=1
					-- - using BR_CNDI branch when ALU-Z=0
					when "000" => --BEQ
						exec_op.aluop <= ALU_SUB; -- if A = B then ALU-Z <= '1'; else ALU-Z <= '0'; end if;
						mem_op.branch <= BR_CND;
					when "001" => --BNE
						exec_op.aluop <= ALU_SUB; -- if A = B then ALU-Z <= '1'; else ALU-Z <= '0'; end if;
						mem_op.branch <= BR_CNDI;
					when "100" => --BLT
						exec_op.aluop <= ALU_SLT; -- ALU-Z = A < B ? 0 : 1 (signed)
						mem_op.branch <= BR_CNDI;
					when "101" => --BGE
						exec_op.aluop <= ALU_SLT; -- ALU-Z = A < B ? 0 : 1 (signed)
						mem_op.branch <= BR_CND;
					when "110" => --BLTU
						exec_op.aluop <= ALU_SLTU; -- ALU-Z = A < B ? 0 : 1 (unsigned)
						mem_op.branch <= BR_CNDI;
					when "111" => --BGEU
						exec_op.aluop <= ALU_SLTU; -- ALU-Z = A < B ? 0 : 1 (unsigned)
						mem_op.branch <= BR_CND;
					when others => exc_dec <= '1';
				end case;
			when OPC_LOAD =>
				mem_op.mem.memread <= '1'; -- read address is ALU result (rs1+imm)
				exec_op.aluop <= ALU_ADD;
				exec_op.alusrc2 <= '1'; -- ALU-B = imm

				wb_op.write <= '1';
				wb_op.src <= WBS_MEM; -- write back from memory to regfile
				
				case funct3 is
					when "000" => mem_op.mem.memtype <= MEM_B;
					when "001" => mem_op.mem.memtype <= MEM_H;
					when "010" => mem_op.mem.memtype <= MEM_W;
					when "100" => mem_op.mem.memtype <= MEM_BU;
					when "101" => mem_op.mem.memtype <= MEM_HU;
					when others =>
						exc_dec <= '1';
						wb_op.write <= '0';
						mem_op.mem.memread <= '0';
				end case;
			when OPC_STORE =>
				mem_op.mem.memwrite <= '1'; -- write address is ALU result (rs1+imm)
				exec_op.aluop <= ALU_ADD;
				exec_op.alusrc2 <= '1'; -- ALU-B = imm
				
				case funct3 is
					when "000" => mem_op.mem.memtype <= MEM_B;
					when "001" => mem_op.mem.memtype <= MEM_H;
					when "010" => mem_op.mem.memtype <= MEM_W;
					when others =>
						exc_dec <= '1';
						mem_op.mem.memwrite <= '0';
				end case;
			when OPC_OP_IMM =>
				wb_op.write <= '1';
				exec_op.alusrc2 <= '1'; -- ALU-B = imm

				case funct3 is
					when "000" => exec_op.aluop <= ALU_ADD;
					when "010" => exec_op.aluop <= ALU_SLT;
					when "011" => exec_op.aluop <= ALU_SLTU;
					when "100" => exec_op.aluop <= ALU_XOR;
					when "110" => exec_op.aluop <= ALU_OR;
					when "111" => exec_op.aluop <= ALU_AND;
					when "001" => exec_op.aluop <= ALU_SLL;
					when "101" =>
						case exec_op.imm(10) is
							when '0' => exec_op.aluop <= ALU_SRL;
							when '1' => exec_op.aluop <= ALU_SRA;
							when others =>
								exc_dec <= '1';
								wb_op.write <= '0';
						end case;
					when others =>
						exc_dec <= '1';
						wb_op.write <= '0';
				end case;
			when OPC_OP =>
				wb_op.write <= '1';

				case funct3 & funct7 is
					when "000" & "0000000" => exec_op.aluop <= ALU_ADD;
					when "000" & "0100000" => exec_op.aluop <= ALU_SUB;
					when "001" & "0000000" => exec_op.aluop <= ALU_SLL;
					when "010" & "0000000" => exec_op.aluop <= ALU_SLT;
					when "011" & "0000000" => exec_op.aluop <= ALU_SLTU;
					when "100" & "0000000" => exec_op.aluop <= ALU_XOR;
					when "101" & "0000000" => exec_op.aluop <= ALU_SRL;
					when "101" & "0100000" => exec_op.aluop <= ALU_SRA;
					when "110" & "0000000" => exec_op.aluop <= ALU_OR;
					when "111" & "0000000" => exec_op.aluop <= ALU_AND;
					when others =>
						exc_dec <= '1';
						wb_op.write <= '0';
				end case;
			when OPC_NOP =>
				case funct3 is
					when "000" => exec_op.aluop <= ALU_NOP;
					when others => exc_dec <= '1';
				end case;
			when others =>
				exc_dec <= '1';
				--report "OPCODE " & to_string(opcode) & " not implemented";
		end case;
	end process;

	regfile_inst : entity work.regfile
	port map (
		clk => clk,
		res_n => res_n,
		stall => stall,
		rdaddr1 => instr(19 downto 15),
		rddata1 => reg_rddata1,
		rdaddr2 => instr(24 downto 20),
		rddata2 => reg_rddata2,
		-- automatic writing to regfile
		wraddr => reg_write.reg,
		wrdata => reg_write.data,
		regwrite => reg_write.write
	);
end architecture;
