; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].


leaw %0, %A     ; atribui 0 para RegA
movw (%A), %D   ; atribui o valor de RAM[0] para RegD
leaw %1, %A     ; atribui 1 para RegA
movw (%A), %A   ; atribui o valor de RAM[1] para RegA
addw %A, %D, %D ; soma RegA e RegD

leaw %2, %A     ; atribui 2 para RegA
movw %D, (%A)   ; atribui o valor de RegD para RAM[2]

nop
leaw $0, %A      ; %A = 0
movw (%A), %D    ; %D = RAM[0]

leaw $1, %A      ; %A = 1
addw (%A), %D, %D ; %D = RAM[0] + RAM[1]

leaw $2, %A      ; %A = 2
movw %D, (%A)    ; RAM[2] = %D
