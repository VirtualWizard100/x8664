global _start

section .data
message: db 0xa, 0x41

Out: db 0



section .text
_start:
	lea r9, [message+1] 	;r9 obtains the address at the 1 byte offset from message (or the start of db in message, they both have the same address since message is just a symbol for it)
	mov r10b, [r9]		;Loading the value stored at the address that r9 is pointing to into r10
	mov [Out], r10b		;storing r10's new value into the empty byte in Out
	mov al, 1
	mov dil, 1
	mov esi, Out
	mov dl, 1
	syscall
	jmp exit
exit:
	mov ax, 60
	mov dil, 0
	syscall
