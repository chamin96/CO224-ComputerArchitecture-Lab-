# CO224-Lab
Computer Architecture Lab Sessions

#ASSEMBLY Program
*Save with .s extension
*Comments starts with @ (even // would do)
*Things starting with '.' are called assembler directives (eg : .text , .global)
*Assembler directives directs the assembler
*Assembler : program that convers instructions to machine code
*One instruction per one line

#CROSS COMPILER
*On Linux sudo apt-get install gcc-arm-linux-gnueabi

#EMULATOR
*On Linux sudo apt-get install qemu-user

#Assembling and Running
##Assemble
  arm-linux-gnueabi-gcc -Wall example.s -o example
##Run
  qemu-arm -L /usr/arm-linux-gnueabi example
