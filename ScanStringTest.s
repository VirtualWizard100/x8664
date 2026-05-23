section .text

global _start

_start:
	mov rax, 0x56
	mov rcx, msglen			; rcx is the counter that's going to be decremented with repne
	mov rdi, msg			; rdi is going to be the string that scasb compares the byte value in rax to
	repne scasb
	jnz Match_Not_Found		; If a match wasn't found, then the zero flag is going to be set to 0
	dec rdi				; Else the rdi register is going to be equal to 1 byte more than the offset address of the match, so you have to decrement it to get the offset address of the match
	mov rax, 0x1
	mov rsi, rdi
	mov rdi, 0x1
	mov rdx, rcx			; mov the length of the string from the match to the end into rdx
	add rdx, 0x1			; If there's a newline that's in the string, then rcx isn't going to count it as part of the string length
	syscall
	jmp exit

Match_Not_Found:
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, Not_Found_Message
	mov rdx, NF_Message_len
	syscall

exit:
	mov rax, 0x3c
	xor rdi, rdi
	syscall


section .data
msg:
	db "My name is Virtual Wizard", 0xa

msglen equ $-msg

Not_Found_Message:
	db "Match not found", 0xa
NF_Message_len equ $-Not_Found_Message
