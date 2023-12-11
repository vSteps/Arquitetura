.text
main: addi $2, $0, 5 #Lendo um inteiro
syscall
add $8, $0, $2 #Copiando o inteiro lido para o reg8
addi $2, $0, 5 #Lendo um inteiro
syscall
add $9, $0, $2 #Copiando o inteiro lido para o reg9
mul $10, $8, $9 #Multiplicando os dois inteiros lidos
add $4, $0, $10 #Copiando o resultado para o reg4
addi $2, $0, 1 #Imprimindo o reg4
syscall
addi $2, $0, 10 #Finalizando instrução
syscall