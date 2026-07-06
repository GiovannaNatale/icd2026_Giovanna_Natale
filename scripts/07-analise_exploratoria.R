# Arquivo: 07-analise-exploratoria.R
# Autor(a): Giovanna
# Data: 25/05/2026
# Objetivos:
# 1. Calcular estatísticas descritivas amostrais.
# 2. Visualizar a distribuição empírica dos dados.
# 3. Comparar padrões entre grupos.

# 0. Configurações globais ---------------------------------------------

# Controla a forma como os valores numéricos aparecem no console.
options(digits = 5, scipen = 999)

# Carrega os pacotes usados para caminhos, manipulação e visualização.
library(here)
library(tidyverse)
library(tidyplots)

# Permite que os gráficos do tidyplots usem o espaço disponível.
tidyplots_options(width = NA, height = NA)



# Carregamento dos dados --------------------------------------------------

# Usa um caminho relativo ao projeto para encontrar os dados limpos.
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

# Carrega os dados de marketing preparados na Lista 2.
dados_marketing <- read_rds(caminho_dados)

# Confere variáveis, tipos e primeiras observações dos dados.
glimpse(dados_marketing)



# Inspeção inicial --------------------------------------------------------

# Verifica o tamanho dos dados: quantidade de linhas e colunas.
dim(dados_marketing)

# Lista os nomes das variáveis disponíveis.
names(dados_marketing)

# Mostra as primeiras linhas para uma inspeção rápida dos dados.
head(dados_marketing)

# Conta quantas semanas aparecem em cada status de promoção.
dados_marketing |>
  count(status_promocao)



#  Primeira inspeção estatística da receita -------------------------------

# Calcula estatísticas iniciais da receita semanal de vendas.
inspecao_receita <- dados_marketing |>
  summarize(
    n = n(),
    minimo = min(receita_vendas),
    maximo = max(receita_vendas),
    amplitude = max(receita_vendas) -
      min(receita_vendas)
  )

# Mostra a tabela de inspeção no console.
inspecao_receita




# Pacote tidyplots --------------------------------------------------------

dados_marketing |>
  tidyplot(x = receita_vendas) |>
  add_histogram()

dados_marketing |>
  tidyplot(y = receita_vendas) |>
  add_boxplot()

dados_marketing |>
  tidyplot(x = status_promocao, y = receita_vendas) |>
  add_boxplot()



# Distribuição empírica da receita ----------------------------------------

# Visualiza como a receita semanal se distribui nos dados observados.
# tidyplot() inicia o gráfico e add_histogram() adiciona o histograma.
# O argumento bins controla a quantidade de classes do histograma.
dados_marketing |>
  tidyplot(x = receita_vendas) |>
  add_histogram(bins = 20)



# Valores típicos da receita ----------------------------------------------

# Calcula média e mediana para descrever o centro da distribuição.
centro_receita <- dados_marketing |>
  summarize(
    media = mean(receita_vendas),
    mediana = median(receita_vendas)
  )

centro_receita



#______________________________________________________________________________
#NOVO
#______________________________________________________________________________




# Arquivo: 07-analise-exploratoria-numerica.R
# Autor(a): <seu nome>
# Data: 15/06/2026
# Objetivos:
# 1. Carregar e inspecionar os dados de marketing
# 2. Calcular estatísticas amostrais de centro, posição e variabilidade
# 3. Interpretar a receita semanal com base nos dados observados

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)


# 1. Carregamento dos dados -----------------------------------------------

# Caminho do arquivo de dados limpos
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

# Leitura dos dados de marketing
dados_marketing <- read_rds(caminho_dados)

# Estrutura dos dados carregados
glimpse(dados_marketing)



# 2. Inspeção inicial -----------------------------------------------------

# Dimensão da base
dim(dados_marketing)

# Nomes das variáveis
names(dados_marketing)

# Primeiras linhas da base
head(dados_marketing)

# Contagem de semanas por status de promoção
dados_marketing |> 
  count(status_promocao)


# 3. Valores típicos da receita -------------------------------------------

# Resumo com medidas amostrais de centro
estatisticas_centro <- dados_marketing |> 
  summarize(
    # Média amostral
    media = mean(receita_vendas),
    
    # Mediana amostral
    mediana = median(receita_vendas)
  )

# Exibe o resumo calculado
estatisticas_centro


# 4. Resumo rápido da receita ---------------------------------------------

# Extrai a coluna receita_vendas como um vetor
receita <- dados_marketing |> 
  pull(receita_vendas)

# Resumo amostral básico
summary(receita)

df <-
dados_marketing |> 
  mutate(promocao = factor/status_promocao) |> 
  pull(promocao)
summary(df$promocao) 

# 5. Quantis da receita ---------------------------------------------------

# Quantis amostrais selecionados
quantis_receita <- dados_marketing |> 
  sumarize(
    # Mínimo amostral e percentil 5
    p0 = quantile(receita_vendas, 0),
    p5 = quantile(receita_vendas, 0.05),
    
    # Quartis amostrais
    q1 = quantile(receita_vendas, 0.25),
    mediana = quantile(receita_vendas, 0.50),
    q3 = quantile(receita_vendas, 0.75),
    
    # Percentil 95 e máximo amostral
    p95 = quantile(receita_vendas, 0.95),
    p100 = quantile(receita_vendas, 1)
    
  )

# Exibe os quantis calculados
quantis_receita


# 6. Variabilidade da receita ---------------------------------------------

# 6. Variabilidade da receita --------------------------------------------

# Resumo com medidas amostrais de variabilidade
estatisticas_variabilidade <- dados_marketing |>
  summarize(
    
    # Amplitude amostral
    amplitude = max(receita_vendas) - min(receita_vendas),
    
    # Variância amostral
    variancia = var(receita_vendas),
    
    # Desvio-padrão amostral
    desvio_padrao = sd(receita_vendas),
    
    # Intervalo interquartil amostral
    iqr = IQR(receita_vendas)
  )

# Exibe as estatísticas de variabilidade
estatisticas_variabilidade

# 7. Coeficiente de variação --------------------------------------------

# Resumo com média, desvio-padrão e CV amostrais
cv_receita <- dados_marketing |>
  summarize(
    
    # Média amostral
    media = mean(receita_vendas),
    
    # Desvio-padrão amostral
    desvio_padrao = sd(receita_vendas),
    
    # CV amostral percentual
    cv_percentual = 100 * desvio_padrao / media
  )

# Exibe o coeficiente de variação
cv_receita