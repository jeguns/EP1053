y3 = matrix(c(7,TRUE,5,8,1,2),nrow=3)
typeof(y3)
str(y3)
is.double(y3)
is.vector(y3)
is.list(y3)
is.matrix(y3)
y3[3,1]
y3[2, ]
y3[ ,2]

var1 = c(4,5,3,5,3)
var2 = c('1','3','66','12','15')
x4 = data.frame(var1, var2)
str(x4)
typeof(x4)
typeof(var2)
typeof(x4$var2) # var2 es el nombre de la col
typeof(x4[,2]) # [,2] es la 2da col
typeof(x4[[2]]) # [[2]] es la 2da col
is.double(x4)
is.vector(x4)
is.list(x4)
is.matrix(x4)
is.data.frame(x4)
x4$var2[3]
# tercera posición del vector atómico
# que resulta de extraer la variable var2
# del data frame x4.

x = 5 # asigna
(x = 5) # asigna e imprime
A1 = c(1,3,4,10,10,20,2,1)
A1
(A1 = c(1,3,4,10,10,20,2,1))
(A1 = c(1,3,4,10,10,20,2,1));str(A1)
(B1 = array(c(1,3,4,10,10,20,2,1), dim = 8))
str(B1)
(C1 = array(c(1,3,4,10,10,20,2,1), dim = c(1,8))); str(C1)
(D1 = array(c(1,3,4,10,10,20,2,1), dim = c(8,1))); str(D1)
(E1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,4))); str(E1)
(F1 = array(c(1,3,4,10,10,20,2,1), dim = c(2,2,2)));str(F1)
(G1 = array(c(1,3,4,10,10,20,2,'1'), 
            dim = c(2,2,2),
            dimnames = list(c("Fila1","Fila2"),
                            c("Col1","Col2"),
                            c("Capa1","Capa2"))))
(D1 = array(c(1,3,4,10,10,20,2,1), dim = c(5,2))); str(D1)

(a  = c(9,4,2,3,4))
(a1 = rep(4,3))
(a2 = seq(1,5))
(a3 = seq(1,5,0.25))
(a4 = rev(a))
(a5 = sort(a))
(a6 = unique(a))
(a8 = rev(sort(a)))
(a9 = sort(a,decreasing = TRUE))
(a7 = letters)
typeof(letters)
str(letters)
LETTERS
(y = c(LETTERS,'Ñ'))
(y = c(LETTERS[1:14],'Ñ',LETTERS[15:26]))
which(letters=="z")

P = c(1,5,8,6,5,4,5,2,6,'6')
which(P == 6)
which(P == '6') # COERCIÓN IMPLÍCITA
str(P)
which(P == 12)

b1 = list(x = 4L, y = TRUE, 5-3i)
names(b1)
x20 = unlist(b1)
x20
str(x20)
lapply(b1,"as.numeric") 
sapply(b1,"as.numeric") 

b2 = list(x = c("r","a","f"), 
          y = TRUE, 
          z = list(0,1))
names(b2)
unlist(b2)
lapply(b2, "as.character") 

c1 = matrix(c(5,6,3,4,3,3,1,1),ncol = 4, 
            byrow = TRUE, 
            dimnames = list(c("f1","f2"),
                            c("co1","co2","co3","co4")))
dim(c1)
m = dim(c1)
str(m)
rownames(c1)
colnames(c1)
t(c1) # transpuesta de la matriz c1
c2 = matrix(c(3,4,3,4),nrow = 2)
cbind(c1,c2)
c3 = matrix(c(3,4,3,4),ncol = 4)
rbind(c1,c3)
