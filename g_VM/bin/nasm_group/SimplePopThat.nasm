; 0 - POP that 0
leaw $THAT, %A
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
; 1 - POP that 1
leaw $THAT, %A
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
; 2 - POP that 2
leaw $THAT, %A
movw (%A), %D
leaw $2, %A
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
; End
