.text
main:	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	mul $10, $8, $9


if:
	beq $8, $10 sim
	add $11, $0, $8
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	add $11, $8, $8
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	j if
	
	
	




sim: addi $2, $0, 10
	syscall
