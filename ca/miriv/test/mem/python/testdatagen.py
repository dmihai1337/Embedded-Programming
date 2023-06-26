#!/usr/bin/env python3

import random
import ctypes

if __name__ == "__main__":
    ROUNDS = 20
    input_file = "../testdata/input.txt"
    output_file = "../testdata/output.txt"

    branch_types = ["BR_NOP", "BR_BR", "BR_CND", "BR_CNDI"]
    mem_types = ["MEM_W", "MEM_H", "MEM_HU", "MEM_B", "MEM_BU"]
    wb_sources = ["WBS_ALU", "WBS_MEM", "WBS_OPC"]

    stall = 0
    flush = 0
    mem_op_branch = 0
    mem_op_memrd = 0
    mem_op_memwr = 0
    mem_op_memdt = 0
    wbop_rd = 0
    wbop_wr = 0
    wbop_src = 0
    pc_new_in = 0
    pc_old_in = 0
    aluresult_in = 0
    wrdata = 0
    zero = 0
    memin_busy = 0
    memin_data = 0

    membusy = 0
    reg_write_data = 0
    reg_write_reg = 0
    reg_write_write = 0
    pc_new_out = 0
    pc_old_out = 0
    pcsrc = 0
    wbop_rd_out = 0
    wbop_wr_out = 0
    wbop_src_out = 0
    aluresult_out = 0
    memresult = 0
    exc_load = 0
    exc_store = 0
    memout_addr = 0
    memout_rd = 0
    memout_wr = 0
    memout_byteena = 0
    memout_wrdata = 0

    # Registers
    mem_op_branch_reg = 0
    mem_op_memrd_reg = 0
    mem_op_memwr_reg = 0
    mem_op_memdt_reg = 0
    wbop_rd_reg = 0
    wbop_wr_reg = 0
    wbop_src_reg = 0
    pc_new_reg = 0
    pc_old_reg = 0
    aluresult_reg = 0
    zero_reg = 0
    memin_busy_reg = 0
    memin_data_reg = 0

    with open(input_file, "w+") as inf, open(output_file, "w+") as outf:

        for j in range(0,ROUNDS):

            # MEM_W

            mem_op_branch = random.randint(0, 3)
            wbop_rd = random.getrandbits(5)
            wbop_wr = random.getrandbits(1)
            wbop_src = random.randint(0, 2)
            pc_new_in = random.getrandbits(16)
            pc_old_in = random.getrandbits(16)
            wrdata = int("0b00000000111111110000000011111111", 2)
            zero = random.getrandbits(1)
            memin_busy = random.getrandbits(1)
            memin_data = int("0b00000000111111110000000011111111", 2)

            for i in range(0, 5):

                mem_op_memdt = 0
                mem_op_memwr = 1
                mem_op_memrd = 0
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = not (((aluresult_in >> 1) & 1) == 0 and (aluresult_in & 1) == 0)
                membusy = memin_busy 
                memresult = int("0b11111111000000001111111100000000", 2)
                memout_addr = aluresult_in >> 2 
                memout_rd = mem_op_memrd if exc_store == 0 else 0
                memout_wr = mem_op_memwr if exc_store == 0 else 0
                memout_byteena = 15
                memout_wrdata = "11111111000000001111111100000000"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")
            
            for i in range(0, 5):

                mem_op_memdt = 0
                mem_op_memwr = 0
                mem_op_memrd = 1
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(1, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = not (((aluresult_in >> 1) & 1) == 0 and (aluresult_in & 1) == 0)
                exc_store = 0
                membusy = memin_busy or (not (exc_load or exc_store))
                memresult = int("0b11111111000000001111111100000000", 2)
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd if exc_load == 0 else 0
                memout_wr = mem_op_memwr if exc_load == 0 else 0
                memout_byteena = 15
                memout_wrdata = "11111111000000001111111100000000"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")

            # MEM_H

            mem_op_branch = random.randint(0, 3)
            wbop_rd = random.getrandbits(5)
            wbop_wr = random.getrandbits(1)
            wbop_src = random.randint(0, 2)
            pc_new_in = random.getrandbits(16)
            pc_old_in = random.getrandbits(16)
            wrdata = int("0b00000000111111110000000011111111", 2)
            zero = random.getrandbits(1)
            memin_busy = random.getrandbits(1)
            memin_data = int("0b00000000111111110000000011111111", 2)

            for i in range(0, 5):

                mem_op_memdt = 1
                mem_op_memwr = 0
                mem_op_memrd = 1
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load =  not ((aluresult_in & 1) == 0)
                exc_store = 0
                membusy = memin_busy or (not (exc_load or exc_store))
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd if exc_load == 0 else 0
                memout_wr = mem_op_memwr if exc_load == 0 else 0

                if ((aluresult_in >> 1) & 1):
                    memresult = int("0b11111111111111111111111100000000", 2)
                    memout_wrdata = "----------------1111111100000000"
                    memout_byteena = 3
                else:
                    memresult = int("0b11111111111111111111111100000000", 2)
                    memout_wrdata = "1111111100000000----------------"
                    memout_byteena = 12

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")
            
            for i in range(0, 5):

                mem_op_memdt = 1
                mem_op_memwr = 1
                mem_op_memrd = 0
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = not ((aluresult_in & 1) == 0)
                membusy = memin_busy
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd if exc_store == 0 else 0
                memout_wr = mem_op_memwr if exc_store == 0 else 0

                if ((aluresult_in >> 1) & 1):
                    memresult = int("0b11111111111111111111111100000000", 2)
                    memout_wrdata = "----------------1111111100000000"
                    memout_byteena = 3
                else:
                    memresult = int("0b11111111111111111111111100000000", 2)
                    memout_wrdata = "1111111100000000----------------"
                    memout_byteena = 12

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")

            # MEM_HU

            mem_op_branch = random.randint(0, 3)
            wbop_rd = random.getrandbits(5)
            wbop_wr = random.getrandbits(1)
            wbop_src = random.randint(0, 2)
            pc_new_in = random.getrandbits(16)
            pc_old_in = random.getrandbits(16)
            wrdata = int("0b00000000111111110000000011111111", 2)
            zero = random.getrandbits(1)
            memin_busy = random.getrandbits(1)
            memin_data = int("0b00000000111111110000000011111111", 2)

            for i in range(0, 5):

                mem_op_memdt = 2
                mem_op_memwr = 0
                mem_op_memrd = 1
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = not ((aluresult_in & 1) == 0)
                exc_store = 0
                membusy = memin_busy or not (exc_load or exc_store)
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd if exc_load == 0 else 0
                memout_wr = mem_op_memwr if exc_load == 0 else 0

                if ((aluresult_in >> 1) & 1):
                    memresult = int("0b00000000000000001111111100000000", 2)
                    memout_wrdata = "----------------1111111100000000"
                    memout_byteena = 3
                else:
                    memresult = int("0b00000000000000001111111100000000", 2)
                    memout_wrdata = "1111111100000000----------------"
                    memout_byteena = 12

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")
            
            for i in range(0, 5):

                mem_op_memdt = 2
                mem_op_memwr = 1
                mem_op_memrd = 0
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = not ((aluresult_in & 1) == 0)
                membusy = memin_busy
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd if exc_store == 0 else 0
                memout_wr = mem_op_memwr if exc_store == 0 else 0

                if ((aluresult_in >> 1) & 1):
                    memresult = int("0b00000000000000001111111100000000", 2)
                    memout_wrdata = "----------------1111111100000000"
                    memout_byteena = 3
                else:
                    memresult = int("0b00000000000000001111111100000000", 2)
                    memout_wrdata = "1111111100000000----------------"
                    memout_byteena = 12

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")

            # MEM_B

            mem_op_branch = random.randint(0, 3)
            wbop_rd = random.getrandbits(5)
            wbop_wr = random.getrandbits(1)
            wbop_src = random.randint(0, 2)
            pc_new_in = random.getrandbits(16)
            pc_old_in = random.getrandbits(16)
            wrdata = int("0b00000000111111110000000011111111", 2)
            zero = random.getrandbits(1)
            memin_busy = random.getrandbits(1)
            memin_data = int("0b00000000111111110000000011111111", 2)

            for i in range(0, 5):

                mem_op_memdt = 3
                mem_op_memwr = 0
                mem_op_memrd = 1
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = 0
                membusy = memin_busy or mem_op_memrd
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd
                memout_wr = mem_op_memwr

                if ((aluresult_in >> 1) & 1):
                    if (aluresult_in  & 1):
                        memresult = int("0b11111111111111111111111111111111", 2)
                        memout_byteena = 1
                        memout_wrdata = "------------------------11111111"
                        
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 2
                        memout_wrdata = "----------------11111111--------"
                else:
                    if (aluresult_in  & 1):
                        memresult = int("0b11111111111111111111111111111111", 2)
                        memout_byteena = 4
                        memout_wrdata = "--------11111111----------------"
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 8
                        memout_wrdata = "11111111------------------------"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")
            
            for i in range(0, 5):

                mem_op_memdt = 3
                mem_op_memwr = 1
                mem_op_memrd = 0
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = 0
                membusy = memin_busy or mem_op_memrd
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd
                memout_wr = mem_op_memwr

                if ((aluresult_in >> 1) & 1):
                    if (aluresult_in  & 1):
                        memresult = int("0b11111111111111111111111111111111", 2)
                        memout_byteena = 1
                        memout_wrdata = "------------------------11111111"
                        
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 2
                        memout_wrdata = "----------------11111111--------"
                else:
                    if (aluresult_in  & 1):
                        memresult = int("0b11111111111111111111111111111111", 2)
                        memout_byteena = 4
                        memout_wrdata = "--------11111111----------------"
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 8
                        memout_wrdata = "11111111------------------------"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")

            # MEM_BU

            mem_op_branch = random.randint(0, 3)
            wbop_rd = random.getrandbits(5)
            wbop_wr = random.getrandbits(1)
            wbop_src = random.randint(0, 2)
            pc_new_in = random.getrandbits(16)
            pc_old_in = random.getrandbits(16)
            wrdata = int("0b00000000111111110000000011111111", 2)
            zero = random.getrandbits(1)
            memin_busy = random.getrandbits(1)
            memin_data = int("0b00000000111111110000000011111111", 2)

            for i in range(0, 5):

                mem_op_memdt = 4
                mem_op_memwr = 0
                mem_op_memrd = 1
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}\n")
                inf.write("\n")

                reg_write_write = wbop_wr
                reg_write_reg = wbop_rd
                reg_write_data = aluresult_in
                pc_new_out = pc_new_in
                pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                pc_old_out = pc_old_in
                aluresult_out = aluresult_in
                wbop_rd_out = wbop_rd
                wbop_src_out = wbop_src
                wbop_wr_out = wbop_wr
                exc_load = 0
                exc_store = 0
                membusy = memin_busy or mem_op_memrd
                memout_addr = aluresult_in >> 2
                memout_rd = mem_op_memrd
                memout_wr = mem_op_memwr

                if ((aluresult_in >> 1) & 1):
                    if (aluresult_in  & 1):
                        memresult = int("0b00000000000000000000000011111111", 2)
                        memout_byteena = 1
                        memout_wrdata = "------------------------11111111"
                        
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 2
                        memout_wrdata = "----------------11111111--------"
                else:
                    if (aluresult_in  & 1):
                        memresult = int("0b00000000000000000000000011111111", 2)
                        memout_byteena = 4
                        memout_wrdata = "--------11111111----------------"
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 8
                        memout_wrdata = "11111111------------------------"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}\n")

                outf.write("\n")
            
            for i in range(0, 5):

                mem_op_memdt = 4
                mem_op_memwr = 1
                mem_op_memrd = 0
                aluresult_in = (random.getrandbits(14) << 2) + random.randint(0, 3)

                # Test a stall

                if i == 0:
                    mem_op_branch_reg = mem_op_branch
                    mem_op_memrd_reg = mem_op_memrd
                    mem_op_memwr_reg = mem_op_memwr
                    mem_op_memdt_reg = mem_op_memdt
                    wbop_rd_reg = wbop_rd
                    wbop_wr_reg = wbop_wr
                    wbop_src_reg = wbop_src
                    pc_new_reg = pc_new_in
                    pc_old_reg = pc_old_in
                    aluresult_reg = aluresult_in
                    zero_reg = zero
                    memin_busy_reg = memin_busy
                    memin_data_reg = memin_data

                if i == 1:
                    stall = 1
                else:
                    stall = 0

                if i == 1:
                    reg_write_write = wbop_wr
                    reg_write_reg = wbop_rd
                    pc_new_out = pc_new_reg
                    pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                    pc_old_out = pc_old_reg
                    aluresult_out = aluresult_reg
                    wbop_rd_out = wbop_rd_reg
                    wbop_src_out = wbop_src_reg
                    wbop_wr_out = wbop_wr_reg
                    exc_load = 0
                    exc_store = 0
                    membusy = memin_busy
                    memout_addr = aluresult_reg >> 2
                    memout_rd = 0
                    memout_wr = 0
                else:
                    reg_write_write = wbop_wr
                    reg_write_reg = wbop_rd
                    reg_write_data = aluresult_in
                    pc_new_out = pc_new_in
                    pcsrc = ((mem_op_branch == 2) and zero) or ((mem_op_branch == 3) and not zero) or mem_op_branch == 1
                    pc_old_out = pc_old_in
                    aluresult_out = aluresult_in
                    wbop_rd_out = wbop_rd
                    wbop_src_out = wbop_src
                    wbop_wr_out = wbop_wr
                    exc_load = 0
                    exc_store = 0
                    membusy = memin_busy or mem_op_memrd
                    memout_addr = aluresult_in >> 2
                    memout_rd = mem_op_memrd
                    memout_wr = mem_op_memwr

                inf.write(f"{stall:01b}\n")
                inf.write(f"{flush:01b}\n")
                inf.write(f"{branch_types[mem_op_branch]}\n")
                inf.write(f"{mem_op_memrd:01b}\n")
                inf.write(f"{mem_op_memwr:01b}\n")
                inf.write(f"{mem_types[mem_op_memdt]}\n")
                inf.write(f"{wbop_rd:05b}\n")
                inf.write(f"{wbop_wr:01b}\n")
                inf.write(f"{wb_sources[wbop_src]}\n")
                inf.write(f"{pc_new_in:016b}\n")
                inf.write(f"{pc_old_in:016b}\n")
                inf.write(f"{aluresult_in:032b}\n")
                inf.write(f"{wrdata:032b}\n")
                inf.write(f"{zero:01b}\n")
                inf.write(f"{memin_busy:01b}\n")
                inf.write(f"{memin_data:032b}")

                if not (i == 4 and j == ROUNDS - 1):
                    inf.write("\n\n")

                if ((aluresult_out >> 1) & 1):
                    if (aluresult_out  & 1):
                        memresult = int("0b00000000000000000000000011111111", 2)
                        memout_byteena = 1
                        memout_wrdata = "------------------------11111111"
                        
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 2
                        memout_wrdata = "----------------11111111--------"
                else:
                    if (aluresult_out  & 1):
                        memresult = int("0b00000000000000000000000011111111", 2)
                        memout_byteena = 4
                        memout_wrdata = "--------11111111----------------"
                    else:
                        memresult = int("0b00000000000000000000000000000000", 2)
                        memout_byteena = 8
                        memout_wrdata = "11111111------------------------"

                outf.write(f"{membusy:01b}\n")
                outf.write(f"{reg_write_write:01b}\n")
                outf.write(f"{reg_write_reg:05b}\n")
                outf.write(f"{reg_write_data:016b}\n")
                outf.write(f"{pc_new_out:016b}\n")
                outf.write(f"{pcsrc:01b}\n")
                outf.write(f"{wbop_rd_out:05b}\n")
                outf.write(f"{wbop_wr_out:01b}\n")
                outf.write(f"{wb_sources[wbop_src_out]}\n")
                outf.write(f"{pc_old_out:016b}\n")
                outf.write(f"{aluresult_out:032b}\n")
                outf.write(f"{memresult:032b}\n")
                outf.write(f"{memout_addr:014b}\n")
                outf.write(f"{memout_rd:01b}\n")
                outf.write(f"{memout_wr:01b}\n")
                outf.write(f"{memout_byteena:04b}\n")
                outf.write(f"{memout_wrdata}\n")
                outf.write(f"{exc_load:01b}\n")
                outf.write(f"{exc_store:01b}")

                if not (i == 4 and j == ROUNDS - 1):
                    outf.write("\n\n")

# DATA GENERATED