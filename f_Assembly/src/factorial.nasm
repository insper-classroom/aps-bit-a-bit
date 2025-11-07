; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

; Uso de células auxiliares:
; RAM[0] = n (entrada)
; RAM[1] = resultado (saida)   <-- queremos ao final n!
; RAM[2] = i (contador do loop do fatorial)
; RAM[3] = tempA (guarda multiplicando)
; RAM[4] = tempB (guarda contador do multiply)
; RAM[5] = prod_acc (acumulador do multiply)


    ; --- Checa caso n <= 1: fatorial = 1 ---
    leaw $0, %A
    movw (%A), %D        ; %D = n
    subw %D, $1, %D      ; %D = n - 1
    leaw $set_one, %A
    jle  %D              ; se n-1 <= 0 então n <= 1 -> resultado = 1
    nop

    ; --- Inicializa resultado = 1 e i = 2 ---
    leaw $1, %A
    movw $1, (%A)        ; RAM[1] = 1
    leaw $2, %A
    movw %A, %D
    leaw $2, %A       ; RAM[2] = i = 2
    movw %D, (%A)

factorial_loop:
    ; --- compara i com n: se i > n, fim ---
    leaw $0, %A
    movw (%A), %D        ; %D = n
    leaw $2, %A
    movw (%A), %A        ; %A = i
    subw %D, %A, %D      ; %D = n - i
    leaw $end_factorial, %A
    jl   %D              ; se n - i < 0  => i > n => fim
    nop

    ; --- multiplicar: RAM[1] = RAM[1] * i  (usando somas repetidas) ---
    ; copia multiplicando = current result (RAM[1]) -> RAM[3]
    leaw $1, %A
    movw (%A), %D        ; %D = RAM[1] (multiplicando)
    leaw $3, %A
    movw %D, (%A)        ; RAM[3] = multiplicando

    ; copia multiplicador = i (RAM[2]) -> RAM[4] (contador para multiply)
    leaw $2, %A
    movw (%A), %D        ; %D = i
    leaw $4, %A
    movw %D, (%A)        ; RAM[4] = counter_for_multiply

    ; inicializa acumulador do produto em RAM[5] = 0
    leaw $5, %A
    movw $0, (%A)        ; RAM[5] = 0

mul_loop:
    ; carrega contador do multiply (RAM[4]) em %D
    leaw $4, %A
    movw (%A), %D        ; %D = contador
    leaw $after_mul, %A
    jle  %D              ; se contador <= 0 -> fim do multiply
    nop

    ; acc = RAM[5]
    leaw $5, %A
    movw (%A), %D        ; %D = acc

    ; A = multiplicando (RAM[3])
    leaw $3, %A
    movw (%A), %A        ; %A = multiplicando

    ; acc = acc + multiplicando
    addw %D, %A, %D      ; %D = acc + multiplicando

    ; salva acc de volta em RAM[5]
    leaw $5, %A
    movw %D, (%A)        ; RAM[5] = novo acc

    ; decrementa contador (RAM[4] = RAM[4] - 1)
    leaw $4, %A
    movw (%A), %D        ; %D = contador
    decw %D
    leaw $4, %A
    movw %D, (%A)

    ; repete multiply
    leaw $mul_loop, %A
    jmp
    nop

after_mul:
    ; copia produto (RAM[5]) para RAM[1] (resultado)
    leaw $5, %A
    movw (%A), %D
    leaw $1, %A
    movw %D, (%A)        ; RAM[1] = product

    ; incrementa i: RAM[2] = RAM[2] + 1
    leaw $2, %A
    movw (%A), %D
    addw %D, $1, %D
    leaw $2, %A
    movw %D, (%A)

    ; volta para o loop do fatorial
    leaw $factorial_loop, %A
    jmp
    nop

set_one:
    ; n <= 1, apenas coloca resultado = 1
    leaw $1, %A
    movw $1, (%A)
    leaw $end_factorial, %A
    jmp
    nop

end_factorial:
    nop
