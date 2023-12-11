.text
main:   addi $2, $0, 5
	syscall
	addi $8, $2, 0
	add $4, $2, $0
	addi $2, $0, 1
	syscall
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
	sll $4, $8, 1
	addi $2, $0, 1
	syscall

			
	
	
	