
# -------- #
# GRÁFICAS #
# -------- #

Vacunas = read_csv("vacunas_covid_2021-03-16.csv")

Vacunas %>% 
  mutate(GRUPO_RIESGO     = GRUPO_RIESGO %>% as.factor,
         SEXO             = SEXO %>% as.factor,
         FABRICANTE       = FABRICANTE %>% as.factor,
         DIRESA           = DIRESA %>% as.factor,
         DEPARTAMENTO     = DEPARTAMENTO %>% as.factor,
         PROVINCIA        = PROVINCIA %>% as.factor,
         DISTRITO         = DISTRITO %>% as.factor,
         FECHA_CORTE      = FECHA_CORTE %>% ymd,
         FECHA_VACUNACION = FECHA_VACUNACION %>% ymd,
         DIASDESDE        = (today()-FECHA_VACUNACION) %>% as.numeric,
         DOSIS            = DOSIS %>%  as.factor %>% fct_recode(Primera="1",Segunda="2")) -> VacunasOK


# Para variables cualitativas ---------------------------------------------

VacunasOK %>% 
  select(SEXO) %>% 
  table() %>% 
  barplot()

VacunasOK %>% 
  select(SEXO) %>% 
  table() %>% 
  barplot(col=c("forestgreen","gold"))

VacunasOK %>% 
  select(SEXO) %>% 
  table() %>% 
  barplot(col  = c("forestgreen","gold"),
          main = "Distribución de dosis por sexo",
          cex.axis = 0.75)

VacunasOK %>% 
  select(SEXO) %>% 
  table() -> Tabla
Tabla %>% 
  barplot(col  = c("forestgreen","gold"),
          main = "Distribución de dosis por sexo",
          cex.axis = 0.75) -> Grafico
Grafico %>% text(y=Tabla-40000,labels = as.character(Tabla))


VacunasOK %>% 
  select(SEXO) %>% 
  table() %>% 
  pie()

VacunasOK %>% 
  select(SEXO) %>% 
  table() %>% 
  pie(col  = c("forestgreen","gold"),
      main = "Distribución de dosis por sexo",
      cex.axis = 0.75)

library(waffle)

VacunasOK %>% 
  filter(DISTRITO=="CHACLACAYO" & EDAD>50) %>% 
  select(FABRICANTE) %>% 
  table() %>% 
  waffle(rows = 20, colors = c("darkblue", "gold"),
       title = 'Dosis aplicadas en el distrito de Chaclacayo', legend_pos="bottom")

VacunasOK %>% 
  filter(DISTRITO=="CHACLACAYO" & EDAD<=50) %>% 
  select(FABRICANTE) %>% 
  table() %>% 
  waffle(rows = 20, colors = c("darkblue", "gold"),
         title = 'Dosis aplicadas en el distrito de Chaclacayo', legend_pos="bottom", size=0) 

# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf



# Para variables cuantitativas --------------------------------------------

VacunasOK %>% 
  select(EDAD) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist()

VacunasOK %>% 
  select(EDAD) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist(col  = "deeppink1",
       freq = FALSE,
       main = "Distribución de dosis por edad de la persona vacunada",
       xlab = "Edad",
       ylab = "Densidad")

VacunasOK %>% 
  filter(SEXO=="FEMENINO" & DISTRITO == "VILLA EL SALVADOR" & EDAD > 50) %>% 
  select(DIASDESDE) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  hist(col  = "lightseagreen",
       freq = FALSE,
       main = "Distribución de dosis desde el último día de vacunación",
       xlab = "Edad",
       ylab = "Densidad")

VacunasOK %>% 
  select(EDAD) %>% 
  boxplot()

VacunasOK %>% 
  select(EDAD) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución de dosis según edad de la persona vacunada",
          ylab = "Edad")

VacunasOK %>% 
  filter(GRUPO_RIESGO=="ADULTO MAYOR" & DEPARTAMENTO != "LIMA") %>% 
  select(EDAD) %>% 
  boxplot(col  = "turquoise",
          main = "Distribución de dosis según edad del adulto mayor vacunado",
          ylab = "Edad")

VacunasOK %>% 
  select(EDAD) %>% 
  filter(!is.na(EDAD)) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  density() %>% 
  plot(main = "Distribución de dosis según edad de la persona vacunada",
       xlab = "Edad",
       ylab = "Densidad")

VacunasOK %>% 
  filter(GRUPO_RIESGO=="PERSONAL DE SALUD" & DEPARTAMENTO != "LIMA") %>% 
  select(EDAD) %>% 
  filter(!is.na(EDAD)) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  density() %>% 
  plot(main = "Distribución de dosis según edad de la persona vacunada",
       xlab = "Edad",
       ylab = "Densidad")


VacunasOK %>% 
  filter(GRUPO_RIESGO=="PERSONAL DE SALUD" & DEPARTAMENTO != "LIMA") %>% 
  select(EDAD) %>% 
  as.matrix() %>% 
  as.vector() %>% 
  fdt(start=18,end=78,h=10,right=FALSE) %>% 
  plot(type = "cfp",
       col  = "darkblue",
       pch  = 18,
       xlab = "Edad",
       ylab = "Cantidad de dosis",
       main = "Distribución acumulada de dosis por edad")
