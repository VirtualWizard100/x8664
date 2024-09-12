;read/write
STDIN equ 0
STDOUT equ 1
STDERR equ 2

;chmod
O_READ equ 0o004
O_WRITE equ 0o002
O_EXEC equ 0o001
G_READ equ 0o040
G_WRITE equ 0o020
G_EXEC equ 0o010
U_READ equ 0o400
U_WRITE equ 0o200
U_EXEC equ 0o100
O_RW equ 0o006
O_RX equ 0o005
O_WX equ 0o003
O_RWX equ 0o007
G_RW equ 0o060
G_RX equ 0o050
G_WX equ 0o030
G_RWX equ 0o070
U_RW equ 0o600
U_RX equ 0o500
U_WX equ 0o300
U_RWX equ 0o700
UGO_RWX equ 0o777

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
	mov eax, 0x5a
	mov rdi, %1
	mov rsi, %2
	syscall
%endmacro
