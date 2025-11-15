; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Main.main 0
Main.main:
; 1 - PUSH constant 123
leaw $123, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - PUSH constant 23
leaw $23, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 3 - ADD
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
; Label (marcador)
while:
; 4 - Goto Incondicional
leaw $while, %A
jmp
nop
; End
