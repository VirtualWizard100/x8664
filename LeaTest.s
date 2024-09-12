global _start

section .data
message: db 0xa, 0x41

Out: db 0



section .text
_start:
	mov r10, message
	lea r9, [message+1]
	mov r10, [r9]
	mov [Out], r10b
	mov al, 1
	mov dil, 1
	mov rsi, Out
	mov dl, 1
	syscall
	jmp exit
exit:
	mov rax, 60
	mov rdi, 0
	syscall
