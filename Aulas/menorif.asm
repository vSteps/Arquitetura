.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	#leitura dos numeros
	sub $10, $8, $9
	#subtração e negação do sinal
	srl $10, $10, 31
	#deslocamento dos bits
	beq $10, $0, impB
	#if A
	add $4, $0, $9
	j imp
	
impB: add $4, $0, $9

imp: 	addi $2, $0, 1
	syscall