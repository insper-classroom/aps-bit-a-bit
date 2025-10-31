; Arquivo: mult_SW.nasm
; Curso: Elementos de Sistemas
; Criado por: Renan Trevisoli
; Data: 16/04/25
;
; Realiza a multiplicação SW(9 downto 5)*SW(4 downto 0)
; e mostra o resultado nos LEDs
; exemplo: "0101100110" => 0d11*0d6 => 0d66 => "0001000010"

; Arquivo: mult_SW.nasm
; Realiza a multiplicação SW(9 downto 5)*SW(4 downto 0)
; usando multiplicação por chaves


leaw $21185, %A
movw (%A), %D        ; %D = RAM[0000000000011111]

; Salva bits 4-0 em RAM[0]
leaw $31, %A
andw %D, %A, %D
leaw $10, %A
movw %D, (%A)        ; RAM[10] = multiplicador

; Extrai bits 9-5 para %D
leaw $21185, %A
movw (%A), %D        ; Recarrega valor original
leaw $992, %A
andw %D, %A, %D      ; %D = bits 9-5
leaw $0, %A
movw %D, (%A)
leaw $32, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)


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

leaw $10, %A
movw (%A), %D
leaw $0, %A 
movw %D, (%A)
leaw $2, %A 
movw (%A), %D
leaw $1, %A
movw %D, (%A)

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
    ; Verifica primeiro se é zero
    leaw $end_loop, %A
    je %D              ; se %D == 0 então pular para end_loop
    nop

    ; Verifica se é negativo
    leaw $end_loop, %A  
    jl %D              ; se %D < 0 então pular para end_loop
    nop

    ; Se chegou aqui, contador > 0, continua a multiplicação

    ; Carrega resultado em %D (temporariamente) e multiplicando em %A
    leaw $3, %A
    movw (%A), %D      ; %D = resultado

    leaw $1, %A
    addw (%A), %D, %D  ; %D = resultado + multiplicando (RAM[1])

    ; grava resultado de volta em RAM[3]
    leaw $3, %A
    movw %D, (%A)

    ; decrementa contador (RAM[2] = RAM[2] - 1)
    leaw $2, %A
    movw (%A), %D      ; %D = contador
    decw %D            ; %D = %D - 1
    movw %D, (%A)      ; RAM[2] = novo contador

    ; voltar para início do loop
    leaw $loop_start, %A
    jmp
    nop

end_loop:
    nop

leaw $3, %A
movw (%A), %D
leaw $21184, %A
movw  %D, (%A)

