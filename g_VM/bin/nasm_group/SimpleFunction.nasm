; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main 0
Main.main:
; 1 - PUSH constant 1
leaw $1, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - PUSH constant 2
leaw $2, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 3 - chamada de funcao SimpleFunction 2
leaw $SimpleFunction$ret.0, %A
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
leaw $SimpleFunction, %A
jmp
nop
SimpleFunction$ret.0:
; Label (marcador)
loop:
; 4 - Goto Incondicional
leaw $loop, %A
jmp
nop
; 5 - Declarando função SimpleFunction 2
SimpleFunction:
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
; 6 - PUSH argument 0
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
; 7 - PUSH argument 1
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
; 8 - ADD
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
; 9 - Retorno de função
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
