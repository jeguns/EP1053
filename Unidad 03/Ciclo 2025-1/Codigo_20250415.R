
# ARCHIVOS DE TEXTO PLANO -------------------------------------------------

datos1a = read.table(file = "Cap3 - INEI - 001.txt", header = TRUE)
datos1b = read.table("Cap3 - INEI - 001.txt", TRUE)
datos1c = read.table(header = TRUE, file = "Cap3 - INEI - 001.txt")
identical(datos1b,datos1c)
library(readr)
datos1d = read_tsv("Cap3 - INEI - 001.txt")
datos1d # read_tsv → tibble
datos1c # read.table


# ARCHIVOS SEPARADOS POR COMAS --------------------------------------------

datos2a = read.table("Cap3 - INEI - 002.csv", TRUE, sep = ",")
datos2b = read.csv("Cap3 - INEI - 002.csv")
identical(datos2a,datos2b)
datos2c = read_csv("Cap3 - INEI - 002.csv")


# ARCHIVOS SEPARADOS POR PUNTO Y COMA -------------------------------------

datos3a = read.table("Cap3 - INEI - 003.csv", TRUE, sep = ";")
datos3b = read.csv("Cap3 - INEI - 003.csv", sep = ";")
datos3c = read.csv2("Cap3 - INEI - 003.csv")
identical(datos3a,datos3c)
datos3d = read_csv2("Cap3 - INEI - 003.csv")
identical(datos3d,datos3a)
datos3a
datos3d


# HOJAS DE CÁLCULO EXCEL --------------------------------------------------

library(readxl)
datos4a = read_excel("Cap3 - INEI - 004.xlsx")
datos4b = read_xlsx("Cap3 - INEI - 004.xlsx")
datos4c = read_excel("Cap3 - INEI - 005.xls")
datos4d = read_xls("Cap3 - INEI - 005.xls")
identical(datos4a, datos4b)
identical(datos4a, datos4c)

df1 = read_excel('Cap3 - INEI - 006.xlsx', 
                 sheet = "TB_POBLACION",
                 range = "C4:F13")
df2 = read_excel('Cap3 - INEI - 006.xlsx', 
                 sheet = 1,
                 range = "C4:F13")
df3 = read_excel('Cap3 - INEI - 006.xlsx', 
                 range = "TB_POBLACION!C4:F13")
identical(df1,df3)
df1
df_amazonas = read_excel('Cap3 - INEI - 006.xlsx', 
                         sheet = 2)
df_ancash = read_excel('Cap3 - INEI - 006.xlsx', 
                         sheet = 3)
df_arequipa = read_excel('Cap3 - INEI - 006.xlsx', 
                         sheet = 4)

head(df_amazonas,n=12) -> df_amazonas_12

df_ancash$Cantidad -> cantidad_ancash

list(df_amazonas_12, cantidad_ancash)
