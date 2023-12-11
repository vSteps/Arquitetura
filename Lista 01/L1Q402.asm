.text
main: addi $2, $0, 5 #Lendo um inteiro
syscall
add $8, $0, $2 #Copiando o inteiro lido para o reg8
addi $2, $0, 5 #Lendo um inteiro
syscall
add $9, $0, $2 #Copiando o inteiro lido para o reg9
addi $12, $0, 5
mul $10, $8, 2
mul $11, $9, 2
add $11, $11, $11
add $13, $11, $10
div $14, $13, $12
add $4, $0, $14 #Copiando o resultado para o reg4
addi $2, $0, 1 #Imprimindo o reg4
syscall
addi $2, $0, 10 #Finalizando instrução
syscall