.code16

.global begin_stage_1_relocation

begin_stage_1_relocation:
	cli
	cld
	movw $0x0060, %ax
	movw %ax, %es
	xorw %di, %di

	movw %di, %ds
	movw $(0x7c00 + end_stage_1_relocation), %si

	movw $(510 - (end_stage_1_relocation - begin_stage_1_relocation)), %cx
	rep movs

	jmp $0x0060, $(stage_1 - end_stage_1_relocation)
end_stage_1_relocation:

stage_1:
	movw %cs, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %ss
	movw $0xfff0, %sp

	sti

	movb $0x0e, %ah
	movb $'!', %al
	int $0x10
	jmp stage_1

.org 446

.org 510
.byte 0x55
.byte 0xaa
