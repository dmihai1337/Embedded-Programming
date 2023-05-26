#!/usr/bin/env python3

import random
import ctypes

if __name__ == "__main__":
    ROUNDS = 100
    input_file = "../testdata/input.txt"
    output_file = "../testdata/output.txt"

    stall = 0
    flush = 0
    pcsrc = 0
    pc_in = 0
    mem_in = 0

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:

        pc_register = 0

        for j in range(0,5):

            # no stalling or flushing

            stall = 0
            flush = 0
            for i in range(0,ROUNDS):
                pcsrc = random.getrandbits(1)
                pc_in = random.getrandbits(16)
                mem_in = random.getrandbits(16)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{pcsrc:01b}\n")
                inf.write(f"{pc_in:016b}\n")
                inf.write(f"{mem_in:033b}\n\n")

                mem_busy = 0
                pc_register = pc_in if pcsrc == 1 else pc_register + 4
                pc_out = pc_register
                instr = mem_in
                mem_out = 15

                outf.write(f"{mem_busy:032b}\n")
                outf.write(f"{pc_out:016b}\n")
                outf.write(f"{instr:016b}\n")
                outf.write(f"{mem_out:052b}\n\n")

            # flush one time

            stall = 0
            flush = 1

            pcsrc = random.getrandbits(1)
            pc_in = random.getrandbits(16)
            mem_in = random.getrandbits(16)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pcsrc:01b}\n")
            inf.write(f"{pc_in:016b}\n")
            inf.write(f"{mem_in:033b}\n\n")

            mem_busy = 0
            pc_register = pc_in if pcsrc == 1 else pc_register + 4
            pc_out = pc_register
            instr = 19 # NOP
            mem_out = 15

            outf.write(f"{mem_busy:032b}\n")
            outf.write(f"{pc_out:016b}\n")
            outf.write(f"{instr:016b}\n")
            outf.write(f"{mem_out:052b}\n\n")

            # stall one time

            stall = 1
            flush = 0

            pcsrc = random.getrandbits(1)
            pc_in = random.getrandbits(16)
            mem_in = random.getrandbits(16)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pcsrc:01b}\n")
            inf.write(f"{pc_in:016b}\n")
            inf.write(f"{mem_in:033b}\n\n")

            mem_busy = 0
            pc_out = pc_register
            instr = mem_in
            mem_out = 15

            outf.write(f"{mem_busy:032b}\n")
            outf.write(f"{pc_out:016b}\n")
            outf.write(f"{instr:016b}\n")
            outf.write(f"{mem_out:052b}\n\n")

            # stall and flush one time

            stall = 1
            flush = 1

            pcsrc = random.getrandbits(1)
            pc_in = random.getrandbits(16)
            mem_in = random.getrandbits(16)

            inf.write(f"{stall:01b}\n")
            inf.write(f"{flush:01b}\n")
            inf.write(f"{pcsrc:01b}\n")
            inf.write(f"{pc_in:016b}\n")
            inf.write(f"{mem_in:033b}")

            if j < 4:
                inf.write("\n\n")

            mem_busy = 0
            pc_out = pc_register
            instr = 19 # NOP
            mem_out = 15

            outf.write(f"{mem_busy:032b}\n")
            outf.write(f"{pc_out:016b}\n")
            outf.write(f"{instr:016b}\n")
            outf.write(f"{mem_out:052b}")

            if j < 4:
                outf.write("\n\n")

# DATA GENERATED

        
        
        
        
