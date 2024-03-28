; Calculates the first n Fibonacci numbers
; Input n is stored at 0H
; Outputs stored at 1H, 2H, 3H...

LXI H, 0H
MOV B, M ; Set register B to be equal to n
MVI A, 1H ; Load accumulator with 1H
CMP B
JC generate ; If n >= 2
JZ one ; If n = 1
JMP done ; If n = 0 then done
one: LXI H, 1H
MVI M, 1H ; Set first term to 1
JMP done ; If n = 1, then done
generate: LXI H, 1H
MVI M, 1H ; First term at location 1H is 1
MOV D, M ; Set register D to be previous term
LXI H, 2H
MVI M, 1H ; Second term at location 2H is 2
MOV E, M ; Set register E to be current term
DCR B
DCR B ; Set register B to be number of new terms to generate
JM done ; If n < 2 then done
JZ done ; If n = 2 then done
; Otherwise, calculate the next term
next: MOV A, D ; Move previous term to accumulator
ADD E ; Add current term to get next term
INX H ; Get next memory location
MOV M, A ; Store next term
MOV D, E ; Set the new previous term in register D
MOV E, A ; Set the current term in register E
DCR B ; Decrement loop counter
JZ done ; If loop counter at 0 then done
JMP next ; Otherwise loop again
done: HLT