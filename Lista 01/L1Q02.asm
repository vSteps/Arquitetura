.text
main: addi $2, $0, 5 #Lendo um inteiro
syscall
add $8, $0, $2 #C�pia do inteiro lido no reg8
mul $9, $8, $8 #Multiplica��o do numero lido por ele mesmo
add $4, $0, $9 #Colocando no reg 4 o resultado da multiplica��o
addi $2, $0, 1 #Imprimindo o reg4
syscall
addi $2, $0, 10 #Finalizando instru��o