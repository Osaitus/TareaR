# ----------------------------------------------------------
# Clase 02 - Variables aleatorias
# Dr. José Gallardo Matus
# 19 marzo 2022
# DBT 845 - Investigación reproducible y análisis de datos biotecnológicos con R.
# ----------------------------------------------------------

# ¿Cómo habilitar librerías?
library(readxl)

# ¿Cómo importar datos datos a R?
dat <- read_excel("Data.xlsx", sheet = 1)


head(dat)
mean(dat$Weight)
mean(dat$sex)
summary(dat) 

dat$sex <- as.factor(dat$sex) 
summary(dat) 





