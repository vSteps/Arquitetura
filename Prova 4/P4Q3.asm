.text
main:
    addi $1 $0 0 # contador de linhas que vai de 1 até N
    addi $10 $0 1 # números
        addi $2 $0  5
        syscall
        add $8 $0 $2 # 8 = N
        addi $8 $8 1 # N + 1 para percorrer todas as linhas

quebra:
    addi $5 $0 0 # contador de prints por linha resetado
    addi $1 $1 1 # linhas += 1
    beq $1 $8 fim # termina o código se atingir N
    add $4 $0 '\n'
    addi $2 $0 11
    syscall # quebra de linha

loop:
    add $4 $0 $10
    addi $2 $0 1
    syscall # print dos números

    add $4 $0 ' '
    addi $2 $0 11
    syscall # print dos espaços

    addi $5 $5 1 # contador de prints += 1
    addi $10 $10 1 # números += 1

    beq $1 $5 quebra # se o contador de linhas for igual ao de prints, reinicia
    j loop
fim:
    addi $2 $0 10
    syscall