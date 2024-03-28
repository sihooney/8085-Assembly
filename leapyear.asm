; Check if a year is a leap year
; First two digits of year input at 0H, second two digits at 1H
; If leap year, set register B to be 1, other 0
; Output at 2H

LXI H, 0H
MOV D, M ; Store first two digits in register D
LXI H, 1H
MOV E, M ; Store last 2 digits in register E
MOV A, E
CPI 0H ; Check if last 2 digits are 00
JZ first
JNZ second
first: MOV A, D ; Check first two digits
JMP modulo
second: MOV A, E ; Check last two digits
modulo: SUI 4H ; Subtract 4
CPI 4H
JC remainder ; Remainder found
JMP modulo ; Otherwise keep subtracting 4
remainder: CPI 0H
JZ leap
JNZ notleap
leap: MVI B, 1H ; Set register B to be 1
JMP done
notleap: MVI B, 0H ; Set register to be 0
done: LXI H, 2H
MOV M, B
HLT