
# ============================ #
# MEDIDAS DE TENDENCIA CENTRAL #
# ============================ #

# Paquetes ----------------------------------------------------------------

library(readxl)
library(dplyr)
library(skimr)
library(modeest)

# Ejemplo introductorio ---------------------------------------------------

# Se registran las siguientes variables para un grupo 
# de 12 alumnos de 1ero de secundaria
# X = Edad (Numero de años cumplidos)
# Y = Tipo de sangre
# Z = Número de hermanos

x = c(12,11,12,13,12,12,13,12,12,11,12,12) 
x = c(11,11,12,12,12,12,12,12,12,12,13,13) # x ordenado (no es necesario hacerlo)
y = c("O+","O+","A","O+","AB","O+","A","O+","O+","B","A","O-")
z = c(0,0,1,1,2,2,1,2,1,0,3,2)
Z = c(0,0,0,1,1,1,1,2,2,2,2,3) # z ordenado (no es necesario hacerlo)
mean(x);mean(y);mean(z) # la edad promedio es de 12 años, en promedio tienen 1.25 hermanos (aprox. 1)
median(x);median(y);median(z)
mfv(x);mfv(y);mfv(z)
w = c("O+","O+","O-","O+","O-","O+","O-","O+","O+","O-","O-","O-")
v = c(1,2,3,5)
mfv(w);mfv(v)
r = c(1,1,1,1,1,1,1,1,1,1)
mfv(r)

# Lectura de datos --------------------------------------------------------

datos = read_xlsx('Datos 05 - 2022.xlsx')

# Preprocesamiento de datos -----------------------------------------------

datos |> 
  rename(DURACION = 1,
         INVITADO = 2,
         ESPERA = 3) -> datos

datos |> View()
datos |> head()
datos |> glimpse()
datos |> tail()
datos |> nrow()
datos |> count()
datos |> nrow() |> str()
datos |> count() |> str()
datos |> ncol()
datos |> colnames()
datos |> str()
datos |> skim()

# Media -------------------------------------------------------------------

datos$DURACION |> mean()

datos |> pull(DURACION) |> mean()

datos |> 
  filter(INVITADO == "No") |> 
  pull(DURACION) |> 
  mean()

datos |> 
  filter(INVITADO == "No") |> 
  summarise(mean(DURACION))


datos |> 
  filter(INVITADO == "No") |> 
  summarise(Media_Host = mean(DURACION))

# Mediana -----------------------------------------------------------------

datos |> 
  filter(INVITADO == "Sí") |> 
  summarise(Mediana_Invitado = median(DURACION))

# Moda --------------------------------------------------------------------

datos |> 
  filter(ESPERA == "No") |> 
  summarise(Moda_NoEspera = mfv(DURACION))

datos |> 
  group_by(INVITADO) |> 
  summarise(Media = mean(DURACION),
            Mediana = median(DURACION),
            Moda = mfv(DURACION))



