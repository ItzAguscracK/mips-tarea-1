.data
nl:   .asciiz "\n"      # \n
.text
.globl main

# s0 -> El contador
# s1 -> 101
# s2 -> el resultado i % 3
main:

li $s0, 1               # i = 1
li $s1, 101             # El nro o valor 101 con el que se sale del loop

loop:
beq $s0, $s1, exit

#  Se checa que s0 sea divisible por 3
rem $s2, $s0, 3         # i % 3
beq $s2, $zero, print   # si i % 3 = 0
# Se checa que s0 sea divisible por 5
rem $s2, $s0, 5         # i % 3
beq $s2, $zero, print   # si i % 3 = 0

j endprint

print:
# Se imprime el valor de s0 y \n
li $v0, 1
move $a0, $s0
syscall
li $v0, 4
la $a0, nl
syscall

endprint: 
addi $s0, $s0, 1        # i++
j loop

exit:
li $v0, 10
syscall                 # Se sale del programa cuando acaba el loop