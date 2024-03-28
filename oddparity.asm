; Check if the lowest 7 bits of a number has an even number of 1s
; Input number located at 0H
; If even number of 1s, the make MSB of input 1, otherwise 0

LXI H, 0H
MOV B, M ; Load register B with number
MVI C, 7H ; Set register C as loop counter
MVI D, 0H ; Set register D to count number of 1s
MVI E, 1H ; Set register E as number to AND number with
checkbit: MOV A, E ; Move E to accumulator
ANA B ; Check if bit is 1 or 0
JZ continue ; If bit is 0, continue
INR D ; Otherwise, increment counter of 1s
continue: MOV A, E ; Move E back into accumulator
RLC ; Rotate accumulator left to get new number to AND number with
MOV E, A ; Move number into E
DCR C ; Decrement loop counter
JNZ checkbit ; Loop again
MOV A, D ; Move D into A
ANI 1H ; AND with 0b0000001 to check odd/even
MOV A, B ; Load accumulator with B
JZ even ; If even number of 1s
JNZ odd ; If odd number of 1s
even: ORI 80H ; Logical OR to set MSB as 1
JMP done ; Finished
odd: ANI 7FH ; Logical AND to set MSB as 0
done: MOV M, A ; Output answer
HLT