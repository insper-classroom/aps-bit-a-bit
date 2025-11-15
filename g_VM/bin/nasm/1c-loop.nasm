; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main
Main.main:
; 1 - PUSH constant 55
leaw $55,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 2 - POP temp 4
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $9,%A
movw %D,(%A)
; 3 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 4 - POP temp 3
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $8,%A
movw %D,(%A)
; Label (marcador)
Main.Main.main.LOOPING:
; 5 - PUSH temp 4
leaw $9,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 6 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 7 - EQ
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
subw (%A),%D,%D
leaw $EQMain0,%A
je %D
nop
leaw $SP,%A
subw (%A),$1,%A
movw $0,(%A)
leaw $EQ2Main0,%A
jmp
nop
EQMain0:
leaw $SP,%A
subw (%A),$1,%A
movw $-1,(%A)
EQ2Main0:
; 8 - Goto Condicional
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $Main.Main.main.END,%A
jne %D
nop
; 9 - PUSH temp 3
leaw $8,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 10 - PUSH constant 1
leaw $1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 11 - ADD
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
addw (%A),%D,%D
movw %D,(%A)
; 12 - POP temp 3
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $8,%A
movw %D,(%A)
; 13 - PUSH temp 4
leaw $9,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 14 - PUSH constant 1
leaw $1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 15 - SUB
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
subw (%A),%D,%D
movw %D,(%A)
; 16 - POP temp 4
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $9,%A
movw %D,(%A)
; 17 - Goto Incondicional
leaw $Main.Main.main.LOOPING,%A
jmp
nop
; Label (marcador)
Main.Main.main.END:
; Label (marcador)
Main.Main.main.while:
; 18 - Goto Incondicional
leaw $Main.Main.main.while,%A
jmp
nop
; End
