library(qualR)
library(keyring)

openair_data <- cetesb_retrieve_param(
  key_get("qualar_ex_usr"),
  key_get("qualar_ex_pass"),
  c("O3", "MP2.5", "VV", "DV"),
  "Pinheiros",
  "01/01/2023",
  "30/12/2024"
)

saveRDS(openair_data, file = "data/pin_example_23_24.rds")