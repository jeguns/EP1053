library(magrittr)
library(dplyr)
library(modeest)

# ----------------------- #
# MEDIDAS DE VARIABILIDAD #
# ----------------------- #

# Ejemplo introductorio

Rango = function(s){max(s)-min(s)}
Rango(x);Rango(z)

IQR(x);IQR(z)
var(x);var(z)
sd(x);sd(z)

# Aplicación BONOS

BONO = read.csv2("bono_Independiente_trabajaperu.csv")
BONO %>% View()

BONO = BONO %>% 
  select(DE_DEPARTAMENTO,PERSONAS_HOGAR,MONTO,BONO_COBRADO,ENTIDAD_COBRO,MEDIO_COBRO)

BONO %>% 
  summarise(R = Rango(PERSONAS_HOGAR))

BONO %>% 
  summarise(RIC = IQR(PERSONAS_HOGAR))

BONO %>% 
  filter(DE_DEPARTAMENTO=="CUSCO") %>% 
  summarise(DESV = sd(PERSONAS_HOGAR))

BONO %>% 
  filter(DE_DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(DESV = sd(PERSONAS_HOGAR))

BONO %>% 
  filter(DE_DEPARTAMENTO=="CUSCO") %>% 
  summarise(CV = sd(PERSONAS_HOGAR)/mean(PERSONAS_HOGAR)*100) 

BONO %>% 
  filter(DE_DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(DESV = sd(PERSONAS_HOGAR)/mean(PERSONAS_HOGAR)*100)
