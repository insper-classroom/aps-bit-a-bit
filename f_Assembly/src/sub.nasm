; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

leaw $0, %A     ; atribui 0 para RegA
movw (%A), %D   ; atribui o valor de RAM[0] para RegD
leaw $1, %A     ; atribui 1 para RegA
movw (%A), %A   ; atribui o valor de RAM[1] para RegA
subw %A, %D, %D ; subtrai RegA e RegD

leaw $2, %A     ; atribui 2 para RegA
movw %D, (%A)   ; atribui o valor de RegD para RAM[2]

nop
; 3) Faz a subtração: RAM[1] - RAM[0]
subw %D, %A, %D    ; %D = %D - %A = RAM[1] - RAM[0]

; 4) Grava o resultado em RAM[2]
leaw $2, %A
movw %D, (%A)      ; RAM[2] = %D

nop

