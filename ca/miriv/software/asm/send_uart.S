		.text
		.align  2
		.globl  _start

_start:
		nop
		nop
		nop
		#set ascii code of character to be sent here (i.e., in a0, "K" in this example) and send it
		addi a0,x0,0x4B
		jal ra,send_char
		nop
		nop
		nop
		#send newline
		addi a0,x0,0x0A
		jal ra,send_char
		nop
		nop
		nop

loop:
		jal x0,loop

send_char:
		lbu  a5,-8(x0) #check status
		nop
		nop
		nop
		andi a5,a5,1
		nop
		nop
		nop
		beq  a5,x0,send_char
		nop
		nop
		nop
		andi a5,a0,255
		nop
		nop
		nop
		sb  a5,-4(x0) #write data
		nop
		nop
		nop
		jalr x0,0(ra)

		nop
		nop
		nop
		
		.end _start
		.size _start, .-_start
