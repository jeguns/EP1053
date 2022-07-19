
# Usando códigos de Python en RStudio

# Es necesario que haya instalado Anaconda Python
# Descárguelo aquí: https://www.anaconda.com/products/distribution

library(reticulate)

# Operación básica --------------------------------------------------------

repl_python() # activar consola de Python
x = 4.3
y = 5
z = x*y
type(x)
type(y)
type(z)
exit

py$x; py$x |> typeof()
py$y; py$y |> typeof()
py$z; py$z |> typeof()

# Paquete math y uso de pi ------------------------------------------------

repl_python() 
import math
math.pi
radio = 5
ope1  = math.pi * radio **2
ope1
type(ope1)
exit

py$ope1; typeof(py$ope1)

# Paquete math y uso del número de Euler ----------------------------------

repl_python()
math.log(math.e**2,math.e)
ope2 = math.factorial(10-7)**2 - math.comb(5,3) - 5 + math.log(math.e**5,math.e)
ope2
type(ope2)
exit

py$ope2 ;typeof(py$ope2)

# Paquete math y uso de factorial -----------------------------------------

repl_python()
x = 5
ope3 = math.factorial(x)/(x-3)
ope3
type(ope3)
exit

py$ope3; typeof(py$ope3)

# Números complejos -------------------------------------------------------

repl_python()
z1 = 7 + 12j  # complex(7, 12)
z2 = complex(14, 24)
z1
z2
ope4 = z1*z2 - 5
ope4
type(ope4)
exit

py$ope4 ;typeof(py$ope4)

# Datos lógicos -----------------------------------------------------------

repl_python()
x = 1e308
ope5 = math.inf > x
type(ope5)
exit

py$ope5 ;typeof(py$ope5)

# De lista en Python a vector atómico en R --------------------------------

repl_python()
lista_python = [20,15,28,12,11,19]
lista_python
type(c1) 
exit

py$lista_python
str(py$lista_python) 
py$lista_python |> is.atomic()
py$lista_python |> is.list()
py$lista_python |> is.vector()

# De tupla en Python a lista en R -----------------------------------------

repl_python()
tupla_python = (3,5,4,5,4,4,3,4,3,3)
tupla_python
type(tupla_python)
exit

py$tupla_python
str(py$tupla_python) 
py$tupla_python |> is.atomic()
py$tupla_python |> is.list()
py$tupla_python |> is.vector()

# De diccionario en Python a lista en R -----------------------------------

repl_python()
dic_python = {"Nombre":["Sofia","Martin","Ricardo"], 
  "Edad":[22,22,34],
  "TipoSangre":["O-","AB","O+"]}
dic_python
type(dic_python)
exit

py$dic_python
str(py$dic_python)
py$dic_python |> is.atomic()
py$dic_python |> is.list()
py$dic_python |> is.vector()
py$dic_python |> as.data.frame()

# Lectura de data frames --------------------------------------------------

repl_python()
import pandas as pd
datos = pd.read_csv('https://github.com/mwaskom/seaborn-data/raw/master/iris.csv')
datos
type(datos)
datos.sepal_length.mean()
datos.sepal_length.median()
datos.sepal_length.describe()
exit

py$datos
str(py$datos) 
py$datos |> is.data.frame()
py$datos |> is.matrix()
py$datos$sepal_length |> boxplot(col = "gray84")

# Usar variables generadas en R -------------------------------------------

r1 = ((27-35)**2)/4 + (42/(log(12))**(1/2) - factorial(12)/(factorial(6)*factorial(6)))
r1; str(r1)

repl_python()
r.r1
round(r.r1,2)
type(r.r1)
exit

r2 = exp(sum(1:15)/3 - (sum(1:5)/5)**2/3) + exp(log(factorial(6)-exp(5/4)))
r2; str(r2)

repl_python()
r.r2
type(r.r2)
