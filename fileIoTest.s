%include "fileio.s"

global _start

section .text
_start:
	read 0, input, 32
	write STDOUT, message, 5
	write STDOUT, input, 32
	jmp exit

exit:
	mov ax, 60
	mov dil, 0
	syscall

section .data
message:
	db "Ahoy "
section .bss
input:
	resb 32
