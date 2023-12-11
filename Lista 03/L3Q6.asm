.text
main: addi $9, $0, 0  #soma
     
while1:  addi $2, $0, 5
         syscall
         add $8, $0, $2
         srl $8, $8, 31
         bne $8, $0, sai
         add $9, $9, $2
         j while1

sai:     add $4, $0, $9
         addi $2, $0, 1
         syscall      
     
fim:  addi $2, $0, 10
      syscall