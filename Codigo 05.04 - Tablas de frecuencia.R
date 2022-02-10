library(magrittr)
library(dplyr)
library(fdth) # para tablas de frecuencias
library(modeest)
library(sjstats)
library(readr)
library(lubridate)
library(forcats)

# -------------------- #
# TABLAS DE FRECUENCIA #
# -------------------- #

Multas = read_xlsx("Datos 05.xlsx", range = "A3:I7906")

Multas |> 
  rename(CODIGO = 1,
         DESCRIPCION = 2,
         FORMATO = 3,
         GRAVEDAD = 4,
         AÑO = 5,
         MES = 6,
         CANTIDAD = 7,
         IMPORTE = 8,
         REINCIDENCIA = 9) |> 
  select(-AÑO) -> Multas


# Variables cualitativas, o cuantitativas discretas -----------------------

Multas %>% select(GRAVEDAD) %>% table()

table(Multas$GRAVEDAD)

Multas %>% select(GRAVEDAD) %>% table() |> prop.table()

Multas %>% 
  count(GRAVEDAD) %>% 
  rename(f = 2) %>% # frecuencia absoluta 
  mutate(prop = f/sum(f)) |> # frecuencia relativa
  mutate(porc = f/sum(f)*100) # frecuencia porcentual o porcentaje

data.frame(x=c(2,3,5,3,2,1,2,5,3,4,4)) |> 
  count(x)%>% 
  rename(f = 2) %>% # frecuencia absoluta 
  mutate(prop = f/sum(f)) |> # frecuencia relativa
  mutate(porc = f/sum(f)*100) # frecuencia porcentual o porcentaje

data.frame(x=c(2,3,5,3,2,1,2,5,3,4,4,7,8,1,12,15,16,17,20,15,12,11)) |> 
  count(x)%>% 
  rename(f = 2) %>% # frecuencia absoluta 
  mutate(prop = round(f/sum(f),2)) |> # frecuencia relativa
  mutate(porc = round(f/sum(f)*100,3)) # frecuencia porcentual o porcentaje
# ↑ esta tabla no sería de utilidad porque la variable cuantitativa
# discreta tiene muchos valores

# Variables cuantitativas continuas, o discretas con muchos valores -------

Multas %>% 
  filter(CODIGO=="G14") %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  fdt(breaks="Sturges") %>% 
  print()

Multas %>% 
  filter(CODIGO=="G14") %>% 
  pull(IMPORTE) %>% 
  fdt(breaks="Sturges") %>%  # utilizando la regla de Sturges
  print()

Multas %>% 
  filter(CODIGO=="G14") %>% 
  pull(IMPORTE) %>% 
  fdt(start=340,end=25000,h=3000,right=FALSE) %>% 
  print()



