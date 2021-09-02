

# CAPÍTULO 4: PREPARACIÓN DE DATOS


# Introduccion ------------------------------------------------------------


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

# ATENCIÓN: El símbolo = es equivalente a <- o -> dependiendo
# la posición del objeto 


# Aplicación 1: Biblioteca ------------------------------------------------

library(readxl)
datos41A = read_excel("Datos 04.01 - A.xlsx")

is.na(datos41A)
datos41A |> is.na()
datos41A %>% is.na()

sum(is.na(datos41A))
datos41A %>% is.na() %>% sum()

datos41A[,3] %>% is.na() %>% sum()
datos41A$Editorial %>% is.na() %>% sum()

library(janitor)
tabyl(datos41A$Editorial)

library(skimr)
skim(datos41A)

which(datos41A$Año == 2002)
which(is.na(datos41A$Año))
which(datos41A$Año == 2020)

# Aplicación 2: Alumnos de posgrado ---------------------------------------

# Con esta aplicación veremos un poco más acerca de datos perdidos,
# así como el uso de filtros por filas (observaciones) y 
# columnas (selección de variables)

datos41B = read.csv2("Datos 04.01 - B.csv")
datos41B %>% View()
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

filter(filter(filter(datos41C,Nota>0 & Nota<20),Edad>18 & Edad<90),NumCred>0)

datos41B = read.csv2("Datos 04.01 - B.csv")

datos41B |> 
  filter(Edad>18 & Edad<90) %>% 
  select(-X) %>% 
  filter(Nota>0 & Nota<20) %>% 
  filter(NumCred>0) -> datosOK

datos41B |> 
  filter(Edad>18 & Edad<90 & Nota>0 & Nota<20 & NumCred>0) %>% 
  select(-X) 

datos41B
datosOK

# ---------------------- #
# Manipulación de fechas #
# ---------------------- #

Sys.Date()
Sys.time()

library(lubridate)
today()
now()
OlsonNames()
today(tz = "America/Lima")
now(tz = "America/Lima")
today(tz = "US/Hawaii")
now(tz = "US/Hawaii")
today(tz = "Etc/GMT-5")
now(tz = "Etc/GMT-5")
today(tz = "Etc/GMT+5") # LIMA
now(tz = "Etc/GMT+5")
today(tz = "Australia/Eucla")
now(tz = "Australia/Eucla")

ymd("2020-09-04")
ymd("2020-Sep-04")
dmy("04-Sep-2020")
dmy("04-09-2020")
as.Date("04-09-2020",format=c("%d-%m-%Y"))
as.Date("04-Sep-2020",format=c("%d-%m-%Y")) # no reconoce Sep

make_datetime(2020,09,04)
make_datetime(day=04,month=09,year=2020)
make_datetime(2020,09,04,11)
make_datetime(2020,09,04,11,25)
make_datetime(2020,09,04,11,25,40,tz="America/Lima") -> a
a
year(a)
month(a)
mday(a) # día del mes
yday(a) # día del año
yday(today())
today() %>% yday()
365-yday(today())
wday(a) # día de la semana asumiendo que comienza en domingo
wday(a, week_start = 1) # día de la semana asumiendo que comienza en lunes

wday(today())
today() %>% wday()

wday(today(),  week_start = 1)
today() %>% wday(week_start = 1)

quarter(today())
today() %>% quarter()

now() %>% pm()

# --------------------------------- #
# Aplicación 3: Tarjetas de crédito #
# --------------------------------- #

# Con esta aplicación veremos cómo realizar la transformación de variables
# asimismo, repasaremos lo concerniente a selección de variables
# y filtros por observaciones

datos41D = read.delim("Datos 04.01 - C.txt", encoding = "UTF-8")

library(lubridate) # lubridate sirve para el manejo de fechas

# las líneas 167 y 168 son equivalentes a la línea 165

rename(datos41D, TIPO_TARJETA = 5)

datos41D %>% 
  rename(TIPO_TARJETA = 5) %>% 
  mutate(NOMBRE_COMPLETO = paste(NOMBRES,APELLIDOS)) %>% 
  mutate(MONTO_USD = MONTO_SOLES/3.64) %>% 
  mutate(FECHA_PAGO1  = as.Date(FECHA_PAGO1,format=c("%d/%m/%Y"))) %>% 
  mutate(FECHA_COMPRA = as.Date(FECHA_COMPRA,format=c("%d/%m/%Y"))) %>% 
  mutate(TIEMPO = FECHA_PAGO1 - FECHA_COMPRA) %>% 
  mutate(MES    = month(FECHA_COMPRA)) %>% 
  filter(MES == 1) %>% 
  filter(TIEMPO > 30) %>% 
  select(NOMBRE_COMPLETO, MONTO_USD, TIEMPO) -> MOROSOS

MOROSOS

# Si la fecha fuese por ejemplo 05-08-2020, tendríamos que colocar en formato "%d-%m-%Y"
# Si la fecha fuese por ejemplo 2020.08.05, tendríamos que colocar en formato "%Y.%m.%d"

# ----------------------- #
# Aplicación 4: Empleados #
# ----------------------- #

empleados = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Empleados")
areas     = read_xlsx("Datos 04.01 - D.xlsx", sheet = "Areas")

empleados$FECHA_NACIMIENTO %>% str()
empleados %>% 
  mutate(FNAC = as.Date(FECHA_NACIMIENTO)) -> empleados
empleados$FNAC %>% str()

empleados %>% 
  mutate(EDAD = as.numeric(floor((today()-FNAC)/365)) )

empleados %>% 
  mutate(FNAC = as.Date(FECHA_NACIMIENTO),
         MNAC = month(FNAC),
         EDAD = ((today()-FNAC)/365) %>% floor() %>% as.numeric()) %>% 
  select(-FECHA_NACIMIENTO) -> empleados

inner_join(empleados,areas) 
empleados %>% inner_join(areas)
empleados %>% inner_join(areas) -> datos_total

View(left_join(empleados,areas))
empleados %>% left_join(areas) %>% View()

empleados %>% right_join(areas) %>% View()

empleados %>% full_join(areas) %>% View()


