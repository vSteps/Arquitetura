.text
main: addi $2, $0, 5
syscall
add $8, $0, $2
andi $4, $8, 1
addi $2, $0, 1
syscall