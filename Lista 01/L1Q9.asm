.text
main: addi $2, $0, 5
syscall
add $8, $0, $2
addi $9, $0, 3600
addi $10, $0, 60
div $8, $9
mflo $4
mfhi $8
addi $2, $0, 1
syscall
addi $4, $0, ':'
addi $2, $0, 11
syscall
div $8, $10
mflo $4
mfhi $8
addi $2, $0, 1
syscall
addi $4, $0, ':'
addi $2, $0, 11
syscall
mfhi $4
addi $2, $0, 1
syscall
addi $2, $0 10
syscall
