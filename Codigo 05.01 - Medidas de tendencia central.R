library(magrittr)
library(dplyr)
library(modeest)

# ---------------------------- #
# MEDIDAS DE TENDENCIA CENTRAL #
# ---------------------------- #

# Ejercicio introductorio
# Se registran las siguientes variables para un grupo de 12 alumnos de 1ero de secundaria
# X = Edad
# Y = Tipo de sangre
# Z = Número de hermanos

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
y = c("O+","O+","A","O+","AB","O+","A","O+","O+","B","A","O-")
z = c(0,0,1,1,2,2,1,2,1,0,3,2)

mean(x);mean(y);mean(z)
median(x);median(y);median(z)
mfv(x);mfv(y);mfv(z)

# Aplicación SUNEDU

SUNEDU = read.csv("Licenciamiento Institucional_6.csv", sep = "|")
SUNEDU %>% head()
SUNEDU %>% tail()
SUNEDU %>% nrow()
SUNEDU %>% ncol()
SUNEDU %>% colnames()
SUNEDU %>% View()

SUNEDU %>% 
  summarise(mean(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  summarise(media = mean(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(TIPO_GESTION == "PRIVADO") %>% 
  summarise(media.privadas = mean(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(TIPO_GESTION == "PÚBLICO") %>% 
  summarise(media.publicas = mean(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(ESTADO_LICENCIAMIENTO == "LICENCIA OTORGADA") %>% 
  filter(DEPARTAMENTO_LOCAL == "LIMA") %>% 
  summarise(media.lima = mean(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(ESTADO_LICENCIAMIENTO == "LICENCIA OTORGADA") %>% 
  filter(DEPARTAMENTO_LOCAL != "LIMA") %>% 
  summarise(mediana.NOlima = median(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  summarise(moda = mfv(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(ESTADO_LICENCIAMIENTO == "LICENCIA DENEGADA") %>% 
  summarise(moda = mfv(DEPARTAMENTO_LOCAL, ))

SUNEDU %>% 
  filter(DEPARTAMENTO_LOCAL == "AREQUIPA") %>% 
  summarise(moda = mfv(TIPO_GESTION))


  
