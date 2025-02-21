dado

# Média das 00 - 23
day <- timeAverage(dado, avg.time = "day")

# O problema: eu preciso a média das 14 h - 13h do
# dia seguinte
# e sem considerar domingo (ainda não)!
v <- c(1, 2,3, 4, 5)
v[3:5]

# tiramos as primeiras horas para
# coemçar desde as 14:00
dado_2pm <- dado[14: nrow(dado), ]
names(dado_2pm)[1] <- "date_original"


# criar uma coluna date que comece as 00:00
dado_2pm$date <- seq(
  as.POSIXct("2023-01-01 00:00"),
  by = "hour",
  length.out = nrow(dado_2pm)
)

day_mean_2pm <- timeAverage(dado_2pm, avg.time = "day")
day_mean_2pm_weekday <- selectByDate(day_mean_2pm,
                                     day = "weekday") # seg - sex
day_mean_2pm_weekday <- selectByDate(day_mean_2pm,
                                     day = "weekend") # seg - 

# RollingMean8h
# Calcular a média
# Em pt: calcula a média movel do o3, cada 8h
o3_movel <- rollingMean(
  dado,
  pol = "o3", # poluente
  width = 8,  # 8 horas se os dados são horarios
  new.name = "roll_o3" # o resultado se chama roll_o3
)

# Depois eu quero a máxima por dia da variavel roll_o3
o3_mda <- timeAverage(o3_movel,
                      pol = "roll_o3",
                      statistic = "max",
                      avg.time = "day")
timePlot(o3_mda, pol = "roll_o3")
