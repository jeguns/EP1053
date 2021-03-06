library(readr) # lectura
library(magrittr) # pipe
library(dplyr) # transformación
library(lubridate) # tiempo - fechas
library(forcats) # factores
library(modeest) # moda
library(skimr) # descriptivo

# ---------------------------- #
# MEDIDAS DE TENDENCIA CENTRAL #
# ---------------------------- #

# Ejercicio introductorio
# Se registran las siguientes variables para un grupo 
# de 12 alumnos de 1ero de secundaria
# X = Edad (Numero de años cumplidos)
# Y = Tipo de sangre
# Z = Número de hermanos

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
x = c(11,11,12,12,12,12,12,12,12,12,13,13)
y = c("O+","O+","A","O+","AB","O+","A","O+","O+","B","A","O-")
z = c(0,0,1,1,2,2,1,2,1,0,3,2)
Z = c(0,0,0,1,1,1,1,2,2,2,2,3)
w = c("O+","O+","O-","O+","O-","O+","O-","O+","O+","O-","O-","O-")
v = c(1,2,3,5)
mean(x);mean(y);mean(z)
median(x);median(y);median(z)
mfv(x);mfv(y);mfv(z);mfv(w);mfv(v)
# La mediana es 1 ← NO ES UNA INTERPRETACIÓN
# Al menos la mitad de los alumnos tiene 12 o menos años.
# Al menos la mitad de los alumnos tiene 1 o ningún hermano.

# Aplicación VACUNAS

Vacunas = read.csv("vacunas_covid_2021-03-21.csv")
Vacunas %>% head()
Vacunas %>% tail()
Vacunas %>% nrow()
Vacunas %>% ncol()
Vacunas %>% colnames()
Vacunas %>% View()

Vacunas = read_csv("vacunas_covid_2021-03-21.csv")
Vacunas %>% head()
Vacunas %>% tail()
Vacunas %>% nrow()
Vacunas %>% ncol()
Vacunas %>% colnames()
Vacunas %>% View()

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

skim(VacunasOK)

mean(VacunasOK$EDAD)

mean(VacunasOK$EDAD, na.rm = TRUE)

VacunasOK$EDAD %>% 
  mean(na.rm = TRUE) # esta línea es equivalente a la que la precede

VacunasOK %>% 
  summarise(mean(EDAD,na.rm = TRUE))

VacunasOK %>% 
  summarise(MEDIA = mean(EDAD,na.rm = TRUE))

VacunasOK %>% 
  filter(DEPARTAMENTO == "AREQUIPA") %>% 
  summarise(MEDIA_AREQUIPA = mean(EDAD,na.rm = TRUE))

VacunasOK %>% 
  filter(DEPARTAMENTO == "AREQUIPA") %>% 
  summarise(MEDIANA_AREQUIPA = median(EDAD,na.rm = TRUE))

VacunasOK %>% 
  filter(DEPARTAMENTO == "AREQUIPA") %>% 
  summarise(MODA_AREQUIPA = mfv(EDAD,na_rm = TRUE))

VacunasOK %>% 
  filter(DEPARTAMENTO == "AREQUIPA") %>% 
  summarise(MODA_AREQUIPA2 = mfv(GRUPO_RIESGO,na_rm = TRUE))

VacunasOK %>% 
  filter(DEPARTAMENTO == "AREQUIPA") %>% 
  summarise(MEDIA_AREQUIPA = mean(EDAD,na.rm = TRUE),
            MEDIANA_AREQUIPA = median(EDAD,na.rm = TRUE),
            MODA_AREQUIPA = mfv(EDAD,na_rm = TRUE))

VacunasOK %>% 
  group_by(DEPARTAMENTO) %>% 
  summarise(MEDIA   = mean(EDAD,na.rm = TRUE),
            MEDIANA = median(EDAD,na.rm = TRUE),
            MODA    = mfv(EDAD,na_rm = TRUE)) -> Resultados
  
