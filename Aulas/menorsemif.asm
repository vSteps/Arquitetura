.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	#leitura dos numeros
	sub $10, $8, $9
	not $11, $10
	#subtra��o e nega��o do sinal
	srl $10, $10, 31
	srl $11, $11, 31
	#deslocamento dos bits
	mul $12, $8, $10
	mul $13, $9, $11
	#multiplica��o
	add $4, $12, $13
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
	#impress�o e finaliza��o
	
