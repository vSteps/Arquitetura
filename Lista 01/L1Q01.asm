.text
main: addi $2, $0, 5 #Lendo um inteiro
syscall
add $8, $0, $2 #Copiando no reg8 o inteiro lido
sll $9, $8, 1 #Deslocando 1 bit para a esquerda/multiplicando por 2 o numero lido
add $4, $0, $9 #Colocando o resultado do deslocamento no reg4
addi $2, $0, 1 #Imprimindo o reg4
syscall
addi $2, $0, 10 #Finalizando instrução
syscall
