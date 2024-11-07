global _start

section .text
_start:
	mov eax, 0x3e
	mov edi, 4396
	mov esi, 0x9
	syscall

exit:
	mov eax, 0x3c
	mov edi, 0x0
	syscall
