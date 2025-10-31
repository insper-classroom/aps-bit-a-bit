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

leaw %0, %A
movw (%A), %D ; pega o valor da RAM[0] e bota no RegD

leaw %1, %A
mov %D, (%A) ; pega o valor de RAM[0] e bota no RAM[1]