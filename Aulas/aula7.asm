
addi $2 $0 5
	syscall
	add $10 $0 $2
	
cont: lw $4 0($9)
	addi $2 $0 1
	syscall
	add $9 $9 $4
	jr $31
	jal
	
prn: add $9 $0 $4
	add $10 $0 $5

cont: lw $4 0($9)