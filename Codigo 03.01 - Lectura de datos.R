
# Antes de ejecutar estos códigos, cree su carpeta de trabajo y 
# su proyecto RStudio dentro de ella


# Lectura de datos - Archivos txt -----------------------------------------

datos01 = read.table(file = "Datos 03.01 - 01.txt", header=TRUE)
datos01
(datos01 = read.table("Datos 03.01 - 01.txt", header=TRUE))
View(datos01)
head(datos01) # por default muestra las 6 primeras filas 
str(datos01) 
dim(datos01)
datos01$edad
str(datos01$edad)
col01 = datos01[,2]
datos01[,2] -> col01
col01
datos01[3:4,] -> subset01
datos01[c(2,5),] -> subset02
str(col01)
str(subset01)

datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE) # ERROR
datos02 = read.table("Datos 03.01 - 02.txt", header = TRUE, skip = 2)
head(datos02)
# edad de la persona fallecida fue mayor a 80 años
filtro = datos02$edad > 80
datos02[filtro,]
datos02[datos02$edad > 80,] -> datos02_80
View(datos02_80)

datos03 = read.table(file="Datos 03.01 - 03.txt", 
                     header=FALSE, 
                     skip = 2,
                     col.names = c("ID","EDAD", "SEXO","DOSIS"),
                     na.strings = "*")
datos03
#fue menor a 80 años y su sexo fue Femenino (y &) (o |)
filtro = datos03$EDAD < 80 & datos03$SEXO == "F"
datos03[filtro,] -> datos03_f80
dim(datos03_f80)[1]
nrow(datos03_f80)
ncol(datos03_f80)

datos04 = read.table("Datos 03.01 - 04.txt", 
                    header     = TRUE,
                    nrows      = 10, 
                    na.strings = c("-","*","/"))
datos04$flag_vacuna
#Seleccione los datos de las filas 2 y 4, y las columnas 2 y 3.
datos04[c(2,4),c(2,3)]

datos05A = read.table("Datos 03.01 - 05.txt", TRUE)
dim(datos05A)
datos05B = read.table("Datos 03.01 - 05.txt", TRUE, row.names = 1)
dim(datos05B)
identical(datos05A,datos05B)
# tuvieron que ser hospitalizados (flag_hospitalizado=1) y que no recibieron ninguna dosis
filtro1 = datos05A$flag_hospitalizado==1 & datos05A$flag_vacuna==0
datos05A[filtro1,]
filtro2 = datos05A$flag_hospitalizado==1 & datos05A$flag_vacuna>=1
datos05A[filtro2,]

datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1)
datos06 = read.table("Datos 03.01 - 06.txt", header = TRUE, skip = 1, sep = "\t")
datos06 = read.delim("Datos 03.01 - 06.txt", skip = 1)

# Filtre en un data frame a las personas cuyo distrito de domicilio es San Juan 
# de Lurigancho pero no fallecieron allí (dist_cdc no es SJL), solo considerando 
# las columnas fecha_fallecimiento, edad, sexo y flag_vacuna.

filtro = datos06$dist_domicilio=="SAN JUAN DE LURIGANCHO" & datos06$dist_cdc!="SAN JUAN DE LURIGANCHO"
datos06[filtro,c(2,3,4,11)]

filtro = datos06$dist_domicilio=="SAN JUAN DE LURIGANCHO" & !datos06$dist_cdc=="SAN JUAN DE LURIGANCHO"
datos06[filtro,c(2,3,4,11)]

filtro = datos06$edad>50 & !datos06$edad>80
datos06[filtro,c(2,3,4,11)]

# Lectura de datos - Archivos csv -----------------------------------------

datos07A = read.table("Datos 03.01 - 07.csv", header = TRUE, sep = ",")
datos07B = read.csv("Datos 03.01 - 07.csv")
identical(datos07A,datos07B)
install.packages("readr") # instalando el paquete readr
library(readr) # llamando, cargando o activando el paquete readr
require(readr) # llamando, cargando o activando el paquete readr
datos07C = read_csv("Datos 03.01 - 07.csv")
identical(datos07A,datos07B)
identical(datos07A,datos07C)
identical(datos07B,datos07C)
str(datos07A)
str(datos07B)
str(datos07C) # TIBBLE (ES UN TIPO DE DATA FRAME)

datos08A = read.table("Datos 03.01 - 08.csv", header = TRUE, sep = ";") # data frame
datos08B = read.csv("Datos 03.01 - 08.csv", sep = ";") # data frame
datos08C = read.csv2("Datos 03.01 - 08.csv") # data frame
datos08D = read_csv2("Datos 03.01 - 08.csv") # tibble
datos08E = read_delim("Datos 03.01 - 08.csv", delim = ";") # tibble
identical(datos08A,datos08B)
identical(datos08A,datos08C)
identical(datos08D,datos08B)
identical(datos08D,datos08E)
str(datos08D)
str(datos08E)

datos09 = read_csv2("Datos 03.01 - 09.csv")
dim(datos09)

# Lectura de datos - Archivos xls y xlsx ----------------------------------

install.packages("readxl")
library(readxl) 
datos10A = read_xls("Datos 03.01 - 10.xls")
datos10A = read_excel("Datos 03.01 - 10.xls")
datos10B = read_xlsx("Datos 03.01 - 10.xlsx")
datos10C = read_excel("Datos 03.01 - 10.xlsx")
identical(datos10A,datos10B)
# Filtre los registros correspondientes a sexo masculino y
# que no tengan datos perdidos en esa columna
filtro1 = datos10A$sexo=="M" & !is.na(datos10A$sexo)
datos10A[filtro1,]
# Otro ejemplo:
filtro2 = datos10A$sexo=="M" & is.na(datos10A$sexo)
datos10A[filtro2,]
# Filtre los registros que no correspondan a Lima 
# (dpt_cdc distinto de Lima) y que no tengan datos perdidos 
# en la columna edad.
filtro3 = datos10A$dpt_cdc!="LIMA" & !is.na(datos10A$edad)
datos10A[filtro3,]
View(datos10A[filtro3,])
# Otro ejemplo:
filtro4 = datos10A$dpt_cdc!="LIMA" & is.na(datos10A$fecha_dosis1)
datos10A[filtro4,] -> ejemplo
View(ejemplo)

datos11 = read_excel("Datos 03.01 - 11.xlsx") 
View(datos11)

datos12 = read_excel("Datos 03.01 - 11.xlsx",
                     sheet = 'Ica')

datos13 = read_excel("Datos 03.01 - 11.xlsx",
                     sheet = 2)

identical(datos12,datos13)

datosxx = read_excel("Datos 03.01 - 11.xlsx",
                     sheet = c("TACNA",'Ica')) ## ERROR ##

datos14A = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "TACNA",
                     range = "E1:G14")
datos14B = read_excel("Datos 03.01 - 11.xlsx", 
                     range = "TACNA!E1:G14")
datos14C = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "Ica",
                     range = "TACNA!E1:G14")
identical(datos14A,datos14B)
identical(datos14A,datos14C)
identical(datos14B,datos14C)

datos15 = read_xlsx("Datos 03.01 - 11.xlsx", 
                     sheet = 2,
                     n_max = 20)
View(datos15)
datos15 = read_xlsx("Datos 03.01 - 11.xlsx", 
                    range = "Ica!A1:AH21")
View(datos15)

datos16 = read_excel("Datos 03.01 - 11.xlsx", 
                     sheet = "Ica", ## este es el nombre de la hoja
                     range = "A2:E1036", 
                     col_names = c("ID_PERSONA","FECHA_FALLECE",
                                   "EDAD","SEXO","CRITERIO_FALLECE"))


datos1111 = read_csv("datos.csv",
                     locale = readr::locale(encoding = "latin1"))
