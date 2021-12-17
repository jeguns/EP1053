

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


  