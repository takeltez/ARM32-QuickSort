.include "i_o.s"
.include "quick_sort.s"

.global main

.text
main:
	cmp r0, #2
	bhi _correct
	b err_exit

_correct:
	mov r2, #4

	mul r3, r0, r2
	sub sp, sp, r3

	bl d_in

	mov r0, #0
	ldr r1, [sp, #4]
	sub r1, r1, #1

	bl quick_sort

	bl d_out

	mov r2, #4

	ldr r0, [sp, #4]
	add r0, r0, #2

	mul r3, r0, r2
	add sp, sp, r3

	mov r7, #1
	swi 0
