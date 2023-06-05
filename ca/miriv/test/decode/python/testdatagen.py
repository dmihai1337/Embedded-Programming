#!/usr/bin/env python3

import random
import ctypes

def get_bin_slice(bin_str, start, stop):
    return bin_str[len(bin_str)-start-1:len(bin_str)-stop]

def get_instr_r(opcode, rd, funct3, rs1, rs2, funct7):
    return f"{funct7:07b}{rs2:05b}{rs1:05b}{funct3:03b}{rd:05b}{opcode:07b}"

def get_instr_i(opcode, rd, funct3, rs1, imm):
    return f"{get_bin_slice(imm, 11, 0)}{rs1:05b}{funct3:03b}{rd:05b}{opcode:07b}"

def get_instr_s(opcode, funct3, rs1, rs2, imm):
    return f"{get_bin_slice(imm, 11, 5)}{rs2:05b}{rs1:05b}{funct3:03b}{get_bin_slice(imm, 4, 0)}{opcode:07b}"

def get_instr_b(opcode, funct3, rs1, rs2, imm):
    return f"{get_bin_slice(imm, 12, 12)}{get_bin_slice(imm, 10, 5)}{rs2:05b}{rs1:05b}{funct3:03b}{get_bin_slice(imm, 4, 1)}{get_bin_slice(imm, 11, 11)}{opcode:07b}"

def get_instr_u(opcode, rd, imm):
    return f"{get_bin_slice(imm, 31, 12)}{rd:05b}{opcode:07b}"

def get_instr_j(opcode, rd, imm):
    return f"{get_bin_slice(imm, 20, 20)}{get_bin_slice(imm, 10, 1)}{get_bin_slice(imm, 11, 11)}{get_bin_slice(imm, 19, 12)}{rd:05b}{opcode:07b}"

def get_imm_i():
    imm = f"{random.getrandbits(11):011b}"
    return f"{imm[0]*21}{imm}"

def get_imm_s():
    return get_imm_i()

def get_imm_b():
    imm = f"{random.getrandbits(11):011b}"
    return f"{imm[0]*20}{imm}0"

def get_imm_u():
    return f"{random.getrandbits(20):020b}" + 12*"0"

def get_imm_j():
    imm = f"{random.getrandbits(20):020b}"
    return f"{imm[0]*11}{imm}0"

if __name__ == "__main__":
    ROUNDS = 100
    input_file = "../testdata/input.txt"
    output_file = "../testdata/output.txt"

    PC_LENGTH = 16

    OPC_LOAD   = int('0000011', 2)
    OPC_STORE  = int('0100011', 2)
    OPC_BRANCH = int('1100011', 2)
    OPC_JALR   = int('1100111', 2)
    OPC_JAL    = int('1101111', 2)
    OPC_OP_IMM = int('0010011', 2)
    OPC_OP     = int('0110011', 2)
    OPC_AUIPC  = int('0010111', 2)
    OPC_LUI    = int('0110111', 2)

    stall = 0
    flush = 0

    pc = 0

    REG_BITS = 5
    REG_COUNT = 2**REG_BITS

    rdaddr1 = 0
    rdaddr2 = 0
    wraddr = 0
    wrdata = 0
    regwrite = 0

    regfile = [random.getrandbits(32) for x in range(0, REG_COUNT)]
    regfile[0] = 0

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:

        for i in range(0, REG_COUNT):
            inf.write(f"{0:01b}\n")
            inf.write(f"{0:01b}\n")
            inf.write(f"{0:016b}\n")
            inf.write(f"{15:032b}\n")
            inf.write(f"1\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{regfile[i]:032b}\n")
            inf.write(f"\n")

            outf.write(f"{0:016b}\n")
            outf.write(f"ALU_NOP\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{0:05b}\n") # rs1
            outf.write(f"{0:05b}\n") # rs2
            outf.write(f"{0:032b}\n") # readdata1
            outf.write(f"{0:032b}\n") # readdata2
            outf.write(f"{0:032b}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{0:05b}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_u()
            rd = random.getrandbits(5)
            instr = get_instr_u(opcode=OPC_LUI, rd=rd, imm=imm)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write(f"\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_NOP\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_u()
            rd = random.getrandbits(5)
            instr = get_instr_u(opcode=OPC_AUIPC, rd=rd, imm=imm)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"1\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_j()
            rd = random.getrandbits(5)
            instr = get_instr_j(opcode=OPC_JAL, rd=rd, imm=imm)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_NOP\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_BR\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_OPC\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rd = random.getrandbits(5)
            rs1 = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_JALR, rd=rd, imm=imm, rs1=rs1, funct3=0)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_NOP\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"1\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_BR\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_OPC\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=0)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SUB\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CND\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=1)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SUB\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CNDI\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=4)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLT\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CNDI\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=5)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLT\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CND\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=6)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLTU\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CNDI\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_b()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_b(opcode=OPC_BRANCH, imm=imm, rs1=rs1, rs2=rs2, funct3=7)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLTU\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_CND\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_LOAD, imm=imm, rd=rd, rs1=rs1, funct3=0)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"1\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_B\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_MEM\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_LOAD, imm=imm, rd=rd, rs1=rs1, funct3=1)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"1\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_H\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_MEM\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_LOAD, imm=imm, rd=rd, rs1=rs1, funct3=2)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"1\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_MEM\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_LOAD, imm=imm, rd=rd, rs1=rs1, funct3=4)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"1\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_BU\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_MEM\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_LOAD, imm=imm, rd=rd, rs1=rs1, funct3=5)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"1\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_HU\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_MEM\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_s()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_s(opcode=OPC_STORE, imm=imm, rs1=rs1, rs2=rs2, funct3=0)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"1\n") # memwrite
            outf.write(f"MEM_B\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_s()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_s(opcode=OPC_STORE, imm=imm, rs1=rs1, rs2=rs2, funct3=1)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"1\n") # memwrite
            outf.write(f"MEM_H\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_s()
            rs1 = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_s(opcode=OPC_STORE, imm=imm, rs1=rs1, rs2=rs2, funct3=2)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"1\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"0\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=0)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=2)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLT\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=3)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLTU\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=4)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_XOR\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=6)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_OR\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = get_imm_i()
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=7)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_AND\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = list(get_imm_i())
            imm[-11] = "0"
            imm = ''.join(imm)
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=5)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SRL\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = list(get_imm_i())
            imm[-11] = "1"
            imm = ''.join(imm)
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            instr = get_instr_i(opcode=OPC_OP_IMM, imm=imm, rs1=rs1, rd=rd, funct3=5)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SRA\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"1\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=0, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_ADD\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=0, funct7=int('0100000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SUB\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=1, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLL\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")
        
        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=2, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLT\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=3, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SLTU\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=4, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_XOR\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=5, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SRL\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=5, funct7=int('0100000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_SRA\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=6, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_OR\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        for i in range(0, ROUNDS):
            pc = pc + 1
            imm = 0
            rs1 = random.getrandbits(5)
            rd = random.getrandbits(5)
            rs2 = random.getrandbits(5)
            instr = get_instr_r(opcode=OPC_OP, funct3=7, funct7=int('0000000',2), rs1=rs1, rs2=rs2, rd=rd,)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pc:016b}\n")
            inf.write(f"{instr}\n")
            inf.write(f"0\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{0:032b}\n")
            inf.write("\n")

            outf.write(f"{pc:016b}\n")
            outf.write(f"ALU_AND\n")
            outf.write(f"0\n") # alusrc1
            outf.write(f"0\n") # alusrc2
            outf.write(f"0\n") # alusrc3
            outf.write(f"{get_bin_slice(instr, 19, 15)}\n") # rs1
            outf.write(f"{get_bin_slice(instr, 24, 20)}\n") # rs2
            outf.write(f"{regfile[int(get_bin_slice(instr, 19, 15),2)]:032b}\n") # readdata1
            outf.write(f"{regfile[int(get_bin_slice(instr, 24, 20),2)]:032b}\n") # readdata2
            outf.write(f"{imm}\n")
            outf.write(f"BR_NOP\n")
            outf.write(f"0\n") # memread
            outf.write(f"0\n") # memwrite
            outf.write(f"MEM_W\n") # memtype
            outf.write(f"{get_bin_slice(instr, 11, 7)}\n") # rd
            outf.write(f"1\n") # wb_write
            outf.write(f"WBS_ALU\n") # wb_src
            outf.write(f"0\n") # exe_dec
            outf.write(f"\n")

        # exe_dec
        inf.write(f"{0:01b}\n")
        inf.write(f"{0:01b}\n")
        inf.write(f"{0:016b}\n")
        inf.write(f"{1:032b}\n")
        inf.write(f"0\n")
        inf.write(f"{0:05b}\n")
        inf.write(f"{0:032b}\n")
        inf.write(f"\n")


        outf.write(f"{0:016b}\n")
        outf.write(f"ALU_NOP\n")
        outf.write(f"0\n") # alusrc1
        outf.write(f"0\n") # alusrc2
        outf.write(f"0\n") # alusrc3
        outf.write(f"{0:05b}\n") # rs1
        outf.write(f"{0:05b}\n") # rs2
        outf.write(f"{regfile[0]:032b}\n") # readdata1
        outf.write(f"{regfile[0]:032b}\n") # readdata2
        outf.write(f"{0:032b}\n")
        outf.write(f"BR_NOP\n")
        outf.write(f"0\n") # memread
        outf.write(f"0\n") # memwrite
        outf.write(f"MEM_W\n") # memtype
        outf.write(f"{0:05b}\n") # rd
        outf.write(f"0\n") # wb_write
        outf.write(f"WBS_ALU\n") # wb_src
        outf.write(f"1\n") # exe_dec
        outf.write(f"\n")
        
        # Finalize
        inf.write(f"{0:01b}\n")
        inf.write(f"{0:01b}\n")
        inf.write(f"{0:016b}\n")
        inf.write(f"{15:032b}\n")
        inf.write(f"0\n")
        inf.write(f"{0:05b}\n")
        inf.write(f"{0:032b}")


        outf.write(f"{0:016b}\n")
        outf.write(f"ALU_NOP\n")
        outf.write(f"0\n") # alusrc1
        outf.write(f"0\n") # alusrc2
        outf.write(f"0\n") # alusrc3
        outf.write(f"{0:05b}\n") # rs1
        outf.write(f"{0:05b}\n") # rs2
        outf.write(f"{regfile[0]:032b}\n") # readdata1
        outf.write(f"{regfile[0]:032b}\n") # readdata2
        outf.write(f"{0:032b}\n")
        outf.write(f"BR_NOP\n")
        outf.write(f"0\n") # memread
        outf.write(f"0\n") # memwrite
        outf.write(f"MEM_W\n") # memtype
        outf.write(f"{0:05b}\n") # rd
        outf.write(f"0\n") # wb_write
        outf.write(f"WBS_ALU\n") # wb_src
        outf.write(f"0") # exe_dec