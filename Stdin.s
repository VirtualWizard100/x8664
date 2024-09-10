global _start

_start:
        call Message1
        call GetName
        call Message2
        call PrintName
        call PrintEnd
        call Exit

Message1:
	mov eax, 0x1
	mov edi, 0x1
	mov esi, message1
	mov edx, len
	syscall

GetName:
	mov eax, 0
	mov edi, 0
	mov esi, Name
	mov edx, 50
	syscall
	ret

Message2:
	mov eax, 0x1
	mov edi, 0x1
	mov esi, message2
	mov edx, len
	syscall
	ret

PrintName:
	mov eax, 0x1
	mov edi, 0x1
	mov esi, Name
	mov edx, 50
	syscall

PrintEnd:
	mov eax, 0x1
	mov edi, 0x1
	mov esi, End
	mov edx, 2
	syscall
	ret

Exit:
	mov eax, 60
	mov edi, 0
	syscall

section .data
	message1:
		db "What is your name:", 0xa
	len equ $-message1
	message2:
		db "How's it going "
	len2 equ $-message2
	End:
		db "?", 0xa
section .bss
	Name:
		resb 32
