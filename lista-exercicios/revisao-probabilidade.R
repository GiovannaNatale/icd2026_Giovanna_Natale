# Arquivo: revisao-probabilidade.R
# Autor: Giovanna
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

#_______________________________________________________________________________

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.

#_______________________________________________________________________________


#_______________________________________________________________________________


# Exercício 1 -----------------------------------------------------
# Experimento, evento e variável aleatória

# a)  S = {Compra, Não Compra}

# b) A = {Compra}

# c) P(A) = P(Compra)

# d) Antes de definir uma variável aleatória, o resultado observado
# não é diretamente numérico. O experimento produz uma categoria
# qualitativa ("Compra" ou "Não Compra"). A representação numérica
# surge somente após a definição de uma variável aleatória.

# e) Variável aleatória indicadora para representar a compra:
# X = 1, se o cliente realizou uma compra nos 7 dias seguintes
# X = 0, se o cliente não realizou uma compra nos 7 dias seguintes

# Em notação matemática:
# X = {
#       1, se ocorrer Compra
#       0, se ocorrer Não Compra
#     }

#_______________________________________________________________________________


#_______________________________________________________________________________


# Exercício 2 -----------------------------------------------------
# Valor esperado em uma decisão simples

# a) Valores possíveis de X: 
# X ∈ {0, 500}

# b) P(X = 500) = 
# P(X = 500) = 0,04

# c) P(X = 0) = 
# P(X = 0) = 0,96

# d) E(X) = 
# E(X) = 500 * P(X = 500) + 0 * P(X = 0)
# E(X) = 500 * 0,04 + 0 * 0,96
# E(X) = 20

# e) Interpretação do valor esperado:
# O valor esperado de R$ 20 significa que, em média,
# a empresa tem um custo de R$ 20 de garantia para cada
# produto vendido quando se considera um grande número
# de vendas.

#_______________________________________________________________________________


#_______________________________________________________________________________


# Exercício 3 -----------------------------------------------------
# Escolha de distribuição de probabilidade

# a) # Modelo: Bernoulli
# Justificativa: a variável observada possui apenas dois resultados possíveis,
# compra (1) ou não compra (0).

# b) # Modelo: Binomial
# Justificativa: a variável observada é a contagem de sucessos (conversões)
# em um número fixo de tentativas (300 clientes).

# c) # Modelo: Poisson
# Justificativa: a variável observada é uma contagem de ocorrências
# (chegadas de clientes) em um intervalo fixo de tempo.

# d) # Modelo: Normal
# Justificativa: a variável observada é contínua e apresenta distribuição
# aproximadamente simétrica em torno de um valor médio.

#_______________________________________________________________________________


# Exercício 4 -----------------------------------------------------
# Simulação com distribuição de Poisson
# escreva, complete e execute o código fornecido

# Simulação de 1.000 valores de X ~ Poisson(12)

set.seed(123)

# Gerar os dados simulados
X <- rpois(n = 1000, lambda = 12)

# Média simulada
media_simulada <- mean(X)
media_simulada

# Proporção de horas em que a capacidade de 15 clientes foi excedida
prop_excesso <- mean(X > 15)
prop_excesso

# Percentil 95
percentil_95 <- quantile(X, probs = 0.95)
percentil_95

# e) Interpretação da capacidade atual
# A média simulada deve ficar próxima de 12 clientes por hora,
# coerente com o parâmetro da distribuição Poisson.
#
# A proporção de valores acima de 15 indica a frequência com que
# a demanda ultrapassa a capacidade atual da unidade.
#
# O percentil 95 representa um valor tal que aproximadamente 95%
# das horas de pico possuem essa quantidade de clientes ou menos.
#
# Se o percentil 95 for maior que 15, isso sugere que a capacidade
# atual não é suficiente para acomodar cerca de 5% das horas mais
# movimentadas. Se a proporção acima de 15 for relativamente baixa,
# a capacidade pode ser considerada razoável para a maior parte
# das situações, embora ocorram períodos ocasionais de sobrecarga.

#_______________________________________________________________________________
