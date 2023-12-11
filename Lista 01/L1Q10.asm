.text
main: addi $2, $0, 12
syscall
add $8, $0, $2
sub $9, $8, 32
addi $4, $0, '\n'
addi $2, $0, 11
syscall
add $4, $0, $9
addi $2, $0, 11
syscall
addi $2, $0, 10
syscall