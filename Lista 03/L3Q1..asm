.text
main:	addi $8, $0, 30
	addi $10, $0, 3


if:
	beq $9, $8 sim
	addi $9, $9, 3
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	j if
	
	
	




sim: addi $2, $0, 10
	syscall