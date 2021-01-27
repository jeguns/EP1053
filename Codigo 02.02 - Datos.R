
# DATOS TIPO INTEGER

x = 4L # almacena el valor 4L (4 entero) en x
x # imprime o muestra el valor almacenado en x
print(x) # imprime o muestra el valor almacenado en x
(x = 4L) # almacena e imprime
typeof(x) # ¿cuál es el tipo de dato de x?
is.integer(x) # ¿es x un dato de tipo entero?

y = 4
typeof(y)
is.integer(y)

# DATOS TIPO DOUBLE

x = 36
typeof(x)
is.integer(x)
is.double(x)
y = 40.3
typeof(y)
is.integer(y)
is.double(y)

# DATOS TIPO COMPLEX

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
!is.complex(v)

# DATOS TIPO LOGICAL

a = TRUE
typeof(a)
is.integer(a)
is.double(a)
is.complex(a)
is.logical(a)

(3 == 5.2) # ¿3=5.2?
(R = 3 == 5.2) # ¿3=5.2? y lo almacena en el objeto R
4.6 <= 8.1
12 > 3.5

# DATOS TIPO CHARACTER

(p = 'Universidad Agraria')
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)
q = '70096321'
is.double(q)
is.character(q)
s = 'En este taller se hará uso del paquete ggplot2 para visualizar gráficamente el comportamiento de variables relacionadas al COVID-19 en nuestro país, a partir de datos extraídos de la Plataforma Nacional de Datos Abiertos y la Sala Situacional del Ministerio de Salud.'

# COERCIÓN DE DATOS

a1 = TRUE + 2L
typeof(a1)

a2 = 2L + 36.25
typeof(a2)

a3 = '997658733'
typeof(a3)

a4 = 2.25*4L
typeof(a4)

a5 = 2L + 4
typeof(a5)

as.integer(24.12)

# VECTOR

x1 = c(3,4,5,12,3.4)
typeof(x1)
str(x1)
is.double(x1)
is.vector(x1)
x1[1]
x1[1:3]
x1[c(1:3)]
x1[-2]
x1[-c(1:3)]

y1 = c(FALSE, 5L, 6.3, 'abc123')
typeof(y1)
str(y1)
is.double(y1)
is.vector(y1)
y1[3]

sort(x1) # de menor a mayor
sort(x1, decreasing = TRUE) # de mayor a menor

# LISTA
# Toda lista puede tener características de un vector
# Todo vector no necesariamente tiene las características una lista

x2 = list(1L, 'a')
typeof(x2)
str(x2)
is.vector(x2)
is.list(x2)
x2[[2]]
is.double(x2)
is.integer(x2)
is.character(x2)

x3 = list(1L, 2L)
is.integer(x3)

y2 = list(m = c(3,4,5), n = c(7,24,25))
typeof(y2)
str(y2)
is.vector(y2)
is.list(y2)
y2[[2]]
y2[[2]][3]
y2$n[3]

# MATRIZ

x3 = matrix(c(7,3,5,8),ncol=2)
typeof(x3)
str(x3)
is.double(x3)
is.vector(x3)
is.list(x3)
is.matrix(x3)
x3[1,2]
x3[2,]
x3[,2]

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


# DATA FRAME 

x4 = data.frame(var1 = c(4,5,3,5,3), var2= c('1','3','66','12','15'))
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

# ARRAY o ARREGLO

(A1 = c(1,3,4,10,10,20,2,1));str(A1)
(B1 = array(c(1,3,4,10,10,20,2,1), dim = c(8))); str(B1)
(C1 = array(c(1,3,4,10,10,20,2,1), dim = c(1,8))); str(B1)
(D1 = array(c(1,3,4,10,10,20,2,1), dim = c(8,1))); str(C1)
(E1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,4))); str(D1)
(F1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,2,2)));str(E1)
(G1 = array(matrix(c(1,3,4,10,10,20,2,1)),dim=c(2,2,2)));str(F1)
(H1 = array(matrix(c(1,3,4,10,10,20,2,'1'),ncol=2),dim=c(2,2,2)));str(G1)
x5[,,2]
is.matrix(x5[,,2])
x5[,,2][1,3]
is.vector(x5[,,2][1,3])
