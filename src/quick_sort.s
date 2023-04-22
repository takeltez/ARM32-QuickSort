.include "partition.s"

.text
quick_sort:
	push {lr}

	cmp r0, r1
	bge _qs_exit

	sub sp, sp, #12

	str r0, [sp]
	str r1, [sp, #4]

	bl partition

	str r0, [sp, #8]
	sub r0, r0, #1

	mov r1, r0
	ldr r0, [sp]

	bl quick_sort

	ldr r0, [sp, #8]
	add r0, r0, #1

	ldr r1, [sp, #4]

	bl quick_sort

	add sp, sp, #12

_qs_exit:
	pop {lr}
	bx lr
