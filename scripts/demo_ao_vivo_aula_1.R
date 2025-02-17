# R como calculadora

uma_conta <- (10 * 5 -2 ) ^ 3 # Ctrl + Enter

# Para asignar variáveis usamos <- (alt + -)

ano_nacimento <- 1988

# Funções : nome_funçao()
class(ano_nacimento) 

# Tipos de variaveis
o3 <- "ozônio"
class(o3)

usp <- "Universidade de São Paulo"
class(usp)

g <- 9.81 # m/2

bool <- 5 > 10
class(bool)

# Vetores -> c()
pontos_cardeais <- c("N", "E", "S", "W")
# Convenção meteorologica
pontos_cardeais_graus <- c(0, 90, 180, 270)

# OBS: Os vetores só aceitam um único tipo de variavel
de_1ate10 <- seq(1, 10)
                     #Inicio, #Final, #paso
pares_ate_100 <- seq(0, 100, 2)

# ? -> Pedir ajuda
# ?nome_da_função
sec_float <- seq(0, 1, 0.0001)

# length -> # numero de elemntos
length(sec_float)
length(pontos_cardeais)

# Selecionar elementos vetor [indice]
# selecionar elemento errado
pontos_cardeais[2]

# selecionar 1ro e 3ro elemento
pontos_cardeais[c(1, 3)]

# Trocar elementos
pontos_cardeais[2] <- "L"
pontos_cardeais[4] <- "O"

# Eliminar GEE[-indice]
GEE <- c("H2O", "CO2", "O2", "CH4")
GEE[-3]
GEE[3] <- "O3"

#  Exercicio 1
pol_sp <- c("MP10", "MP2,5", "SO2", "NO2")
pol_amostra <- c(24, 24, 24, 1)
pol_pqa <- c(100, 50, 40, 240)

# https://github.com/quishqa/Curso_R_openair_FSP_USP_2025

# Operações element wise
tempC <- c(34, 33, 27, 28, 32, 40)
tempK <- tempC + 273

temp_char <- c("32", "31", "30", "23")
temp_num <- as.numeric(temp_char)


# Data Frames
gases <- c("N2", "O2", "Ar", "CO2")
massa_molar <- c(14 * 2 , 16 * 2, 40, 12 + 2 * 16)
percentagem <- c(78.08, 20.95, 0.9, 0.4)

ar <- data.frame(
  gases, massa_molar, percentagem
)
# Selecionar colunas '$' nome_df$nome_coluna -> vetor

ar$gases
ar$percentagem

# selecionar colunas nome_df[nome_col] -> df

ar["percentagem"]

# Adicionar nova coluna $ (mesmo numero de linhas)
ar$nome <- c("Nitrogênio", "Oxigênio", 
             "Argônio", "Dióxido de Carbono")
ar

# Funções importantes df
nrow(ar) # numero linhas 
ncol(ar) # numero colunas

str(ar) # olhar tipo de variavel coluna

names(ar) # nome das colunas

# Bom para trocar o nome das colunas
names(ar) <- c("gas", "W", "per", "nome")

names(ar)

head(ar, 2) # mostrar primeiras linhas
tail(ar, 2) # mostrar ultimas linhas

# Trocar toda a coluna
ar$nome <- c("Nitrogéno", "Oxígeno", "Argón", "Dióxido de Carbono")

# Exercicio 2

pol_sp <- c("MP10", "MP2,5", "SO2", "NO2")
pol_amostra <- c(24, 24, 24, 1)
pol_pqa <- c(100, 50, 40, 240)

# Criar um data.frame
pqa_sp <- data.frame(
  pol_sp, pol_amostra, pol_pqa
)

# Separador é "."
pqa_sp$pm <- c(1, 1, 64, 14 + 2 * 16)

pqa_sp$nome <- c("Material particulado grosso", "Material particulado fino", "Dióxido de enxofre", "Dióxido de Nitrogênio")

# Caso da vida real: Dados Guarulhos 2024
# Para ler dados externos usamos a função
# read.table()

gru <- read.table(
  file.choose(), # abre janela para selec file
  sep = ",", # separdor das colunas
  dec = ".", # separador decimal
  header = TRUE # se temos nome das colunas
)

# Vamos trocar F, to C

gru$tc <- (gru$tmpf - 32 ) * 5 / 9

mean(gru$tc, na.rm = T)
# Alt + Shift + zetinha para baixo
max(gru$tc, na.rm = T)
min(gru$tc, na.rm = T)

# Vamos trocar knots para m/s
gru$ws <- gru$sknt * 0.5144

# EDA
mean(gru$ws, na.rm = T)
max(gru$ws, na.rm = T)
min(gru$ws, na.rm = T)

sd(gru$tc, na.rm = T)
median(gru$tc, na.rm = T)


# Plots

# serie temporal
plot(gru$tc,
     t = "l",
     col = "orange",
     xlab = "Horas",
     ylab = "Temperatura ºC")

# boxplot
boxplot(gru$tc)




