; Calculate the sum of the squares of the first n natural numbers
; Input n located at 0x1000, n >= 1
; Output sum of series at 0x1001 and 0x1002 (16-bit) answer

LXI H, 1000H
MOV A, M ; Set accumulator to n
; Will calculate sums decreasing, from n down to 1
LXI H, 0H ; Set HL register pair as answer
sum: XCHG ; Store sum in DE registers
MVI H, 0H
MVI L, 0H
MOV C, A ; Store current n in register C
square: DAD B ; Add n
DCR A ; Decrement loop counter
JNZ square
DAD D ; Now add the square to the sum
MOV A, C
DCR A
JNZ sum
XCHG ; Store sum in DE registers
; Output sum
LXI H, 1001H
MOV M, D
LXI H, 1002H
MOV M, E
hlt