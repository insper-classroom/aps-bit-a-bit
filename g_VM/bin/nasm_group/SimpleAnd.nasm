; 0 - AND
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
andw (%A), %D, %D
movw %D, (%A)
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; End
