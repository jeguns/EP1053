
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella

# Lectura de datos - Archivos txt

(datos01 = read.table("Datos 03.01 - 01.txt", header=TRUE))
datos01
View(datos01)
head(datos01) 

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE) # ERROR

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE, skip = 2)
head(datos02)

datos03 = read.table("Datos 03.01 - 03.txt", 
                     header    = FALSE, 
                     col.names = c("Edad","Sexo", "Fecha de vacunación","Dosis","Fabricante"),
                     na.strings = "*",
                     skip = 2)

datos04 = read.table("Datos 03.01 - 04.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = "-")
datos04[6,] # 6ta fila
datos04[,2] # 2da columna
datos04[6,2] # dato de la 6ta fila y 2da columna
datos04$DOSIS # columna Pruebas

datos05 = read.table("Datos 03.01 - 05.txt", header = TRUE)
head(datos05)

datos05 = read.table("Datos 03.01 - 05.txt", header = TRUE, row.names = 1)
head(datos05)

datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, sep = "\t", skip=1)
datos06 = read.delim("Datos 03.01 - 06.txt", header = TRUE, skip = 1)

# Lectura de datos - Archivos csv

datos07 = read.table("Datos 03.01 - 07.csv", header = TRUE, sep = ",")
head(datos07)
str(datos07)
datos07 = read.csv("Datos 03.01 - 07.csv")
datos07
head(datos07)
str(datos07)
install.packages("readr") # instalando el paquete readr
library(readr) # llamando, cargando o activando el paquete readr
datos07 = read_csv("Datos 03.01 - 07.csv")
datos07
head(datos07)
str(datos07)

datos08 = read.table("Datos 03.01 - 08.csv", header = TRUE, sep = ";")
datos08 = read.csv("Datos 03.01 - 08.csv", sep = ";")
datos08 = read.csv2("Datos 03.01 - 08.csv")

datos09 = read_csv2("Datos 03.01 - 09.csv")
datos09 = read_csv2("Datos 03.01 - 09.csv", locale = locale(encoding = "Latin1"))

# Lectura de datos - Archivos xlsx

# Necesitamos instalar y cargar el paquete readxl

install.packages("readxl")
library(readxl) 

datos10 = read_xlsx("Datos 03.01 - 10.xlsx")
datos10 = read_xls("Datos 03.01 - 10.xls")
datos10 = read_excel("Datos 03.01 - 10.xlsx")


datos11 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "TACNA",
                     range = "E1:G14")

datos12 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = 2,
                     n_max = 20)

datos13 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "Puno",
                     col_names = c("Fecha de corte", "UUID", "Grupo de riesgo", "Edad", "Sexo", "Fecha de vacunacion",
                                   "Dosis", "Fabricante","DIRESA","Departamento","Provincia","Distrito"))
