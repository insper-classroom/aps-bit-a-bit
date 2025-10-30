; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

; 1) Carrega RAM[1] e guarda em %D
leaw $1, %A
movw (%A), %D      ; %D = RAM[1]

; 2) Carrega RAM[0] e guarda em %A
leaw $0, %A
movw (%A), %A      ; %A = RAM[0]

; 3) Faz a subtração: RAM[1] - RAM[0]
subw %D, %A, %D    ; %D = %D - %A = RAM[1] - RAM[0]

; 4) Grava o resultado em RAM[2]
leaw $2, %A
movw %D, (%A)      ; RAM[2] = %D

nop

