global _start

_start:
	push rbp	;push the current address of the base pointer
	push rbx
	push r12
	push r13
	push r14
	push r15
	mov ebp, esp	;move the stack frame pointer into the base pointer
	sub rsp, 0x10	;decrement the stack pointer by 16 bytes to point to reserve room for 2 8 byte local variables
	add r10, 0xa
	cmp r10, 100
	mov [eax], ebp
	jmp QWORD[eax]
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp
	jmp exit

exit:
	mov rax, 60
	mov dil, 0
	syscall
