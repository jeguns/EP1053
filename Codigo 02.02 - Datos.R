

# Datos enteros -----------------------------------------------------------

x = 4L
typeof(x)
is.integer(x)

y = 4
typeof(y)
is.integer(y)

# Datos flotantes ---------------------------------------------------------

x = 36
typeof(x)
is.integer(x)
is.double(x)

y = 40.3
typeof(y)
is.integer(y)
is.double(y)

z = exp(4)
typeof(z)
is.integer(Z)
is.double(Z)


# Datos numéricos ---------------------------------------------------------


a = 4L
b = 4
is.numeric(a)
is.numeric(b)
c = 4+4i
is.numeric(c)

# Datos complejos ---------------------------------------------------------

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

sqrt(-1)

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


# Datos lógicos -----------------------------------------------------------

(a = FALSE)
typeof(a)
is.integer(a)
is.double(a)
is.complex(a)
is.logical(a)

3 == 5.2
4.6 <= 8.1
12 > 3.5
5 != 8
(w = 5 != 8) # el símbolo igual significa asignación
(w <- 5 != 8)
(5 != 8 -> w)
5 != 8 -> w
typeof(w) 


# Datos caracter o cadena -------------------------------------------------

(p = 'Universidad Agraria')
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)
q = '70096321'
is.character(q)
r = 70096321
is.character(r)
is.double(r)

# Coerción ----------------------------------------------------------------

(A = TRUE + 2L)
typeof(A)

(B = 2L + 36.25)
typeof(B)

(C = '997658733')
typeof(C)

C = paste0("Tengo ",25L," años")
typeof(C)

D = 5L
as.integer(D)
as.complex(D)
as.double(D)
as.character(D)


# Vectores atómicos -------------------------------------------------------

x1 = c(3,4,5,12,3.4)
typeof(x1)
str(x1) # estructura 
is.double(x1)
is.atomic(x1)
is.complex(x1)
is.logical(x1)
x1[1]
x1[1:3]
x1[c(1:3)]
x1[c(1,2,3)]
x1[-2]
x1[-c(1:3)]

a1 = c(11,11,11,11,11)
is.atomic(a1)
a2 = rep(11,5)
a1
a2
a3 = c(1,2,3,5,6,6,6,6,6,7,10)
a3 = c(1:3,5,rep(6,5),7,10)
a3
a3[c(1,5,8)]

y1 = c(FALSE, 5L, 6.3, 'abc123')
typeof(y1)
str(y1)
is.double(y1)
is.atomic(y1)
y1[3]
is.double(y1[3])

a4 = c(FALSE, 5L, 6.3)
typeof(a4)
a4[3]
is.double(a4[3])


# Listas ------------------------------------------------------------------

x2 = list(1L, 'a')
typeof(x2)
str(x2)
is.atomic(x2)
is.list(x2)
x2[2]
x2[[2]]
x2[[[2]]] # ERROR
typeof(x2[2])
typeof(x2[[2]])
is.double(x2)
is.integer(x2)
is.character(x2)

a5 = list(2,3,4)
is.double(a5)
typeof(a5)

x3 = list(1L, 2L)
is.integer(x3)

y2 = list(m = c(3,4,5), n = c(7,24,25))
typeof(y2)
str(y2)
is.atomic(y2)
is.list(y2)
y2[2]
y2[[2]]
typeof(y2[2])
typeof(y2[[2]])
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

x3
is.atomic(x3)
is.list(x3)
is.vector(x3)

y2
is.atomic(y2)
is.list(y2)
is.vector(y2)

# Matrices ----------------------------------------------------------------

x3 = matrix(c(7,3,5,8),ncol=2)
x3
print(x3)
matrix(c(rep(1,16)),ncol=4)
matrix(rep(1,16),ncol=4)
typeof(x3)
str(x3)
is.double(x3)
is.vector(x3)
is.list(x3)
is.matrix(x3)
x3[2] # no tiene mucha utilidad
x3[1,2] # fila 1 y columna 2
x3[2,] # fila 2
x3[,2] # columna 2

a6 = matrix(c(1,4,1,0,3,7,6,10,2),ncol=3)
a6[2,1]
a6[3,2]
c(a6[2,1],a6[3,2])
a6[c(2,3),c(1,2)]

y3 = matrix(c(7,TRUE,5,8,1,2),nrow=3)
typeof(y3)
y3 = matrix(c(7,TRUE,5,8,1,2),nrow=3,byrow=TRUE)
str(y3)
is.double(y3)
is.vector(y3)
is.list(y3)
is.matrix(y3)
y3[3,1]
y3[2,]
y3[,2]


# Data frames -------------------------------------------------------------

var1 = c(4,5,3,5,3)
var2 = c('1','3','66','12','15')
var3 = rep(5,5)
var4 = c(1i,2+4i,6i,1i,5+9i)
x4 = data.frame(var1, var2, var3, var4)
x4
typeof(x4)
str(x4)
is.double(x4)
is.vector(x4)
is.list(x4)
is.matrix(x4)
is.data.frame(x4)
x4[1,2]
x4[2,] # fila 2
x4[,2] # columna 2
x4$var1 # extraigo la variable var1
x4$var2[3]

