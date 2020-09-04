
# CAPÍTULO 4: PREPARACIÓN DE DATOS

library(dplyr)
library(magrittr)

x = c(2,5,4,3)
sum(x)
x %>% sum()

y = "Jueves 3"
is.logical(y)
y %>% is.logical()
y %>% is.logical() %>% as.numeric()
as.numeric(is.logical(y))

# ----------------- #
# Limpieza de datos #
# ----------------- #

x = c(5,2.1,9,NA,4)
is.na(x)
sum(is.na(x))
y <- sum(is.na(x))

x %>% is.na()
x %>% is.na() %>% sum()
x %>% is.na() %>% sum() -> z

# Aplicación 1: Biblioteca

library(readxl)
datos41A = read_excel("Datos 04.01 - A.xlsx")

is.na(datos41A)
datos41A %>% is.na()

sum(is.na(datos41A))
datos41A %>% is.na() %>% sum()

datos41A %>% View()

datos41A[,3] %>% is.na() %>% sum()
datos41A$Editorial %>% is.na() %>% sum()
m = datos41A[,3];m %>% is.na() %>% sum()
m = datos41A[,3];sum(is.na(m))

# Aplicación 2: Alumnos de posgrado

datos41B = read.csv2("Datos 04.01 - B.csv")
datos41B %>% View()
datos41B %>% select(Nombre,Nota,Edad,NumCred) # Columnas a mantener
datos41B %>% select(-X) # Columnas a eliminar
(datos41B = datos41B %>% select(-X))

datos41B %>% filter(Nota>=0 & Nota<=20)

datos41B %>% filter(!Nota<0 & !Nota>20)

datos41B %>% filter(Edad>=18 & Edad<=59)

datos41B %>% 
  filter(Nota>=0 & Nota<=20) %>% 
  filter(Edad>=18 & Edad<=59) %>% 
  filter(NumCred>0)

filter(filter(filter(datos41B,Nota>0 & Nota<20),Edad>18 & Edad<90),NumCred>0)

datos41B = read.csv2("Datos 04.01 - B.csv")

datos41B %>%
  select(-X) %>% 
  filter(Nota>0 & Nota<20) %>% 
  filter(Edad>18 & Edad<90) %>% 
  filter(NumCred>0) -> datosOK

datos41B
datosOK

# Aplicación 3: Tarjetas de crédito

datos41C = read.delim("Datos 04.01 - C.txt", encoding = "UTF-8")

library(lubridate) # lubridate sirve para el manejo de fechas

datos41C %>% 
  mutate(NOMBRE_COMPLETO = paste(NOMBRES,APELLIDOS)) %>% 
  mutate(MONTO_USD = MONTO_SOLES/3.54) %>% 
  mutate(TIEMPO = as.Date(FECHA_PAGO1,format=c("%d/%m/%Y"))-as.Date(FECHA_COMPRA,format=c("%d/%m/%Y"))) %>% 
  mutate(MES = month(as.Date(FECHA_COMPRA,format=c("%d/%m/%Y")))) %>% 
  filter(MES == 1) %>% 
  filter(TIEMPO > 30) %>% 
  select(NOMBRE_COMPLETO, MONTO_USD, TIEMPO) -> MOROSOS

# El símbolo = es equivalente a <-, no es equivalente a ->

MOROSOS

# Si la fecha fuese por ejemplo 05-08-2020, tendríamos que colocar en formato "%d-%m-%Y"
# Si la fecha fuese por ejemplo 2020.08.05, tendríamos que colocar en formato "%Y.%m.%d"

# Manipulando fechas

Sys.Date()
Sys.time()

library(lubridate)
today()
today(tz = "America/Lima")
today(tz = "US/Hawaii")
today(tz = "Etc/GMT-5")
today(tz = "Australia/Eucla")
OlsonNames()

ymd("2020-09-04")
ymd("2020-Sep-04")
dmy("04-Sep-2020")

make_datetime(2020,09,04)
make_datetime(day=04,month=09,year=2020)
make_datetime(2020,09,04,11)
make_datetime(2020,09,04,11,25)
make_datetime(2020,09,04,11,25,40,tz="America/Lima") -> a

year(a)
month(a)
mday(a) # día del mes
yday(a) # día del año
366-yday(today())
wday(a) # día de la semana

# Aplicación 4: Empleados

empleados = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Empleados")
areas     = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Areas")

inner_join(empleados,areas)
empleados %>% inner_join(areas) %>% View()

# empleados %>%
#   mutate(UBICACION = ifelse(AREA=="Marketing","San Isidro",
#                             ifelse(AREA=="Finanzas","Lima","Otro"))) %>%
#   mutate(JEFE = "ABC") %>%
#   View()

left_join(empleados,areas) %>% View()
empleados %>% left_join(areas) %>% View()

empleados %>% right_join(areas) %>% View()

empleados %>% full_join(areas) %>% View()


