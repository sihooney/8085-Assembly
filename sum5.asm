; Calculate sum of 5 numbers.
; Input numbers located at 1H, 2H, 3H, 4H, 5H
; Output sum located in 6H

MVI A, 0H ; Set accumulator to 0
MVI B, 5H ; Set register B to be loop counter with value of 5
LXI H, 0H ; Set memory pointer to 0H
sum: INX H ; Increment memory to point to next value to add
ADD M ; Add next value
DCR B ; Decrement loop counter
JZ done ; Check if loop finished
JMP sum ; Otherwise keep adding next value
done: STA 6H ; Output sum
HLT