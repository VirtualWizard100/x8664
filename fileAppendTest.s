%include "fileio.s"
global _start

section .text
_start:
	openat -100, file, UGO_RW, STDIN
	mov rdi, rax
	mov eax, 0x8
	mov rsi, 0x0
	mov rdx, 0x2
	syscall
	fchmod rdi, UGO_RW
	write rdi, message, len
	syncfs rdi
	close rdi

exit:
	mov eax, 0x3c
	mov dil, 0x0
	syscall

section .data
file:
	db "Payload.txt", 0
message:
	db "Ahoy Matey", 0xa
len equ $-message
