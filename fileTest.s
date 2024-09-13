%include "fileio.s"

global _start

section .text
_start:
	openat -100, file, U_EXEC+UGO_RW, STDIN
	mov r9, rax
	fchmod r9, UGO_RW
	read 0, var, 32
	write 1, var, 32
	write r9, var, 32
	syncfs r9
	close r9
	jmp exit

exit:
	mov rax, 60
	mov rdi, 0
	syscall

section .data
file:
	db "test.txt", 0
section .bss
var:
	resb 32
