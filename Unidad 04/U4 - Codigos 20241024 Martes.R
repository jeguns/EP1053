library(readxl)
read_excel('04 - DATOS - 03.xlsx', sheet = 1) -> empleados
read_excel('04 - DATOS - 03.xlsx', sheet = 2) -> areas
library(dplyr)
empleados |> inner_join(areas)
empleados |> left_join(areas)
empleados |> right_join(areas)
empleados |> full_join(areas)
empleados |> full_join(areas, by = c("AREA"="AREA"))
empleados |> full_join(areas, by = "AREA")

fechas1 <- c("2023-05-01", "2023-05-02", "2023-05-03", "2023-05-04", "2023-05-05","2023-05-12")
fechas2 <- c("01/05/23", "02/05/23", "03/05/23", "04/05/23", "05/05/23", "12/05/23")
fechas3 <- c("01/May/2023", "02/May/2023", "03/May/2023", "04/May/2023", "05/May/2023", "12/May/2023")
datos   <- data.frame(fechas1, fechas2, fechas3)
datos |> str()

datos |> 
  mutate(f1 = as.Date(fechas1),
         f2 = as.Date(fechas2, format = c("%d/%m/%y")),
         f3 = as.Date(fechas3, format = c("%d/%b/%Y"))) -> datos1
datos1 |> str()

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

week(dmy(291024))
291024 |> dmy() |> week()

((dmy(291024) - dmy(291023))/7) |> as.numeric()

"01/01/1970" |> dmy() |> as.numeric()
"02/01/1970" |> dmy() |> as.numeric()
"10/07/1956" |> dmy() |> as.numeric()
"10/07/1256" |> dmy() |> as.numeric()
"01/01/1000" |> dmy() |> as.numeric()
"31/12/0999" |> dmy() |> as.numeric()
"31/12/0009" |> dmy() |> as.numeric()
"31/12/0001" |> dmy() |> as.numeric()
"01/01/0000" |> dmy() |> as.numeric()
"01/01/0052" |> dmy() |> as.numeric()

a = "20/05/2024"
b = "23/05/2024"
r = dmy(b) - dmy(a)
str(r)
r = r |> as.numeric()
str(r)

