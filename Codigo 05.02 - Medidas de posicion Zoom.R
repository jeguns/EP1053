
# =================== #
# MEDIDAS DE POSICIÓN #
# =================== #

# Paquetes ----------------------------------------------------------------

library(readxl)
library(dplyr)
library(skimr)
library(modeest)


# Ejemplo introductorio ---------------------------------------------------

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
quantile(x)
quantile(x, 0.25)
quantile(x, c(0.25,0.46))
sort(x)


# Aplicación --------------------------------------------------------------

datos = read_xlsx('Datos 05 - 2022.xlsx')

datos |> 
  rename(DURACION = 1,
         INVITADO = 2,
         ESPERA = 3) -> datos

datos$DURACION |> quantile(probs = 0.90)

datos |> pull(DURACION) |> quantile(probs = 0.90)

datos |> 
  filter(INVITADO == "Sí") |> 
  pull(DURACION) |> 
  quantile(probs = 0.35)

datos |> 
  filter(INVITADO == "Sí") |> 
  summarise(quantile(DURACION,0.35))

datos |> 
  filter(INVITADO == "Sí") |> 
  summarise(P35 = quantile(DURACION,0.35))

datos |> 
  filter(INVITADO == "No") |> 
  summarise(Cuartiles = quantile(DURACION, probs = c(0.25,0.50,0.75)))

datos |> 
  filter(ESPERA == "Sí") |> 
  summarise(Percentiles = quantile(DURACION, probs = c(0.20,0.82)))


