
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella

# Lectura de datos - Archivos txt

(datos01 = read.table("Datos 03.01 - A.txt", header=TRUE))
datos01
View(datos01)
head(datos01) 

datos02 = read.table("Datos 03.01 - B.txt", header = TRUE) # ERROR

datos02 = read.table("Datos 03.01 - B.txt", header = TRUE, skip = 3)
head(datos02)

datos03 = read.table("Datos 03.01 - C.txt", 
                     header    = FALSE, 
                     col.names = c("Pruebas","Resultado positivo"),
                     na.strings = "*",
                     skip = 1)

read_csv(......... , na = c("*","."))
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

datos06 = read.table("Datos 03.01 - F.txt", header = TRUE, sep = "\t", skip=1)
datos06 = read.delim("Datos 03.01 - F.txt", header = TRUE, skip = 1)

# Lectura de datos - Archivos csv

datos07 = read.table("Datos 03.01 - G.csv", header = TRUE, sep = ",")
head(datos07)
datos07 = read.csv("Datos 03.01 - G.csv")
head(datos07)

datos08 = read.table("Datos 03.01 - H.csv", header = TRUE, sep = ";")
datos08 = read.csv("Datos 03.01 - H.csv", sep = ";")
datos08 = read.csv2("Datos 03.01 - H.csv")

install.packages("readr") # instalando el paquete readr
library(readr) # llamando, cargando o activando el paquete readr
datos07_ = read_csv("Datos 03.01 - G.csv", locale = locale(encoding = "Latin1"))
datos07_ = read_csv("Datos 03.01 - G.csv")
datos08_ = read_csv2("Datos 03.01 - H.csv", locale = locale(encoding = "Latin1"))
mean(datos07[,3])

datos_07 = read.csv("Datos 03.01 - G.csv")
datos_07 = read.csv("Datos 03.01 - G.csv", encoding = "latin1")

?read_csv
# También se tiene read_tsv (similar a read.delim)

# Lectura de datos - Archivos xlsx

# Necesitamos instalar y cargar el paquete readxl

install.packages("readxl")
library(readxl) 

datos09 = read_xlsx("Datos 03.01 - I.xlsx")
datos09_ = read_xls("Datos 03.01 - I.xls")
datos09 = read_excel("Datos 03.01 - I.xlsx")

# install.packages("openxlsx")
# library(openxlsx) # función read.xlsx

datos10 = read_excel("Datos 03.01 - J.xlsx", 
                     sheet = "POSITIVIDAD_10082020",
                     range = "A1:D5")
head(datos10)
View(datos10)

datos11_ = read_excel("Datos 03.01 - K.xls", 
                     sheet = 1,
                     n_max = 2)
head(datos11_)

datos12 = read_excel("Datos 03.01 - L.xlsx", 
                     sheet = "CASOS_08022021",
                     skip  = 4,
                     col_names = c("País", "Región", "Moleculares", "Rápidas", "Antígenos","Positivos", "Fallecidos"))
View(datos12)
