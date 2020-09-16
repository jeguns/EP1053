library(magrittr)
library(dplyr)
library(modeest)

# ------------------- #
# MEDIDAS DE POSICIÓN #
# ------------------- #

# Ejercicio introductorio

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
quantile(x, 0.25)
sort(x)

# Aplicación SUNEDU

SUNEDU = read.csv("Licenciamiento Institucional_6.csv", sep = "|")

SUNEDU %>% 
  summarise(P90 = quantile(PERIODO_LICENCIAMIENTO,0.90))

SUNEDU %>% 
  summarise(P35 = quantile(LATITUD_UBICACION,0.35))

SUNEDU %>% 
  filter(DEPARTAMENTO_LOCAL == "LA LIBERTAD") %>% 
  summarise(P25 = quantile(PERIODO_LICENCIAMIENTO,0.25),
            P75 = quantile(PERIODO_LICENCIAMIENTO,0.75))
