; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.



leaw $5, %A
movw (%A), %D      ; D = RAM[5]


; Se resultado for 0: número é par
; Se resultado for 1: número é ímpar
leaw $1, %A
andw %D, %A, %D    ; D = RAM[5] & 1

; Se D == 0, número é par (salva 1 em RAM[0])
; Se D != 0, número é ímpar (salva 0 em RAM[0])
leaw $PAR, %A
je %D              ; Se D == 0, vai para PAR
nop

; Caso ÍMPAR :::::::::::::  salva 0 em RAM[0]
; PODERIA FAZER UM IF ELSE 
leaw $0, %A
movw %A, %D        ; D = 0
leaw $0, %A
movw %D, (%A)      ; RAM[0] = 0
leaw $FIM, %A
jmp
nop

; Caso PAR :::::::::::::: salva 1 em RAM[0]
PAR:
leaw $1, %A
movw %A, %D        ; D = 1
leaw $0, %A
movw %D, (%A)      ; RAM[0] = 1

FIM:
nop