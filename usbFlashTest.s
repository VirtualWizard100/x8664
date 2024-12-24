%include "fileio.s"
global _start

section .text
_start:
	jmp Ioctl
Ioctl:
	call Openat
	mov eax, 0x10
	mov edi, r11d
	mov esi, 0xc0105512
	lea rdx, [struct_USBDEVFS_DISCONNECT]
	syscall
	close edi
	nanosleep nanosleep_time, nanosleep_time
	call Openat
	mov eax, 0x10
	mov edi, r11d
	mov esi, 0xc0105512		;( /usr/include/linux/usbdevice_fs.h ) Line 516775: #define USBDEVFS_IOCTL             _IOWR('U', 18, struct usbdevfs_ioctl)
	lea rdx, [struct_USBDEVFS_CONNECT]
	syscall
	nanosleep nanosleep_time, nanosleep_time
	add r10d, 0x1
	cmp r10d, 0xa
	jb Ioctl
	jmp exit

Openat:
	openat -100, file, UGO_W, STDIN
	mov r11d, eax
	ret

exit:
	mov eax, 0x3c
	xor edi, edi
	syscall

section .data

( /usr/include/linux/usbdevice_fs.h ) Line 516706: struct usbdevfs_ioctl {
							int     ifno;           /* interface 0..N ; negative numbers reserved */
					        	int     ioctl_code;     /* MUST encode size + direction of data so the
						                                 * macros in <asm/ioctl.h> give correct values */
        						void *data;     /* param buffer (in, or out) */
							};

struct_USBDEVFS_DISCONNECT:
	dd 0x0
	dd 0x00005516

struct_USBDEVFS_CONNECT:
	dd 0x0
	dd 0x00005517

file:
	db "/dev/bus/usb/001/007", 0 	;use lsusb to find the bus number, and device number of the usb that you want to flash

nanosleep_time:
	dd 0x5				;amount of seconds to sleep between connects and disconnects

