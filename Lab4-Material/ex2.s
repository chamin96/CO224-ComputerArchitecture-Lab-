@ ARM Assembly: Lab 4 - exercise 2 
@ Write an ARM Assembly program to read two numbers and print whether they are equal or not
	.text 	@ instruction memory
	.global main
main:
	@ push (store) lr to r9
	mov r9,lr

	
@-------------------input number 1
    ldr r0, =first
    bl printf

	sub sp,sp,#4 		@allocate stack for input
	ldr r0, =formatd	@scanf("%d")
	mov r1,sp
    bl scanf

	ldr r4,[sp,#0]		@load and save x
	str r4,[sp,#4]
	
@--------------------input number 2
	ldr r0, =second
    bl printf

	sub sp,sp,#4 		@allocate stack for input
	ldr r0, =formatd	@scanf("%d")
	mov r1,sp
    bl scanf

	ldr r4,[sp,#0]		@load and save y
	str r4,[sp,#8]

@--------------------load and compare
    ldr r4,[sp,#4] 		@load num1
    ldr r5,[sp,#8]		@load num2
	
	cmp r4,r5
    beq same
	
	ldr r0, =notEqual
    bl printf
    b exit
	
same:
    ldr r0, =equal
	bl printf
	

exit:	
	


	@ stack handling (pop lr from the r9) and return
	mov lr,r9
	mov pc, lr

	.data	@ data memory
first: .asciz "Enter number 1: "
second: .asciz "Enter number 2: "
formatd: .asciz "%d"
equal: .asciz "Number 1 and Number 2 are EQUAL.\n"
notEqual: .asciz "Number 1 and Number 2 are NOT EQUAL.\n"

