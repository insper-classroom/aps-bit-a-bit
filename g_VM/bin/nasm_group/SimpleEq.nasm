; 0 - EQ
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %D
incw %A
subw (%A), %D, %D
leaw $EQ_TRUE_0, %A
je %D
nop
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $0, %D
movw %D, (%A)
leaw $EQ_END_0, %A
jmp
nop
EQ_TRUE_0:
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $-1, %D
movw %D, (%A)
EQ_END_0:
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; End
