; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main 0
Main.main:
; 1 - PUSH constant 15
leaw $15, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - PUSH constant 5
leaw $5, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 3 - chamada de funcao div 2
leaw $div$ret.0, %A
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
leaw $div, %A
jmp
nop
div$ret.0:
; 4 - POP temp 1
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
; 5 - Goto Incondicional
leaw $while, %A
jmp
nop
; 6 - Declarando função div 2
div:
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
; 7 - PUSH constant 0
leaw $0, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 8 - POP local 0
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
; 9 - PUSH argument 0
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
; 10 - POP local 1
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
LOOP_DIV:
; 11 - PUSH local 1
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
; 12 - PUSH argument 1
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
; 13 - LT
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %D
incw %A
subw (%A), %D, %D
leaw $LT_TRUE_0, %A
jl %D
nop
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $0, %D
movw %D, (%A)
leaw $LT_END_0, %A
jmp
nop
LT_TRUE_0:
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $-1, %D
movw %D, (%A)
LT_END_0:
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; 14 - Goto Condicional
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
leaw $END_DIV, %A
jne %D
nop
; 15 - PUSH local 1
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
; 16 - PUSH argument 1
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
; 17 - SUB
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
; 18 - POP local 1
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
; 19 - PUSH local 0
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
; 20 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 21 - ADD
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
; 22 - POP local 0
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
; 23 - Goto Incondicional
leaw $LOOP_DIV, %A
jmp
nop
; Label (marcador)
END_DIV:
; 24 - PUSH local 0
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
; 25 - Retorno de função
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
; End
