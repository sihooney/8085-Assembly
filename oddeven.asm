; Checks if a number is even or odd.
; Input number is in 0H, output is in 1H.
; If number is odd, outptut 0xFF, otherwise 0x0

LDA 0H ; Load accumulator with input
ANI 1H ; Logical AND with 1
LXI H, 1H ; Set output memory location
JZ even ; Jump if zero flag to even
MVI M, 0FFH ; Output 0xFF if odd
JMP done ; done
even: MVI M, 0H ; Output 0 if even
done: HLT