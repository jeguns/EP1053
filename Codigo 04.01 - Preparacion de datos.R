# CAPÍTULO 4: PREPARACIÓN DE DATOS


# Introduccion ------------------------------------------------------------

# install.packages("dplyr")

library(dplyr) # (pipe y otras funciones)
library(magrittr) # opcional (solo pipe)

x = c(2,5,4,3)
sum(x)
x %>% sum()
x |> sum()

y = "Jueves 3"
is.logical(y)
y %>% is.logical()
y %>% is.logical() %>% as.numeric() 
y %>% is.logical %>% as.numeric
y |> is.logical() |> as.numeric() 
as.numeric(is.logical(y))

# Limpieza ----------------------------------------------------------------

x = c(5,2.1,9,NA,4)

is.na(x)
sum(is.na(x))
z <- sum(is.na(x))

x %>% is.na()
x %>% is.na() %>% sum()
x %>% is.na %>% sum -> z
x %>% is.na %>% which

y = data.frame(y1=c(1,2,3),y2=c(NA,NA,2))
y %>% is.na %>% sum
y %>% is.na %>% which

# Aplicación 1: Biblioteca ------------------------------------------------

library(readxl)
datos41A = read_excel("Datos 04.01 - A.xlsx")

is.na(datos41A)
datos41A |> is.na()
datos41A %>% is.na()

library(naniar)
datos41A |> any_na()
datos41A |> n_miss()
datos41A |> prop_miss()
datos41A |> pct_miss()
datos41A |> n_complete() 
datos41A |> gg_miss_upset() # gráfica...
datos41A |> miss_case_summary()

sum(is.na(datos41A))
datos41A %>% is.na() %>% sum()

datos41A[,3] %>% is.na() %>% sum()
datos41A$Editorial %>% is.na() %>% sum()
datos41A |> miss_var_summary()

library(janitor)
tabyl(datos41A$Editorial)

library(skimr)
skim(datos41A)



# Aplicación 2: Alumnos de posgrado ---------------------------------------

# Con esta aplicación veremos un poco más acerca de datos perdidos,
# así como el uso de filtros por filas (observaciones) y 
# columnas (selección de variables)

library(dplyr)
datos41B = read.csv2("Datos 04.01 - B.csv")
datos41B %>% View() # Equivale a View(datos41B)
datos41B %>% select(Nombre,Nota,Edad,NumCred) # Columnas a mantener
datos41B %>% select(-X) # Columnas a eliminar
(datos41C = datos41B %>% select(-X))
(datos41B |> select(-X) -> datos41C)

datos41C %>% filter(Nota>=0 & Nota<=20) # O: | (Alt 124)
datos41C %>% filter(!Nota<0 & !Nota>20)

datos41C %>% filter(Edad>=18 & Edad<=59)

datos41C %>% filter(NumCred>0)

datos41C %>% 
  filter(Nota>=0 & Nota<=20) %>% 
  filter(Edad>=18 & Edad<=59) |>
  filter(NumCred>0) 

datos41C |> 
  filter(Nota>=0 & Nota<=20 & Edad>=18 & Edad<=59 & NumCred>0)

filter(filter(filter(datos41C,Nota>0 & Nota<20),Edad>18 & Edad<90),NumCred>0)

datos41B = read.csv2("Datos 04.01 - B.csv")

datos41B |> 
  select(-X) %>% 
  filter(Edad>=18 & Edad<=59) %>% 
  filter(Nota>0 & Nota<20) %>% 
  filter(NumCred>0) -> datosOK

datos41B |> 
  filter(Edad>=18 & Edad<=59 & Nota>0 & Nota<20 & NumCred>0) %>% 
  select(-X) 

datos41B
datosOK

# Manipulación de fechas --------------------------------------------------

Sys.Date()
Sys.time()

Sys.Date() |> str()
Sys.time() |> str()

Sys.Date() |> typeof()
Sys.time() |> typeof()

Sys.Date() |> as.numeric()
Sys.time() |> as.numeric()

as.Date("2022-11-10") |> as.numeric()
as.Date("1970-01-01") |> as.numeric()
as.Date("1965-12-31") |> as.numeric()

as.Date("2021-09-02") - as.Date("2021-07-11")
as.Date("2021-09-02") |> as.numeric()
as.Date("2021-07-11") |> as.numeric()
as.Date("2021-09-02") - as.Date("2018-09-02")

a = Sys.time()
b = Sys.time()
b-a

as.Date("1980-01-01") + 366
as.Date(19019, origin = as.Date("1970-01-01"))
as.Date(26, origin = as.Date("2022-01-01"))
as.Date(10, origin = as.Date("1950-01-01"))

library(lubridate)
today()
now()
OlsonNames()
today(tz = "America/Lima") # tz = time zone
now(tz = "America/Lima")
today(tz = "US/Hawaii")
now(tz = "US/Hawaii")
today(tz = "Asia/Tokyo")
now(tz = "Asia/Tokyo")
today(tz = "Etc/GMT-5")
now(tz = "Etc/GMT-5")
today(tz = "Etc/GMT+5") # PERÚ
now(tz = "Etc/GMT+5")
today(tz = "Australia/Eucla")
now(tz = "Australia/Eucla")

"2020-09-04"
ymd("2020-09-04") # y = year (año), m = month (mes), d = day (día)
"2020-09-04" |> str()
ymd("2020-09-04") |> str()
"2020-09-04" |> typeof()
ymd("2020-09-04") |> typeof()
ymd("2020-Sep-04")
dmy("04-Sep-2020")
dmy("04-09-2020")
as.Date("04-09-2020",format=c("%d-%m-%Y"))
as.Date("04-09-20",format=c("%d-%m-%y"))
as.Date("04-Sep-2020",format=c("%d-%m-%Y")) # no reconoce Sep

make_datetime(2020,09,04) #UTC = Universal Time Coordinated
make_datetime(day=04,month=09,year=2020)
make_datetime(2020,09,04,11)
make_datetime(2020,09,04,11,25)
make_datetime(2022,01,27,08,49,15,tz="America/Lima") -> a
a
year(a)
month(a)
day(a)
mday(a) # día del mes
yday(a) # día del año (cuenta desde el 01/01)
wday(a) # día de la semana comenzando en domingo
wday(a,week_start = 1) # día de la semana comenzando en lunes
yday(today())
today() |> yday()
library(dplyr)
today() %>% yday()
365-yday(today())

wday(today())
today() %>% wday()

wday(today(),  week_start = 1)
today() %>% wday(week_start = 1)

quarter(today())
today() %>% quarter()

semester(today())
today() %>% semester()

# ¿En qué semestre se encuentra el 05 de octubre del 2018?
"05-10-2018" %>% semester #1
semester(as.Date("2018-10-05")) #2
"05-10-2018" %>% semester() #3
("2018-10-5")%>%  semester() #4
dmy("05-10-2018") -> x1 #5
semester(x1)
as.Date("2022-10-05") %>% #6  
  semester()

now() %>% am()
now() %>% pm()


# Aplicación 3: Tarjetas de crédito ---------------------------------------

# Con esta aplicación veremos cómo realizar la transformación de variables
# asimismo, repasaremos lo concerniente a selección de variables
# y filtros por observaciones

datos41D = read.delim("Datos 04.01 - C.txt", encoding = "UTF-8")

library(lubridate) # lubridate sirve para el manejo de fechas
library(dplyr)
rename(datos41D, TIPO_TARJETA = 5)

datos41D |> rename(TIPO_TARJETA = 5)

datos41D %>% rename(TIPO_TARJETA = 5)

datos41D %>% 
  rename(TIPO_TARJETA = 5) %>% 
  mutate(NOMBRE_COMPLETO = paste(NOMBRES,APELLIDOS)) %>% 
  mutate(MONTO_USD = round(MONTO_SOLES/3.85,2)) %>% 
  mutate(FECHA_PAGO1  = as.Date(FECHA_PAGO1,format=c("%d/%m/%Y"))) %>% 
  mutate(FECHA_COMPRA = as.Date(FECHA_COMPRA,format=c("%d/%m/%Y"))) %>% 
  mutate(TIEMPO = as.numeric((FECHA_PAGO1 - FECHA_COMPRA))) %>% 
  mutate(MES    = month(FECHA_COMPRA)) %>% 
  filter(MES == 1 & TIEMPO > 30) %>% 
  select(NOMBRE_COMPLETO, MONTO_USD, TIEMPO) -> MOROSOS

datos41D %>% 
  rename(TIPO_TARJETA = 5) %>% 
  mutate(NOMBRE_COMPLETO = paste(NOMBRES,APELLIDOS),
         MONTO_USD = round(MONTO_SOLES/3.85,2),
         FECHA_PAGO1  = as.Date(FECHA_PAGO1,format=c("%d/%m/%Y")),
         FECHA_COMPRA = as.Date(FECHA_COMPRA,format=c("%d/%m/%Y")),
         TIEMPO = as.numeric((FECHA_PAGO1 - FECHA_COMPRA)),
         MES    = month(FECHA_COMPRA)) %>% 
  filter(MES == 1 & TIEMPO > 30) %>% 
  select(NOMBRE_COMPLETO, MONTO_USD, TIEMPO) -> MOROSOS

MOROSOS

library(writexl)
write_xlsx(MOROSOS, "000111_ARCHIVO.xlsx")
write.csv(MOROSOS, "resultado.csv")
write.csv2(MOROSOS, "resultado2.csv")

# Si la fecha fuese por ejemplo 05-08-2020, tendríamos que colocar en formato "%d-%m-%Y"
# Si la fecha fuese por ejemplo 2020.08.05, tendríamos que colocar en formato "%Y.%m.%d"


# Aplicación 4 - Empleados ------------------------------------------------

library(readxl)
empleados = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Empleados")
areas     = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Areas")

# Un breve paréntesis antes de analizar los distintos join

empleados |> str()

empleados |> select(APELLIDOS)
empleados |> pull(APELLIDOS)

empleados |> select(APELLIDOS, NOMBRES, AREA)
empleados |> pull(APELLIDOS, NOMBRES, AREA)

# Ahora sí...

inner_join(empleados,areas) 
empleados %>% inner_join(areas)
areas |> inner_join(empleados)
empleados %>% inner_join(areas) -> datos_total
datos_total |> View()

View(left_join(empleados,areas))
empleados %>% left_join(areas) %>% View()

empleados %>% right_join(areas) %>% View()

empleados %>% full_join(areas) %>% View()


