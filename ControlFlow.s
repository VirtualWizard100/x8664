global _start

_start:
	add r10, 1
	jmp First

First:
	mov eax, 1
	mov edi, 1
	mov esi, message1
	mov edx, len1
	syscall
	cmp r10, 1
	je Second

Second:
	mov eax, 1
	mov edi, 1
	mov esi, message2
	mov edx, len2
	syscall
	add r10, 1
	cmp r10, 1
	jg Exit

Exit:
	mov eax, 1
	mov edi, 1
	mov esi, exitmessage
	mov edx, len3
	syscall
	mov eax, 60
	mov edi, 0
	syscall

section .data
message1:
	db "First message.", 0xa
len1 equ $-message1

message2:
	db "Second Message.", 0xa
len2 equ $-message2

exitmessage:
	db "Exiting...", 0xa
len3 equ $-exitmessage

