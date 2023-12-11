#data valida
.text
main:  addi $2, $0, 5
        syscall
        addi $20, $2, 0  #dia
       addi $2, $0, 5
        syscall
        addi $21, $2, 0  #mes


        addi $2, $0, 5
        syscall
        addi $8, $2, 0 #ano
       
        beq $20, $0, inv
        beq $21, $0, inv
        srl $22, $20, 31
        srl $23, $21, 31
        bne $22, $0, inv
        bne $23, $0, inv
        addi $24, $0, 12
        sub $24, $24, $21  #12 - mes
        srl $22, $24, 31
        bne $22, $0, inv
       
       
        addi $22, $0, 2
        bne $22, $21, naoFev
        # fevereiro
        addi $9, $0, 400
        div $8, $9
        mfhi $10
        beq $10, $0, bis
       
        addi $9, $0, 100
        div $8, $9
        mfhi $10
        beq $10, $0, naobis
       
        addi $9, $0, 4
        div $8, $9
        mfhi $10
        beq $10, $0, bis
        j naobis
       
bis:    addi $24, $0, 29    
        j cont
naobis: addi $24, $0, 28    
cont:   j limsup
       
       
       
naoFev: addi $22, $0, 8
        div $21, $22
        mflo $22 # $22<=quo(mes/8)
        add $22, $21, $22 # $22<=mes+quo(mes/8)
        addi $23, $0, 1
        and $22, $22, $23 #$22<=resto(mes+quo(mes/8)/2)
        addi $24, $22, 30
        addi $12 , $0, 31
        addi $13, $0, 30
        
        
       
limsup: sub $22, $24, $20
        srl $22, $22, 31
        bne $22, $0, inv
        
        
        
prox:	





        # valido
        addi $4, $0, 'V'
        addi $2, $0, 11
        syscall
        j fim
inv:    addi $4, $0, 'X'
        addi $2, $0, 11
        syscall
fim:    addi $2, $0, 10
        syscall