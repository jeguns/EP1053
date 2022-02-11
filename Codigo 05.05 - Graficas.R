
# Carga de paquetes -------------------------------------------------------

library(magrittr)
library(dplyr)
library(fdth) # ← para tablas de frecuencias
library(modeest)
library(sjstats)
library(readr)
library(lubridate)
library(forcats)
library(readxl)

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
  barplot(col  = c("red","forestgreen","gold"),
          main = "Distribución de infracciones por gravedad",
          cex.axis = 0.75)

Multas %>% 
  select(GRAVEDAD) %>% 
  table() -> Tabla
Tabla %>% 
  barplot(col  = c("red","forestgreen","gold"),
          main = "Distribución de infracciones por gravedad",
          cex.axis = 0.75) -> Grafico
Grafico %>% text(y=Tabla-250, labels = as.character(Tabla))

pie(table(Multas$GRAVEDAD))

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  pie()

Multas %>% 
  select(GRAVEDAD) %>% 
  table() %>% 
  pie(col  = c("forestgreen","gold","red"),
      main = "Distribución de infracciones por gravedad")

library(waffle)

Multas %>% 
  count(FORMATO) %>% 
  mutate(n=round(n/100,0)) |> 
  pull(n) |> 
  waffle(rows = 5)

# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf


# Gráficas para variables cuantitativas --------------------------------------------

Multas %>% 
  pull(IMPORTE) %>% 
  hist()

Multas %>% 
  pull(IMPORTE) %>% 
  hist(col  = "dodgerblue3",
       #freq = FALSE,
       main = "Distribución de importes por infracciones",
       xlab = "Importe",
       ylab = "Frecuencia")

Multas %>% 
  pull(IMPORTE) %>% 
  hist(col  = "dodgerblue3",
       freq = FALSE, # densidad → probabilidades 
       main = "Distribución de importes por infracciones",
       xlab = "Importe",
       ylab = "Densidad")

Multas %>% 
  filter(CODIGO == "G56") |> 
  pull(IMPORTE) %>% 
  hist(col  = "dodgerblue3",
       #freq = FALSE,
       main = "Distribución de importes por infracciones (código G56)",
       xlab = "Importe",
       ylab = "Frecuencia")

boxplot(Multas$IMPORTE)

Multas %>% 
  filter(CODIGO == "G01") |> 
  select(IMPORTE) %>% 
  boxplot()

Multas %>% 
  filter(CODIGO == "G01") |> 
  select(IMPORTE) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución del importe de las infracciones por código G01",
          ylab = "Importe")

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
  filter(!is.na(IMPORTE))  |> 
  pull(IMPORTE) %>% 
  density() %>% 
  plot(main = "Distribución del importe de las infracciones de código G01",
       xlab = "Edad",
       ylab = "Densidad")

library(agricolae)
Multas %>% 
  filter(CODIGO == "G01") |> 
  filter(!is.na(IMPORTE))  |> 
  pull(IMPORTE) |> 
  graph.freq(plot=FALSE)  |> 
  ogive.freq(col="dodgerblue3",frame=FALSE,
             xlab="Importe", ylab="Frecuencia acumulada relativa", 
             main="Distribución del importe de las infracciones de código G01")
