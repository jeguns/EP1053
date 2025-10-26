datos1 <- read.csv2('Matriculados Alumnos  Año 2025.csv') 
datos1 |> head(4)
datos2 <- read.csv2('Alumnos Matriculados 2025-II-UNALM.csv') 
datos2 |> head(4)
library(dplyr)

# 1a
datos1 |> inner_join(datos2, 
                     by = c("Facultad" = "FACULTAD", 
                            "Departamento" = "DEPARTAMENTO", 
                            "curso" = "CURSO")) -> datos_A

# 1b
datos1 |> left_join(datos2, 
                    by = c("Facultad" = "FACULTAD", 
                           "Departamento" = "DEPARTAMENTO", 
                           "curso" = "CURSO"))-> datos_B

# 1c
datos1 |> right_join(datos2, 
                     by = c("Facultad" = "FACULTAD",
                            "Departamento" = "DEPARTAMENTO", 
                            "curso" = "CURSO"))-> datos_C

# 1d
datos1 |> full_join(datos2, 
                    by = c("Facultad" = "FACULTAD", 
                           "Departamento" = "DEPARTAMENTO", 
                           "curso" = "CURSO"))-> datos_D

# 2a
datos_A |> 
  filter(Departamento == "Entomologia") |> 
  pull(curso)

# 2b
datos_C |> 
  filter(is.na(cantidad_matriculados) & NRO_MATRICULADOS < 50) |> 
  pull(curso)

# 2c
datos_B |> 
  filter(Facultad == "Pesqueria" & is.na(NRO_MATRICULADOS)) |> 
  pull(curso)

# 2d
datos_D |> 
  filter(Facultad == "Industrias Alimentarias" & 
           (is.na(cantidad_matriculados) | is.na(NRO_MATRICULADOS))) |> 
  pull(curso)

# 3a
datos_A |> 
  select(Facultad, Departamento, curso, 
         cantidad_matriculados, NRO_MATRICULADOS) |> 
  rename(Curso = 3,
         Matriculados1 = 4,
         Matriculados2 = 5) -> datos_ciclos

# 3b
library(tidyr)
datos_ciclos |> 
  filter(Facultad == "Pesqueria") |> 
  pivot_longer(cols = c("Matriculados1", "Matriculados2"), 
               names_to = "Ciclo", 
               values_to= "Alumnos") |> 
  mutate(Ciclo = ifelse(Ciclo == "Matriculados1", "2025-I", "2025-II")) 

