%include "fileio.s"
global _start

section .text
_start:
	openat -100, file, UGO_RW, STDIN
	mov edi, eax
	mov eax, 0x5
	mov esi, buffer
	syscall
	write 1, buffer, len
exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data
file:
	db "fstatTest.s", 0

section .bss
buffer:
	resb 88
len equ $-buffer
