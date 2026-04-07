# Arquivo: 02-lista.R
# Autor(a): Giovanna Natale
# Data: <07/04/2026>
# Objetivo:
# 1. Resolver os exercícios da lista 2

#===============================================================================

# Configurações globais ---------------------------------------------------

#===============================================================================

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários
#===============================================================================



#===============================================================================

# Exercicio 1 -------------------------------------------------------------

#===============================================================================

# Escreva o código necessário para:

## a) Carregar os pacotes here, tidyverse e janitor, escreva esse código no 
## local indicado do script.

library(here) # para usar caminhos relativos
library(tidyverse) # carrega o dplyr, readr, ggplot2, etc.
library(janitor) # para limpar os nomes das colunas

## b) Importar o arquivo dados-marketing.csv da pasta dados/brutos usando as 
## funções here() do pacote here e a função read_csv do pacote readr. 
## Os dados importados devem ser armazenados em um objeto chamado dados_marketing.

# define o caminho para o arquivo csv
caminho_csv <- here("dados/brutos/dados-marketing.csv")

# importa os dados e armazena no objeto dados_marketing
dados_marketing <- read_csv(caminho_csv, show_col_types = FALSE)


## c) Em seguida, execute glimpse(dados_marketing) e analise a estrutura do objeto
## dados_marketing para entender como os dados foram registrados pela linguagem R.

glimpse(dados_marketing) # rodar no console
#===============================================================================



#===============================================================================

# Exercicio 2 -------------------------------------------------------------

#===============================================================================

# Com base na saída de glimpse(dados_marketing), responda em comentários
# no próprio script:

## a) O que cada linha (observação) do arquivo representa?
# Cada linha representa os gastos semainais de marketing e as promoções e receitas

## b) Quantas observações e quantas variáveis há no objeto dados_marketing?
# Tem 9 colunas e 156 linhas
#===============================================================================



#===============================================================================

# Exercicio 3 -------------------------------------------------------------

#===============================================================================

## a) Use clean_names() para padronizar os nomes das colunas e crie um novo objeto
## chamado dados_marketing_limpos a partir de dados_marketing.

dados_marketing_limpos <- dados_marketing |>
  clean_names()  

## b) escreva e execute names(dados_marketing_limpos) e verifique os 
## novos nomes das variáveis/colunas.
 
# names(dados_marketing_limpos) # rodar no console
  
#===============================================================================



#===============================================================================

# Exercicio 4 -------------------------------------------------------------

#===============================================================================

# Utilizando o objeto dados_marketing_limpos, use a função select do dplyr para
# criar um pipeline (sequência de operações) que mostre apenas as seguintes variáveis:

dados_marketing_limpos |> 
  select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)

#===============================================================================

# Exercicio 5 -------------------------------------------------------------

#===============================================================================

# Use mutate() para criar uma nova variável chamada gasto_total no
# objeto dados_marketing_limpos, correspondente à soma dos gastos com:

dados_marketing_limpos <- dados_marketing_limpos |>
  mutate( gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email)
  
# View(dados_marketing_limpos) no console para visualizar 

# Depois, exiba as colunas data, mes, gasto_total e receita_vendas.

dados_marketing_limpos |> 
  select(data, mes, gasto_total, receita_vendas)

#===============================================================================

# Exercicio 6 -------------------------------------------------------------

#===============================================================================

# Use mutate() e ifelse() para criar as seguintes novas variáveis
# no objeto dados_marketing_limpos:

## a) status_promocao, com os valores "Com promoção" e "Sem promoção";

dados_marketing_limpos <- dados_marketing_limpos |>
  mutate(
    status_promocao = ifelse(promocao == 1, "Com promoção", "Sem promoção"),
    status_concorrencia = ifelse(atividade_concorrente == 1, "Com concorrência", "Sem concorrência"))

## b) status_concorrencia, com os valores "Com concorrência" e "Sem concorrência".

# use View(dados_marketing_limpos) para visualizar a base de dados e verificar

#===============================================================================

# Exercicio 7 -------------------------------------------------------------

#===============================================================================

# Salve o objeto dados_marketing_limpos na pasta dados/limpos do seu projeto 
# usando a função write_rds() do pacote readr.

write_rds(
  dados_marketing_limpos,
  here("dados", "limpos", "dados_marketing_limpos.rds")
)

#===============================================================================

# Exercicio 8 -------------------------------------------------------------

#===============================================================================

# Usando o objeto dados_marketing_limpos, aplique a função filter() para
# identificar apenas as semanas que atendem, simultaneamente, às duas condições abaixo:
# houve promoção; a receita de vendas foi maior que 1000.

dados_marketing_limpos |> 
  filter(status_promocao == "Com promoção")

dados_marketing_limpos |> 
  filter(receita_vendas > "1000")
#===============================================================================

# Exercicio 9 -------------------------------------------------------------

#===============================================================================
