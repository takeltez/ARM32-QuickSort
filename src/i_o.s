.text
d_in:
	push {lr}

	sub r0, r0, #2
	str r0, [sp, #8]

	mov r4, r0
	mov r5, r1

	ldr r0, [r1, #4]
	ldr r0, [r0]
	str r0, [sp, #4]

	bl check_mode

	mov r0, r4
	mov r1, r5

	add r4, r1, #4
	mov r5, r0
	add r6, sp, #8

_d_in_loop:
	ldr r0, [r4, #4]!

	bl atoi

	str r0, [r6, #4]!

	sub r5, r5, #1
	cmp r5, #0

	beq _d_in_loop_exit
	bal _d_in_loop

_d_in_loop_exit:
	add r11, sp, #4

	pop {lr}
	bx lr

d_out:
	push {lr}

	ldr r0, =arr_name_msg
	ldr r1, [sp, #8]

	bl printf

	add r4, sp, #8
	ldr r5, [sp, #8]

_d_out_loop:
	ldr r0, =arr_cont_msg
	ldr r1, [r4, #4]!

	bl printf

	sub r5, r5, #1
	cmp r5, #0

	beq _d_out_loop_exit
	bal _d_out_loop

_d_out_loop_exit:
	ldr r0, = nl_msg

	bl printf

	pop {lr}
	bx lr

check_mode:
	ldrb r0, [sp, #4]

	cmp r0, #'a'
	bne _a_d
	b _a_or_s_m

_a_d:
	cmp r0, #'d'
	bne err_exit

_a_or_s_m:
	bx lr

print_err:
	push {lr}

	ldr r0, =err_msg

	bl printf

	pop {lr}
	bx lr

err_exit:
	bl print_err

	mov r7, #1
	swi 0

.data
arr_name_msg:
	.asciz "Sorted array[%d]: "
arr_cont_msg:
	.asciz "%d "
nl_msg:
	.asciz "\n"
err_msg:
	.asciz "quicksort [sort mode] elem0, elem1, elem2, ...\n\nsort mode:\n\ta - ascending sort\n\td - descending sort\n"
