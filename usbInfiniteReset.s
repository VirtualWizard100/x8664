%include "../x8664/fileio.s"
global _start

section .text
_start:
	openat 0x10, file, UGO_RW, STDIN
	ja Mmap
	write 1, errmessage, len
	jmp ErrorExit
Mmap:
	mov r8d, eax
	mov eax, 0x9
	mov edi, 0x0
	mov esi, 0x1000
	mov edx, 0x1
	mov r10d, r8d
	syscall
	ja Ioctl
	write 1, errmessage, len
	jmp ErrorExit

Ioctl:
	mov edi, r8d	;Move the open device file descriptor into edi
	mov rdx, rax	;move the mmap pointer of the device into rdx
	mov rax, 0x10	;ioctl syscall number
	mov rsi, 0x00005514	;bit 31 = Read, bit 30 = Write, bits 29-16 = size of arguements, 15-8 = ascii character for group of commands
	syscall
	jmp Ioctl

ErrorExit:
        mov eax, 0x3c
        mov edi, 0x1
        syscall

exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data
file:
	db "/dev/bus/usb/001/005", 0	;Path of usb you want to infinitely reset, use lsusb to get the bus directory, and device file

errmessage:
	db "Couldn't obtain usb device file descriptor.", 0xa
len equ $-errmessage
