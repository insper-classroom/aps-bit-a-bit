; 0 - LT
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
; End
