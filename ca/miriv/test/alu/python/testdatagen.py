#!/usr/bin/env python3

import random
import ctypes

if __name__ == "__main__":
    ROUNDS = 100
    input_file = "../testdata/input.txt"
    output_file = "../testdata/output.txt"

    a = 0
    b = 0

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:
        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_NOP\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{b:032b}\n")
            outf.write("-\n\n")
        
        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_SLT\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            sa = a - 2**32 if f"{a:032b}"[0] == "1" else a
            sb = b - 2**32 if f"{b:032b}"[0] == "1" else b

            outf.write(f"{(1 if sa < sb else 0):032b}\n")
            outf.write(f"{'0' if sa < sb else '1'}\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_SLTU\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{(1 if a < b else 0):032b}\n")
            outf.write(f"{'0' if a < b else '1'}\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(5)

            inf.write("ALU_SLL\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")
            
            outf.write(f"{ctypes.c_uint32(a << b).value:032b}\n")
            outf.write(f"-\n\n")
        
        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(5)

            inf.write("ALU_SRL\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{ctypes.c_uint32(a >> b).value:032b}\n")
            outf.write(f"-\n\n")
        
        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(5)

            inf.write("ALU_SRA\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{ctypes.c_uint32((ctypes.c_int32(a).value >> b)).value:032b}\n")
            outf.write(f"-\n\n")
        
        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_ADD\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{ctypes.c_uint32((ctypes.c_int32(a).value + ctypes.c_int32(b).value)).value:032b}\n")
            outf.write(f"-\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_SUB\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{ctypes.c_uint32((ctypes.c_int32(a).value - ctypes.c_int32(b).value)).value:032b}\n")
            outf.write(f"{'1' if a == b else '0'}\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = a

            inf.write("ALU_SUB\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{ctypes.c_uint32((ctypes.c_int32(a).value - ctypes.c_int32(b).value)).value:032b}\n")
            outf.write(f"{'1' if a == b else '0'}\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_AND\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{(a & b):032b}\n")
            outf.write(f"-\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_OR\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{(a | b):032b}\n")
            outf.write(f"-\n\n")

        for i in range(0,ROUNDS):
            a = random.getrandbits(32)
            b = random.getrandbits(32)

            inf.write("ALU_XOR\n")
            inf.write(f"{a:032b}\n")
            inf.write(f"{b:032b}\n\n")

            outf.write(f"{(a ^ b):032b}\n")
            outf.write(f"-\n\n")
        
        inf.write("ALU_NOP\n")
        inf.write(f"{a:032b}\n")
        inf.write(f"{b:032b}")

        outf.write(f"{b:032b}\n")
        outf.write("-")
        
        