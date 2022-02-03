library(readxl) 
library(magrittr) 
library(dplyr) 
library(lubridate) 
library(forcats)
library(modeest) 
library(skimr) 

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
x = c(11,11,12,12,12,12,12,12,12,12,13,13) # x ordenado 
y = c("O+","O+","A","O+","AB","O+","A","O+","O+","B","A","O-")
z = c(0,0,1,1,2,2,1,2,1,0,3,2)
Z = c(0,0,0,1,1,1,1,2,2,2,2,3)
w = c("O+","O+","O-","O+","O-","O+","O-","O+","O+","O-","O-","O-")
v = c(1,2,3,5)
mean(x);mean(y);mean(z) # 
median(x);median(y);median(z)
# Def: 
mfv(x);mfv(y);mfv(z);mfv(w);mfv(v)
# 

# Aplicación MULTAS

Multas = read_xlsx("Datos 05.xlsx", range = "A3:I7906")
Multas %>% View()
Multas %>% head()
Multas %>% tail()
Multas %>% nrow()
Multas |> count()
Multas %>% ncol()
Multas %>% colnames()
Multas |> str()
Multas |> skim()

mean(Multas$`Cant. multas impuestas`)

mean(Multas$`Cant. multas impuestas`, na.rm = TRUE)

Multas$`Cant. multas impuestas`|> mean(na.rm = TRUE) #

Multas %>% 
  summarise(mean(`Cant. multas impuestas`,na.rm = TRUE))

Multas %>% 
  summarise(MEDIA = mean(`Cant. multas impuestas`,na.rm = TRUE))

Multas %>% 
  filter(`Código falta` == "M21") -> MultasEstacionar
mean(MultasEstacionar$`Cant. multas impuestas`)

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  summarise(MEDIA_ESTACIONAR = mean(`Cant. multas impuestas`,na.rm = TRUE))

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  summarise(MEDIANA_ESTACIONAR = median(`Cant. multas impuestas`,na.rm = TRUE))

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  summarise(MODA_ESTACIONAR = mfv(`Cant. multas impuestas`,na_rm = TRUE))

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  count(`Cant. multas impuestas`)

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  summarise(MODA_FORMATO_ESTACIONAR = mfv(`Tipo formato`,na_rm = TRUE))

Multas %>% 
  filter(`Código falta` == "M21") %>% 
  summarise(MEDIA_ESTACIONAR = mean(`Cant. multas impuestas`,na.rm = TRUE),
            MEDIANA_ESTACIONAR = median(`Cant. multas impuestas`,na.rm = TRUE),
            MODA_ESTACIONAR = mfv(`Cant. multas impuestas`,na_rm = TRUE))

Multas %>% 
  group_by(`Código falta`) %>% 
  summarise(MEDIA_ESTACIONAR = mean(`Cant. multas impuestas`,na.rm = TRUE),
            MEDIANA_ESTACIONAR = median(`Cant. multas impuestas`,na.rm = TRUE),
            MODA_ESTACIONAR = mfv(`Cant. multas impuestas`,na_rm = TRUE)) |> 
  head(10)

Multas %>% 
  group_by(`Código falta`) %>% 
  summarise(MEDIA_ESTACIONAR = mean(`Cant. multas impuestas`,na.rm = TRUE),
            MEDIANA_ESTACIONAR = median(`Cant. multas impuestas`,na.rm = TRUE),
            MODA_ESTACIONAR = mfv(`Cant. multas impuestas`,na_rm = TRUE)) |> 
  as.data.frame() |>  # ¿funciona convirtiendo a tibble?
  slice_sample(n=10)
