.data
nl:   .asciiz " "      # \n

.text
.globl main
main:

li $t0, 0               # Se carga 0 en t0
li $t1, 1               # Se carga 1 en t1

li $v0, 1
move $a0, $t0
syscall                 # Se imprime t0

li $v0, 4
la $a0, nl
syscall                 # Se imprime \n

li $v0, 1
move $a0, $t1
syscall                 # Se imprime t1

li $v0, 4
la $a0, nl
syscall                 # Se imprime \n

# Se carga 18 en i
li $t3, 18
loop:
beq $t3, $zero, exit

# El loop
add $t2, $t0, $t1       # c = a + b
# Se imprime c
li $v0, 1
move $a0, $t2
syscall                 # Imprime t2
li $v0, 4
la $a0, nl
syscall                 # Se imprime \n
move $t0, $t1           # a = b
move $t1, $t2           # b = c

addi $t3, $t3, -1       # Decremental a el contador

j loop                  # Comienza el loop

exit:
li $v0, 10              # Exit
syscall                 # Exit


