; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main 0
Main.main:
; 1 - PUSH constant 55
leaw $55, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - POP temp 4
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $14, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
leaw $0, %A
movw %D, (%A)
leaw $14, %A
movw (%A), %D
leaw $9, %A
movw %D, (%A)
; 3 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 4 - POP temp 3
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $14, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
leaw $0, %A
movw %D, (%A)
leaw $14, %A
movw (%A), %D
leaw $8, %A
movw %D, (%A)
; Label (marcador)
LOOPING:
; 5 - PUSH temp 4
leaw $9, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 6 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 7 - EQ
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %D
incw %A
subw (%A), %D, %D
leaw $EQ_TRUE_0, %A
je %D
nop
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $0, %D
movw %D, (%A)
leaw $EQ_END_0, %A
jmp
nop
EQ_TRUE_0:
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $-1, %D
movw %D, (%A)
EQ_END_0:
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; 8 - Goto Condicional
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $13, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $13, %A
movw (%A), %D
leaw $END, %A
jne %D
nop
; 9 - PUSH temp 3
leaw $8, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 10 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 11 - ADD
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw (%A), %D, %D
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; 12 - POP temp 3
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $14, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
leaw $0, %A
movw %D, (%A)
leaw $14, %A
movw (%A), %D
leaw $8, %A
movw %D, (%A)
; 13 - PUSH temp 4
leaw $9, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 14 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 15 - SUB
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
subw %D, (%A), %D
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; 16 - POP temp 4
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $14, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
leaw $0, %A
movw %D, (%A)
leaw $14, %A
movw (%A), %D
leaw $9, %A
movw %D, (%A)
; 17 - Goto Incondicional
leaw $LOOPING, %A
jmp
nop
; Label (marcador)
END:
; Label (marcador)
while:
; 18 - Goto Incondicional
leaw $while, %A
jmp
nop
; End
