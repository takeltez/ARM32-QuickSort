.text
input:
	push {lr}

	sub r6, r6, #1
	str r6, [sp, #4]

	add r5, sp, #4
	mov r4, r1

_input_loop:
	ldr r0, [r4, #4]!

	bl atoi

	str r0, [r5, #4]!

	sub r6, r6, #1
	cmp r6, #0

	beq _out_of_input_loop
	bal _input_loop

_out_of_input_loop:
	pop {lr}
	bx lr

output:
	push {lr}

	ldr r0, =arr_name_msg

	bl printf

	ldr r6, [sp, #4]
	add r5, sp, #4

_output_loop:
	ldr r0, =arr_cont_msg
	ldr r1, [r5, #4]!

	bl printf

	sub r6, r6, #1
	cmp r6, #0

	beq _out_of_output_loop
	bal _output_loop

_out_of_output_loop:
	ldr r0, = nl_msg

	bl printf

	ldr r0, =size_msg
	ldr r1, [sp, #4]

	bl printf

	pop {lr}
	bx lr

print_err:
	push {lr}

	ldr r0, =err_msg

	bl printf

	pop {lr}
	bx lr

.data
size_msg:
	.asciz "Size: %d\n"
arr_name_msg:
	.asciz "Array: "
arr_cont_msg:
	.asciz "%d "
nl_msg:
	.asciz "\n"
err_msg:
	.asciz "Wrong array size\n"
