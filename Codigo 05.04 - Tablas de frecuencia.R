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
  rename(f = 2) %>% 
  mutate(porc = f/sum(f)*100)


# Variables cuantitativas continuas, o discretas con muchos valores -------

Multas %>% 
  filter(CODIGO=="G14") %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  #as.vector() %>% 
  fdt(breaks="Sturges") %>% 
  print()

Multas %>% 
  filter(CODIGO=="G14") %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  fdt(start=340,end=22755,h=3000,right=FALSE) %>% 
  print()



