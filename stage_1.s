.code16

.global stage_1_prelude

stage_1_prelude:
	jmp $0x0000, $(0x7c00 + mbr_boot)

mbr_boot:
	movb $0x0e, %ah
	movb $'!', %al
	int $0x10
	jmp mbr_boot

.org 510
.byte 0x55
.byte 0xaa
