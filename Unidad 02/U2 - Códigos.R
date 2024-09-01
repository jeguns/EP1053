
# TIPOS DE DATOS ESTRUCTURADOS --------------------------------------------

## INTEGER -----------------------------------------------------------------

x = 4L
typeof(x)
is.integer(x)

y = 4
typeof(y)
is.integer(y)

## DOUBLE ------------------------------------------------------------------

x = 36
typeof(x)
is.integer(x)
is.double(x)

y = 40.3
typeof(y)
is.integer(y)
is.double(y)


## COMPLEX -----------------------------------------------------------------

z = 1 + 2i
typeof(z)
is.integer(z)
is.double(z)
is.complex(z)

t = 1i
typeof(t)
is.integer(t)
is.double(t)
is.complex(t)

w = 10 + 0i
typeof(w)
is.integer(w)
is.double(w)
is.complex(w)

v = 10
typeof(v)
is.integer(v)
is.double(v)
is.complex(v)

## LOGICAL -----------------------------------------------------------------

a = TRUE
typeof(a)
is.integer(a)
is.double(a)
is.complex(a)
is.logical(a)

3 == 5.2
4.6 <= 8.1
12 > 3.5
5 != 8
b = (4 == 5)

## CHARACTER ---------------------------------------------------------------

p = 'Universidad Agraria'
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)

q = '70096321'

s = 'R is a free software environment for statistical computing and graphics. To download R, please choose your preferred CRAN mirror.'

# ESTRUCTURAS DE DATOS ----------------------------------------------------

## VECTOR ATÓMICO --------------------------------------------------------

x1 = c(3,4,5,12,3.4)
typeof(x1)
str(x1)
is.double(x1)
is.atomic(x1)
x1[1]
x1[1:3]
x1[c(1:3)]
x1[c(1,2,3)]
x1[-2]
x1[-c(1:3)]
x1[3.12]

y1 = c(FALSE, 5L, 6.3, 'abc123')
typeof(y1)
str(y1)
is.double(y1)
is.atomic(y1)
y1[3]

## LISTA -------------------------------------------------------------------

x2 = list(1L, 'a')
typeof(x2)
str(x2)
is.atomic(x2)
is.list(x2)
x2[2]
x2[[2]]
is.double(x2)
is.integer(x2)
is.character(x2)

x3 = list(1L, 2L)
is.integer(x3)

y2 = list(m = c(3,4,5), n = c(7,24,25))
typeof(y2)
str(y2)
is.atomic(y2)
is.list(y2)
y2[[2]]
y2[[2]][3]
y2$n[3]

x1
is.atomic(x1)
is.list(x1)
is.vector(x1)

y1
is.atomic(y1)
is.list(y1)
is.vector(y1)

x2
is.atomic(x2)
is.list(x2)
is.vector(x2)

y2
is.atomic(y2)
is.list(y2)
is.vector(y2)

is.atomic(x3)
is.list(x3)
is.vector(x3)


## MATRIZ ------------------------------------------------------------------

x3 = matrix(c(7,3,5,8,6,6),ncol=2)
typeof(x3)
str(x3)
is.double(x3)
is.vector(x3)
is.list(x3)
is.matrix(x3)
x3[1,2]
x3[2,]
x3[,2]
x3[c(1,3),2]
x3[2:3,2]

y3 = matrix(c(7,TRUE,5,8,1,2),nrow=3)
typeof(y3)
str(y3)
is.double(y3)
is.vector(y3)
is.list(y3)
is.matrix(y3)
y3[3,1]
y3[2,]
y3[,2]

## DATA FRAME --------------------------------------------------------------

var1 = c(4,5,3,5,3)
var2 = c('1','3','66','12','15')
x4 = data.frame(var1, var2)
typeof(x4)
str(x4)
is.double(x4)
is.vector(x4)
is.list(x4)
is.matrix(x4)
is.data.frame(x4)
x4[1,2]
x4[2,]
x4[,2]
x4$var1
x4$var2[3]


## ARRAY -------------------------------------------------------------------

(A1 = c(1,3,4,10,10,20,2,1))
str(A1)

(B1 = array(c(1,3,4,10,10,20,2,1), dim = 8))
str(B1)

(C1 = array(c(1,3,4,10,10,20,2,1), dim = c(1,8)))
str(C1)

(D1 = array(c(1,3,4,10,10,20,2,1), dim = c(8,1)))
str(D1)

(E1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,4)))
str(E1)

(F1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,2,2)))
str(F1)

(G1 = array(c(1,3,4,10,10,20,2,'1'), 
            dim = c(2,2,2),
            dimnames = list(c("Fila1","Fila2"),
                            c("Col1","Col2"),
                            c("Capa1","Capa2"))))
str(G1)


# FUNCIONES IMPORTANTES ---------------------------------------------------

## PARA MANEJO DE VECTORES ATÓMICOS ------------------

(a  = c(9,4,2,3,4))
(a1 = rep(4,3))
(a2 = seq(1,5))
(a3 = seq(1,5,0.25))
(a4 = rev(a))
(a5 = sort(a))
(a6 = unique(a))
(a7 = letters)
which(letters=="z")

## PARA MANEJO DE LISTAS ---------------------------------------------------

b1 = list(x = 4L, y = TRUE, 5-3i)
names(b1)
unlist(b1)
lapply(b1,"as.numeric") 
sapply(b1,"as.numeric") 

b2 = list(x = c("r","a","f"), y = TRUE, z = list(0,1))
names(b2)
unlist(b2)
lapply(b2, "as.character") 

## PARA MANEJO DE MATRICES -------------------------------------------------

c1 = matrix(c(5,6,3,4,3,3,1,1),ncol = 4, byrow = TRUE, dimnames = list(c("f1","f2"),c("co1","co2","co3","co4")))
dim(c1)
rownames(c1)
colnames(c1)
t(c1)
c2 = matrix(c(3,4,3,4),nrow = 2)
cbind(c1,c2)
c3 = matrix(c(3,4,3,4),ncol = 4)
rbind(c1,c3)


# EJEMPLO DE DATOS SEMIESTRUCTURADOS --------------------------------------

# Datos de empleados en una empresa

empleados <- list(
  empleado_1 = list(
    id = 201,
    nombre = "Carlos",
    departamento = "Ventas",
    salario = 45000,
    certificaciones = c("Ventas Avanzadas", "CRM")
  ),
  empleado_2 = list(
    id = 202,
    nombre = "María",
    departamento = "Recursos Humanos",
    salario = 52000,
    certificaciones = c("Gestión del Talento", "Legislación Laboral")
  ),
  empleado_3 = list(
    id = 203,
    nombre = "Luis",
    departamento = "Tecnología",
    salario = 60000,
    certificaciones = c("Python", "Seguridad Informática")
  )
)

# Accediendo al nombre del segundo empleado
empleados$empleado_2$nombre

# Accediendo al departamento del primer empleado
empleados$empleado_1$departamento

# Accediendo a las certificaciones del tercer empleado
empleados$empleado_3$certificaciones

# Añadir una nueva certificación al primer empleado
empleados$empleado_1$certificaciones <- c(empleados$empleado_1$certificaciones, "Estrategias de Ventas")

# Mostrar las certificaciones actualizadas del primer empleado
empleados$empleado_1$certificaciones

