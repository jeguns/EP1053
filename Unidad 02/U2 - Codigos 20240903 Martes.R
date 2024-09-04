x = 4L
print(x)
typeof(x) # ¿Qué tipo de dato se almacena en x?
is.integer(x) # ¿En x se almacena un dato entero?

z = 4.51564L
print(z)
typeof(z) # ¿Qué tipo de dato se almacena en x?
is.integer(z) # ¿En x se almacena un dato entero?

y = 4.0
typeof(y)
is.integer(y)

x = 36
typeof(x)
is.integer(x)
is.double(x)

y = 40.3
typeof(y)
is.integer(y)
is.double(y)

a = 4L
is.integer(a)
is.numeric(a)
b = 4
is.double(b)
is.numeric(b)
r = a + b # coerción
typeof(r) 

z = 1+2i
typeof(z)
is.integer(z)
is.double(z)
is.complex(z)
is.numeric(z)

w = 10 + 0i
typeof(w)
is.integer(w)
is.double(w)
is.complex(w)

m = 10*0i # Coerción implícita
typeof(m)
n = as.double(m) # Coerción explícita
n
typeof(n)

m = 10*1i # Coerción implícita
typeof(m)
n = as.double(m) # Coerción explícita
n
typeof(n)

a = T
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
b
m = (4L == 4)
m

A1 = 4L
A2 = 4
identical(A1,A2)

p = 'Universidad Agraria'
typeof(p)
is.integer(p)
is.double(p)
is.complex(p)
is.logical(p)
is.character(p)
q = "70096321"
typeof(q)
q
s = 'R is a free software environment
for statistical computing 
and graphics. 
To download R, please choose your 
preferred CRAN mirror.'