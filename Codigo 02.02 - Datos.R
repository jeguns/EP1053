

# Asignación de variables -------------------------------------------------

x = 3
x <- 3
y = 36 - 9 *2 + 5^2
z = 'hola'
94-62 -> R # FORMA 1
R <- 94-62 # FORMA 2
R = 94-62 # FORMA 3
(u = 5+4**2)


# Datos enteros -----------------------------------------------------------

x = 4L
typeof(x)
is.integer(x)
y = 4
typeof(y) # float
is.integer(y)

# Datos de tipo double ----------------------------------------------------

x = 36
typeof(x)
is.integer(x)
is.double(x)

(y = 40.3 - sqrt(41) + log10(100))
(40.3 - sqrt(41) + log10(100) -> y)
typeof(y)
is.integer(y)
is.double(y)

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

w = 10+0i
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

a = FALSE
typeof(a)
is.integer(a)
is.double(a)
is.complex(a)
is.logical(a)

d <- 3 == 5.2 # Booleano
is.logical(d)
e = 4.6 <= 8.1
12 > 3.5 -> f

# Datos caracter ----------------------------------------------------------

p = "Universidad Agraria"
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)
q = '70096321'
typeof(q)