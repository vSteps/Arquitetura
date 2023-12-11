.text
main: addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	beq $8, $9 eq
	addi $4, $0, 'n'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'o'
	addi $2, $0, 11
	syscall
	addi $4, $0, 't'
	addi $2, $0, 11
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	addi $4, $0, 'e'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'q'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'u'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'a'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'l'
	addi $2, $0, 11
	syscall
	addi $4, $0, 's'
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall 				
	
	
	
eq: 	addi $4, $0, 'e'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'q'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'u'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'a'
	addi $2, $0, 11
	syscall
	addi $4, $0, 'l'
	addi $2, $0, 11
	syscall
	addi $4, $0, 's'
	addi $2, $0, 11
	syscall
	addi $2, $0, 10
	syscall					