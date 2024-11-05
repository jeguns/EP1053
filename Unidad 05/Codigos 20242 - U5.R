
# Lectura de datos --------------------------------------------------------

library(readxl)
datos <- read_excel('OXFAM_IEP_ENADES_2024.xlsx', na = c('99','99999'))

# Preprocesamiento --------------------------------------------------------

library(dplyr)
datos |> 
  mutate(sexo = case_when(sexo == 1 ~ "Hombre",
                          sexo == 2 ~ "Mujer",
                          sexo == 3 ~ "Otro"),
         region = case_when(region == 1 ~ "Costa",
                            region == 2 ~ "Sierra",
                            region == 3 ~ "Selva"),
         ur = case_when(ur == 1 ~ "Urbana",
                        ur == 2 ~ "Rural"),
         edu = case_when(edu %in% 1:2 ~ "Sin educación",
                         edu %in% 3:4 ~ "Primaria",
                         edu %in% c(5,6,8) ~ "Secundaria",
                         edu %in% c(7,9,10) ~ "Superior"),
         edu = factor(edu, levels = c("Sin educación","Primaria",
                                      "Secundaria","Superior")),
         edu2 = ifelse(edu2 == 1, "E. Básica","E. Superior"),
         edupadre = case_when(edupadre %in% 1:2 ~ "Sin educación",
                              edupadre %in% 3:4 ~ "Primaria",
                              edupadre %in% c(5,6,8) ~ "Secundaria",
                              edupadre %in% c(7,9,10) ~ "Superior" ),
         ocupa = case_when(ocupa == 1 ~ "Solo trabaja",
                           ocupa == 2 ~ "Solo estudia",
                           ocupa == 3 ~ "Trabaja y estudia",
                           ocupa == 4 ~ "Está jubilado(a)",
                           ocupa == 5 ~ "Está desempleado(a)",
                           ocupa == 6 ~ "Solo se dedica a tareas del hogar",
                           ocupa == 7 ~ "Ni estudia ni trabaja ni se dedica a labores del hogar",
                           ocupa == 8 ~ "Trabaja y hace las tareas del hogar"),
         P07 = case_when(P07 == 4 ~ "Mucho",
                         P07 == 3 ~ "Algo",
                         P07 == 2 ~ "Poco",
                         P07 == 1 ~ "Nada"),
         P08 = case_when(P08 == 1 ~ "Ha aumentado",
                         P08 == 2 ~ "Se mantiene igual",
                         P08 == 3 ~ "Ha disminuido"),
         P16 = case_when(P16 == 1 ~ "Les alcanza bien y pueden ahorrar",
                         P16 == 2 ~ "Les alcanza justo sin grandes dificultades",
                         P16 == 3 ~ "No les alcanza y tienen dificultades",
                         P16 == 4 ~ "No les alcanza y tienen grandes dificultades"),
         P26 = case_when(P26 == 1 ~ "Muy desigual",
                         P26 == 2 ~ "Algo desigual",
                         P26 == 3 ~ "Poco desigual",
                         P26 == 4 ~ "Nada desigual"),
         P27 = case_when(P27 == 1 ~ "Está gobernado por unos cuantos grupos poderosos en su propio beneficio",
                         P27 == 2 ~ "Está gobernado para el bien de todo el pueblo")) -> datos1

# Medidas de tendencia central --------------------------------------------

datos1 |> pull(edad) |> mean()
datos1 |> summarise(mean(edad))

datos1 |> 
  group_by(edu2) |> 
  summarise(Media = mean(edad))

datos1 |> 
  group_by(edu2) |> 
  summarise(Media = mean(edad))

datos1 |> 
  group_by(edu) |> 
  summarise(Media = mean(edad))

datos1 |> pull(edad) |> median()

datos1 |> summarise(median(edad))

datos1 |> 
  filter(P26 == "Nada desigual") |> 
  summarise(Mediana = median(edad))

datos1 |> 
  group_by(edu) |> 
  summarise(Mediana = median(edad))

library(modeest)
datos1 |> pull(edad) |> mfv()

datos1 |> summarise(Moda = mfv(edad))

datos1 |> summarise(Moda = mfv(ocupa))

datos1 |> 
  group_by(ur) |> 
  reframe(Moda = mfv(hogar)) 
  
datos1 |> 
  group_by(P05) |> 
  reframe(Media = mean(edad),
            Mediana = median(edad),
            Moda = mfv(edad)) |> 
  filter(!is.na(P05)) 


# Medidas de posición -----------------------------------------------------

datos1 |> pull(edad) |> quantile()

datos1 |> pull(hogar) |> quantile(probs = c(0.33), na.rm = TRUE)
datos1 |> summarise(Perc33 = quantile(hogar, 0.33, na.rm = TRUE))

datos1 |> pull(P15) |> quantile(probs = c(0.89), na.rm = TRUE)
datos1 |> summarise(Perc89 = quantile(P15, 0.89, na.rm = TRUE))

datos1 |> 
  filter(sexo == "Mujer" & P07 == "Mucho") |>  
  reframe(Perc = quantile(edad, c(0.15, 0.62, 0.94)))

datos1 |> 
  filter(sexo == "Mujer") |> 
  summarise(P19 = quantile(edad, 0.19))

datos1 |> 
  filter(sexo == "Hombre") |> 
  group_by(ur) |> 
  summarise(P92 = quantile(edad, 0.92))

datos1 |> 
  group_by(edu2) |> 
  reframe(Valores = quantile(edad, c(0.10,0.90))) |> 
  mutate(Perc = rep(c(0.10,0.90)*100,2)) 

datos1 |> 
  reframe(quantile(hogar,na.rm = TRUE))

datos1 |> 
  group_by(edupadre) |> 
  summarise(quantile(hogar,0.90, na.rm = TRUE)) |> 
  filter(!is.na(edupadre))

# Medidas de dispersión ---------------------------------------------------

library(ggQC)
datos1 |> pull(edad) |> QCrange()
datos1 |> summarise(Rango = QCrange(edad))

datos1 |> summarise(Rango = QCrange(edad), .by = sexo)

datos1 |> pull(edad) |> IQR()
datos1 |> summarise(RIC = IQR(edad))

datos1 |> 
  group_by(P08) |> 
  summarise(RIC = IQR(edad)) |> 
  filter(!is.na(P08))

datos1 |> pull(edad) |> var()

datos1 |> pull(hogar) |> var(na.rm = TRUE)

datos1 |> 
  filter(P16 == "Les alcanza bien y pueden ahorrar") |> 
  summarise(desv = sd(edad))

datos1 |> 
  group_by(P27) |>  
  summarise(desv = sd(P15, na.rm = TRUE)) |> 
  filter(!is.na(P27))

library(sjstats)
datos1 |> pull(edad) |> cv()*100
datos1 |> summarize(coef_var = cv(edad)*100)

datos1 |> group_by(sexo) |> summarize(cv = cv(edad)*100)

datos1 |> group_by(region) |> summarize(cv = cv(edad)*100)

# Tablas ------------------------------------------------------------------

datos1 |> count(sexo) |> mutate(porc = n/sum(n)*100)

library(tidyr)
datos1 |> count(sexo,ocupa) |> filter(!is.na(ocupa))
datos1 |> count(sexo,ocupa) |> filter(!is.na(ocupa)) |> spread(sexo,n, fill=0)

datos1 |> 
  count(sexo,ocupa)  |> 
  filter(!is.na(ocupa)) |>
  group_by(ocupa) |> 
  mutate(prop = n / sum(n)*100) |> 
  select(-n) |> 
  spread(sexo, prop, fill = 0)

datos1 |> 
  count(sexo,ocupa)  |> 
  filter(!is.na(ocupa)) |>
  group_by(sexo) |> 
  mutate(prop = n / sum(n)*100) |> 
  select(-n) |> 
  spread(sexo, prop, fill = 0)

datos1 |> 
  filter(!is.na(hogar)) |> 
  count(hogar) |> 
  mutate(porc = n/sum(n)*100)

library(DescTools)
datos |> pull(hogar) |> Freq()
datos |> pull(edad) |> Freq()
datos |> pull(edad) |> Freq(breaks = seq(10,100,20))

# Gráficos ----------------------------------------------------------------

## Variable cualitativa -------------------------------------------------

datos1 |> 
  pull(sexo) |> 
  table() |>
  barplot(main = "Distribución de encuestados por sexo",
          xlab = "Sexo",
          ylab = "Frecuencia",
          col = "darkblue")

datos1 |> 
  pull(region) |> 
  table() |>
  barplot(main = "Distribución de encuestados por región de residencia",
          xlab = "Región",
          ylab = "Frecuencia",
          col = c("darkblue","forestgreen","gold"))

datos1 |> 
  pull(region) |> 
  table() |>
  pie(main = "Distribución de encuestados por región de residencia",
      col = c("darkblue","forestgreen","gold"))

datos1 |>
  count(region) |>
  mutate(PORC = round(100*n/sum(n))) -> tabla
tabla |> pull(PORC,region) -> partes
library(waffle)
waffle(partes, title = "Distribución de encuestados por región de residencia",
       rows = 10, colors = c("darkblue","forestgreen","gold"))

## Variable cuantitativa -------------------------------------------------

datos |> 
  pull(edad) |>
  hist(main = "Distribución de encuestados por edad",
       xlab = "Edad", ylab = "Frecuencia (número de encuestados)",
       col = "gold")


datos |> 
  pull(P15) |>
  hist(main = "Distribución de encuestados por monto mínimo para vivir en el hogar",
       xlab = "Monto mínimo mensual que requiere su hogar para vivir",
       ylab = "Frecuencia (número de encuestados)",
       col = "gold",
       breaks = seq(0,40000,2000))

datos |> 
  pull(edad) |>
  boxplot(main = "Distribución de encuestados por edad",
          ylab = "Edad",
          col = "gold")
          
datos |> 
  pull(P15) |>
  boxplot(main = "Distribución de encuestados por monto mínimo para vivir en el hogar",
          ylab = "Monto mínimo",
          col = "gold")
