.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	#leitura dos n�meros
	sub $10, $8, $9
	sub $11, $9, $8
	#subtra��o do menor com o maior e vice-versa
	srl $10, $10, 31
	srl $11, $11, 31
	#deslocamento de bits (se for negativo == 1; se for positivo == 0)
	mul $12, $9, $10
	#multiplica o segundo numero com a primeira subtra��o
	mul $13, $8, $11
	#multiplica o primeiro numero com a segunda subtra��o
	add $4, $12, $13
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
	
