global _start

section .text
_start:
	mov r9b, BYTE [arr+4]
	mov al, 1
	mov dil, 1
	mov [message], r9b
	mov esi, message
	mov rdx, 2
	syscall
	jmp exit

exit:
	mov eax, 60
	mov dil, 0
	syscall

section .data
arr:
	db 0, 0, 0, 0, 65, 0, 0, 0
message:
	db 0, 0xa
