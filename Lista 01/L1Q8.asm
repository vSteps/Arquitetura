.text
main: addi $2, $0, 5
syscall
add $8, $0, $2
addi $2, $0, 5
syscall
add $9, $0, $2
addi $2, $0, 5
syscall
add $10, $0, $2
mul $9, $9, 60
mul $8, $8, 3600
add $10, $10, $9
add $4, $10, $8
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall 
