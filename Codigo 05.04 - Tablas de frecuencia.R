library(magrittr)
library(dplyr)
library(fdth) # ← para tablas de frecuencias
library(modeest)
library(sjstats)
library(readr)
library(lubridate)
library(forcats)

# -------------------- #
# TABLAS DE FRECUENCIA #
# -------------------- #

Vacunas = read_csv("vacunas_covid_2021-03-21.csv")

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

# Variables cualitativas, o cuantitativas discretas -----------------------

VacunasOK %>% 
  select(DOSIS) %>% 
  table()

table(VacunasOK$DOSIS)

VacunasOK %>% 
  select(DOSIS) %>% 
  table() %>% 
  prop.table()

VacunasOK %>% 
  count(DOSIS) %>% 
  rename(f = 2) %>% 
  mutate(porc = f/sum(f)*100)

VacunasOK %>% 
  count(SEXO) %>% 
  rename(f = 2) %>% 
  mutate(porc = f/sum(f)*100)

# Variables cuantitativas continuas, o discretas con muchos valores -------

VacunasOK %>% 
  filter(DISTRITO=="LINCE") %>% 
  select(EDAD) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  fdt(breaks="Sturges") %>% 
  print()

VacunasOK %>% 
  filter(DISTRITO=="LINCE") %>% 
  select(EDAD) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  fdt(start=18,end=78,h=10,right=FALSE) %>% 
  print()

