.text
main: addi $2, $0, 5 #Lendo um inteiro
syscall
add $8, $0, $2 #Copiando o inteiro lido para o reg8
addi $2, $0, 5 #Lendo um inteiro
syscall
add $9, $0, $2 #Copiando o inteiro lido para o reg9
addi $10, $0, 3
addi $11, $0, 2
addi $12, $0, 5
mul $13, $10, $8
mul $14, $11, $9
add $15, $13, $14
div $16, $15, $12
add $4, $0, $16 #Copiando o resultado para o reg4
addi $2, $0, 1 #Imprimindo o reg4
syscall
addi $2, $0, 10 #Finalizando instrução
syscall