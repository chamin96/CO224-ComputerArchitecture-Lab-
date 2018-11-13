@ ARM Assembly: Lab 4 - exercise 4
@ 
    .text 	@ instruction memory
@---------------------------------string reverse function
strRev:
    sub sp,sp,#12
    str r4,[sp,#0]
    str r5,[sp,#4]
    str r9,[sp,#8]

    mov r4,#0   @iterator=0
strLength:    
    add r2,r4,r1
    ldrb r3,[r2,#0]
    cmp r3,#0
        beq exit_strLength
    add r4,r4,#1
    b strLength

    mov r5,#1
    add r6,r4,r1
exit_strLength:
    add r2,r4,r1
    ldrb r3,[r2,#0]
    add r12,r5,r6
    strb r3,[r12,#0]
    cmp r4,#0
        beq exit_strRev
    sub r4,r4,#1
    add r5,r5,#1
    b exit_strLength

exit_strRev:
    mov r0,r12
    ldr r4,[sp,#0]
    ldr r5,[sp,#4]
    ldr r9,[sp,#8]
    add sp,sp,#12
    mov pc,lr

@-----------------------------main
	.global main
main:
	@ push (store) lr to r9
	mov r9,lr

@-------------------input number
    ldr r0, =first
    bl printf

	sub sp,sp,#4 		@allocate stack for input
	ldr r0, =formatd	@scanf("%d")
	mov r1,sp
    bl scanf

	ldr r4,[sp,#0]		@load and save num
	str r4,[sp,#4]
@--------------------	
    ldr r4,[sp,#4]      @load number

    cmp r4,#0           @check for invalid numbers
    ble invalid

    mov r5,#0           @counter starting from 0
    b loop
loop:                   @while counter<=number
    cmp r5,r4
    beq exit

    ldr r0, =second     @enter input string
    mov r1,r5
    bl printf

    add r5,r5,#1

@----------------------scan string
	sub sp,sp,#200 		@allocate stack for input
	ldr r0, =formats	@scanf("%s")
	mov r1,sp
    bl scanf

    
    mov r1,sp
    bl strRev
    mov r1,r0
    ldr r0, =printStr
    bl printf

    b loop
invalid:                
    ldr r0, =invalid_msg
    bl printf
    b exit

exit:
@--------------------
	@ stack handling (pop lr from the r9) and return
	mov lr,r9
	mov pc, lr

	.data	@ data memory
first: .asciz "Enter the number of strings: "
formatd: .asciz "%d"
invalid_msg: .asciz "Invalid Number\n"
second: .asciz "Enter the input string %d:\n"
formats: .asciz "%s"
printStr: .asciz "%s\n"


