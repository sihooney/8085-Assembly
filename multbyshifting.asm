; Multiply 2 8-bit numbers through shifting
; Input numbers as 0H and 1H
; Output answer at 2H (highest 8 bits) and 3H (lower 8 bits)

LXI H, 0H
MOV C, M ; Move first operand into register C
MVI B, 0H ; Clear register B
LXI H, 1H
MOV D, M ; Move second operand into register D
MVI E, 8H ; Set register E as loop counter
LXI H, 0H ; Set HL register as result
multloop: MOV A, D ; Move second operand to accumulator
ANI 1H ; Check if LSB is 1 or 0
JZ shift
DAD B ; If 1, add
shift: MOV A, C
STC
CMC ; Clear carry flag
RAL ; Rotate left through carry
MOV C, A ; Store the shifted lower 8 bits
MOV A, B ; Higher 8 bits
RAL ; Rotate left through carry
MOV B, A ; Store shifted higher 8 bits
MOV A, D
RRC ; Shift second operand right to check next bit
MOV D, A
DCR E ; Decrement loop counter
JNZ multloop
XCHG
LXI H, 3H
MOV M, E ; Output lower 8 bits of answer
LXI H, 2H
MOV M, D ; Output higher 8 bits of answer
HLT