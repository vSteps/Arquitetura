.text
main: addi $2, $0, 5
syscall
add $8, $0, $2
addi $9 ,$0, 10
addi $10, $0, 100
addi $11, $0, 1000

div $8, $11
mflo $4
mfhi $8
beq $4, $0, space_m
addi $2, $0, 1
syscall
j cent

space_m:
addi $4, $0, ' '
addi $2, $0, 11
syscall

cent:
div $8, $10
mflo $4
mfhi $8
beq $4, $0, space_c
addi $2, $0, 1
syscall
j dez

space_c:
addi $4, $0, ' '
addi $2, $0, 11
syscall

dez:
div $8, $9
mflo $4
mfhi $8
beq $4, $0, space_d
addi $2, $0, 1
syscall
j fim

space_d:
addi $4, $0, ' '
addi $2, $0, 11
syscall

fim:
add $4, $0, $8
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall
