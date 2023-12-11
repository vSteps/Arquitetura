.text
main: addi $2, $0, 5
syscall
add $8, $0,$2
addi $9, $0, 10
div $8, $9
mfhi $4
mflo $8
addi $2, $0, 1
syscall
addi $4, $0, '\n'
addi $2, $0, 11
syscall
addi $2, $0, 1
div $8, $9
mfhi $4
mflo $8
addi $2, $0, 1
syscall
addi $4, $0, '\n'
addi $2, $0, 11
syscall
addi $2, $0, 1
div $8, $9
mfhi $4
mflo $8
addi $2, $0, 1
syscall
addi $4, $0, '\n'
addi $2, $0, 11
syscall
addi $2, $0, 1
div $8, $9
mfhi $4
mflo $8
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall
