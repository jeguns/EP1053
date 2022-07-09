
# ======== #
# GRÁFICAS #
# ======== #

# Paquetes ----------------------------------------------------------------

library(readxl)
library(dplyr)
library(skimr)
library(modeest)
library(fdth) 
library(waffle)

# Aplicación --------------------------------------------------------------

datos = read_xlsx('Datos 05 - 2022.xlsx')

datos |> 
  rename(DURACION = 1,
         INVITADO = 2,
         ESPERA = 3) -> datos

datos |>  
  select(INVITADO) |> 
  table() |> 
  barplot()

datos |>  
  pull(INVITADO) |> 
  table() |> 
  barplot(col = "peachpuff")

datos |>  
  pull(INVITADO) |> 
  table() |> 
  barplot(col  = c("red","gold"),
          main = "Distribución de usuarios invitados",
          cex.axis = 0.75)

datos |>  
  pull(INVITADO) |> 
  table() -> Tabla
Tabla %>% 
  barplot(col  = c("red","gold"),
          main = "Distribución de usuarios invitados",
          cex.axis = 0.75) -> Grafico
Grafico %>% text(y=Tabla*0.9,labels = as.character(Tabla))

datos |>  
  pull(INVITADO) |> 
  table() |> 
  pie()

datos |>  
  pull(INVITADO) |> 
  table() |> 
  pie(col  = c("red","gold"),
      main = "Distribución de usuarios invitados")

datos |>  
  pull(INVITADO) |> 
  table() |> 
  waffle(colors = c("red","green"))

datos |>
  pull(INVITADO) |>
  table() |>
  waffle(rows       = 8,
         colors     = c("darkseagreen4", "brown1"),
         title      = "Distribución de usuarios invitados",
         legend_pos = "bottom")

# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf


# Gráficas para variables cuantitativas --------------------------------------------

datos |>  pull(DURACION) |> hist()

datos |>  pull(DURACION) |> 
  hist(col  = "cornflowerblue",
       #freq = FALSE,
       main = "Distribución de la duración del tiempo de conexión",
       xlab = "Edad",
       ylab = "Frecuencia")

datos |>  pull(DURACION) |> 
  hist(col  = "lightseagreen",
       freq = FALSE,
       main = "Distribución de la duración del tiempo de conexión",
       xlab = "Edad",
       ylab = "Densidad")

datos %>% pull(DURACION) %>% boxplot()

boxplot(datos$DURACION)

datos |> 
  pull(DURACION) |> 
  boxplot(col  = "turquoise",
          main = "Distribución de la duración del tiempo de conexión",
          ylab = "Tiempo (minutos)")

datos |> 
 summarise(quantile(DURACION,probs=c(0.25,0.50,0.75)))

datos |> 
  pull(DURACION) |> 
  density() |> 
  plot(main = "Distribución de la duración del tiempo de conexión",
       xlab = "Duración",
       ylab = "Densidad")

datos |> 
  pull(DURACION) |> 
  fdt(start=0,end=120,h=10,right=FALSE) |> 
  plot(type = "cfp",
       col  = "darkblue",
       pch  = 18,
       xlab = "Duración",
       ylab = "Frecuencia acumulada",
       main = "Distribución acumulada de tiempos de duración")


# Adcional ----------------------------------------------------------------

datos |> 
  filter(DURACION == 15) # conectados 15 minutos 

datos |> 
  filter(DURACION > 20) # conectados más de 20 minutos

datos |> 
  filter(DURACION <= 18) # conectados hasta 18 minutos

datos |> 
  filter(DURACION >=30 & DURACION <= 60) # conectados desde 30 hasta 60 minutos

datos |> 
  filter(DURACION == 20 | DURACION == 30 | DURACION == 40)

datos |> 
  filter(DURACION %in% c(20,30,40))
