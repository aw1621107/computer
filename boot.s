.code16
.intel_syntax noprefix

.global mbr_boot

mbr_boot:
	mov ah, 0x0e
	mov al, '!'
	int 0x10
	jmp mbr_boot

.org 510
.byte 0x55
.byte 0xaa
