# ----------------------------------------------------------
# Clase 04 - Script Manipulación de datos con tidyr y dplyr
# Dr. José Gallardo Matus
# 29 marzo 2022
# DBT 845 - Investigación reproducible y análisis de datos biotecnológicos con R.
# ----------------------------------------------------------

# Habilita librerías
library(readxl) # Para importar datos a R

library(dplyr) # Para manipular datos

library(ggplot2) # Para hacer gráficos

library(tidyr) # Para manipular datos

# LIBRERÍA DPLYR: EL OPERADOR PIPE (TUBERÍA).

# dplyr usa el operador pipe %>% como una tubería para enlazar un data.frame con una o más funciones.

x <- rnorm(5)
y <- rnorm(5)
dat <- data.frame(x,y)
dat
max(dat) 
dat %>% max
dat %>% arrange(y) # Ordena filas de un data.frame por el valor de alguna columna

# Importar messy datos
messy <- read_excel("Peces.xlsx") # Carga el set de datos
summary(messy)

# Importar messy datos con datos faltantes
messy <- read_excel("Peces.xlsx", na="NA")
summary(messy)
head(messy)  # Muestra los primeros datos del data set

# Filtrar variable peso con tubería
messy %>% filter(Variable == "peso")

# Colapsar columna Especie
messy %>% filter(Variable == "peso") %>% gather("Especie","Peso",3:5)

# Crear objeto Peso
Peso <- messy %>% filter(Variable == "peso") %>% gather("Especie","Peso",3:5)

# Eliminar columna "variable" y renombrar variable réplica.
Peso <- Peso[,-1]
colnames(Peso)[1] <- "peces"
Peso$peces <- c(1:9)
head(Peso) 

# EJERCICIO 
# Usando el objeto messy cree un objeto llamado Parasitos y ordene los datos de parásitos en formato TIDY.


# Unir Objetos Peso, Parasitos y Sexo.
sexo <- read_excel("Peces.xlsx", sheet = 2)
head(sexo)
data <- left_join(Peso, Parasitos, "peces")
tidy_data <- left_join(data, sexo, "peces")
head(tidy_data)

# Eliminar y transformar columnas.
tidy_data <- tidy_data[,-4] 
colnames(tidy_data)[2] <- "Especie"
tidy_data <- tidy_data[, c(1, 2, 5, 3, 4)]
head(tidy_data)

# FUNCIÓN SELECT()
# Permite extraer o seleccionar variables/columnas específicas de un data.frame.
select(tidy_data, Especie, Sexo)

# FUNCIÓN SELECT() CON PIPE
tidy_data %>% select(Especie, Sexo)

# FUNCIÓN FILTER() CON PIPE
# **filter()**: Para filtrar desde una tabla de datos un subconjunto de filas.
# Ej. solo un nivel de de un factor, observaciones que cumplen algún criterio (ej. > 20).
tidy_data %>% filter(Sexo == "Macho")

# MÚLTIPLES FUNCIONES Y TUBERÍAS
tidy_data %>% select(Especie, Sexo, Peso) %>% 
  filter(Sexo == "Macho")

# FUNCIÓN SUMMARIZE()
tidy_data %>% select(Especie, Sexo, Peso) %>% 
          summarize(n = n(), 
                    Promedio_Peso = mean(Peso), 
                    Maximo_Peso = max(Peso))

# FUNCIÓN SUMMARIZE() removiendo NA
tidy_data %>% select(Especie, Sexo, Peso) %>% 
  summarize(n = n(), 
            Promedio_Peso = mean(Peso, na.rm=T), 
            Maximo_Peso = max(Peso, na.rm=T))


# FUNCIÓN SUMMARIZE() + GROUP_BY()
# Permite agrupar filas con base a los niveles de alguna variable o factor.
tidy_data %>% group_by(Especie) %>% 
          summarize(n = n(), 
            Promedio_Peso = mean(Peso, na.rm=T), 
            Maximo_Peso = max(Peso, na.rm=T))

# EJERCICIO
# Usando tidy_data calcule n, promedio y desviación estándar de parasitos por especie.


# FUNCIÓN MUTATE()
# Permite calcular nuevas variables "derivadas", ej. proporciones, tasas, log.
tidy_data %>% select(Especie, Peso, parasitos) %>% 
  mutate(Densidad_parasitos = parasitos/Peso)

# EJERCICIO
# Usando mutate() genere las variables derivadas logaritmo del peso y log+1 del número de parásitos.

# HACER PLOT CON GGPLOT2
ggplot(tidy_data, aes(x=Peso, y=parasitos))+
  geom_point(size= I(2))+
  labs(x= "Peso(g)", y= "Número de parásitos")+
  theme_bw()

# EJERCICIO
# Realice un gráfico de puntos para visualizar la relación entre el log+1 de parásitos en función del logaritmo del peso.









# RESPUESTA ORDENAR PARASITOS
# Filtrar variable parasitos con tubería
messy %>% filter(Variable == "parasitos")
# Colapsar columna Especie
messy %>% filter(Variable == "parasitos") %>% gather("Especie","parasitos",3:5)
# Crear objeto Parasitos
Parasitos <- messy %>% filter(Variable == "parasitos") %>% gather("Especie","parasitos",3:5)
# Eliminar columna "variable" y renombrar variable réplica.
Parasitos <- Parasitos[,-1]
colnames(Parasitos)[1] <- "peces"
Parasitos$peces <- c(1:9)
