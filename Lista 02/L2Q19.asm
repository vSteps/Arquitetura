.text
main: 	addi $2, $0, 5
	syscall
	add $8 ,$0, $2
	
	addi $10, $0, 10
	addi $11, $0, 1 # primeiro multiplicador
	
	div $8, $10
	mfhi $9	
	mflo $13 #quociente
	mul $20, $9, $11
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	div $13, $10
	mfhi $9	
	mflo $13 #quociente
	mul $21, $9, $11
	add $20, $20, $21
	sll $11, $11, 1	
	
	add $4, $0, $20
	addi $2, $0, 1
	syscall
	
	addi $2, $0 10
	syscall
		
	
																							
																																													
																																																																			
																																																																																									
																																																																																																															
																																																																																																																																					
																																																																																																																																																											
																																																																																																																																																																																	
																																																																																																																																																																																																																														#a