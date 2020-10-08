
library(dplyr)
library(PerformanceAnalytics)
library(ggplot2)
library(GGally)
library(forcats)

# Fecha_Hora 
# Nota -> Cuantitativa continua
# Desempeno -> Cuantitativa discreta
# Dificultad -> Cuantitativa discreta
# Inasistencias -> Cuantitativa discreta
# Ansiedad -> Cuantitativa discreta
# Participacion -> Cuantitativa discreta
# Adicional -> Cualitativa nominal dicotómica (Sí/No)
# Modalidad -> Cualitativa jerárquica
# Horario -> Cualitativa nominal dicotómica (Sí/No)
# Conexion -> Cuantitativa discreta
# Dispositivo -> Cualitativa nominal
# Distacciones -> Cualitativa nominal dicotómica (Sí/No)
# Sueno -> Cuantitativa discreta
# Deportes -> Cualitativa jerárquica
# Preparacion -> Cualitativa nominal dicotómica (Sí/No)
# Cursos -> Cuantitativa discreta
# Opcion -> Cualitativa nominal dicotómica (Sí/No)
# Carrera -> Cualitativa nominal dicotómica (Sí/No)

# ---------------- #
# LECTURA DE DATOS #
# ---------------- #

datos1 = read.csv("Datos 05.05 - A.csv", 
                  encoding  = "UTF-8",
                  col.names = c("Fecha_Hora", "Nota", "Desempeno", "Dificultad",
                                "Inasistencias", "Ansiedad", "Participacion", "Adicional",
                                "Modalidad", "Horario", "Conexion", "Dispositivo",
                                "Distracciones", "Sueno", "Deportes", "Preparacion",
                                "Cursos", "Opcion", "Carrera")) 

# ---------------- #
# PREPROCESAMIENTO #  
# ---------------- #

datos1 %>% str

cualis = c("Adicional", "Modalidad", "Horario", "Dispositivo", "Distracciones", 
            "Deportes", "Preparacion", "Opcion", "Carrera")

datos1 = datos1 %>% 
  select(-Fecha_Hora) %>% 
  mutate_at(cualis,as.factor) 

datos1 %>% select(Nota, Desempeno, Dificultad, Inasistencias, Ansiedad, Conexion, Sueno, Cursos) %>% summary()

datos1 %>% select(Participacion) %>% table()
datos1 %>% select(Adicional) %>% table()
datos1 %>% select(Modalidad) %>% table()     # Reordenar categorías
datos1 %>% select(Horario) %>% table()
datos1 %>% select(Dispositivo) %>% table()   # Unir categorías
datos1 %>% select(Distracciones) %>% table() # Variable no informativa
datos1 %>% select(Deportes) %>% table()      # Reordenar categorías
datos1 %>% select(Preparacion) %>% table()   # Variable no informativa
datos1 %>% select(Opcion) %>% table()
datos1 %>% select(Carrera) %>% table()       # Recodificar

datos1 = datos1 %>% 
  select(-Preparacion,-Distracciones) %>% 
  mutate(Modalidad   = factor(Modalidad, levels = c("Individual", "En pares", "Grupal (3 a más personas)"))) %>%
  mutate(Dispositivo = fct_collapse(Dispositivo, Otros = c("Tablet","Teléfono"))) %>% 
  mutate(Deportes    = factor(Deportes, levels = c("Nunca","Una o dos veces por semana","Interdiario","Diariamente"))) %>% 
  mutate(Carrera     = ifelse(Carrera %in% c("no","No","No, me gusta la carrera que elegí ."),"No",
                               ifelse(Carrera %in% c("si","sí","Si","Sí","SI","SÍ"),"Si",""))) 

datos1 %>% View

# --------------------- #
# ANÁLISIS EXPLORATORIO #
# --------------------- #

chart.Correlation(datos1[,-c(7,8,9,11,13,15,16)])
ggpairs(datos1)

boxplot(Nota ~ Adicional)
attach(datos1)
boxplot(Nota ~ Adicional)
boxplot(Nota ~ Modalidad)
boxplot(Nota ~ Horario) # sin diferencias 
boxplot(Nota ~ Dispositivo)
boxplot(Nota ~ Deportes)
boxplot(Nota ~ Opcion)
boxplot(Nota ~ Carrera) # sin diferencias?

# ------------ #
# MODELAMIENTO #
# ------------ #

modelo1 = lm(formula = Nota ~ Desempeno + Ansiedad + Adicional + Modalidad + Dispositivo + Sueno + Deportes,
             data    = datos1)
summary(aov(modelo1))
summary(modelo1)

modelo2 = lm(Nota ~ Desempeno + Ansiedad + Modalidad + Dispositivo + Deportes, data = datos1)
summary(aov(modelo2))
summary(modelo2)
datos1 %>% select(Nota,Desempeno,Ansiedad,Modalidad,Dispositivo,Deportes) %>% ggpairs

modelo3 = lm(Nota ~ Desempeno + Ansiedad + Dispositivo + Deportes, data = datos1)
summary(aov(modelo3))
summary(modelo3)
datos1 %>% select(Nota,Desempeno,Ansiedad,Dispositivo,Deportes) %>% ggpairs()


modelo4 = lm(Nota ~ Desempeno + Ansiedad, data = datos1)
summary(aov(modelo4))
summary(modelo4)
datos1 %>% select(Nota,Desempeno,Ansiedad) %>% ggpairs()

nuevo = data.frame(Desempeno = c(5,5,2,2),
                   Ansiedad  = c(5,2,5,2))
modelo4 %>% predict(nuevo)

