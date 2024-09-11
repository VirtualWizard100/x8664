global _start

section .data
message:
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
_start:
	mov r10, 0x206c617574726956
	mov r9, 0x0a6472617a6957
	mov [message], r10
	mov [message+8], r9
	mov eax, 1
	mov edi, 1
	mov esi, message
	mov edx, 15
	syscall
	jmp exit

exit:
	mov eax, 60
	mov edi, 0
	syscall

