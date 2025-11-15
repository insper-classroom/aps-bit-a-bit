; 0 - PUSH constant 5
leaw $5, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 1 - Goto Incondicional
leaw $END2, %A
jmp
nop
; Label (marcador)
DUMMY:
; 2 - PUSH constant 3
leaw $3, %A
movw %A, %D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; Label (marcador)
END2:
; 3 - POP temp 0
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
; End
