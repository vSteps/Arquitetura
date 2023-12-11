.text	# L x H = 512 x 512| PIXELS x (L x H) = 4 x 4 | ADDRESS FOR DISPLAY = Padrão
main:
	lui  $9, 0x1001
	addi $9, $9, 2576    # posição inicial de desenho vertical/horizontal : $9(l) = 16; $9(h) = 2560
    addi   $13, $0 120        # Maior desenho vertical
    ########  Peças ########
    #   0x999999  ==> Borda	 #
   #   0x9933ff  ==>   Quadrado	 #
    #   0xff0000   ==>   L	 #
    #   0x0xffff00 ==>   Barra	 #
    #   0x0400ff  ==>   T	 #
    ##########################
     	
# Desenhar Parede
testeAltura:  
	beq  $13, 0, rotDesenhaBorda
	beq  $13, 120, rotDesenhaLinha
	beq  $13, 1, rotDesenhaLinha
		
	addi  $12, $0 2
	addi   $16, $0 324
	addi  $17, $0 -136
	
	j desenhaCinza
	
rotDesenhaLinha:
	addi   $25, $0 0x999999
	addi   $12, $0 82
	addi   $16, $0 4
	addi   $17, $0 184
	
desenhaCinza:   
	sw   $25, 0($9)
	add  $9, $9, $16
	addi $12, $12, -1
	bgt  $12, 0, desenhaCinza

rotProxLinha: 
	add  $9, $9, $17
   	 addi $13, $13, -1
    
    j testeAltura

# Desenhar a borda que mostra a próxima peça
bordaTesteeAltura:
	beq  $13, 0, _selecao1Peça
	beq  $13, 1, rotDesenhaBordaLinha
	
	addi   $16, $0 512
	addi   $17, $0 -160
	
	j desenhaCinzaBorda2
	
rotDesenhaBorda:
	lui  $9, 0x1001
	addi $9, $9, 14164
    	addi   $13, $0 54

rotDesenhaBordaLinha:
	addi   $12, $0 41
	addi   $16, $0 4
	addi   $17, $0 508
	
desenhaCinzaBorda:
	sw   $25, 0($9)
	add  $9, $9, $16
	addi $12, $12, -1
	bgt  $12, 0, desenhaCinzaBorda
	
	addi $13, $13, -1
	j novoRotDesenhaBorda
	
desenhaCinzaBorda2:
	sw   $25, 0($9)
	add  $9, $9, $16
	addi $13, $13, -1
	bgt  $13, 1, desenhaCinzaBorda2
	
novoRotDesenhaBorda:
	add  $9, $9, $17
	
	j bordaTesteeAltura

# Apaga borda se ja tiver algo desenhado
rotApagaBorda:
	addi   $14, $0 4
	addi   $25, $0 0
	
apagaDaBorda:
	sw   $25, 0($7)
	addi $7, $7, 4
	addi $14, $14, -1
	bgt  $14, 0, apagaDaBorda
	addi $12, $12, -1
	j checaSePrecisaApagar
	
# Checa se ja tem algo desenhado na borda
rotChecaBorda:
	lui  $7, 0x1001
	addi $7, $7, 24408
	addi   $12, $0 10
	addi   $19, $0 16
	j checaSePrecisaApagar

novoRotChecaBorda:
	addi $7, $7, 352
	addi   $12, $0 10
	
checaSePrecisaApagar:
	lw   $23, 0($7)
	sgt  $6, $23, 0
	beq  $6, 1, rotApagaBorda
	addi $7, $7, 16
	addi $12, $12, -1
	bgt  $12, 0, checaSePrecisaApagar
	addi $19, $19, -1
	bgt  $19, 0, novoRotChecaBorda
	
	jr   $31
	
checaProFinal:
	lw   $24, 7284($9)
	sgt  $11, $24, 0
	beq  $11, 1, fim
	lw   $24, 7316($9)
	sgt  $11, $24, 0
	beq  $11, 1, fim
	lw   $24, 7348($9)
	sgt  $11, $24, 0
	beq  $11, 1, fim
	lw   $24, 7380($9)
	sgt  $11, $24, 0
	beq  $11, 1, fim
	
	jr   $31	

_selecao1Peça:
	addi   $2, $0 42		# Gera um número aletório no range
	addi   $5, $0 4   	# $5 é o maior número aleatório
	syscall      	# número gerado vai pro ($4)
	
	add  $17, $0, $4  # guarda no $17 o número da próxima peça
	
# Move e Mento
rotParaMover:
	lui  $8, 0xffff
	lui  $9, 0x1001
	addi  $22, $0 6		   # 6 = linha que começa a desenhar
	jal  checaProFinal
	addi   $24, $0 0		# tecla pressionada	
	addi   $14, $0 0		# vloecidade
	addi   $15, $0 0

	add  $16, $0, $17
	beq  $16, 0, quadrado
	beq  $16, 1, L
	beq  $16, 2, barra
	beq  $16, 3, T
	
selecaoProxPeça:
	addi  $2, $0 42		# 42 Gera um número aletório no range
	addi  $5, $0 4   	#$5 é o maior número aleatório
	syscall      	# número gerado vai pro ($4)
	
	add  $17, $0, $4  # guarda no $17 o número da próxima peça
	
	jal  rotChecaBorda	# checa se precisa apagar a borda
	
	lui  $9, 0x1001
	beq  $17, 0, quadradoBorda
	beq  $17, 1, LBorda
	beq  $17, 2, barraBorda
	beq  $17, 3, tBorda

# Desenhar o quadrado
quadradoBorda:
	addi $9, $9, 24456
	j rotParaDesenharQuadrado

quadrado:
	addi $9, $9, 3220

rotParaDesenharQuadrado:
	addi   $25, $0 0x9933ff		# Roxo
	addi   $12, $0 16		# largura maxima
	addi   $19, $0 16		# Altura maxima -> 8 = 1 bloco; 16/8 = 2 blocos de Altura
	j DesenharQuadrado

novoRotDesenharQuadrado:
	addi $19, $19, -1
	addi   $12, $0 16
	addi $9, $9, 448
	bgt  $19, 0, DesenharQuadrado
	beq  $15, 1, cont
	jal  precisaDesenharProxBorda
	
resetaQuadrado:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi   $25, $0 0x9933ff
	addi   $18, $0 2
	j resetaMovimentoQuadrado

DesenharQuadrado:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, DesenharQuadrado
	bgt  $19, 0, novoRotDesenharQuadrado

# Fazuéli (Faz o L)
LBorda:
	addi $9, $9, 24504
	j rotParaDesenharL

L:
	addi $9, $9, 3252

rotParaDesenharL:
	addi  $25, $0 0xff0000	# vermelho
	addi   $12, $0 8			# largura maxima 'inicial' -> os dois primeiros com  8 de largura e o último com 16
	addi   $19, $0 16		# Altura maxima-> 8 = 1 bloco; 16/8 = 2 blocos de Altura
	j DesenharL	
	
novoRotDesenharL:
	addi $19, $19, -1
	blt  $19, 9, _segundoRotDesenharL
	
_primeiroRotDesenharL:
	addi   $12, $0 8
	addi $9, $9, 480
	bgt  $19, 0, DesenharL
	
_segundoRotDesenharL:
	addi  $12, $0 24
	addi $9, $9, 416
	bgt  $19, 0, DesenharL
	beq  $15, 1, cont
	jal  precisaDesenharProxBorda
	
resetaL:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi  $25, $0 0xff0000
	addi   $18, $0 2
	j resetaMovimentoL

DesenharL:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, DesenharL
	bgt  $19, 0, novoRotDesenharL

# Desenhar a barra
barraBorda:
	addi $9, $9, 28520
	j rotParaDesenharBarra

barra:
	addi $9, $9, 3188

rotParaDesenharBarra:
	addi   $25, $0 0xffff00	# amar elo(muito ruim ser viciado em lol)
	addi   $12, $0 32		# largura maxima
	addi   $19, $0 8			# Altura maxima -> 8 = 1 bloco; 32/8 = 4 blocos de Altura
	j DesenharBarra
	
novoRotDesenharBarra:
	addi $19, $19, -1
	addi   $12, $0 32
	addi $9, $9, 384
	bgt  $19, 0, DesenharBarra
	beq  $15, 1, cont
	jal  precisaDesenharProxBorda
	
resetaBarra:
	lui  $9, 0x1001
	addi $9, $9, 6900
	addi   $25, $0 0xffff00
	addi   $18, $0 1
	j resetaMovimentoBarra
	
DesenharBarra:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, DesenharBarra
	bgt  $19, 0, novoRotDesenharBarra

# Desenhar o Tesão(T)
tBorda:
	addi $9, $9, 24472
	j rotParaDesenharT

T:
	addi $9, $9, 3220
	
rotParaDesenharT:	
	addi   $25,$0 0x0400ff 	# azul
	addi   $12, $0 8			# largura maxima 'inicial'-> o primeiro com 8 de largura e o último com 24
	addi   $19, $0 16		#  Altura maxima-> 8 = 1 bloco; 16/8 = 2 blocos de Altura
	j DesenharT

novoRotDesenharT:
	addi $19, $19, -1
	beq  $19, 8, ajeitaOffsetUmaVez
	blt  $19, 9, _segundoRotDesenharT

_primeiroRotDesenharT:
	addi   $12, $0 8
	addi $9, $9, 480
	bgt  $19, 0, DesenharT
	
ajeitaOffsetUmaVez:
	addi   $12, $0 24
	addi $9, $9, 448
	j DesenharT

_segundoRotDesenharT:
	addi   $12, $0 24
	addi $9, $9, 416
	bgt  $19, 0, DesenharT
	beq  $15, 1, cont
	jal  precisaDesenharProxBorda
	
resetaT:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi   $25, $0 0x0400ff 
	addi   $18, $0 2
	j resetaMovimentoT
	
DesenharT:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, DesenharT
	bgt  $19, 0, novoRotDesenharT
	
precisaDesenharProxBorda:
	addi  $15, $0 1
	add  $20, $0, $31
	j selecaoProxPeça

cont:
	add  $31, $0, $20
	jr   $31

# Acelerar
rotAcelerar:
	addi   $14, $0 10
	beq  $16, 0, resetaMovimentoQuadrado
	beq  $16, 1, resetaMovimentoL
	beq  $16, 2, resetaMovimentoBarra
	beq  $16, 3, resetaMovimentoT
	
rotVelocidadeMaxima:
	addi   $14, $0 150
	beq  $16, 0, resetaMovimentoQuadrado
	beq  $16, 1, resetaMovimentoL
	beq  $16, 2, resetaMovimentoBarra
	beq  $16, 3, resetaMovimentoT
	
acelerar:
	addi $14, $14, -1
	beq  $16, 0, resetaMovimentoQuadrado
	beq  $16, 1, resetaMovimentoL
	beq  $16, 2, resetaMovimentoBarra
	beq  $16, 3, resetaMovimentoT
	
# Move e Mento: Pra baixo oomi
resetaMovimentoQuadrado:
	addi   $12, $0 16
	addi $9, $9, -7744
	j apagarCimaQuadrado

resetaMovimentoL:
	addi   $12, $0 24
	addi $9, $9, -7712
	j apagarCimaL

resetaMovimentoBarra:
	addi   $12, $0 32
	addi $9, $9, -3712
	j apagarCimaBarra

resetaMovimentoT:
	addi   $12, $0 24
	addi $9, $9, -7744
	j apagarCimaT

delay:
	bgt  $14, 0, acelerar
	addi   $4, $0 35
	addi   $2, $0 32
	syscall
	
	beq  $16, 0, resetaMovimentoQuadrado
	beq  $16, 1, resetaMovimentoL
	beq  $16, 2, resetaMovimentoBarra
	beq  $16, 3, resetaMovimentoT

apagar:
	addi  $23, $0 0
	sw   $23, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	jr   $31
	
desenhar:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	jr   $31

# Funções de apagar ; Move e Mentos
apagarCimaQuadrado:
	jal  apagar
	bgt  $12, 0, apagarCimaQuadrado
	addi $22, $22, 1	
	j desenharFimQuadrado
		
_segundoApagarPtL:
	addi $9, $9, 4000
	
apagarCimaL:
	jal  apagar
	beq  $12, 16, _segundoApagarPtL
	bgt  $12, 0, apagarCimaL
	addi $22, $22, 1
	j desenharFimL

apagarCimaBarra:
	jal  apagar
	bgt  $12, 0, apagarCimaBarra
	addi $22, $22, 1
	j desenharFimBarra
	
_segundoApagarPtT:
	addi $9, $9, 4032
	j apagarCimaT
	
_terceiroApagarPtT:
	addi $9, $9, 32
	
apagarCimaT:
	jal  apagar
	beq  $12, 16, _segundoApagarPtT
	beq  $12, 8, _terceiroApagarPtT
	bgt  $12, 0, apagarCimaT
	addi $22, $22, 1
	j desenharFimT
	
	
# Move e Mentos: Girar Peças

rotGiraBarra:
	
	
	
# Funções de apagar ; Move e Mentos
desenharFimQuadrado:
	addi   $12, $0 16
	addi $9, $9, 8128
	#j desenharFim
	
desenharFimL:
	addi   $12, $0 24
	addi $9, $9, 4032
	#j desenharFim

desenharFimBarra:
	addi   $12, $0 32
	addi $9, $9, 3968
	#j desenharFim

desenharFimT:
	addi   $12, $0 24
	addi $9, $9, 4000

fim:
	addi $2, $0, 10
	syscall
