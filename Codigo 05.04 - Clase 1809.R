library(magrittr) # %>% 
library(dplyr)    # select, filter, mutate, summarise
library(modeest)  # mfv (most frequent value)

# Ejercicio introductorio
# Se registran las siguientes variables para un grupo de 12 alumnos de 1ero de secundaria
# X = Edad (años cumplidos) → cuantitativa discreta
# Y = Tipo de sangre → cualitativa nominal
# Z = Número de hermanos → cuantitativa discreta

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
y = c("O+","O+","A","O+","AB","O+","A","O+","O+","B","A","O-")
z = c(0,0,1,1,2,2,1,2,1,0,3,2)
D = data.frame(x,y,z)

mean(x);mean(y);mean(z) # promedio
median(x);median(y);median(z) # mediana
sort(x)
# POR LO MENOS la mitad (el 50%) de las edades es menor o igual a 12
sort(z)
# Al menos la mitad de los alumnos tiene uno o menos hermanos
mfv(x);mfv(y);mfv(z)

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
  summarise(Media = mean(PERIODO_LICENCIAMIENTO))

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

# Halle e interprete la mediana del periodo de licenciamiento de las
# universidades privadas licenciadas fuera de Lima.
SUNEDU %>% 
  filter(ESTADO_LICENCIAMIENTO == "LICENCIA OTORGADA") %>% 
  filter(DEPARTAMENTO_LOCAL != "LIMA") %>% 
  filter(TIPO_GESTION == "PRIVADO") %>% 
  summarise(mediana.NOlima = median(PERIODO_LICENCIAMIENTO))
  
SUNEDU %>% 
  summarise(moda = mfv(PERIODO_LICENCIAMIENTO))

SUNEDU %>% 
  filter(ESTADO_LICENCIAMIENTO == "LICENCIA DENEGADA") %>% 
  summarise(moda = mfv(DEPARTAMENTO_LOCAL))

SUNEDU %>% 
  filter(DEPARTAMENTO_LOCAL == "AREQUIPA") %>% 
  summarise(moda = mfv(TIPO_GESTION))

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
quantile(x, 0.25)
quantile(x, 0.44)
sort(x)
# Al menos el 25% de las edades es menor o igual a 12
# Al menos el 44% de las edades es menor o igual a 12
quantile(x, 0.05)
# Al menos el 5% de las edades es menor o igual a 11

# Menos del 95% de las edades es mayor a 11

SUNEDU %>% 
  summarise(P90 = quantile(PERIODO_LICENCIAMIENTO,0.90))

SUNEDU %>% 
  summarise(P35 = quantile(LATITUD_UBICACION,0.35))


SUNEDU %>% 
  filter(DEPARTAMENTO_LOCAL == "LA LIBERTAD") %>% 
  summarise(P25 = quantile(PERIODO_LICENCIAMIENTO,0.25),
            P75 = quantile(PERIODO_LICENCIAMIENTO,0.75),
            MEDIA = mean(PERIODO_LICENCIAMIENTO)) -> resumen

resumen
