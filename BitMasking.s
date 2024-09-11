global _start

section .data
message:
	db 0, 0

section .text
_start:
	mov r10w, 0x0a41
	mov [message], r10w
	mov eax, 1
	mov edi, 1
	mov esi, message
	mov edx, 2
	syscall
	jmp exit

exit:
	mov eax, 60
	mov edi, 0
	syscall

