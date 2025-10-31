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


