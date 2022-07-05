
# ==================== #
# TABLAS DE FRECUENCIA #
# ==================== #

# Paquetes ----------------------------------------------------------------

library(readxl)
library(dplyr)
library(skimr)
library(modeest)
library(fdth) 

# Aplicación --------------------------------------------------------------

datos = read_xlsx('Datos 05 - 2022.xlsx')

datos |> 
  rename(DURACION = 1,
         INVITADO = 2,
         ESPERA = 3) -> datos

datos$INVITADO |> table() 
datos |> pull(INVITADO) |> table() 
datos |> select(INVITADO) |> table() 


datos$INVITADO |> table() |> prop.table()
datos |> pull(INVITADO) |> table() |> prop.table()
datos |> select(INVITADO) |> table() |> prop.table()

datos |> 
  count(INVITADO) |> 
  rename(f=2) |> 
  mutate(porc = f/sum(f)*100)

datos |> 
  count(DURACION) |> 
  rename(f=2) |> 
  mutate(porc = f/sum(f)*100) |> 
  print(n=42)

datos |> 
  pull(DURACION) |> 
  fdt(breaks="Sturges") |> 
  print()

datos |> 
  pull(DURACION) |> 
  fdt(start = 0, end = 120, h = 15) |> 
  print()

datos |> 
  pull(DURACION) |> 
  fdt(start = 0, end = 120, h = 15, right = TRUE) |> 
  print()


