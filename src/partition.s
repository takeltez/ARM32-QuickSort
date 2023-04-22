.include "swap.s"

.text
a_sort:
	cmp r5, r4
	bge _a_sort_exit

	ldr r5, [sp]
	add r5, r5, #1
	str r5, [sp]

	push {r1, lr}

	mov r0, r5
	mov r1, r2

	bl swap

	pop {r1, lr}

_a_sort_exit:
	bx lr

d_sort:
	cmp r5, r4
	ble _d_sort_exit

	ldr r5, [sp]
	add r5, r5, #1
	str r5, [sp]

	push {r1, lr}

	mov r0, r5
	mov r1, r2

	bl swap

	pop {r1, lr}

_d_sort_exit:
	bx lr

partition:
	push {lr}

	sub sp, sp, #8

	mov r2, #4

	add r3, r11, #8
	mul r2, r1, r2
	add r3, r3, r2

	ldr r3, [r3]
	str r3, [sp, #4]

	sub r3, r0, #1
	str r3, [sp]

	sub r3, r1, #1
	mov r2, r0

_part_loop:
	cmp r2, r3
	bgt _part_loop_exit

	mov r4, #4

	add r5, r11, #8
	mul r4, r2, r4
	add r5, r5, r4

	ldr r5, [r5]
	ldr r4, [sp, #4]

	ldrb r6, [r11]

	cmp r6, #'d'
	bne _a_mode

	bl d_sort
	b _part_loop_step

_a_mode:
	bl a_sort

_part_loop_step:
	add r2, r2, #1
	bal _part_loop

_part_loop_exit:
	ldr r5, [sp]
	add r5, r5, #1

	mov r0, r5

	bl swap

	ldr r2, [sp]
	add r0, r2, #1

	add sp, sp, #8

	pop {lr}
	bx lr
