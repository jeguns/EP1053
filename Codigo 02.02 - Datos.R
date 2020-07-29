
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

(R = 3 == 5.2) # ¿3=5.2?
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

(x1 = c(3, 4, 5, 12, 3.4))
typeof(x1)
str(x1)
is.double(x1)
is.logical(x1)
is.vector(x1)
is.list(x1)
x1[1] 

x1[c(1,2,5)] # Manera más general
x1[c(1,5,2)]

sort(x1) # de menor a mayor
sort(x1, decreasing = TRUE) # de mayor a menor

x1[1:4] # Similar a Excel A1:B30
x1[c(1:3)]
x1[-2]
x1[-c(1:3)]
x1[-(1:3)]

y1 = c(FALSE, 5L, 6.3, 'abc123')
typeof(y1)
str(y1)
is.double(y1)
is.vector(y1)
y1[3]

# LISTA
# Toda lista es un vector
# No todo vector es una lista

x2 = list(1L, 'a')
typeof(x2)
str(x2)
is.vector(x2)
is.list(x2)
x2[2] #crea una sublista con la segunda posición
x2[[2]] #extrae el elemento de la posición 2

y2 = list(m = c(3,4,5), n = c(7,24,25))
typeof(y2)
str(y2)
is.vector(y2)
is.list(y2)
y2[[2]]
y2$n
y2[[2]][3]
y2$n[3]
y2$m
y2$m[2]

# MATRIZ

# DATA FRAME

# ARRAY