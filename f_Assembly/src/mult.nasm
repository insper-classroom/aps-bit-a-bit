; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

    ; --- Copia multiplicador (RAM[0]) para RAM[2] como contador ---
    leaw $0, %A
    movw (%A), %D      ; %D = RAM[0]
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = contador = RAM[0]

    ; --- Inicializa resultado em RAM[3] = 0 ---
    leaw $3, %A
    movw $0, (%A)

loop_start:
    ; Carrega contador em %D
    leaw $2, %A
    movw (%A), %D      ; %D = contador

    ; Se contador <= 0, vai para o fim
    leaw $end_loop, %A
    jle  %D             ; se %D <= 0 então pular para end_loop

    ; Carrega resultado em %D (temporariamente) e multiplicando em %A
    leaw $3, %A
    movw (%A), %D      ; %D = resultado

    leaw $1, %A
    movw (%A), %A      ; %A = multiplicando (RAM[1])

    ; resultado = resultado + multiplicando
    addw %D, %A, %D    ; %D = resultado + multiplicando

    ; grava resultado de volta em RAM[3]
    leaw $3, %A
    movw %D, (%A)

    ; decrementa contador (RAM[2] = RAM[2] - 1)
    leaw $2, %A
    movw (%A), %D      ; %D = contador
    decw %D            ; %D = %D - 1
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = novo contador

    ; voltar para início do loop
    leaw $loop_start, %A
    jmp

end_loop:
    nop
