; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

; RAM[0] = |RAM[1]|

    leaw    RAM+1, %A
    movw    (%A), %D
    leaw    0, %A
    movw    %A, %B
    subw    %B, %D, %A
    jle     posi
    negw    %D
posi:
    leaw    RAM, %A
    movw    %D, (%A)
    nop
