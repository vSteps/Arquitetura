.text
main:    lui $8 0x1001
         addi $9 $0 0
         addi $10 $0 10
      
teste1:  beq $9 $10 fimLer
         addi $2 $0 5
         syscall
         sw $2 0($8)
         addi $8 $8 4
         addi $9 $9 1
         j teste1
 
fimLer: addi $8 $8 -4
        addi $9 $0 0
 
teste2: beq $9 $10, fimEscrev
       
       lw $4 0($8)
       addi $2 $0 1
       syscall
       addi $4 $0 ' '
       addi $2 $0 11
       syscall
       addi $9 $9 1
       addi $8 $8 -4
       j teste2
       
fimEscrev: addi $2 $0 10
           syscall
       