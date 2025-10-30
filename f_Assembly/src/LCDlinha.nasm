; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe uma linha no LCD

    leaw    8, %A
    movw    %A, %D
    leaw    255, %A
    movw    %A, %B
    leaw    RAM+20, %A

linha_loop:
    movw    %B, (%A)
    addw    %A, 1, %A
    subw    %D, 1, %D
    jne     linha_loop

linha_pronta:
    nop
