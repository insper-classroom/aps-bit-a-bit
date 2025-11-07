; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares 
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01
;
; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

<<<<<<< HEAD
=======
leaw $1, %A
movw (%A),%D
leaw $0, %A 
subw %D, (%A), %D 

leaw %Neg, %A 

jl %D
nop

leaw $1,%A 
movw (%A), %D
leaw $2,%A 
movw %D,(%A)


leaw %end, %A 
jmp 
nop

Neg:
leaw $0, %A 
movw (%A), %D
leaw $2,%A 
movw %D,(%A)





end: 


>>>>>>> a7a18eacb01bebad5706b17857281c88973f4d8a
