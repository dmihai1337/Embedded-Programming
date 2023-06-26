		.text
		.align  2
		.globl  _start

_start:
		addi x5, x0, 0
		nop
		nop
loop:
		addi x5, x5, 1
		sw x5, 16(x0)
		lw x16, 16(x0)
		add x1, x5, x16
		jal x0, loop
		addi x5, x5, 10
		addi x5, x5, 10
		addi x5, x5, 10

		.end _start
		.size _start, .-_start
