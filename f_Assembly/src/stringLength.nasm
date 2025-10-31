; Arquivo: stringLength.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi 
; Data: 28/03/2018
;
; Assuma que uma string é um conjunto de caracteres terminado
; em NULL (0).
; 
; Supondo que temos uma string que começa no endereço 8 da RAM.
; Calcule o seu tamanho e salve o resultado na RAM[0].
;
; Os caracteres estão formatados em ASCII
; http://sticksandstones.kstrom.com/appen.html
; 
; Exemplo:
;
;   Convertido para ASCII
;             |
;             v
;  RAM[8]  = `o`
;  RAM[9]  = `i`
;  RAM[10] = ` `
;  RAM[11] = `b`
;  RAM[12] =  l`
;  RAM[13] = `z`
;  RAM[14] = `?`
;  RAM[15] = NULL = 0x0000


; Calcula o tamanho de uma string terminada em NULL
; String começa em RAM[8]

; Inicializa contador
leaw $0, %A
movw $0, (%A)      ; RAM[0] = 0 (contador)

; Inicializa ponteiro para percorrer a string
leaw $8, %A
movw %A, %D        ; D = 8 (endereço inicial)

LOOP:
; Configura endereço atual
movw %D, %A        ; A = endereço atual
movw (%A), %D      ; D = caractere atual

; Verifica se é NULL (0)
leaw $END, %A
je %D              ; Se D == 0, termina
nop

; Incrementa contador
leaw $0, %A
movw (%A), %D      ; D = contador atual
incw %D            ; D = D + 1
movw %D, (%A)      ; RAM[0] = RAM[0] + 1

; Prepara próximo endereço (endereço_atual + 1)
leaw $0, %A
movw (%A), %D      ; D = contador atual
leaw $8, %A
addw %A, %D, %D    ; D = 8 + contador (próximo endereço)

leaw $LOOP, %A
jmp
nop

END:
nop