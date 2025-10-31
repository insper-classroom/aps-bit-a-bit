; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

; SW8 !SW8 OFF ON ON R5 R3 ON SW0 OFF 
; -   -    0   1  1  -  -  1  -   0

; vetor auxiliar %356 (todas as SWs desligadas)
; 0   1    0   1  1  0  0  1  0   0

leaw $21185, %A
movw (%A), %D
leaw $356, %A 
addw %D, %A, %D
leaw $5, %A
orw %D, (%A), %D
leaw $3, %A
orw %D, (%A), %D

leaw $21184, %A
movw %D, (%A)
