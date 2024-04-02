; Determine greatest common divisor of two numbers, x and y
; Using subtraction-based Euclidean algorithm
; Input numbers as 0H and 1H
; Output GCD at 2H

LXI H, 0H
MOV B, M ; Store x in register B
LXI H, 1H
MOV C, M ; Store y in register C
MOV A, B
CPI 0H ; Check if x = 0
JZ xzero
MOV A, C
CPI 0H ; Check if y = 0
JZ yzero
euclid: MOV A, B
CMP C ; Check if x = y
JZ done ; If x = y, then finished
JC ylarger ; If y > x
JMP xlarger ; If x > y
ylarger: MOV A, C ; Move y to accumulator
SUB B ; Subtract x
MOV C, A ; Store y back into register C
JMP euclid ; Loop again
xlarger: MOV A, B ; Move x to accumulator
SUB C ; Subtract y
MOV B, A ; Store x back into register B
JMP euclid ; Loop again
done: LXI H, 2H
MOV M, B ; Output GCD
JMP exit
xzero: MOV A, C
CPI 0H ; Check if y = 0
JZ bothzero
LXI H, 2H
MOV M, C ; Otherwise gcd = y
JMP exit
yzero: MOV A, B
CPI 0H ; Check if x = 0
JZ bothzero
LXI H, 2H
MOV M, B ; Otherwise gcd = x
JMP exit
bothzero: LXI H, 2H
MVI M, 0H ; Output 0 if both inputs 0
exit: HLT
