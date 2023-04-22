.text
swap:
	mov r8, #4

	add r6, r11, #8
	mul r8, r0, r8
	add r6, r6, r8

	ldr r9, [r6]

	mov r8, #4

	add r10, r11, #8
	mul r8, r1, r8
	add r10, r10, r8

	ldr r8, [r10]
	str r8, [r6]
	str r9, [r10]

	bx lr
