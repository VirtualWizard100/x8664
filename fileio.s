;read/write
STDIN equ 0
STDOUT equ 1
STDERR equ 2

;chmod
O_READ equ 0004
O_WRITE equ 0002
O_EXEC equ 0001
G_READ equ 0040
G_WRITE equ 0020
G_EXEC equ 0010
U_READ equ 0400
U_WRITE equ 0200
U_EXEC equ 0100
O_RW equ 0006
O_RX equ 0005
O_WX equ 0003
O_RWX equ 0007
G_RW equ 0060
G_RX equ 0050
G_WX equ 0030
G_RWX equ 0070
U_RW equ 0600
U_RX equ 0500
U_WX equ 0300
U_RWX equ 0700
UGO_RWX equ 0777

%macro read 3
	mov al, 0
	mov dil, %1
	mov esi, %2
	mov dx, %3
	syscall
%endmacro

%macro write 3
	mov al, 1
	mov dil, %1
	mov esi, %2
	mov dx, %3
	syscall
%endmacro

%macro chmod 2
	mov ax, 60
	mov rdi, %1
	mov esi, %2
	syscall
%endmacro
