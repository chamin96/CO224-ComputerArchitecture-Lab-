@ ARM Assembly: Lab 4 - exercise 4
@ 
    .text 	@ instruction memory

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
@--------------------	
    add sp,sp,#4        @free stack
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
    	mov r8,sp

@---------------------------get string length
    mov r6,#0   @iterator=0
strLength:    
    add r2,r6,r8        @r2=str[i]
    ldrb r3,[r2,#0]     @load str[i] to r3
    cmp r3,#0           @compare for null char
        beq str_Rev

    add r6,r6,#1        @i++
    b strLength

str_Rev:

    mov r11,sp
    sub r6,r6,#1

print_rev:
    add r2,r6,r11
    ldrb r3,[r2,#0]
    cmp r3,#0
        beq exit_rev

    mov r1,r3
    ldr r0, =formatc
    bl printf
     
    
    sub r6,r6,#1
    b print_rev

exit_rev:
    ldr r0, =newline
    bl printf
    add sp,sp,#200      @free stack

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
formatc: .asciz "%c"
printStr: .asciz "%s\n"
newline: .asciz "\n"
