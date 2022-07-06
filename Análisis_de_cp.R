
# script análisis de CP



# Paquetes

library(readxl)
library(dplyr)
library(psych) # Procedures for Psychological, Psychometric, and Personality Research
library(factoextra) # Extract and Visualize the Results of Multivariate Data Analyses.
library(ggplot2)

# Realizar ACP a partir del set de datos **bioenv.xlsx** disponibles en el libro MULTIVARIATE ANALYSIS OF ECOLOGICAL DATA
# de los autores [Michael Greenacre and Raul Primicerio](https://www.fbbva.es/microsite/multivariate-statistics/).

# **Ejercicio 1.** Importar y explorar
Descriptores <- read_excel("Descriptores.xlsx")
View(Descriptores)

Descriptores$Name <- as.factor(Descriptores$Name)
str(Descriptores)

# Elabore una gráfica de correlaciones de las variables Depth, Pollution y Temperature
# usando la función **pairs.panels()**.

pairs.panels(Descriptores[4:8])
pairs.panels(Descriptores[9:13])
pairs.panels(Descriptores[14:18])
DescriptoresCor<-cor(Descriptores[4:18], method = "pearson")

# **Ejercicio 2.** Análisis de Componentes Principales
# Elabore un nuevo set de datos llamado **bioenv_new** solo con las variables Depth, Pollution y Temperature.
# utilice la columna Sitio para agregar el nombre de las filas.

DescriptoresDF <- as.data.frame(Descriptores[,4:18])
row.names(DescriptoresDF) <- Descriptores$Name
head(DescriptoresDF)

# Realice un análisis de componentes principales para el nuevo set de datos **bioenv_new**
# con la función **prcomp**, use el argumento *scale = TRUE* para estandarizar las variables de forma automática. 

DescriptoresCP <- prcomp(DescriptoresDF, scale = TRUE)
DescriptoresCP

# Obtenga la varianza explicada por cada CP con la función **get_eigenvalue**
# y grafique con la función **fviz_eig**.
get_eigenvalue(DescriptoresCP)
fviz_eig(DescriptoresCP)


# Elabore gráficas para representar la distribución de los sitios **fviz_pca_ind()**,
# de las variables **fviz_pca_var()** y gráficas Biplot **fviz_pca_biplot()**

fviz_pca_ind(DescriptoresCP, repel = TRUE) # repel= TRUE evita que se solape el nombre de los sitios
fviz_pca_ind(DescriptoresCP, repel = TRUE,
             label = "none") # label = "none" hide individual labels

#agregar columna adicional#
fviz_pca_ind(DescriptoresCP, repel = TRUE,
             label = "none",
             habillage = Descriptores$Tipo) # Identifica individuos por factor de clasificación


fviz_pca_ind(DescriptoresCP, repel = TRUE,
             label = "none",
             habillage = Descriptores$Tipo,
             addEllipses = TRUE) # añade elipses para identificar factores de clasificación

fviz_pca_ind(bioenvpca, repel = TRUE,
             label = "none",
             habillage = bioenv$Sediment,
             addEllipses = TRUE,
             ellipse.level=0.60) # ajusta tamaño de elipses (se interpreta como el intervalo de confianza).

fviz_pca_ind(bioenvpca, repel = TRUE,
             label = "none",
             habillage = bioenv$Sediment,
             addEllipses = TRUE,
             ellipse.level=0.60,
             select.ind = list(cos2 = 15)) # selecciona individuos que mas contrbuyen al PCA


fviz_pca_var(DescriptoresCP) # grafica de correlación, angulo de 90° significa correlación 0

fviz_pca_var(bioenvpca, select.var=list(name = c("Pollution","Depth")))

fviz_pca_biplot(bioenvpca,
                repel = TRUE,
                label = "var",
                habillage = bioenv$Sediment,
                addEllipses = TRUE,
                ellipse.level=0.60,
                select.ind = list(cos2 = 15),
                select.var=list(name = c("Pollution","Depth")))