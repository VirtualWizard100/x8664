%include "fileio.s"
global _start

section .text
_start:
	openat -100, file, UGO_RW, STDIN
	mov edi, eax
	jmp Ioctl
Ioctl:
	mov eax, 0x10
	mov esi, 0xc0105512
	lea rdx, [USBDEVFS_DISCONNECT]
	syscall
	jmp exit

exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data
USBDEVFS_DISCONNECT:
	dd 0x0
	dd 0x00005516

USBDEVFS_CONNECT:
	dd 0x0
 	dd 0x00005517

file:
	db "/dev/bus/usb/001/004", 0
