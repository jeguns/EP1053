library(magrittr)
library(dplyr)
library(modeest)
library(sjstats)

# ----------------------- #
# MEDIDAS DE VARIABILIDAD #
# ----------------------- #

# Ejemplo introductorio

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
z = c(0,0,1,1,2,2,1,2,1,0,3,2)

Rango = function(f){max(f)-min(f)}
Rango(x);Rango(z)

IQR(x);IQR(z)
var(x);var(z)
sd(x);sd(z)
cv(x);cv(z)

# Aplicación BONOS

BONO = read.csv2("bono_Independiente_trabajaperu.csv")
BONO %>% View()

BONO = BONO %>% 
  select(DE_DEPARTAMENTO,PERSONAS_HOGAR,MONTO,BONO_COBRADO,ENTIDAD_COBRO,MEDIO_COBRO)

BONO %>% 
  summarise(R = Rango(PERSONAS_HOGAR)) -> RANGO 

BONO %>% 
  summarise(RIC = IQR(PERSONAS_HOGAR)) -> RANGO.INTERCUARTIL

BONO %>% 
  filter(DE_DEPARTAMENTO=="CUSCO") %>% 
  summarise(DESV = sd(PERSONAS_HOGAR)) -> DESVE.CUSCO

BONO %>% 
  filter(DE_DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(DESV = sd(PERSONAS_HOGAR)) -> DESVE.LAMB

BONO %>% 
  filter(DE_DEPARTAMENTO %in% c("CUSCO","LAMBAYEQUE")) %>% 
  group_by(DE_DEPARTAMENTO) %>% 
  summarise(DESV = sd(PERSONAS_HOGAR)) -> DESVE

BONO %>% 
  filter(DE_DEPARTAMENTO=="CUSCO") %>% 
  summarise(CV = cv(PERSONAS_HOGAR)*100) 

BONO %>% 
  filter(DE_DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(CV = cv(PERSONAS_HOGAR)*100)
