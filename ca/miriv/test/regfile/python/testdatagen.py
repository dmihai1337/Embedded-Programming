#!/usr/bin/env python3

import random
import ctypes

if __name__ == "__main__":
    ROUNDS = 100
    input_file = "../testdata/input-py.txt"
    output_file = "../testdata/output-py.txt"

    REG_BITS = 5
    REG_COUNT = 2**REG_BITS

    stall = 0
    rdaddr1 = 0
    rdaddr2 = 0
    wraddr = 0
    wrdata = 0
    regwrite = 0

    regfile = [random.getrandbits(32) for x in range(0, REG_COUNT)]
    regfile_new = [random.getrandbits(32) for x in range(0, REG_COUNT)]
    regfile[0] = 0
    regfile_new[0] = 0

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:
        # Checklist:
        # - Initial write to regfile verifying regwrite
        regwrite = 1
        for i in range(0, len(regfile)):
            j = random.getrandbits(REG_BITS)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{j:05b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{regfile[i]:032b}\n")
            inf.write(f"{regwrite:01b}\n\n")

            outf.write(f"{regfile[i]:032b}\n")
            if j <= i:
                outf.write(f"{regfile[j]:032b}\n\n")
            else:
                outf.write(f"{0:032b}\n\n")

        # - Overwrite with new data and no regwrite
        regwrite = 0
        for i in range(0, len(regfile_new)):
            j = random.getrandbits(REG_BITS)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{j:05b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{regfile_new[i]:032b}\n")
            inf.write(f"{regwrite:01b}\n\n")

            outf.write(f"{regfile[i]:032b}\n")
            if j < i:
                outf.write(f"{regfile_new[j]:032b}\n\n")
            else:
                outf.write(f"{regfile[j]:032b}\n\n")

        # - Stalling regfile
        stall = 1
        rddata1 = regfile[i]
        rddata2 = regfile_new[j] if j < i else regfile[j]
        for i in range(0, len(regfile_new)):
            j = random.getrandbits(REG_BITS)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{j:05b}\n")
            inf.write(f"{i:05b}\n")
            inf.write(f"{random.getrandbits(32):032b}\n")
            inf.write(f"{random.getrandbits(1):01b}\n\n")

            outf.write(f"{rddata1:032b}\n")
            outf.write(f"{rddata2:032b}\n\n")

        # - Double read
        stall = 0
        for i in range(0, ROUNDS):
            j = random.getrandbits(REG_BITS)
            inf.write(f"{stall:01b}\n")
            inf.write(f"{j:05b}\n")
            inf.write(f"{j:05b}\n")
            inf.write(f"{0:05b}\n")
            inf.write(f"{random.getrandbits(32):032b}\n")
            inf.write(f"{random.getrandbits(1):01b}\n\n")

            outf.write(f"{regfile_new[j]:032b}\n")
            outf.write(f"{regfile_new[j]:032b}\n\n")

        # Finalize
        inf.write(f"{0:01b}\n")
        inf.write(f"{0:05b}\n")
        inf.write(f"{0:05b}\n")
        inf.write(f"{0:05b}\n")
        inf.write(f"{0:032b}\n")
        inf.write(f"{0:01b}")

        outf.write(f"{0:032b}\n")
        outf.write(f"{0:032b}")