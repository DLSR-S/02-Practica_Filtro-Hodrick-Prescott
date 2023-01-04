rm(list=ls())
#Libreria para leer excel.
library(readr)
#Cargo el csv con información de 1993 a 2019.
MEXD <- read_csv("MEXD.csv")
attach(MEXD)
###==========================================================================###
#Regresión líneal de las actividades económicas de México.
m1 <- lm(productoint~
          actprim+
          actsec+
          actterc)
#Resultados de la regresión lineal.
summary(m1)
###==========================================================================###
#Libreria para habilitar la función hpfilter (el filtro Hodrick Presckott)
library(mFilter)
product.hp<- hpfilter(productoint,
                      freq=800,
                      type=c("lambda","frequency"),
                      drift=FALSE)
summary(product.hp)
plot(product.hp)
###==========================================================================###

