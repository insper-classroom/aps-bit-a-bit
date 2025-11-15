; 0 - POP local 0
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
; 1 - POP local 1
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
; 2 - POP local 2
leaw $LCL, %A
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
