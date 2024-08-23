a = 3L
b = 3
d = T
e = "RRR"
f = 1 + 4i

typeof(a)
typeof(b)
typeof(d)
typeof(e)
typeof(f)

class(a)
class(b)
class(d)
class(e)
class(f)

str(a)
str(b)
str(d)
str(e)
str(f)

x = c(1,1,1,1)
r = list(3,4,5,c(3,4,4))
y = matrix(rep(1,6),ncol=3)
z = data.frame(x1=rep(3,4),x2=letters[1:4])
typeof(x)
typeof(r)
typeof(y)
typeof(z)
class(x)
class(r)
class(y)
class(z)
str(x)
str(y)
str(r)
str(z)

is.matrix(x)
is.matrix(r)
is.matrix(y)
is.matrix(z)
