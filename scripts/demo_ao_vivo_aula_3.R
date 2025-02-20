# qualR

library(qualR)
my_user_name <- "examplequalr@gmail.com"
my_password <- "06660666"
start_date <- "01/01/2023"
end_date <- "31/12/2024"

cetesb_aqs # estaçoes
cetesb_param #poluentes

dados <- cetesb_retrieve_param(my_user_name,
                               my_password,
                               c("O3", "MP2.5","VV", "DV"),
                               "Pinheiros",
                               start_date = "01/01/2023",
                               end_date = "31/12/2024")


#Instalando o pacote openair
install.packages("openair")
library(openair) #abrir o pacote


#transformando dados horários em diários

diario <- timeAverage(dados, avg.time = "day") #day, hour, year, week


semana <- timeAverage(dados, avg.time = "week") #day, hour, year, week


#Trocar valores de wd acima de 360 por NA
dados$wd <- replace(dados$wd, dados$wd > 360, NA)


#selecionar um período
periodo <- selectByDate(dados,
                        year = "2024",
                        month = 6:8, 
                        hour = 8:18)

#exportando os dados
write.csv(dados, "C:/Users/prof/horarios_pinheiros.csv", 
          row.names = FALSE)

#exportando os dados diarios
write.csv(diario,"C:/Users/prof/diario_pinheiros.csv", 
          row.names = FALSE )


#Funçao pacote Openair

#primeira função summaryPlot
summaryPlot(dados)

summaryPlot(dados,
            avg.time = "month",
            col.trend = "green", #muda a cor da linha
            col.mis = "yellow", #muda cor dos dados ausentes
            col.hist = "black",
            print.datacap = TRUE,
            period = "months")



#segunda função timePlot

timePlot(dados, 
         pollutant = c("o3","pm25"))

timePlot(selectByDate(dados, year = "2024", month = 6:8),
         pollutant = c("o3","pm25"),
         y.relation = "free", #muda a escala
         date.format = "%b-%Y", #muda o eixo x
         date.breaks = 5,
         avg.time = "day",
         ref.y = list(h = 15, lty = 5, col = "red"))

         
# terceira função calendarPlot

calendarPlot(selectByDate(dados,
                          year = 2024, month = 6:8),
             pollutant = "pm25",
             annotate = "value", #trocar o valor por conc
             statistic = "mean", 
             lim = 15, # dias com conc acima de 15
             cols = "Purples",
             col.lim = c("black", "orange"), #destaca os dias com > e < conc
             layout = c(3,1), #muda layout
             main = "Estação Pinheiros",
             key.footer = "PM2.5",
             font.lim = c(2,3))


#quarta função TimeVariation

timeVariation (dados,
               pollutant = "o3",
               group = "season",
               hemisphere = "southern",
               xlab = c("Hora", "Hora", "Mês", "Dia da semana"),
               ylab = "O3 (ug m-3)")

timeVariation (dados,
               pollutant = "o3",
               group = "month",
               hemisphere = "southern",
               xlab = c("Hora", "Hora", "Mês", "Dia da semana"),
               ylab = "O3 (ug m-3)")

o3 <- timeVariation(selectByDate(dados,
                           year = 2024, month = c(2,9)),
              pollutant = "o3",
              group = "month")

plot(o3, subset = "day.hour") #month, day, day.hour


#separando os periodos
tv <- splitByDate(dados, dates = "31/12/2023",
                  labels = c("Antes de 2024", "Após 2024"))

o3 <- timeVariation(tv, pollutant = "o3",
                    group = "split.by")

# quinta função windRose
windRose(dados,
         type = "year", #season, year, weekday
         layout = c(3,1),   #troca o layout
         paddle = FALSE,    # mudar o estilo do marcador
         key.position = "right", #muda a posição da escala
         key.header = "velocidade",
         angle.scale =  245)

# sexta função pollutionRose

pollutionRose(dados, pollutant = "o3")


# sétima função percentileRose

percentileRose(dados,
               pollutant = "o3",
               percentile = 75,
               method = "cpf",
               col = "darkgray",
               smooth = TRUE) #suaviza a figura

