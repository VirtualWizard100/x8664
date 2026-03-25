section .text

global _start

_start:
	mov r8, messagelen
	call loop
	call print
	jmp exit

loop:
	mov al, [message + r9]
	mov dl, [key + r9]
	xor al, dl
	mov [buffer + r9], al
	inc r9
	cmp r9, 11
	jne loop
	ret

print:
	mov eax, 0x1
	mov edi, 0x1
	mov rsi, buffer
	mov rdx, messagelen
	syscall
	mov BYTE [r9len], r9b
	mov [r9len + 1], 0xa
	mov eax, 0x1
	mov edi, 0x1
	mov esi, r9len
	mov edx, 0x2
	syscall
	ret

exit:
	mov eax, 60
	mov edi, 0
	syscall

section .data
buffer:
	db 0 dup (100)
message:
	db "encrypt me", 0xa

messagelen equ $-message

key:
	db "b3BlbnNzaC1"

section .bss
r9len:
	resb 2
