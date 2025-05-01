
library(readxl)
library(dplyr)
library(lubridate)

# Valores perdidos --------------------------------------------------------

datos01 = read_xlsx('04 - DATOS - 01.xlsx')
datos01

is.na(datos01)
datos01 |> is.na()
datos01 %>% is.na

datos01 |> na.omit()

datos01 |> complete.cases()

library(mice)
datos01 |> md.pattern()

library(naniar)
datos01 |> gg_miss_upset()

# Selección de variables --------------------------------------------------

datos02 = read_xlsx('04 - DATOS - 02.xlsx')
datos02 |> select(CONGLOME,VIVIENDA,HOGAR,UBIGEO) -> datos03
datos02 |> select(3,4,5,6) -> datos04
identical(datos03,datos04)
datos02 |> select(-1,-2) -> datos05
datos02 |> select(FECENT) -> datos06
datos02 |> pull(FECENT) -> datos07
identical(datos06,datos07)

# Transformación de datos -------------------------------------------------

datos02 |> 
  mutate(CODIGO = paste0(CONGLOME,VIVIENDA,HOGAR)) -> datos08
datos08 |> 
  mutate(P104NUEVO = P104+1) -> datos09
datos08 |> 
  mutate(FECHA_ENC = ymd(FECENT)) -> datos10
datos08 |> 
  mutate(FECHA_ENC = ymd(FECENT),
         DIA       = day(FECHA_ENC),
         SEMANA    = week(FECHA_ENC)) -> datos11
datos08 |> 
  mutate(HABIT = ifelse(P104<4,"menos de 4","4 o más")) -> datos12
datos08 |> 
  mutate(HABIT2 = case_when(P104 == 1 ~ "monoambiente",
                            P104 %in% c(2, 3, 4) ~ "regular",
                            P104 > 4 ~ "grande")) -> datos13

# Renombramiento de variables ---------------------------------------------

datos08 |> 
  select(CODIGO,DOMINIO,P24A,P24B,P104,P107B1,P107D1) |> 
  rename(pared_tarrajeo = 1,
         pared_pintura  = 2,
         habitaciones   = 3,
         cred_casa      = 4,
         monto_cred     = 5) -> datos14

datos08 |> 
  select(CODIGO,DOMINIO,P24A,P24B,P104,P107B1,P107D1) |> 
  rename(pared_tarrajeo = P24A,
         pared_pintura  = P24B,
         habitaciones   = P104,
         cred_casa      = P107B1,
         monto_cred     = P107D1) -> datos14


# Filtro de datos ---------------------------------------------------------

datos14 |> filter(pared_tarrajeo == 3) -> datos15

datos14 |> 
  filter(pared_tarrajeo == 3,
         pared_pintura  == 3) -> datos16

datos14 |> 
  filter(pared_tarrajeo == 3) |> 
  filter(pared_pintura  == 3) -> datos17

datos14 |> 
  filter(pared_tarrajeo == 3 & 
           pared_pintura  == 3) -> datos18

datos14 |> 
  filter(pared_tarrajeo == 3 | 
           pared_pintura  == 3) -> datos19

datos14 |> 
  filter(DOMINIO == 8 & (pared_tarrajeo == 3 | pared_pintura  == 3)) -> datos20

datos14 |> 
  filter(DOMINIO %in% c(1,2,3)) -> datos21


# Ordenamiento de datos ---------------------------------------------------

datos21 |> 
  arrange(CODIGO)

datos21 |>  
  arrange(desc(CODIGO))

datos21 |> 
  arrange(habitaciones) 

datos21 |> 
  arrange(desc(habitaciones))

datos21 |> 
  arrange(-habitaciones) 

# Integración de datos ----------------------------------------------------

read_excel('04 - DATOS - 03.xlsx', sheet = 1) -> empleados
read_excel('04 - DATOS - 03.xlsx', sheet = 2) -> areas

empleados |> inner_join(areas)
empleados |> left_join(areas)
empleados |> right_join(areas)
empleados |> full_join(areas)

