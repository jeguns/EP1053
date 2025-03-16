
# Creación de proyecto ----------------------------------------------------

# Asegúrate de haber creado previamente tu proyecto
# y que tus archivos se encuentren en la carpeta del proyecto

# Lectura de archivos de texto plano --------------------------------------

datos1a = read.table(file = "Cap3 - INEI - 001.txt", header = TRUE)
datos1b = read.table("Cap3 - INEI - 001.txt", TRUE)
datos1c = read.table(header = TRUE, file = "Cap3 - INEI - 001.txt")

library(readr)

# Lectura de archivos separados por comas ---------------------------------

datos2a = read.table("Cap3 - INEI - 002.csv", TRUE, sep = ",")
datos2b = read.csv("Cap3 - INEI - 002.csv")

datos3a = read.table("Cap3 - INEI - 003.csv", TRUE, sep = ";")
datos3b = read.csv("Cap3 - INEI - 003.csv", sep = ";")
datos3c = read.csv2("Cap3 - INEI - 003.csv")

# Lectura de archivos Excel -----------------------------------------------

library(readxl)

datos4a = read_excel("Cap3 - INEI - 004.xlsx")
datos4b = read_xlsx("Cap3 - INEI - 004.xlsx")
datos4c = read_excel("Cap3 - INEI - 005.xls")
datos4d = read_xls("Cap3 - INEI - 005.xls")

head(datos4a)
head(datos4a, n = 3)
tail(datos4a)
tail(datos4a, n = 8)

