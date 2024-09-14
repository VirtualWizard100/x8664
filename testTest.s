global _start

_start:
	mov r9, 0xaa
	mov r8, 0x55
	test r9, r8
	jz Message
	jmp exit

Message:
	mov al, 1
	mov dil, 1
	mov rsi, message
	mov rdx, len
	syscall
	jmp exit

exit:
	mov eax, 60
	mov dil, 0
	syscall

section .data
message:
	db "It worked.", 0xa
len equ $-message
