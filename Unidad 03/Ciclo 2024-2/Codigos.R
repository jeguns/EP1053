datos01 <- read.table(file = "03_datos_01.txt", header = TRUE)
datos01
View(datos01)
str(datos01)
dim(datos01)
nrow(datos01)
ncol(datos01)

datos02  <- read.table("03_datos_02.txt", TRUE)
datos02  <- read.table("03_datos_02.txt", TRUE, skip = 6)
filtro02 <- datos02$P301A == 10
datos02[filtro02,]
datos02[datos02$P301A == 10,]

datos03  <- read.table("03_datos_03.txt", TRUE)
datos03  <- read.table("03_datos_03.txt", TRUE, sep = "\t")
filtro03 <- datos03$P300A=="CASTELLANO" & datos03$P301A=="SECUNDARIA INCOMPLETA"
datos03[filtro03,]

datos04  <- read.table("03_datos_04.txt", TRUE, 
                      na.strings = 99, 
                      nrows      = 50,
                      col.names  = c("CONGLOME","VIVIENDA","HOGAR","PERSONA",
                                    "UBIGEO","LENGUA","EDUCACION"))
filtro04 <- datos04$UBIGEO==150107 | datos04$EDUCACION==6
filtro04
datos04[filtro04,]

install.packages("readr")
library(readr)
datos01a <- read_tsv("03_datos_01.txt")
datos02a <- read_tsv("03_datos_02.txt", skip = 6)
datos03a <- read_tsv("03_datos_03.txt")
datos04a <- read_tsv("03_datos_04.txt",
                     na        = "99",
                     n_max     = 50,
                     col_names = c("CONGLOME","VIVIENDA","HOGAR","PERSONA",
                                  "UBIGEO","LENGUA","EDUCACION"))

datos05a <- read.csv("03_datos_05.csv")
datos05b <- read.table("03_datos_05.csv", header = TRUE, sep = ",")
identical(datos05a,datos05b)
library(readr)
datos05c <- read_csv("03_datos_05.csv")
identical(datos05a,datos05c)
identical(datos05b,datos05c)

datos06a <- read.csv("03_datos_06.csv")
datos06a <- read.csv("03_datos_06.csv", encoding = "latin1")
datos06b <- read_csv("03_datos_06.csv")
guess_encoding("03_datos_06.csv")
datos06b <- read_csv("03_datos_06.csv", locale = locale(encoding = "ISO-8859-1"))
filtro06 <- datos06b$P300A %in% 1:3
datos06c <- datos06b[filtro06,] |> View()

datos07a <- read.csv2('03_datos_07.csv', encoding = "latin1")
datos07b <- read.csv('03_datos_07.csv', encoding = "latin1", sep = ";")
datos07c <- read.table('03_datos_07.csv', TRUE, encoding = "latin1", sep = ";")
datos07d <- read_csv2('03_datos_07.csv', locale = locale(encoding = "ISO-8859-1"))
datos07e <- read_delim('03_datos_07.csv', locale = locale(encoding = "ISO-8859-1"), delim = ";")
dim(datos07a); dim(datos07b); dim(datos07c); dim(datos07d); dim(datos07e)
                          
install.packages("readxl")
library(readxl)
datos09a <- read_excel('03_datos_09.xlsx')
datos09b <- read_xlsx('03_datos_09.xlsx')
datos09c <- read_xls('03_datos_09.xls')

datos10a <- read_xlsx('03_datos_10.xlsx', na = "99", skip = 8) # o skip = 9
datos10b <- read_xlsx('03_datos_10.xlsx', na = "99", range = "A10:E252")
identical(datos10a,datos10b)
filtro10 <- datos10a$P300A==1 & datos10a$P314A == 1
datos10a[filtro10,]

datos11_lima_a <- read_xlsx('03_datos_11.xlsx')
datos11_lima_b <- read_xlsx('03_datos_11.xlsx', sheet = 1)
datos11_lima_c <- read_xlsx('03_datos_11.xlsx', sheet = "LIMA")
datos11_selva_a <- read_xlsx('03_datos_11.xlsx', sheet = 2)
datos11_selva_b <- read_xlsx('03_datos_11.xlsx', sheet = "Selva")
