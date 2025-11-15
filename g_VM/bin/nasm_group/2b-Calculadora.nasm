; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função mult 2
mult:
leaw $0, %A
movw $0, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $0, %A
movw $0, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 1 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - POP local 0
leaw $LCL, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %D
leaw $13, %A
movw %D, (%A)
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
leaw $13, %A
movw (%A), %A
movw %D, (%A)
; 3 - PUSH argument 1
leaw $ARG, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 4 - POP local 1
leaw $LCL, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %D
leaw $13, %A
movw %D, (%A)
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
leaw $13, %A
movw (%A), %A
movw %D, (%A)
; Label (marcador)
loop:
; 5 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 6 - PUSH local 1
leaw $LCL, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %A
movw (%A),%D
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
leaw $end, %A
jne %D
nop
; 9 - PUSH local 0
leaw $LCL, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 10 - PUSH argument 0
leaw $ARG, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %A
movw (%A),%D
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
; 12 - POP local 0
leaw $LCL, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %D
leaw $13, %A
movw %D, (%A)
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
leaw $13, %A
movw (%A), %A
movw %D, (%A)
; 13 - PUSH local 1
leaw $LCL, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %A
movw (%A),%D
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
; 16 - POP local 1
leaw $LCL, %A
movw (%A), %D
leaw $1, %A
addw %D, %A, %D
leaw $13, %A
movw %D, (%A)
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
leaw $13, %A
movw (%A), %A
movw %D, (%A)
; 17 - Goto Incondicional
leaw $loop, %A
jmp
nop
; Label (marcador)
end:
; 18 - PUSH local 0
leaw $LCL, %A
movw (%A), %D
leaw $0, %A
addw %D, %A, %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 19 - Retorno de função
leaw $LCL, %A
movw (%A), %D
leaw $13, %A
movw %D, (%A)
leaw $13, %A
movw (%A), %D
decw %D
decw %D
decw %D
decw %D
decw %D
movw %D, %A
movw (%A), %D
leaw $14, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $ARG, %A
movw (%A), %A
movw %D, (%A)
leaw $ARG, %A
movw (%A), %D
incw %D
leaw $0, %A
movw %D, (%A)
leaw $13, %A
movw (%A), %D
decw %D
movw %D, %A
movw (%A), %D
leaw $THAT, %A
movw %D, (%A)
leaw $13, %A
movw (%A), %D
decw %D
decw %D
movw %D, %A
movw (%A), %D
leaw $THIS, %A
movw %D, (%A)
leaw $13, %A
movw (%A), %D
decw %D
decw %D
decw %D
movw %D, %A
movw (%A), %D
leaw $ARG, %A
movw %D, (%A)
leaw $13, %A
movw (%A), %D
decw %D
decw %D
decw %D
decw %D
movw %D, %A
movw (%A), %D
leaw $LCL, %A
movw %D, (%A)
leaw $14, %A
movw (%A), %A
jmp
nop
; 20 - Declarando função Main.main 0
Main.main:
; 21 - PUSH constant 14
leaw $14, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 22 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 23 - ADD
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
; 24 - POP temp 0
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
leaw $5, %A
movw %D, (%A)
; 25 - PUSH constant 8
leaw $8, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 26 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 27 - SUB
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
; 28 - POP temp 2
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
leaw $7, %A
movw %D, (%A)
; 29 - PUSH temp 0
leaw $5, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 30 - PUSH temp 2
leaw $7, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 31 - chamada de funcao mult 2
leaw $mult$ret.0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $LCL, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $ARG, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $THIS, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $THAT, %A
movw (%A), %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
leaw $0, %A
movw (%A), %D
leaw $7, %A
subw %A, %D, %D
leaw $ARG, %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
leaw $LCL, %A
movw %D, (%A)
leaw $mult, %A
jmp
nop
mult$ret.0:
; 32 - POP temp 1
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
leaw $6, %A
movw %D, (%A)
; Label (marcador)
while:
; 33 - Goto Incondicional
leaw $while, %A
jmp
nop
; End
