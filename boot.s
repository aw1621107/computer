.code16

.global mbr_boot

mbr_boot:
	movb $0x0e, %ah
	movb $'!', %al
	int $0x10
	jmp mbr_boot

.org 510
.byte 0x55
.byte 0xaa
