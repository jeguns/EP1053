

# ======================= #
# MEDIDAS DE VARIABILIDAD #
# ======================= #


# Paquetes ----------------------------------------------------------------

library(readxl)
library(dplyr)
library(skimr)
library(modeest)
library(sjstats)

# Ejemplo introductorio ---------------------------------------------------

x = c(12,11,12,13,12,12,13,12,12,11,12,12) # edad
z = c(0,0,1,1,2,2,1,2,1,0,3,2) # número de hermanos

Rango = function(l){max(l)-min(l)} 
Rango(x);Rango(z)

IQR(x);IQR(z)
var(x);var(z)
sd(x);sd(z)
cv(x);cv(z) # desviación estándar/media
sd(x)/mean(x)


# Aplicación --------------------------------------------------------------

datos = read_xlsx('Datos 05 - 2022.xlsx')

datos |> 
  rename(DURACION = 1,
         INVITADO = 2,
         ESPERA = 3) -> datos

datos$DURACION |> Rango()
datos$DURACION |> IQR()

datos |> pull(DURACION) |> Rango()
datos |> pull(DURACION) |> IQR()

datos |> 
  summarise(R   = Rango(DURACION),
            RIC = IQR(DURACION))

datos |> 
  group_by(ESPERA) |> 
  summarise(DESV_ESTAND = sd(DURACION))

datos |> 
  group_by(INVITADO) |> 
  summarise(VARIABILIDAD = cv(DURACION))






