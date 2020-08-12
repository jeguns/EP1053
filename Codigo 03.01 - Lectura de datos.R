
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella

# Lectura de datos - Archivos txt

datos01 = read.table("Datos 03.01 - A.txt", header = TRUE)

datos02 = read.table("Datos 03.01 - B.txt", header = TRUE, skip = 2)

datos03 = read.table("Datos 03.01 - C.txt", 
                    header    = FALSE, 
                    col.names = c("Pruebas","Resultado positivo"))

datos04 = read.table("Datos 03.01 - D.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = "-")

datos05 = read.table("Datos 03.01 - E.txt", header = TRUE)
datos05 = read.table("Datos 03.01 - E.txt", header = TRUE, row.names = 1)

datos06 = read.table("Datos 03.01 - F.txt", header = TRUE, sep = "\t")
datos06 = read.delim("Datos 03.01 - F.txt", header = TRUE)

# Lectura de datos - Archivos csv

datos07 = read.table("Datos 03.01 - G.csv", header = TRUE, sep = ",")
datos07 = read.csv("Datos 03.01 - G.csv")

datos08 = read.table("Datos 03.01 - H.csv", header = TRUE, sep = ";")
datos08 = read.csv("Datos 03.01 - H.csv", sep = ";")
datos08 = read.csv2("Datos 03.01 - H.csv")

# Lectura de datos - Archivos xlsx

# Necesitamos instalar y cargar el paquete readxl

install.packages("readxl")
library(readxl) 

datos09 = read_xlsx("Datos 03.01 - I.xlsx")
datos09 = read_xls("Datos 03.01 - I.xlsx")
datos09 = read_excel("Datos 03.01 - I.xlsx")

datos10 = read_excel("Datos 03.01 - J.xlsx", 
                     sheet = "POSITIVIDAD_10082020",
                     range = "A1:D5")

datos11 = read_excel("Datos 03.01 - K.xls", 
                     sheet = "CASOS_10082020",
                     n_max = 2)

datos12 = read_excel("Datos 03.01 - L.xlsx", 
                     sheet = "CASOS_10082020",
                     skip  = 3,
                     col_names = c("País", "Región", "Moleculares", "Rápidas", "Positivos", "Fallecidos"))

