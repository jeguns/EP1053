library(readxl)
datosA = read_excel('PD6 - seleccion.xlsx', sheet = 1, skip = 3)
datosB = read_excel('PD6 - seleccion.xlsx', sheet = 2, skip = 3)
datosC = read_excel('PD6 - seleccion.xlsx', sheet = 3, skip = 3)
library(dplyr)
datosA |> inner_join(datosB, by = "DNI") -> datosAB
datosAB |> inner_join(datosC, by = "DNI") -> datosFINAL
datosFINAL |> 
  select(1,2,3,4,5,9,13) -> datosFINAL
datosFINAL |> 
  mutate(CAL_FIN = Calificacion.x + Calificacion.y + Calificacion) -> datosFINAL
datosFINAL |> 
  mutate(NOM = paste(Nombre, ApellidoP, ApellidoM)) |> 
  select(-Nombre, -ApellidoP, -ApellidoM) |> 
  rename(CV = 2, RRHH = 3, GERENCIA = 4, TOTAL = 5) -> datosFINAL
datosFINAL
library(tidyr)
datosFINAL |> pivot_longer(cols = c("CV","RRHH","GERENCIA","TOTAL"),
                           names_to = "EVAL",
                           values_to = "CALIF") -> datosFINAL
datosFINAL

library(writexl)
write_xlsx(datosFINAL, "CONSOLIDADO.xlsx")