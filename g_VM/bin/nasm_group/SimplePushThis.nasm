; 0 - PUSH this 0
leaw $THIS, %A
movw (%A), %D
leaw $0, %A
addw %D, %A,  %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 1 - PUSH this 1
leaw $THIS, %A
movw (%A), %D
leaw $1, %A
addw %D, %A,  %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; 2 - PUSH this 2
leaw $THIS, %A
movw (%A), %D
leaw $2, %A
addw %D, %A,  %A
movw (%A),%D
leaw $0, %A
movw (%A), %A
movw %D, (%A)
leaw $0, %A
movw (%A), %D
incw %D
movw %D, (%A)
; End
