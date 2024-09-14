global _start

_start:
	mov r9, 1
	not r9	;Same thing as mvn in ARM64/32
	jmp exit
exit:
	mov rax, 60
	mov rdi, 0
	syscall
