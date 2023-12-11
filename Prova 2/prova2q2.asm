.text
main:  addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	blt $8, $9 menor
	add $4, $9, $0
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	sub $4 $8, $9
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
menor:
	add $4, $0, $8
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	sub $4, $9, $8
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall	