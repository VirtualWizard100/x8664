global _start

_start:
	mov eax, 0x1
	mov edi, 0x1
	mov esi, message
	mov edx, len
	syscall
	mov eax, 60
	mov edi, 0
	syscall

section .data
	message:
		db "Oi lads.", 0xa
	len equ $-message


