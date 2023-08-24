

##############################################################################
# CBIT200 PROGRAMACIÓN Y ANÁLISIS DE DATOS AMBIENTALES MEDIANTE SOFTWARE LIBRE
# TAREA 0
# by Natalia Reyes E.
##############################################################################


# EJERCICIO 1:
# Cree una nueva variable que contenga un vector con 10 números aleatorios

v = c(sample(1:50,10,replace = F))
cat("El resultado es el vector v= (",v,")")
class(v)


# EJERCICIO 2:
# Multiplíquela por seis.

r = v*6
cat("El resultado es el vector r= (",r,")")


# EJERCICIO 3:
# Cree una segunda variable que contenga una secuencia de 5 caracteres

n = c("a","b","c","d","e")
cat("El resultado es el vector n= (",n,")")

# Otra solución
l = letters[1:5]
cat("El resultado es el vector n= (",l,")")

# Otra solución
i = sample(5)
i = letters[i]
i


# EJERCICIO 4:
# Combine las dos variable en una sola variable

m = paste0(r,n)
cat("El resultado es el vector m= (",m,")")
class(m)

let = paste0(letters, LETTERS)
let

let2 = c(letters, LETTERS)
let2

# EJERCICIO 5:
# ¿Cuál es el largo de esta última variable creada?
length(m)
cat("El largo de la variable es", length(m))

length(letters)
length(let)
length(let2)


# EJERCICIO 6:
# ¿De qué tipo es esta variable?
class(m)
cat("Esta variable es un vector conformado por elementos tipo ", class (m))


# EJERCICIO 7:
# ¿Qué sucede si divide esta última variable por 3?

m/3
cat("Aparece un error dado que los argumentos del operador binario división no son numéricos")


# EJERCICIO 8:  
# Cree un vector con los elementos 1 2 3 4 5 6 y llámelo x

x = c(1,2,3,4,5,6)
cat("Nuevo vector creado: x= (",x,")")


# EJERCICIO 9:
# Cree un nuevo vector con los elementos 10 20 30 40 50 y llámelo y

y = c(10,20,30,40,50)
cat("Nuevo vector creado: y= (",y,")")


# EJERCICIO 10:
# ¿Qué ocurre si intenta sumar x e y? explique

x+y
cat("Suma los elementos de los vectores según su respectiva posición.","\n","Si aún quedan elementos para sumar en uno de los vectores,","\n","empieza a repetir los valores del vector más corto.","\n","No sin antes dar un mensaje de advertencia sobre el largo de los objetos:","\n","In x + y : longer object length is not a multiple of shorter object length")


# EJERCICIO 11:
# Agregue el valor 60 al vector y (ayuda: puedes usar la función c())

y = c(y,60)
cat("El resultado es el nuevo vector y= (",y,")")


# EJERCICIO 12:
#sume x e y

x+y
cat("El resultado es el vector (",x+y,")")


# EJERCICIO 13:
# Multiplique x e y

x*y
cat("El resultado es el vector (",x*y,")")


# EJERCICIO 14:
# Cree un data.frame con el mínimo código posible usando los datos de la siguiente imagen y llámelo z:

z = data.frame(
  Numero = c(5,4,3,1,2),
  Letra = c("S","L","B","Q","A"),
  Medida = c(49.59, 91.84, 49.32, 72.25, 65.51)
)

#Otra solución
z = data.frame("Numero"=c(5,4,3,1,2),"Letra"=c("S","L","B","Q","A"),"Medida"=c(49.59,91.84,49.32,72.25,65.51))

print(z)

# EJERCICIO 15:
# Cree un dataframe de datos ficticios que represente una muestra de 100 individuos de aves y su tamaño corporal. Use 4 tipos de aves: un paseriforme, un columbiforme, un rapaz y trochiliformes en aproximadamente las mismas proporciones. (Averigue el real tamaño promedio de cada grupo)


# Creamos vectores con las especies de aves muestreadas y tamaños corporales ficticios
tipo = c("Paseriforme", "Columbiforme", "Rapaz", "Trochiliforme")
especie = c(Paseriforme="Zonotrichia capensis",Columbiforme="Zenaida auriculata",Rapaz="Daptrius chimango",Trochiliforme="Sephanoides fernandensis")
nombre_comun = c(Paseriforme="Chincol",Columbiforme="Torcaza",Rapaz="Tiuque",Trochiliforme="Picaflor de Juan Fernández")
tamanos_promedio_cm = c(Paseriforme=14, Columbiforme=25, Rapaz=40, Trochiliforme=11)

# Generamos una muestra de 100 individuos de estas especies
set.seed(904)  # Para reproducibilidad de resultados
aves = sample(tipo, 100, replace = TRUE)

muestras <- data.frame(
  tipo_de_ave = aves,
  especie = especie[aves],
  nombre_comun = nombre_comun[aves],
  tamaño = round(rnorm(100, tamanos_promedio_cm[aves], 2), 1)
)

print(muestras)
head(muestras,15)


# EJERCICIO 16:
# Grafique los tamaños corporales de cada grupo (ayuda: puede usar graficos de distribuciones, caja y bigote o bien de violín)

library(ggplot2)


##GRAFICO DE CAJA
ggplot(muestras,
       aes(x = tipo_de_ave, y = tamaño, colour = tipo_de_ave,
           fill = tipo_de_ave)) + # Rellenos diferentes para cada nivel
  geom_boxplot(alpha = 0.5) + # Un poco de transparencia al relleno
  geom_point(size = 3, alpha = 0.3) +
  xlab("Tipos de Aves Muestreadas") +
  ylab("Tamaño [cm]") +
  theme_classic() +
  theme(legend.position = "none") # Removemos la leyenda


##GRAFICO DE VIOLIN
ggplot(muestras,
       aes(x = tipo_de_ave, y = tamaño, colour = tipo_de_ave,
           fill = tipo_de_ave)) + # Rellenos diferentes para cada nivel
  geom_violin(alpha = 0.5) + # Un poco de transparencia al relleno
  geom_point(size = 3, alpha = 0.3) +
  xlab("Tipos de Aves Muestreadas") +
  ylab("Tamaño [cm]") +
  theme_classic() +
  coord_flip() + # This switch X and Y axis and allows to get the horizontal version
  theme(legend.position = "none") # Removemos la leyenda


##GRAFICO DE DISTRIBUCION

library(dplyr)
library(hrbrthemes)

# Represent it
p <- muestras %>%
  ggplot( aes(x=tamaño, fill=tipo_de_ave)) +
  geom_histogram( color="#e9ecef", alpha=0.6, position = 'identity') +
  scale_fill_manual(values=c("#69b3a2", "#404080","violetred","violet")) +
  xlab("Tamaño[cm]") +
  ylab("Cantidad de Individuos") +
  theme_classic() +
  labs(fill="")
p


