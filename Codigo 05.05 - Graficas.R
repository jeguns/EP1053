
# Carga de paquetes -------------------------------------------------------

library(magrittr)
library(dplyr)
library(fdth) # ← para tablas de frecuencias
library(modeest)
library(sjstats)
library(readr)
library(lubridate)
library(forcats)

# Lectura y preprocesamiento ----------------------------------------------

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

# Gráficas para variables cualitativas ------------------------------------

options(scipen = 999)

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  barplot()

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  barplot(col=c("peachpuff"))

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  barplot(col  = c("forestgreen","gold","red"),
          main = "Distribución de infracciones por gravedad",
          cex.axis = 0.75)

Multas %>% 
  select(GRAVEDAD) %>% 
  table() -> Tabla
Tabla %>% 
  barplot(col  = c("forestgreen","gold","red"),
          main = "Distribución de infracciones por gravedad",
          cex.axis = 0.75) -> Grafico
Grafico %>% text(y=Tabla-250,labels = as.character(Tabla))

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  pie()

pie(table(Multas$GRAVEDAD))

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  pie(col  = c("forestgreen","gold","red"),
      main = "Distribución de infracciones por gravedad")

library(waffle)

Multas %>% 
  group_by(FORMATO) %>% 
  count() %>% 
  mutate(n=round(n/100),0) |> 
  pull(n) |> 
  waffle(rows = 5)

# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf


# Gráficas para variables cuantitativas --------------------------------------------

Multas %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist()

Multas %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist(col  = "dodgerblue3",
       #freq = FALSE,
       main = "Distribución de importes por infracciones",
       xlab = "Importe",
       ylab = "Frecuencia")

Multas %>% 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist(col  = "dodgerblue3",
       freq = FALSE,
       main = "Distribución de importes por infracciones",
       xlab = "Importe",
       ylab = "Frecuencia")

Multas %>% 
  filter(CODIGO == "G56") |> 
  select(IMPORTE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist(col  = "dodgerblue3",
       #freq = FALSE,
       main = "Distribución de importes por infracciones (código G56)",
       xlab = "Importe",
       ylab = "Frecuencia")


Multas %>% 
  filter(CODIGO == "G01") |> 
  select(IMPORTE) %>% 
  boxplot()

boxplot(Multas$IMPORTE)

Multas %>% 
  select(IMPORTE) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución del importe de las infracciones",
          ylab = "Edad")

Multas %>% 
  filter(CODIGO == "G01") |> 
  select(IMPORTE) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución del importe de las infracciones por código G01",
          ylab = "Edad")

Multas %>% 
  filter(CODIGO == "G01") |> 
  pull(IMPORTE) %>% 
  quantile()

Multas %>% 
  select(REINCIDENCIA) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución del importe de las infracciones",
          ylab = "Edad")

Multas %>% 
  pull(REINCIDENCIA) %>% 
  quantile()

Multas %>% 
  filter(CODIGO == "G01") |> 
  select(IMPORTE) %>% 
  filter(!is.na(IMPORTE)) %>% 
  pull() |> 
  density() %>% 
  plot(main = "Distribución del importe de las infracciones",
       xlab = "Edad",
       ylab = "Densidad")


