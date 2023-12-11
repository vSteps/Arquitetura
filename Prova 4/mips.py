# Função para verificar se um número é primo
def eh_primo(numero):
    if numero <= 1:
        return False
    if numero <= 3:
        return True
    if numero % 2 == 0 or numero % 3 == 0:
        return False
    i = 5
    while i * i <= numero:
        if numero % i == 0 or numero % (i + 2) == 0:
            return False
        i += 6
    return True

# Solicita ao usuário os valores de a e b
a = int(input("Digite o valor de a: "))
b = int(input("Digite o valor de b: "))

# Inicializa a contagem de números primos
contagem = 0

# Percorre os números entre a e b (incluindo b)
for numero in range(a, b + 1):
    if eh_primo(numero):
        contagem += 1

# Imprime o resultado
print(f"Existem {contagem} números primos entre {a} e {b}.")