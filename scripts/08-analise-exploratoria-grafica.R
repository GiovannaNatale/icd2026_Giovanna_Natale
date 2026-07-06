# Arquivo: 08-analise-exploratoria-grafica.R
# Autor(a): Giovanna 
# Data: 22/06/2026
# Objetivos:
# 1. Criar histograma da receita semanal de vendas com tidyplots
# 2. Criar boxplot da receita semanal de vendas com tidyplots
# 3. Criar boxplot comparativo da receita semanal de vendas com tidyplots
#    entre semanas com e sem promoção

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)
library(tidyplots)


# Permite que os gráficos do tidyplots usem os espaços disponível
tidyplots_options(width = NA, height = NA)


# Importação dos dados ----------------------------------------------------


# Caminho do arquivo de dados limpos
caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")


# Leitura dos dados de marketing
dados_marketing <- read_rds(caminho_dados)


# Estrutura dos dados carregados
glimpse(dados_marketing)



# 1. Histograma da receita ---------------------------------------------------


# Gera o histograma da receita semanal
dados_marketing |> 
  tidyplot(x = receita_vendas) |> 
  add_histogram(bins = 9)

# 2. Estatísticas de apoio para interpretar o histograma -------------

# Resume o centro da receita semanal.
# Servem só para apoiar a leitura do gráfico, não para substituí-la.
resumo_histograma <- dados_marketing |>
  summarize(
    media = mean(receita_vendas),
    mediana = median(receita_vendas)
  )

# Exibe o resumo calculado.
resumo_histograma



# 3. Histograma para publicação -------------------------------------------


# Versão final: eixos nomeados, fonte dos dados e fonte ampliada
dados_marketing |> 
  tidyplot(x = receita_vendas) |> 
  add_histogram(bins = 9, fill = "steelblue") |> 
  adjust_x_axis_title("Receita semanal de vendas (em U$ mil)") |> 
  adjust_y_axis_title("Número de semanas") |> 
  add_caption("Fonte: dados simulados pelo professor.") |> 
  adjust_font(fontsize = 14)