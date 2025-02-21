
# continuação do pacote openair 20/02/25

#Abrindo arquivo .csv
dado <- read.csv("C:/Users/prof/horarios_pinheiros.csv",
                 header = TRUE)

#mudando de character para formato data

dado$date <- as.POSIXct(strptime(dado$date,
                                 format = "%Y-%m-%d %H:%M:%S"))


#ler o pacote 
library(openair)
# oitava função polarPlot

polarPlot(dado, pollutant = "o3")
polarPlot(dado, pollutant = "pm25",
          type = "season",
          hemisphere = "southern")

polarPlot(dado, pollutant = "pm25",
          type = "year")


# nona função polarAnnulus

polarAnnulus(dado, pollutant = "o3")
polarAnnulus(dado, pollutant = "pm25",
             exclude.missing = FALSE,
             type = c("month", "year"))


polarAnnulus(dado, pollutant = "o3",
             key.position = "left", # mudar posição
             key.footer = "O3") #inserir legenda

#decima função
scatterPlot(dado, x="o3", y="ws",
            linear = TRUE,
            type = "wd")


# decima primeira corPlot

corPlot(dado,
        pollutants = c("o3", "pm25"), #selecione as variaveis que quiser
        dendrogram = TRUE, #mostrar o dendrograma
        lower = TRUE) #deixa a informação na parte de baixo

corPlot(dado) #mostrara todas as suas variaveis
 