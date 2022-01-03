
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella


# Lectura de datos - Archivos txt -----------------------------------------

datos01 = read.table("Datos 03.01 - 01.txt", header=TRUE)
datos01
(datos01 = read.table("Datos 03.01 - 01.txt", header=TRUE))
View(datos01)
head(datos01) 
str(datos01)
dim(datos01)

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE) # ERROR
datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE, skip = 2)

datos03 = read.table("Datos 03.01 - 03.txt", 
                     FALSE, 
                     skip = 2,
                     col.names = c("ID","EDAD", "SEXO","DOSIS"),
                     na.strings = "*")

datos04 = read.table("Datos 03.01 - 04.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = "-")

datos05A = read.table("Datos 03.01 - 05.txt", TRUE)
datos05B = read.table("Datos 03.01 - 05.txt", header = TRUE, row.names = 1)

datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1)
datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1, sep = "\t")
datos06 = read.delim("Datos 03.01 - 06.txt", skip = 1)

# Lectura de datos - Archivos csv -----------------------------------------

datos_07 = read.table("Datos 03.01 - 07.csv", header = TRUE, sep = ",")
datos07 = read.csv("Datos 03.01 - 07.csv")
install.packages("readr") # instalando el paquete readr
library(readr) # llamando, cargando o activando el paquete readr
require(readr) # llamando, cargando o activando el paquete readr
datos07_ = read_csv("Datos 03.01 - 07.csv")

datos08A = read.table("Datos 03.01 - 08.csv", header = TRUE, sep = ";")
datos08B = read.csv("Datos 03.01 - 08.csv", sep = ";")
datos08C = read.csv2("Datos 03.01 - 08.csv")
datos08D = read_csv2("Datos 03.01 - 08.csv")
datos08E = read_delim("Datos 03.01 - 08.csv", delim = ";")

datos09 = read_csv2("Datos 03.01 - 09.csv")

# Lectura de datos - Archivos xls y xlsx ----------------------------------

install.packages("readxl")
library(readxl) 
datos10A = read_xls("Datos 03.01 - 10.xls")
datos10B = read_xlsx("Datos 03.01 - 10.xlsx")

datos11 = read_excel("Datos 03.01 - 11.xlsx") 

datos12 = read_excel("Datos 03.01 - 11.xlsx",
                     sheet = 'Ica')

datos13 = read_excel("Datos 03.01 - 11.xlsx",
                     sheet = 2)

datos14 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "TACNA",
                     range = "E1:G14")
datos14 = read_excel("Datos 03.01 - 11.xlsx", 
                     range = "TACNA!E1:G14")

datos15 = read_xlsx("Datos 03.01 - 11.xlsx", 
                     sheet = 2,
                     n_max = 20)

datos16 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "Ica",
                     range = "A1:E1036",
                     col_names = c("ID_PERSONA","FECHA_FALLECE",
                                   "EDAD","SEXO","CRITERIO_FALLECE"),
                     skip = 1)


