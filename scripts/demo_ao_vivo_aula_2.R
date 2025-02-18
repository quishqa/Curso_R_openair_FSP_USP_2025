# Resum ontem
uma_palavra <- "palavra"

um_numero <- 2025

gravidade <- 9.81

um_vetor <- c(1, 2, 3, 4, 5)

um_vetor_chr <- c("mario", "gavidia", "calderon")

um_vetor_chr[1]

um_vetor_chr[1] <- "Mario"

# Data Frame -> conjunto de vetores

beatles_name <- c("John", "Paul", "George", "Ringo")
beatles_instrument <- c("violão", "baixo", "violão", "bateria")

the_beatles <- data.frame(
  beatles_name, beatles_instrument
)

the_beatles$beatles_name
the_beatles$beatles_instrument

the_beatles$beatles_born <- c(1950, 1952, 1950, 1951)

the_beatles$age <- 2025 - the_beatles$beatles_born

gru <- read.table(
  file.choose(), # Escolher o arquivo
  sep = ",", # Separador das colunas
  dec =".", # Separador decimal
  header = T # Se temos nome das colunas
)

# Exercicio CETESB

pin <- read.table(
  "C:/Users/prof/Downloads/1739899975846.csv", # Selecionar arq
  sep = ";", # separador coluna
  dec = ",", # separador decimal
  skip = 8, # pular até linha 8
  header = F  # não tem nome as colunas
)

names(pin) <- c("day", "hour", "pm25", "o3", "ws")

# Resumo data frame
summary(pin)

mean(pin$o3, na.rm = T)
max(pin$o3, na.rm = T)
min(pin$o3, na.rm = T)
sd(pin$o3, na.rm = T) # desvio padrão

print("Hello world!")

o3_mean <- mean(pin$o3, na.rm = T)

print(o3_mean)
print(
  paste("A média de O3 é", o3_mean)
  )

print(
  paste(
    "A média de O3 é",
    o3_mean,
    "ug/m3")
)

print(
  paste(
    "A média de O3 é",
    round(o3_mean),
    "ug/m3")
)

print(
  paste(
    "A média de O3 é",
    round(o3_mean, 2),
    "ug/m3")
)

# Exercicio 2
# Fazer um print con a média, max, e min de pm25
pm25_mean <- mean(pin$pm25, na.rm = T)
pm25_min <- min(pin$pm25, na.rm = T)
pm25_max <- max(pin$pm25, na.rm = T)

print(
  paste("A média de pm25:", 
        round(pm25_mean))
  )
print(
  paste("A mínima de pm25:", pm25_min)
)
print(
  paste("A maxima de pm25:", pm25_max)
)

# unique() -> procura dados unicos
unique(pin$hour)

# Se eu quero saber se eu tenho dados de todos os dias  de nombre

length(
  unique(pin$day)
)

plot(pin$o3)
plot(pin$o3,
     t = "l")
plot(pin$o3,
     t = "l",
     lwd = 1.5,
     col = "red",
     ylab = "O3",
     main = "Pinheiros")

# Boxplot
boxplot(pin$o3)

# Em pt:
# "Eu quero um boxplot
# da coluna o3 dependendo da
# da coluna hour, do data frame
# pin"
boxplot(o3 ~ hour, data=pin)

boxplot(o3 ~ day, data=pin)

boxplot(pin$pm25 ~ pin$day)

# subset -> para filtra e 
# criar novos data frames
# df_subset <- subset(df, subset = <condição>)

pin_o3_elevado <- subset(
  pin,
  subset = o3 > 100
)

# Vou criar dois df
# um quando o vento fraco e outro
# quando o vento e forte
ws_median <- median(pin$ws, na.rm = T)

pin_o3_fraco <- subset(
  pin,
  subset = ws <= ws_median
)

pin_o3_forte <- subset(
  pin,
  subset = ws > ws_median
)

# Install package 
# install.packages(<nome_do_pacote>) entre "
# library(<nome_do_pacote>)

# Usando qualR
library(qualR)

# saber estaçãoes qualidade ar
cetesb_aqs

# saber parametros
cetesb_param

# Vamos a repetir o exemplo de hj
# mas com qualr
# Pinheiros, O3, PM2.5 e Velocidade
# nov 2023
# cetesb_retrieve_param()

pin_nov_23 <- cetesb_retrieve_param(
  username = "XXXXXXXXXX", 
  password = "XXXXXXXXX", 
  parameters = c("O3", "MP2.5", "VV", "NOx"),
  aqs_code = 99, 
  start_date = "01/11/2023",  # dia/mes/ano
  end_date = "30/11/2023" 
)

pin_nov_23 <- cetesb_retrieve_param(
  username = "XXXXXXXXX", 
  password = "XXXXXXXXX", 
  parameters = c("O3", "MP2.5", "VV", "NOx"),
  aqs_code = 99, 
  start_date = "01/11/2023",  # dia/mes/ano
  end_date = "30/11/2023",
  to_csv = T
)

user <- "XXXXXXXX"
pass <- "XXXXXXXX"

# Se a estação não tem dados
# qualR prenche con NA
ibi_met <- cetesb_retrieve_met(
  username = user,
  password = pass,
  aqs_code = 83,
  start_date = "01/11/2023",
  end_date = "30/11/2023")

pin_pol_23 <- cetesb_retrieve_pol(
  username = user,
  password = pass,
  aqs_code = 99,
  start_date = "01/11/2023",
  end_date = "15/11/2023"
)

# Exemplo de como baixar os dados de muitas estções

aqs_test <- head(cetesb_aqs)

aqs_o3 <- lapply(
  aqs_test$code,
  cetesb_retrieve_param,
  username = user,
  password = pass,
  parameters = c("O3", "CO", "NOx"),
  start_date = "01/11/2023",
  end_date= "07/11/2023"
  )

# cetesb_retrieve_param -> usuario define os parametros baixar
# cetesb_retrieve_pol -> baixa todos os poluentes da estação
# cetesb_retrieve_met -> baixa todos os dados meteologicos
# cetesb_retrieve_met_pol -> baixa tudo!

# Metodologia
user <- "XXXXXXXX"
pass <- "XXXXXXXXX"
start <- "01/11/2023" # dia/mes/ano
end <- "07/11/2023"
pol <- c("O3", "MP2.5") # cetesb_param
aqs_code <- 72 # cetesb_aqs Parque D Pedro

# cetesb_retrieve_param
pdp <- cetesb_retrieve_param(
  username = user,
  password = pass,
  parameters = pol,
  aqs_code = aqs_code,
  start_date = start,
  end_date = end
)

# todos os poluentes
# cetesb_retrieve_pol
pdp_pol <- cetesb_retrieve_pol(
  username = user,
  password = pass,
  aqs_code = 72,
  start_date = start,
  end_date = end
)

# todos os dados meteorologicos
pdp_met <- cetesb_retrieve_met(
  username = user,
  password = pass,
  aqs_code = 72,
  start_date = start,
  end_date = end
)

# todos os dados
pdp_all <- cetesb_retrieve_met_pol(
  username = user,
  password = pass,
  aqs_code = 72,
  start_date = start,
  end_date = end, 
  to_csv = T
)

library(geobr)

sp <- read_municipality(
  code_muni = 3550308,
  year = 2020
)

plot(sp$geom, axes = T)

sp_school <- read_schools(year=2020)
sp_escolas <- subset(
  sp_school,
  subset = name_muni == "São Paulo"
)

library(sf)
plot(sp$geom, axes = T)  
plot(st_geometry(sp_escolas),
     pch=19, col = "red", 
     add = T)

# https://github.com/quishqa/Curso_R_openair_FSP_USP_2025

