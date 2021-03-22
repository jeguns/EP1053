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

# Aplicación VACUNAS

Vacunas = read_csv("vacunas_covid_2021-03-16.csv")

Vacunas %>% 
  mutate(GRUPO_RIESGO     = GRUPO_RIESGO %>% as.factor,
         SEXO             = SEXO %>% as.factor,
         FABRICANTE       = FABRICANTE %>% as.factor,
         DIRESA           = DIRESA %>% as.factor,
         DEPARTAMENTO     = DEPARTAMENTO %>% as.factor,
         PROVINCIA        = PROVINCIA %>% as.factor,
         DISTRITO         = DISTRITO %>% as.factor,
         FECHA_CORTE      = FECHA_CORTE %>% ymd,
         FECHA_VACUNACION = FECHA_VACUNACION %>% ymd,
         DIASDESDE        = (today()-FECHA_VACUNACION) %>% as.numeric,
         DOSIS            = DOSIS %>%  as.factor %>% fct_recode(Primera="1",Segunda="2")) -> VacunasOK

VacunasOK %>% 
  filter(!is.na(EDAD)) %>% 
  summarise(R = Rango(EDAD)) 

VacunasOK %>% 
  filter(!is.na(EDAD)) %>% 
  summarise(RIC = IQR(EDAD)) 

VacunasOK %>% 
  filter(DEPARTAMENTO=="CUSCO") %>% 
  summarise(DESV = sd(EDAD,na.rm=TRUE)) -> DESVE.CUSCO

VacunasOK %>% 
  filter(DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(DESV = sd(EDAD,na.rm=TRUE)) -> DESVE.LAMB

VacunasOK %>% 
  filter(DEPARTAMENTO %in% c("CUSCO","LAMBAYEQUE")) %>% 
  group_by(DEPARTAMENTO) %>% 
  summarise(DESV = sd(EDAD,na.rm=T)) -> DESVE

VacunasOK %>% 
  filter(DEPARTAMENTO=="CUSCO") %>% 
  summarise(CV = cv(EDAD)*100) 

VacunasOK %>% 
  filter(DEPARTAMENTO=="LAMBAYEQUE") %>% 
  summarise(CV = cv(EDAD)*100)



