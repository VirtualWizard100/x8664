section .text

global _start

_start:
	mov rsi, msg1
	mov rdi, msg2
	mov rcx, 9
	rep cmpsb
	jnz Not_Equal
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, Equal_String
	mov rdx, E_String_len
	syscall
	jmp exit


Not_Equal:
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, Not_Equal_String
	mov rdx, NE_String_len
	syscall
	jmp exit

exit:
	mov rax, 0x3c
	xor rdi, rdi
	syscall

section .data
msg1:
	db "String 1", 0xa
msg2:
	db "String 2", 0xa

Not_Equal_String:
	db "The 2 strings are not equal", 0xa
NE_String_len equ $-Not_Equal_String

Equal_String:
	db "The 2 strings are equal", 0xa
E_String_len equ $-Equal_String
