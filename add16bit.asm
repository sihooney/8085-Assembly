; Add 2 16 bit numbers, A and B
; Input A in 0H (MSB) and 1H (LSB), input B in 2H (MSB), 3H (LSB)
; Output sum at 4H (MSB) and 5H (LSB)
; If overflow, sum is set to 0xDEADBEEF at locations 4H, 5H, 6H, 7H
; 0xDE at 4H, 0xAD at 5H, 0xBE at 6H, 0xEF at 7H

LDA 1H ; Load accumulator with LSB of first number
LXI H, 3H
ADD M ; Add the LSB of second number
STA 5H ; Store LSB of result at 5H
LDA 0H ; Load accumulator with MSB of first number
LXI H, 2H
ADC M ; Add MSB of second number with carry from previous addition
STA 4H ; Store MSB of result at 4H
JC overflow ; If overflow
LXI H, 6H ; Set memory at 6H and 7H to 0 if no overflow
MVI M, 0H
LXI H, 7H
MVI M, 0H
JMP done ; Finished
overflow: LXI H, 4H ; Set sum to 0xDEADBEEF
MVI M, 0DEH
LXI H, 5H
MVI M, 0ADH
LXI H, 6H
MVI M, 0BEH
LXI H, 7H
MVI M, 0EFH
done: HLT