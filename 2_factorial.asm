.data
ingrese: .asciiz "Ingrese un numero: "

.text
.globl main
main:
li $t1, 1                   #Guardo una variable para el resultado

li $v0, 4                 
la $a0, ingrese                
syscall                         #Imrpimo


#Guardo el numero que ingreso en t0
li $v0, 5      
syscall                         #Guardo en v0
move $t0, $v0


#Calculo el factorial
loop:
beq $t0, $zero, finalizar       #while(t0 != 0){
mul $t1, $t1, $t0               #t1 *= t0;
addi $t0, $t0, -1               #t0--;
j loop                          #}


finalizar:
li $v0, 1     
move $a0, $t1 
syscall                         #Imprimo t1

exit:	
li  $v0, 10                     #Finalizo
syscall                         #Finalizo
