# https://washingtonsilva.github.io/site_bach_icd2026
# *LINK DE INTRODUÇÃO A CIENCIA DE DADOS*




#Variáveis são características podem ser medidas ou observadas.(colunas)

#Observações são as unidades (ou casos) sobre os quais as variáveis são observadas ou medidas. (linhas)

# Ctrl + S = Salvar
# Ctrl + L = limpa o console
# Ctrl + shift + R = Criar uma sessão
# Ctrl + shift + M = |> 
# Alt + - = <-  (atribuição)

# Pipeline = sequencia de operações

# Data frames e tibbles são estruturas de dados formadas por linhas(observações) e
# colunas (variáveis), sendo que cada coluna (variável) pode assumir um tipo diferente. 
# É a estrutura mais comum para armazenar dados para análises estatísticas.

# A função filter() permite escolher quais observações (linhas) você quer manter ou remover de uma data frame/tibble, com base em condições lógicas.

# Sintaxe básica

# com o operador pipe
df |> filter(condição)

# df: A data frame/tibble a ser filtrada
# condição: Expressão lógica que retorna TRUE/FALSE para cada linha
# Somente as linhas que resultam em TRUE são mantidas no resultado

# Tipo	Operador	Descrição
# Comparação	==	igual
# !=	diferente
#>	maior que
#<	menor que
#>=	maior ou igual
#<=	menor ou igual
#Lógicos	&	E (todas as condições verdadeiras) (juntar condições)
# |	OU (pelo menos uma verdadeira)
#!	NÃO (negação)
#Pertinência	%in%	pertence a um conjunto

#Você pode se deparar com códigos que usam , (vírgula) ao invés de & para representar o “E” lógico em filter()
#Exemplo: filter(cidade == "Formiga", receita > 1000).
#Nesta disciplina usaremos somente o operador & para representar o “E” lógico, pois considero que o código fica mais claro e legível.
#Operadores usados com filter()
#Exemplos
#Operadores usados com filter()
#Nota sobre os operadores &, | e %in%
#  Operador	Uso principal	Exemplo
#&	exige que todas as condições sejam verdadeiras	cidade == "Formiga" & receita > 1000
# |	exige que pelo menos uma condição seja verdadeira	cidade == "Formiga" | cidade == "Arcos"
#%in%	verifica se um valor pertence a um conjunto	cidade %in% c("Formiga", "Arcos")
#Ideia central
#Use & para impor condições simultâneas.
#Use | para combinar alternativas.
#Use %in% para escrever de forma mais compacta várias comparações com | para a mesma variável.
#A função select()
#Função select()
#Seleciona as colunas/variáveis desejadas
#A função mutate()

# Cada tipo de arquivo tem um tipo de função para ler 





# GIT
# 1- git status
# 2- git add .
# 3- git status
# 4- git commit -m "mensagem"
# 5- git push origin main 
