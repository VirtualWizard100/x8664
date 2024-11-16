global _start

section .text
_start:
	mov eax, 0x3B
	mov edi, file
	mov esi, 0x0
	mov edx, 0x0
	syscall

exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data
file:
	db "fileTest", 0

