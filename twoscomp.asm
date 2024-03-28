; Peforms absolute value on a number stored in signed two's complement
; Input number at 0H
; Output number at 1H

LXI H, 0H
MOV B, M ; Load input into register B
MVI A, 80H ; Load accumulator with 10000000b
ANA B ; Logical AND to check MSB of input
JZ positive ; If MSB = 0, then done
MOV A, B
CMA ; 1s complement
INR A ; Add 1
JMP done
positive: MOV A, B
done: LXI H, 1H
MOV M, A ; Output answer
HLT