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

# Al menos el 25% de los alumnos tiene una edad menor o igual a 12 años

# Aplicación VACUNAS

Vacunas = read_csv("vacunas_septiembre.csv")

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
  summarise(P90 = quantile(EDAD,0.90,na.rm = T))

VacunasOK %>% 
  filter(!is.na(EDAD)) %>% 
  summarise(P90 = quantile(EDAD,0.90))

VacunasOK %>% 
  filter(!is.na(EDAD) & DIRESA=="CALLAO") %>% 
  summarise(P35 = quantile(EDAD,0.35))

VacunasOK %>% 
  filter(!is.na(EDAD) & GRUPO_RIESGO == "ADULTO MAYOR" & DISTRITO == "MIRAFLORES" & PROVINCIA=="LIMA") %>% 
  summarise(Q1 = quantile(EDAD,0.25),
            Q3 = quantile(EDAD,0.75))


