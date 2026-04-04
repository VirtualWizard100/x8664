section .text
global _start

_start:
	xor r10, r10
	mov r11, hexlen
	jmp valueSort

valueSort:
	xor r9, r9
	cmp r10, r11
        je write
	mov r9b, BYTE [hex + r10]
	cmp r9b, 0xa
	jl number
	jmp letter

write:
	mov eax, 0x1
	mov rdi, 0x1
	mov rsi, buffer
	mov rdx, bufferlen
	syscall
	mov eax, 0x1
	mov edi, 0x1
	mov esi, newline
	mov edx, 1
	syscall
	jmp exit

number:
	add r9, 0x30
	mov BYTE [buffer + r10], r9b
	inc r10
	jmp valueSort

letter:
	add r9, (0x41 - 0xa) ;add Ascii A - 0xa (10)
	mov BYTE [buffer + r10], r9b
	inc r10
	jmp valueSort

exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data
hex:
	db 0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xA, 0xB, 0xC, 0xD, 0xE, 0xF
hexlen equ $-hex

buffer:
	times hexlen db 0
bufferlen equ $-buffer

newline:
	db 0xa
