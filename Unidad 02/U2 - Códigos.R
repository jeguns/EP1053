
# TIPOS DE DATOS ----------------------------------------------------------

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




