.text
main: 	addi $2, $0, 5
	syscall
	add $8, $0, $2
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	addi $11, $0, 27
instr:
	sll $12, $8, 1
	add $12, $12, $8
	sll $13, $9, 3
	add $13, $13, $9
	sll $14, $10, 4
	sub $14, $14, $10
	add $15, $13, $14
	add $15, $15, $12
	div $15, $11
	mflo $4
	addi $2 ,$0, 1
	syscall
	addi $4, $0, ','
	addi $2, $0, 11
	syscall
	mfhi $4
	addi $2 ,$0, 1
	syscall
	addi $2, $0, 10
	syscall


