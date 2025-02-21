# openair funciona porque tem uma coluna 
# chamada `date` e tem que ser de tipo 'POSIXct'
str(dado)

# quase todas as funçoes do open
# tem esta estrutura
# funcao_openair(nome_df, pol = nome_colunas, 
#                 avg.time =, type = "mes, weekday, season )

# data.tresh -> mudar a tolerância da média
# 0.75
day_mean <- timeAverage(dado, avg.time = "day")
day_mean <- timeAverage(dado, avg.time = "day",                         data.thresh = 0.9)
# avg.time = "2 day", "2 weeks", "2 month"

# CalendarPlot
calendarPlot(dado, pol = "o3", year = 2023,
             month = 9)
# Para começar a partir da segunda  feira
calendarPlot(dado, pol = "o3", year = 2023,
             month = 9, w.shift = 2)

# Rosas dos ventos
windRose(dado)
windRose(dado, angle = 45) # Meteorologicamente melhor

# A moral da historia: Don't trust the defaults!
# ?calendarPlot
# ?windRose

# Salvar usando o formato do R: rds
saveRDS(dado, file = "dado_em_rds.rds")
getwd() # Onde estou trabalhando!!!!
write.csv(dado, file = "dado_em_csv.csv")

dado_rds <- readRDS("dado_em_rds.rds")

# Segunda moral da historia: Usar rds!

# Salvar todas as variaveis
save.image("meu_curso_do_openair.rda")

load("meu_curso_do_openair.rda")
