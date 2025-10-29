; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].

    ; Carrega endereço 0 em %A e lê RAM[0] para %D
    leaw $0, %A
    movw (%A), %D      ; %D = RAM[0]

    ; Carrega endereço 1 em %A e lê RAM[1] para %A
    leaw $1, %A
    movw (%A), %A      ; %A = RAM[1]

    ; Soma: %D = %D + %A
    addw %D, %A, %D    ; %D <- %D + %A

    ; Grava resultado em RAM[2]
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = %D

    nop                ; opcional: finaliza com nop
