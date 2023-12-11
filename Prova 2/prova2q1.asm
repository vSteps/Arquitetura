.text
main:  addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	sub $10, $8, $9
	sub $11, $9, $8
	srl $12, $10, 31
	srl $13, $11, 31
	mul $14, $8, $13
	mul $15, $9, $12
	add $16, $14, $15
menor:  mul $14, $8, $12
	mul $15, $9, $13
	add $17, $14, $15
	add $4, $0, $17
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	sub $4, $16, $17
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
	
	