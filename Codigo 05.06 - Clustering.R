library(readxl)
library(cluster) 
library(factoextra)
library(dplyr)
library(GGally)

# ---------------- #
# LECTURA DE DATOS #
# ---------------- #

datos2 = read_xlsx("Datos 05.05 - B.xlsx")

# ------------------------- #
# PREPROCESAMIENTO DE DATOS #
# ------------------------- #

datos2 = datos2 %>% 
  mutate_all(as.factor) %>% 
  rename("FECHA_HORA" = 1, "DISENOS" = 2, "MARCAS" = 3, "PRECIO" = 4, "FOTOS" = 5 ,
         "TIEMPO" = 6, "TIPO_PAGO" = 7, "MONEDA" = 8, "COSTO_DELIVERY" = 9, "POSVENTA" = 10, 
         "GARANTIA" = 11, "HORARIO" = 12, "WEB" = 13, "DISTRITO" = 14, "IG" = 15, 
         "FB" = 16, "TW" = 17, "SEXO" = 18, "ZONA" = 19) %>% 
  select(-FECHA_HORA) 

# --------------------- #
# ANALISIS EXPLORATORIO #
# --------------------- #

pairs(datos2, pch = 18)
ggpairs(datos2)

# ------------ #
# MODELAMIENTO #
# ------------ #

distancias = daisy(datos2, metric = c("gower"))
distancias %>% round(2)

datos2 %>% 
  slice(2,14) %>% 
  View

clustering = diana(as.matrix(distancias), diss = TRUE, keep.diss = TRUE)

plot(clustering, main = "Divisive", which.plots = 2)
rect.hclust(clustering , k = 3, border = c("red","blue","forestgreen"))

fviz_dend(clustering, cex = 1, lwd = 1.5, k = 4, palette = "jco") 

clusters = cutree(clustering, k = 3)

datos2 = datos2 %>% 
  mutate(CLUSTER = clusters)

grafico = function(x){
  x = enquo(x)
  datos2 %>% 
  group_by(CLUSTER,!! x) %>% 
  count() %>% 
  ggplot(aes(CLUSTER, n, fill = !! x, label = n)) +
  geom_col() + 
  geom_text(position = position_stack(vjust = 0.5))}

grafico(DISENOS)

