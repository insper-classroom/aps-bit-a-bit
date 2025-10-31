; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD


leaw $20, %A
movw %A, %D
leaw $0, %A
movw %D, (%A)       ; R0 = 32 (contador de pixels horizontal)

leaw $1, %A
movw $1, (%A)       ; R1 = 1 (valor para setar pixels)

leaw $17584, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)       ; R2 = 16384 (endereço base do LCD)

LINE_LOOP:
leaw $0, %A
movw (%A), %D
leaw $FIM, %A
je %D               
nop

leaw $65535, %A     
movw %A, %D
leaw $2, %A
movw (%A), %A       ; Carrega endereço do LCD em A
movw %D, (%A)       ; Escreve 0xFFFF na memória de vídeo

leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $0, %A
movw (%A), %D
decw %D
movw %D, (%A)

leaw $LINE_LOOP, %A
jmp
nop

FIM:
leaw $FIM, %A
jmp
nop
