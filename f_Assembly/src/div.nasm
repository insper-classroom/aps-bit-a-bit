; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos


leaw $0, %A
movw (%A), %D      ; D = RAM[0] (dividendo)
leaw $2, %A
movw $0, (%A)      ; RAM[2] = 0 (inicializa quociente)

; Verifica se divisor é zero
leaw $1, %A
movw (%A), %D
leaw $END, %A
je %D              ; Se divisor = 0, termina
nop

; Restaura dividendo
leaw $0, %A
movw (%A), %D      ; D = dividendo

LOOP:
; Faz cópia de D em RAM[3] para verificar condição
leaw $3, %A
movw %D, (%A)      ; RAM[3] = D (cópia temporária)

; Verifica se pode subtrair (RAM[3] - RAM[1])
leaw $3, %A
movw (%A), %D      ; D = cópia do dividendo
leaw $1, %A
subw %D, (%A), %D  ; D = cópia - divisor
leaw $END, %A
jl %D              ; Se resultado negativo, termina
nop

; Incrementa quociente
leaw $2, %A
movw (%A), %D      ; D = quociente atual
incw %D            ; D = D + 1
movw %D, (%A)      ; RAM[2] = RAM[2] + 1

; Subtrai divisor do dividendo (em RAM[0])
leaw $0, %A
movw (%A), %D      ; D = dividendo atual
leaw $1, %A
subw %D, (%A), %D  ; D = D - divisor
leaw $0, %A
movw %D, (%A)      ; RAM[0] = novo dividendo

leaw $LOOP, %A
jmp
nop

END:
nop