; 0 - GT
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw (%A), %D
incw %A
subw (%A), %D, %D
leaw $GT_TRUE_0, %A
jg %D
nop
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $0, %D
movw %D, (%A)
leaw $GT_END_0, %A
jmp
nop
GT_TRUE_0:
leaw $0, %A
movw (%A), %A
decw %A
decw %A
movw $-1, %D
movw %D, (%A)
GT_END_0:
leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)
; End
