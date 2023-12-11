.text
main: addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	addi $9, $2, 1
	
for: 	beq $8, $9, fim

	andi $10, $8, 1 
	bne $10, $0, impar
	addi $2, $0, 1
	add $4, $0, $8
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
			


impar: addi $8, $8, 1
	j for
	
	
fim:	addi $2, $0 10,
	syscall