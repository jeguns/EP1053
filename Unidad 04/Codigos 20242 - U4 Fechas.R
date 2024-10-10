fechas1 <- c("2023-05-01", "2023-05-02", "2023-05-03", "2023-05-04", "2023-05-05","2023-05-12")
fechas2 <- c("01/05/23", "02/05/23", "03/05/23", "04/05/23", "05/05/23", "12/05/23")
fechas3 <- c("01/May/2023", "02/May/2023", "03/May/2023", "04/May/2023", "05/May/2023", "12/May/2023")
datos   <- data.frame(fechas1, fechas2, fechas3)
datos |> str()

library(dplyr)
datos |> 
  mutate(f1 = as.Date(fechas1),
         f2 = as.Date(fechas2, format = c("%d/%m/%y")),
         f3 = as.Date(fechas3, format = c("%d/%b/%Y"))) -> datos1
datos1 |> str()

# Símbolos
# %d	día (numérico, de 0 a 31)
# %a	día de la semana abreviado a tres letras
# %A	día de la semana (nombre completo)
# %m	mes (numérico de 0 a 12)
# %b	mes (nombre abreviado a tres letras)
# %B	mes (nombre completo)
# %y	año (con dos dígitos)
# %Y	año (con cuatro dígitos)

library(lubridate)
datos |> 
  mutate(f1 = ymd(fechas1),
         f2 = dmy(fechas2),
         f3 = dmy(fechas3)) -> datos2
datos2 |> str()

datos2 |> 
  mutate(dia       = day(fechas1),
         diasemana = wday(fechas1, week_start = 1),
         mes       = month(fechas1),
         año       = year(fechas1),
         trim      = quarter(fechas1),
         semana    = week(fechas1))

"01/01/1970" |> dmy() |> as.numeric()
"02/01/1970" |> dmy() |> as.numeric()
"10/05/2023" |> dmy() |> as.numeric()
"12/05/2023" |> dmy() |> as.numeric()
"01/01/1969" |> dmy() |> as.numeric()

a = "20/05/2024"
b = "23/05/2024"
r = dmy(b) - dmy(a)
str(r)
r = r |> as.numeric()
str(r)
