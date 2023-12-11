.text	# L x H = 512 x 512 | PIXELS x (L x H) = 4 x 4 | ADDRESS FOR DISPLAY = Padrão
main:
	lui  $9, 0x1001
	addi $9, $9, 2576    # posição inicial de desenho vertical/horizontal : $9(l) = 16; $9(h) = 2560
    addi   $13, $0 120        # Maior desenho vertical
    ########  Peças ########
    #   0x999999  ==> Borda	 #
   #   0x9933ff	  ==>   Quadrado	 #
    #   0xff0000  ==>   L	 #
    #    0xff00ff   ==>   Barra	 #
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

# Apaga borda se ja tiver alvai desenhado
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
	
# Checa se ja tem alvai desenhado na borda
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
	
SeleçaoProximaPeça:
	addi   $2, $0 42		# Gera um número aletório no range
	addi   $5, $0 4   	# $5 é o maior número aleatório
	syscall      	# número gerado vai pro ($4)
	
	add  $17, $0, $4  # guarda no $17 o número da próxima peça
	
	jal  rotChecaBorda	# checa se precisa apagar a borda
	
	lui  $9, 0x1001
	beq  $17, 0, quadradoBorda
	beq  $17, 1, LBorda
	beq  $17, 2, barraBorda
	beq  $17, 3, tBorda

# Desenhar o Quadrado
quadradoBorda:
	addi $9, $9, 24456
	j rotParaDesenharQuadrado

quadrado:
	addi $9, $9, 3220

rotParaDesenharQuadrado:
	addi   $25, $0 0x9933ff		# cor(roxo)
	addi   $12, $0 16		# largura máxima
	addi   $19, $0 16		# altura máxima -> 8 = 1 bloco; 16/8 = 2 blocos de altura
	j primeiroDesenharQuadrado

novoRotPrimeiroDesenharQuadrado:
	addi $19, $19, -1
	addi   $12, $0 16
	addi $9, $9, 448
	bgt  $19, 0, primeiroDesenharQuadrado
	beq  $15, 1, cont
	jal  precisaParaDesenharProximaBorda
	
resetaQuadrado:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi   $25, $0 0x9933ff
	addi   $18, $0 2
	j resetQuadrado

primeiroDesenharQuadrado:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, primeiroDesenharQuadrado
	bgt  $19, 0, novoRotPrimeiroDesenharQuadrado

# Desenhar L
LBorda:
	addi $9, $9, 24504
	j rotParaDesenharL

L:
	addi $9, $9, 3252

rotParaDesenharL:
	addi  $25, $0 0xff0000		# cor (vermelho)
	addi   $12, $0 8			# largura inicial máxima ->Os dois primeiros com 8 de largura e o ultimo com 16
	addi   $19, $0 16		# altura máxima -> 8 = 1 bloco; 16/8 = 2 blocos de altura
	j primeiroDesenharL	
	
novoRotPrimeiroDesenharL:
	addi $19, $19, -1
	blt  $19, 9, _segundoRotPrimeiroDesenharL
	
_primeiroRotPrimeiroDesenharL:
	addi   $12, $0 8
	addi $9, $9, 480
	bgt  $19, 0, primeiroDesenharL
	
_segundoRotPrimeiroDesenharL:
	addi  $12, $0 24
	addi $9, $9, 416
	bgt  $19, 0, primeiroDesenharL
	beq  $15, 1, cont
	jal  precisaParaDesenharProximaBorda
	
resetaL:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi  $25, $0 0xff0000
	addi   $18, $0 2
	j resetL

primeiroDesenharL:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, primeiroDesenharL
	bgt  $19, 0, novoRotPrimeiroDesenharL

# Desenhar Barra
barraBorda:
	addi $9, $9, 28520
	j rotParaDesenharBarra

barra:
	addi $9, $9, 3188

rotParaDesenharBarra:
	addi   $25, $0 0xff00ff 	# cor (rosa)
	addi   $12, $0 32		# largura máxima
	addi   $19, $0 8			# altura máxima -> 8 = 1 bloco; 32/8 = 4 blocos de altura
	j primeiroDesenharBarra
	
novoRotPrimeiroDesenharBarra:
	addi $19, $19, -1
	addi   $12, $0 32
	addi $9, $9, 384
	bgt  $19, 0, primeiroDesenharBarra
	beq  $15, 1, cont
	jal  precisaParaDesenharProximaBorda
	
resetaBarra:
	lui  $9, 0x1001
	addi $9, $9, 6900
	addi   $25, $0 0xff00ff 
	addi   $18, $0 1
	j resetBarra
	
primeiroDesenharBarra:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, primeiroDesenharBarra
	bgt  $19, 0, novoRotPrimeiroDesenharBarra

# Desenhar Tesão
tBorda:
	addi $9, $9, 24472
	j rotParaDesenharT

T:
	addi $9, $9, 3220
	
rotParaDesenharT:	
	addi   $25,$0 0x0400ff			# cor (azul)
	addi   $12, $0 8			# largura inicial máxima -> O primeiro com 8 de largura e o ultimo com 24
	addi   $19, $0 16		# altura máxima -> 8 = 1 bloco; 16/8 = 2 blocos de altura
	j primeiroDesenharT

novoRotPrimeiroDesenharT:
	addi $19, $19, -1
	beq  $19, 8, ajeitaOffsetUmaVez
	blt  $19, 9, _segundoRotPrimeiroDesenharT

_primeiroRotPrimeiroDesenharT:
	addi   $12, $0 8
	addi $9, $9, 480
	bgt  $19, 0, primeiroDesenharT
	
ajeitaOffsetUmaVez:
	addi   $12, $0 24
	addi $9, $9, 448
	j primeiroDesenharT

_segundoRotPrimeiroDesenharT:
	addi   $12, $0 24
	addi $9, $9, 416
	bgt  $19, 0, primeiroDesenharT
	beq  $15, 1, cont
	jal  precisaParaDesenharProximaBorda
	
resetaT:
	lui  $9, 0x1001
	addi $9, $9, 10964
	addi   $25, $0 0x0400ff
	addi   $18, $0 2
	j resetT
	
primeiroDesenharT:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, primeiroDesenharT
	bgt  $19, 0, novoRotPrimeiroDesenharT
	
precisaParaDesenharProximaBorda:
	addi  $15, $0 1
	add  $20, $0, $31
	j SeleçaoProximaPeça

cont:
	add  $31, $0, $20
	jr   $31

# Acelerar
rotAcelera:
	addi   $14, $0 10
	beq  $16, 0, resetQuadrado
	beq  $16, 1, resetL
	beq  $16, 2, resetBarra
	beq  $16, 3, resetT
	
rotVelocidadeMaxima:
	addi   $14, $0 150
	beq  $16, 0, resetQuadrado
	beq  $16, 1, resetL
	beq  $16, 2, resetBarra
	beq  $16, 3, resetT
	
acelera:
	addi $14, $14, -1
	beq  $16, 0, resetQuadrado
	beq  $16, 1, resetL
	beq  $16, 2, resetBarra
	beq  $16, 3, resetT
	
# Move e Mentos - Pra baiixoo omiii
resetQuadrado:
	addi   $12, $0 16
	addi $9, $9, -7744
	j apagaQuadrado

resetL:
	addi   $12, $0 24
	addi $9, $9, -7712
	j apagaL

resetBarra:
	addi   $12, $0 32
	addi $9, $9, -3712
	j apagaBarra

resetT:
	addi   $12, $0 24
	addi $9, $9, -7744
	j apagaT

delay:
	bgt  $14, 0, acelera
	addi   $4, $0 35
	addi   $2, $0 32
	syscall
	
	beq  $16, 0, resetQuadrado
	beq  $16, 1, resetL
	beq  $16, 2, resetBarra
	beq  $16, 3, resetT

apaga:
	addi  $23, $0 0
	sw   $23, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	jr   $31
	
desenha:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	jr   $31

# Funções de apagar - Movimentos
apagaQuadrado:
	jal  apaga
	bgt  $12, 0, apagaQuadrado
	addi $22, $22, 1	
	j desenharFimQuadrado
		
_segundoApagaPtL:
	addi $9, $9, 4000
	
apagaL:
	jal  apaga
	beq  $12, 16, _segundoApagaPtL
	bgt  $12, 0, apagaL
	addi $22, $22, 1
	j desenharFimL

apagaBarra:
	jal  apaga
	bgt  $12, 0, apagaBarra
	addi $22, $22, 1
	j desenharFimBarra
	
_segundoApagaPtT:
	addi $9, $9, 4032
	j apagaT
	
_terceiroApagaPtT:
	addi $9, $9, 32
	
apagaT:
	jal  apaga
	beq  $12, 16, _segundoApagaPtT
	beq  $12, 8, _terceiroApagaPtT
	bgt  $12, 0, apagaT
	addi $22, $22, 1
	j desenharFimT
	
# Funções de Desenhar - Movimento
desenharFimQuadrado:
	addi   $12, $0 16
	addi $9, $9, 8128
	j desenharFim
	
desenharFimL:
	addi   $12, $0 24
	addi $9, $9, 4032
	j desenharFim

desenharFimBarra:
	addi   $12, $0 32
	addi $9, $9, 3968
	j desenharFim

desenharFimT:
	addi   $12, $0 24
	addi $9, $9, 4000
	
#################################
#   Configurações do Teclado	#
#################################
desenharFim:
	jal  desenha
	bgt  $12, 0, desenharFim
	jal  checaLimiteNoFim
	lw   $24, 0($8)
	beq  $24, 0, delay
	lw   $24, 4($8)
	#beq  $24, 97, rotParaMoveEsquerda
	#beq  $24, 100, rotParaMoveDireita
	#beq  $24, 115, rotAcelera
	#beq  $24, 119, rotVelocidadeMaxima
	j delay
#################################
#   Configurações do Teclado	#
#################################	

# Limites da parede / Colisões
checaLimiteNoFim:
	add  $5, $0, $9			
	beq  $16, 0, checaPorQuadradoFim
	beq  $16, 1, checaPorLTFim
	beq  $16, 2, checaPorBarraFim
	beq  $16, 3, checaPorLTFim
	
checaPorQuadradoFim:
	addi $5, $5, 448		# $5 += 448  ->  Adiciona para ir pro primeiro endereço da proxima linha
	addi   $12, $0 16			# $12 = $18(largura da peça atual)
	j horzCheca
	
checaPorLTFim:
	addi $5, $5, 416
	addi   $12, $0 24
	j horzCheca
			
checaPorBarraFim:	
	addi $5, $5, 384
	addi   $12, $0 32
	
horzCheca:
	lw   $23, 0($5)			# $23 = 0($5) valor guardado;
	addi $5, $5, 4			# $5 += 4  ->  checando o que está abaixo da peça atual
	addi $12, $12, -1		# ChecaColunas;
	sgt  $7, $23, 0			# valor guardado > 0 ? 
	beq  $7, 1, checaLinhas  #checaLinhas	# valor guardado > 0 ? true  ->  procura por linahs completas
	bgt  $12, 0, horzCheca  # checacolunas > 0 ? true  ->  refaz
	jr   $31				# checacolunas > 0 ? false ->  sai do rotulo de checagem

checaLimiteNaDireita:
	add  $5, $0, $9
	beq  $16, 0, checaPorQuadradoLDireita
	beq  $16, 1, checaPorQuadradoLDireita
	beq  $16, 2, checaPorBarraDireita
	beq  $16, 3, checaPorTDireita

checaPorQuadradoLDireita:
	addi $5, $5, -8192		
	addi   $12, $0 16			# altura da peça atual
	j vertCheca
	
checaPorBarraDireita:
	addi $5, $5, -4096		
	addi   $12, $0 8				# altura da peça atual
	j vertCheca
	
checaPorTDireita:
	addi $5, $5, -8224		
	addi   $12, $0 16			# altura da peça atual
	j vertChecaPorTDireita
	
novoRotChecaTDireita:
	addi $5, $5, 32	

vertChecaPorTDireita:
	lw   $23, 0($5)
	addi $5, $5, 512
	addi $12, $12, -1
	sgt  $7, $23, 0	
	beq  $7, 1, delay
	beq  $12, 8, novoRotChecaTDireita
	bgt  $12, 0, vertChecaPorTDireita
	jr   $31
	
vertCheca:
	lw   $23, 0($5)			# $23 = 0($5).valor guardado;
	addi $5, $5, 512		# $5 += 512  ->  avança uma linha no display
	addi $12, $12, -1		# checalinhas;
	sgt  $7, $23, 0			# valor guardado > 0 ? 
	beq  $7, 1, delay		# valor guardado > 0 ? true  ->  caso de quebra do rotulo
	bgt  $12, 0, vertCheca  # checalinhas > 0 ? true  ->  refaz
	jr   $31				# checalinhas > 0 ? false -> volta pra função de desenhar
		
checaLimiteNaEsquerda:
	add  $5, $0, $9
	beq  $16, 0, checaPorQuadradoEsquerda
	beq  $16, 1, checaPorLEsquerda
	beq  $16, 2, checaPorBarraEsquerda
	beq  $16, 3, checaPorTEsquerda
	
novoRotChecaLEsquerda:
	addi $5, $5, -64	

vertChecaPorLEsquerda:
	lw   $23, 0($5)
	addi $5, $5, 512
	addi $12, $12, -1
	sgt  $7, $23, 0	
	beq  $7, 1, delay
	beq  $12, 8, novoRotChecaLEsquerda
	bgt  $12, 0, vertChecaPorLEsquerda
	jr   $31
	
novoRotChecaTEsquerda:
	addi $5, $5, -32	

vertChecaPorTEsquerda:
	lw   $23, 0($5)
	addi $5, $5, 512
	addi $12, $12, -1
	sgt  $7, $23, 0	
	beq  $7, 1, delay
	beq  $12, 8, novoRotChecaTEsquerda
	bgt  $12, 0, vertChecaPorTEsquerda
	jr   $31
	
checaPorQuadradoEsquerda:
	addi $5, $5, -8260
	addi  $12, $0 16			# altura da peça atual
	j vertCheca
	
checaPorLEsquerda:
	addi $5, $5, -8228
	addi   $12, $0 16			# altura da peça atual
	j vertChecaPorLEsquerda
	
checaPorBarraEsquerda:
	addi $5, $5, -4228
	addi   $12, $0 8				# altura da peça atual
	j vertCheca
	
checaPorTEsquerda:
	addi $5, $5, -8260
	addi   $12, $0 16			# altura da peça atual
	j vertChecaPorTEsquerda

# Tentar mudar a cor
mudarCor:
	addi $9, $9, -7744
	addi   $12, $0 16
	addi   $19, $0 16
	addi   $25, $0 0x50ff
	j segundoDesenhar
	
novoRotSegundoDesenhar:
	addi $19, $19, -1
	addi   $12, $0 16
	addi $9, $9, 448
	bne  $19, 0, segundoDesenhar
	j checaLinhas
	
segundoDesenhar:
	sw   $25, 0($9)
	addi $9, $9, 4
	addi $12, $12, -1
	bgt  $12, 0, segundoDesenhar
	bgt  $19, 0, novoRotSegundoDesenhar

# Procura por linhas feitas
checaLinhas:
	mul  $21, $22, 512	# $21 = $22 * 512; $22 = apaga ultima linha + 1;
	addi $21, $21, 20	# $21 += 20; 20 = ponta do começo + pixels da parede
	lui  $5, 0x1001 		# $5 = 0x10040000; reseta o valor do registrador
	add  $5, $5, $21	# $5 += $21; vai pro topo da peça atual quando parar
	addi   $19, $0 10		# $19 = 10; quantidade maxima de blocos que preenchem a linha
	j procuraPorLinhasFeitas
	
novoRotProcuraPorLinhasFeitas:
	addi $18, $18, -1
	beq  $18, 0, rotParaMover	
	addi   $19, $0 10		# maximo de blocos por linha (o mesmo para todas as peças)
	lui  $5, 0x1001
	add  $5, $5, $21
	addi $5, $5, 4096
	
procuraPorLinhasFeitas:
	beq  $19, 0, rotDeletaLinhaBloco
	lw   $23, 0($5)
	addi $5, $5, 32
	sgt  $7, $23, 0
	addi $19, $19, -1
	beq  $7, 1, procuraPorLinhasFeitas
	beq  $7, 0, novoRotProcuraPorLinhasFeitas
	
rotDeletaLinhaBloco:
	addi   $15, $0 8				# $18 = 8; altura maxima da linha para deletar
	addi   $12, $0 80
	addi $5, $5, -320
	add  $9, $0, $5			# $9 += $21; incrementa o registrador usado no rot 'apaga'
	j deletaLinhaBloco
	
novoRotDeletaLinhaBloco:
	addi   $12, $0 80			# largura maxima da linha (o mesmo para todas as peças)
	addi $9, $9, 192		# vai pro começo da proxima linha
	
deletaLinhaBloco:
	jal apaga
	bgt  $12, 0, deletaLinhaBloco
	addi $15, $15, -1
	bgt  $15, 0, novoRotDeletaLinhaBloco
	addi $13, $13, 100
	jal  rotChecaPorQualquerCor
	j novoRotProcuraPorLinhasFeitas
	
# Trazer o primeiro bloco de cima pra baixo
rotChecaPorQualquerCor:
	addi $5, $5, -512
	addi   $19, $0 10
	addi   $16, $0 0
	
	j checaPorQualquerCor
	
novoRotChecaPorQualquerCor:
	beq  $16, 10, return
	addi   $19, $0 10
	addi   $16, $0 0
	addi $5, $5, -832

checaPorQualquerCor:
	beq  $19, 0, novoRotChecaPorQualquerCor
	lw   $23, 0($5)
	sgt  $7, $23, 0
	beq  $7, 1, rotTrazerDeCimaParaBaixo
	addi $5, $5, 32
	addi $19, $19, -1
	addi $16, $16, 1
	j checaPorQualquerCor
	
rotTrazerDeCimaParaBaixo:
	addi   $12, $0 8

trazerDeCimaParaBaixo:
	lw   $23, 0($5)
	sw   $23, 4096($5)
	addi   $23, $0 0
	sw   $23, 0($5)
	addi $5, $5, 4
	addi $12, $12, -1
	bgt  $12, 0, trazerDeCimaParaBaixo
	addi $19, $19, -1
	j checaPorQualquerCor
		
return:
	jr   $31
	

fim:
	addi $2, $0, 10
	syscall
