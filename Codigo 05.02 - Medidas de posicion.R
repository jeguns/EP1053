library(magrittr)
library(dplyr)
library(modeest)

# ------------------- #
# MEDIDAS DE POSICIÓN #
# ------------------- #

# Ejercicio introductorio

x = c(12,11,12,13,12,12,13,12,12,11,12,12)
quantile(x, 0.25)
sort(x)

# Al menos el 25% de los alumnos tiene una edad menor o igual a 12 años

# Aplicación Multas

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

quantile(Multas$IMPORTE)

quantile(Multas$IMPORTE, 0.90, na.rm = T)

Multas %>% 
  summarise(P90 = quantile(IMPORTE,0.90,na.rm = T))

Multas %>% 
  filter(!is.na(IMPORTE)) %>% 
  summarise(P90 = quantile(IMPORTE,0.90))

Multas %>% 
  filter(!is.na(IMPORTE) & CODIGO == "L01") %>% 
  summarise(P35 = quantile(IMPORTE,0.35))

VacunasOK %>% 
  filter(!is.na(EDAD) & 
           GRUPO_RIESGO == "ADULTO MAYOR" & 
           DISTRITO == "MIRAFLORES" & 
           PROVINCIA=="LIMA") %>% 
  summarise(Q1 = quantile(EDAD,0.25),
            Q3 = quantile(EDAD,0.75))


