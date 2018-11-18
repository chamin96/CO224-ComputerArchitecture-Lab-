@ ARM Assembly: Lab 4 - exercise 3
@ 


	.text 	@ instruction memory
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

@--------------------   @print 1 to n
    ldr r4,[sp,#4] 		@load num
    mov r5,#1           @counter starting from 1

loop:
    cmp r4,r5
    blt exit


    ldr r0, =printNum
    mov r1,r5
    bl printf

    add r5,r5,#1
    b loop


exit:

@--------------------
	@ stack handling (pop lr from the r9) and return
	mov lr,r9
	mov pc, lr

	.data	@ data memory
first: .asciz "Enter a number: "
formatd: .asciz "%d"
printNum: .asciz "%d\n"

