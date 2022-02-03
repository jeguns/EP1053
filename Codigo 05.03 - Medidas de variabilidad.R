library(magrittr)
library(dplyr)
library(modeest)
library(sjstats)
library(readr)
library(lubridate)
library(forcats)

# ----------------------- #
# MEDIDAS DE VARIABILIDAD #
# ----------------------- #

# Ejemplo introductorio

x = c(12,11,12,13,12,12,13,12,12,11,12,12) # edad
z = c(0,0,1,1,2,2,1,2,1,0,3,2) # número de hermanos

Rango = function(l){max(l)-min(l)} 
Rango(x);Rango(z)

IQR(x);IQR(z)
var(x);var(z)
sd(x);sd(z)
cv(x);cv(z) # desviación estándar/media
sd(x)/mean(x)

# Aplicación VACUNAS

Multas = read_xlsx("Datos 05.xlsx", range = "A3:I7906")

Multas |> 
  rename(CODIGO = 1,
         DESCRIPCION = 2,
         FORMATO = 3,
         GRAVEDAD = 4,
         AÑO = 5,
         MES = 6,
         CANTIDAD = 7,
         IMPORTE = 8,
         REINCIDENCIA = 9) |> 
  select(-AÑO) -> Multas

Multas %>% 
  filter(!is.na(REINCIDENCIA)) %>% 
  summarise(R = Rango(REINCIDENCIA)) 

Multas %>% 
  filter(!is.na(REINCIDENCIA)) %>% 
  summarise(RIC = IQR(REINCIDENCIA)) 

Multas %>% 
  filter(CODIGO=="M03") %>% 
  filter(!is.na(IMPORTE)) %>% 
  summarise(DESV = sd(IMPORTE)) -> DESVE.SINLICENCIA

Multas %>% 
  filter(CODIGO=="M17") %>% 
  filter(!is.na(IMPORTE)) %>% 
  summarise(DESV = sd(IMPORTE)) -> DESVE.SEMAFORO

Multas %>% 
  filter(CODIGO %in% c("M03","M17")) %>% 
  group_by(CODIGO) |> 
  filter(!is.na(IMPORTE)) %>% 
  summarise(DESV = sd(IMPORTE)) -> DESVE

Multas %>% 
  filter(!is.na(IMPORTE)) %>% 
  group_by(GRAVEDAD) %>% 
  summarise(CV = cv(IMPORTE)*100)





