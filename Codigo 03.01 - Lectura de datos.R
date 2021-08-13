
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella

# Lectura de datos - Archivos txt

(datos01 = read.table("Datos 03.01 - 01.txt", header=TRUE))
datos01
View(datos01)
head(datos01) 
str(datos01)
sum(datos01[,2]) # esto sería incorrecto, más adelante haremos limpieza
as.character(datos01[,2])
datos01[,2] = as.character(datos01[,2])
datos01[,2]
str(datos01)

(datos001 = read.table("abc/Datos 03.01 - 01.txt", header=TRUE))

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE) # ERROR

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE, skip = 2)
head(datos02)

?read.table
datos03 = read.table("Datos 03.01 - 03.txt", 
                     FALSE, 
                     skip = 2,
                     col.names = c("Edad","Sexo", "Fecha de vacunación","Dosis","Fabricante"),
                     na.strings = "*")
FUNCION(A, B, C)
FUNCION(...,  ..., ... )
FUNCION()
FUNCION(C = ..., A = ..., B = ...)

datos04 = read.table("Datos 03.01 - 04.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = "-")
str(datos04)
datos04[6,] # 6ta fila
datos04[,2] # 2da columna
datos04[6,2] # dato de la 6ta fila y 2da columna
datos04[6,2:4] # dato de la 6ta fila y 2da-4ta columna
datos04$DOSIS # columna Dosis

?read.table
datos05 = read.table("Datos 03.01 - 05.txt", TRUE)
head(datos05)
dim(datos05) # 57 filas y 5 columnas
datos05 = read.table("Datos 03.01 - 05.txt", header = TRUE, 
                     row.names = 1)
head(datos05)
dim(datos05) # 57 filas y 4 columnas

datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1)
datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1, sep = "\t")
datos06 = read.delim("Datos 03.01 - 06.txt", header = TRUE, skip = 1)
datos06 = read.delim("Datos 03.01 - 06.txt", header = TRUE, skip = 1,
                     encoding = 'UTF-8')
head(datos06)

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
require(readr) # llamando, cargando o activando el paquete readr
datos07 = read_csv("Datos 03.01 - 07.csv")
datos07
head(datos07)
str(datos07) # tibble
View(datos07)

datos08 = read.table("Datos 03.01 - 08.csv", header = TRUE, sep = ";")
datos08 = NULL
datos08 = read.csv("Datos 03.01 - 08.csv", sep = ";")
datos08 = NULL
datos08 = read.csv2("Datos 03.01 - 08.csv")

datos09 = read_csv2("Datos 03.01 - 09.csv")
datos09 = read_csv2("Datos 03.01 - 09.csv", locale = locale(encoding = "Latin1"))

# Lectura de datos - Archivos xlsx

# Necesitamos instalar y cargar el paquete readxl

install.packages("readxl")
library(readxl) 

datos10 = read_xlsx("Datos 03.01 - 10.xlsx")
head(datos10)
datos10 = NULL
datos10 = read_xls("Datos 03.01 - 10.xls")
datos10 = read_excel("Datos 03.01 - 10.xlsx")

datos11 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "TACNA",
                     range = "E1:G14")

datos11C = read_excel("Datos 03.01 - 11.xlsx", 
                     range = "TACNA!E1:G14")

datos12 = read_xlsx("Datos 03.01 - 11.xlsx", 
                     sheet = 2,
                     n_max = 20)

datos13 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "Puno",
                     col_names = c("Fecha de corte", "UUID",
                                   "Grupo de riesgo", "Edad", "Sexo", 
                                   "Fecha de vacunacion",
                                   "Dosis", "Fabricante","DIRESA",
                                   "Departamento","Provincia","Distrito"),
                     skip = 1)
