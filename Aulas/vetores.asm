.data 
.word 1 # 0x10010000 int a=1;
.word 5 # 0x10010004
.word 8 # 0x10010008
.word 0 # 0x1001000c

.text
main:  #addiu $8 $0 0x1001
       #sll $8 $8 16
       #equivale a
       lui $8 0x1001 #load upper immediate - base
       lw $9 0($8) # coloca no $9 o que esta em $8 - memoria 0	
       lw $10 4($8)# coloca no $10 o que esta em $8 - memoria 4
       lw $11 8($8)# coloca no $11 o que esta em $8 -  memoria 8
       add $13 $9 $10 #somas
       add $13 $13 $11 #somas
       sw $13 0xc($8)#salva na memoria 12 ou 0xc o que esta em $13
       addi $2 $0 10
       syscall
       