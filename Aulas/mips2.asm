fat:   add $2 $4 $0
	addi $8 $4 -1
mtl:	mul  $2 $2 $8
	addi $8 $8 -1
	bne $8 $0 mtl
	jr $31