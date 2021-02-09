
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella

# Lectura de datos - Archivos txt

datos01 = read.table("Datos 03.01 - A.txt", header=TRUE)
datos01
View(datos01)
head(datos01) 

datos02 = read.table("Datos 03.01 - B.txt", header = TRUE) # ERROR

datos02 = read.table("Datos 03.01 - B.txt", header = TRUE, skip = 3)
head(datos02)

datos03 = read.table("Datos 03.01 - C.txt", 
                     header    = FALSE, 
                     col.names = c("Pruebas","Resultado positivo"),
                     na.strings = "*")

datos04 = read.table("Datos 03.01 - D.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = "-")
datos04[6,] # 6ta fila
datos04[,2] # 2da columna
datos04[6,2] # dato de la 6ta fila y 2da columna
datos04$Pruebas # columna Pruebas

datos05 = read.table("Datos 03.01 - E.txt", header = TRUE)
head(datos05)

datos05 = read.table("Datos 03.01 - E.txt", header = TRUE, row.names = 1)
head(datos05)

datos06 = read.table("Datos 03.01 - F.txt", header = TRUE, sep = "\t")
datos06 = read.delim("Datos 03.01 - F.txt", header = TRUE)

# Lectura de datos - Archivos csv

datos07 = read.table("Datos 03.01 - G.csv", header = TRUE, sep = ",")
head(datos07)
datos07 = read.csv("Datos 03.01 - G.csv")
head(datos07)

datos08 = read.table("Datos 03.01 - H.csv", header = TRUE, sep = ";")
datos08 = read.csv("Datos 03.01 - H.csv", sep = ";")
datos08 = read.csv2("Datos 03.01 - H.csv")

install.packages("readr")
library(readr)
datos07_ = read_csv("Datos 03.01 - G.csv", locale = locale(encoding = "Latin1"))
datos08_ = read_csv2("Datos 03.01 - H.csv", locale = locale(encoding = "Latin1"))

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
head(datos10)
View(datos10)

datos11 = read_excel("Datos 03.01 - K.xls", 
                     sheet = "CASOS_08022021",
                     n_max = 2)
head(datos11)

datos12 = read_excel("Datos 03.01 - L.xlsx", 
                     sheet = "CASOS_08022021",
                     skip  = 4,
                     col_names = c("País", "Región", "Moleculares", "Rápidas", "Antígenos","Positivos", "Fallecidos"))
View(datos12)
