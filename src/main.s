.include "i_o.s"

.global main

.text
main:
	mov r4, #4
	mov r6, r0

	mul r5, r6, r4
	sub sp, sp, r5

	bl input
	bl output

	mov r4, #4

	ldr r6, [sp]
	add r6, r6, #1

	mul r5, r6, r4
	add sp, sp, r5

	mov r7, #1
	swi 0