.text
leitura:
	addi $2 $0  5
	syscall
	add $8 $0 $2
	addi $2 $0 5
	syscall
	add $9 $0 $2

limite:
	beqz $8 zero_um
	addi $10 $0 1
	addi $11 $0 2
	addi $12 $0 3
	addi $13 $0 5
	addi $14 $0 7
	beq $9 $10 fim
	beq $9 $11 cont
	beq $9 $12 cont
	beq $9 $13 cont
	beq $9 $14 cont
	beq $8 $9 fim #verifica se os numeros do usuario sao iguais
	beq $8 $10 zero_um #verifica se o primeiro valor é igual a 1
	ble $8 $12 cont #verifica se o primeiro valor é <= 3 
	beq $8 $13 cont #verifica se o primeiro valor é = 5
	beq $8 $14 cont #verifica se o primeiro valor é = 7


loop:	
	beq $8 $9 loop2
	ble $8 $12 cont #verifica novamente se o primeiro valor é <=3
	beq $8, $13 cont #verifica se o primeiro valor é = 5
	div $8 $11
	mfhi $15
	beqz $15 soma#verifica se o resto da divisão por 2 é = 0
	div $8 $12
	mfhi $16
	beqz $16 soma #verifica se o resto da divisão por 3 é = 0
	div $8 $13
	mfhi $17
	beq $8 $13 cont
	beqz $17 soma#verifica se o resto da divisao por 5 é = 0
	div $8 $14
	mfhi $18
	beq $8 $14 cont
	beqz $18 soma #verifica se o resto da divisao por 7 é = 0
	beq $8 $9 cont # se $8 = $9 fim
	addi $20 $20 1
	addi $8 $8 1
	
	j loop
	
	
	
loop2:	
	div $8 $11
	mfhi $15
	beqz $15 fim#verifica se o resto da divisão por 2 é = 0
	div $8 $12
	mfhi $16
	beqz $16 fim #verifica se o resto da divisão por 3 é = 0
	div $8 $13
	mfhi $17
	beqz $17 fim#verifica se o resto da divisao por 5 é = 0
	div $8 $14
	mfhi $18
	beqz $18 fim #verifica se o resto da divisao por 7 é = 0
	addi $20 $20 1
	j fim
	
	
soma: addi $8 $8 1
	   j loop


fim: add $4 $0 $20
	addi $2 $0 1
	syscall
	addi $2 $0 10
	syscall #imprime e acaba
	
	
	
	#addi $15, $0, 5
	#mul $16, $15, $15
	#ble $16, $8 
	

cont: addi $20 $20 1 #adiciona um ao contador
	 beq $8 $9 fim
	 addi $8 $8 1 #adiciona um ao primeiro valor
         j loop
         


zero_um: addi $8 $8 1
	j loop