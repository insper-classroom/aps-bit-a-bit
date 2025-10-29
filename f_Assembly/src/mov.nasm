; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

; RAM[0] = RAM[1]
leaw $1, %A
movw (%A), %D      ; %D = RAM[1]
leaw $0, %A
movw %D, (%A)      ; RAM[0] = %D (copia RAM[1] para RAM[0])

; RAM[1] = RAM[0]
leaw $0, %A
movw (%A), %D      ; %D = RAM[0]   (agora RAM[0] já tem o valor de RAM[1])
leaw $1, %A
movw %D, (%A)      ; RAM[1] <- RAM[0] (ambos ficam iguais ao valor original de RAM[1])

; RAM[3] = 1
leaw $3, %A
movw $1, (%A)      ; escreve imediato 1 em RAM[3]

nop
