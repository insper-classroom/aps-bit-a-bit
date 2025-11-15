; 0 - NEG
leaw $0, %A
movw (%A), %A
decw %A
movw (%A), %D
negw %D
movw %D, (%A)
; End
