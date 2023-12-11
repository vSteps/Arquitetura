.text
leitura:
	addi $2 $0  5
	syscall
	add $8 $0 $2
	addi $2 $0 5
	syscall
	add $9 $0 $2

limite:
	addi $10 $0 1
	addi $11 $0 2
	addi $12 $0 3
	addi $13 $0 5
	addi $14 $0 7
	beq $9 $10 fim
	beq $8 $9 primeira #verifica se os numeros do usuario sao iguais
	beq $8 $10 loop
	beq $8 $13 qtd #verifica se o primeiro valor é = 5
	beq $8 $14 qtd #verifica se o primeiro valor é = 7
	
	
primeira: 
	ble $9 $12 qtd #verifica novamente se o primeiro valor é <=3
	div $9 $11
	mfhi $15
	beqz $15 loop#verifica se o resto da divisão por 2 é = 0
	div $9 $12
	mfhi $15
	beqz $15 loop #verifica se o resto da divisão por 3 é = 0
	addi $16 $0, 25
	ble $16, $9 vinte_cinco_ou_más
	addi $20 $20 1	
	j fim

		
do: 
	beq $8 $9 fim
	ble $8 $12 qtd #verifica novamente se o primeiro valor é <=3
	div $8 $11
	mfhi $15
	beqz $15 loop#verifica se o resto da divisão por 2 é = 0
	div $8 $12
	mfhi $15
	beqz $15 loop #verifica se o resto da divisão por 3 é = 0
	addi $16 $0, 25
	ble $16, $8 vinte_cinco_ou_más
	addi $20 $20 1	
	j loop


loop:	
	addi $13 $0 5
	beq $8 $9 fim
	addi $8 $8 1
	ble $8 $12 qtd #verifica novamente se o primeiro valor é <=3
	div $8 $11
	mfhi $15
	beqz $15 loop#verifica se o resto da divisão por 2 é = 0
	div $8 $12
	mfhi $15
	beqz $15 loop #verifica se o resto da divisão por 3 é = 0

verify_vinte_cinco_ou_más:
	add $16 $13, $13
	ble $16, $8 vinte_cinco_ou_más
	addi $20 $20 1	
	j loop
	
	
vinte_cinco_ou_más:
	div $8 $13
	mfhi $23
	beqz $23 loop
	addi $19 $13 2
	div $8 $19
	mfhi $23
	beqz $23 loop
	addi $13 $13 6	
	j verify_vinte_cinco_ou_más
		


fim: add $4 $0 $20
	addi $2 $0 1
	syscall
	addi $2 $0 10
	syscall #imprime e acaba
	

qtd: addi $20 $20 1 #adiciona um ao contador
	 beq $8 $9 fim
         j loop
         