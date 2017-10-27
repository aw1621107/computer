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

.macro print string_label
	pushw %si
	movw $(\string_label - (end_stage_1_relocation - begin_stage_1_relocation)), %si
	call print_asciz_string
	popw %si
.endm

print_asciz_string:
	push %ax
	movb $0x0e, %ah
print_asciz_string_loop_begin:
	lodsb
	test %al, %al
	jz print_asciz_string_done
	int $0x10
	jmp print_asciz_string_loop_begin
print_asciz_string_done:
	movb $0x0d, %al
	int $0x10
	movb $0x0a, %al
	int $0x10
	pop %ax
	ret

string_section_begin:
string_section_end:

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
