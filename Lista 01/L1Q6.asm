.text
main: addi $2, $0, 5
syscall
add $8, $0, $2
addi $9, $0, 10
div $8, $9
mfhi $10
mflo $8
div $8, $9
mflo $4
mfhi $8
addi $2, $0, 1
syscall
add $4, $0, $8
addi $2, $0, 1
syscall
add $4, $0, $10
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall
