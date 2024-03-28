; Compare two integers A and B to return the greater one.
; Input memory locations are 0H and 1H
; Output the greater number in memory location 2H.

LXI H, 0H
MOV A, M ; Move first number into accumulator
LXI H, 1H
MOV B, M ; Move second number into register B
CMP M ; Compares second number to accumulator
LXI H, 2H ; Set output location
JNC first ; Jump if first number larger
JC second ; Jump if second number larger
first: MOV M, A ; Output first number
JMP done
second: MOV M, B ; Output second number
done: HLT