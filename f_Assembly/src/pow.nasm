; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

    ; 1) contador <- RAM[1]  (usamos RAM[2] como contador)
    leaw $1, %A
    movw (%A), %D      ; %D = n
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = contador = n

    ; 2) resultado <- 0   (RAM[0])
    leaw $0, %A
    movw $0, (%A)      ; RAM[0] = 0

loop_start:
    ; 3) carregar contador em %D e, se <= 0, terminar
    leaw $2, %A
    movw (%A), %D      ; %D = contador
    leaw $end_loop, %A
    jle  %D            ; se contador <= 0, pula para end_loop
    nop

    ; 4) resultado = resultado + n
    leaw $0, %A
    movw (%A), %D      ; %D = resultado
    leaw $1, %A
    movw (%A), %A      ; %A = n (multiplicando)
    addw %D, %A, %D    ; %D = resultado + n
    leaw $0, %A
    movw %D, (%A)      ; RAM[0] = novo resultado

    ; 5) contador = contador - 1  (armazenar de volta em RAM[2])
    leaw $2, %A
    movw (%A), %D      ; %D = contador (recarrega)
    decw %D            ; %D = %D - 1
    leaw $2, %A
    movw %D, (%A)      ; RAM[2] = contador - 1

    ; 6) voltar ao início do loop
    leaw $loop_start, %A
    jmp
    nop

end_loop:
    nop


