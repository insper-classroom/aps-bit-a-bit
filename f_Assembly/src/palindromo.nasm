; Arquivo: palindromo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se uma palavra salva na memória
; é um palíndromo ou não. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.
; 
; A palavra possui tamanho fixo de 5 caracteres,
; começando no endereço 10 da RAM e terminando no
; endereço 14 da RAM. A palavra é codificado em
; ASCII.

; exemplo:
;  RAM[10] = a
;  RAM[11] = r
;  RAM[12] = a
;  RAM[13] = r
;  RAM[14] = a
; 

; é palindromo -> RAM[0] = 1
; não é palindromo -> RAM[0] = 0

    ; comeca com RAM[0] = 1
    leaw    1, %A
    movw    (%A), %D
    leaw    RAM, %A
    movw    %D, (%A)          ; RAM[0] = 1

    ; comparar RAM[10] com RAM[14]
    leaw    RAM+10, %A
    movw    (%A), %D          ; D = RAM[10]
    leaw    RAM+14, %A
    subw    (%A), %D, %A      ; A = RAM[14] - RAM[10]
    jne     nao_pal           ; se diferente não é palíndromo

    ; comparar RAM[11] com RAM[13]
    leaw    RAM+11, %A
    movw    (%A), %D          ; 
    leaw    RAM+13, %A
    subw    (%A), %D, %A      ; A = RAM[13] - RAM[11]
    jne     nao_pal           ; se diferente não é palíndromo

    ; é palíndromo -> RAM[0] já é 1
    jmp     fim

nao_pal:
    leaw    0, %A
    movw    (%A), %D
    leaw    RAM, %A
    movw    %D, (%A)          ; RAM[0] = 0

fim:
    nop
