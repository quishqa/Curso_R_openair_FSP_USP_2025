library(qualR)

# Data onda de calor 2023

hw_start_23 <- "01/11/2023"
hw_end_23 <- "30/11/2023"

# Data onda de calor 2024

hw_start_24 <- "01/08/2024"
hw_end_24 <- "31/10/2024"

# Parâmetros

pols <- c("O3", "NOx", "MP2.5", "CO", "TEMP")

pin_hw_23 <- cetesb_retrieve_param(
  Sys.getenv("QUALAR_USER"),
  Sys.getenv("QUALAR_PASS"),
  pols,
  "Pinheiros",
  hw_start_23,
  hw_end_23
  )


pin_hw_24 <- cetesb_retrieve_param(
  Sys.getenv("QUALAR_USER"),
  Sys.getenv("QUALAR_PASS"),
  pols,
  "Pinheiros",
  hw_start_24,
  hw_end_24
)

saveRDS(pin_hw_23, file = "data/hw_2023.rds")
saveRDS(pin_hw_24, file = "data/hw_2024.rds")
