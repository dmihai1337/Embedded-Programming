#!/usr/bin/env python3

import random
import ctypes

if __name__ == "__main__":
    ROUNDS = 100
    input_file = "../testdata/input.txt"
    output_file = "../testdata/output.txt"

    stall = 0
    flush = 0
    op_rd = 0
    op_write = 0
    op_src = 0
    aluresult = 0
    memresult = 0
    pc_old_in = 0
    reg_write_reg = 0
    reg_write_write = 0
    reg_write_data = 0

    sources = ['WBS_ALU', 'WBS_MEM', 'WBS_OPC']

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:

        for i in range(0,ROUNDS):
           
            op_rd = random.getrandbits(5)
            op_write = random.getrandbits(1)
            op_src = random.getrandbits(1)
            pc_old_in = random.getrandbits(16)
            aluresult = random.getrandbits(32)
            memresult = random.getrandbits(32)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{op_rd:05b}\n")
            inf.write(f"{op_write:01b}\n")
            inf.write("WBS_ALU\n")
            inf.write(f"{aluresult:032b}\n")
            inf.write(f"{memresult:032b}\n")
            inf.write(f"{pc_old_in:016b}\n")
            inf.write("\n")

            reg_write_reg = op_rd
            reg_write_write = op_write
            reg_write_data = aluresult

            outf.write(f"{reg_write_write:01b}\n")
            outf.write(f"{reg_write_reg:05b}\n")
            outf.write(f"{reg_write_data:016b}\n")
            outf.write("\n")

        for i in range(0,ROUNDS):
           
            op_rd = random.getrandbits(5)
            op_write = random.getrandbits(1)
            op_src = random.getrandbits(1)
            pc_old_in = random.getrandbits(16)
            aluresult = random.getrandbits(32)
            memresult = random.getrandbits(32)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{op_rd:05b}\n")
            inf.write(f"{op_write:01b}\n")
            inf.write("WBS_MEM\n")
            inf.write(f"{aluresult:032b}\n")
            inf.write(f"{memresult:032b}\n")
            inf.write(f"{pc_old_in:016b}\n")
            inf.write("\n")

            reg_write_reg = op_rd
            reg_write_write = op_write
            reg_write_data = memresult

            outf.write(f"{reg_write_write:01b}\n")
            outf.write(f"{reg_write_reg:05b}\n")
            outf.write(f"{reg_write_data:016b}\n")
            outf.write("\n")

        for i in range(0,ROUNDS):
           
            op_rd = random.getrandbits(5)
            op_write = random.getrandbits(1)
            op_src = random.getrandbits(1)
            pc_old_in = random.getrandbits(16)
            aluresult = random.getrandbits(32)
            memresult = random.getrandbits(32)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{op_rd:05b}\n")
            inf.write(f"{op_write:01b}\n")
            inf.write("WBS_OPC\n")
            inf.write(f"{aluresult:032b}\n")
            inf.write(f"{memresult:032b}\n")
            inf.write(f"{pc_old_in:016b}")

            if i < ROUNDS - 1:
                inf.write("\n\n")

            reg_write_reg = op_rd
            reg_write_write = op_write
            reg_write_data = pc_old_in + 4

            outf.write(f"{reg_write_write:01b}\n")
            outf.write(f"{reg_write_reg:05b}\n")
            outf.write(f"{reg_write_data:016b}")

            if i < ROUNDS - 1:
                outf.write("\n")

# DATA GENERATED