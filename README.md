# Título

**Caracterizacion de proteinas crioprotectantes/anticongelantes**

# Autor
Javier Espinoza

## Descripción del problema a resolver.
El proyecto busca caracterizar un set de peptidos obtenidos de proteinas de choque frio cuyas secuencias fueron obtenidas de bacterias antarticas, realizando un análisis de un set de descriptores seleccionados para despues realizar analisis de agrupacion.    

## Descripción de las variables de estudio, los factores que se desean analizar y el número total de observaciones.

**Datos**

1. Archivo excel con secuencias de los peptidos.
2. Archivo excel con los valores de los descriptores seleccionados.

**Variables de estudio**

1. Distintos valores de caracterización (descriptores) para cada peptido (numeros).
2. Secuencias y clasificación de péptidos (caracteres).

**Paquetes especiales**
Peptides (https://github.com/dosorio/Peptides/)

**Archivos en el repositorio**

1. Archivo excel "Lista calculo" que contiene las secuencias de todos los peptidos utilizados
2. Archivo excel "Descriptores" que contiene una lista de los peptidos con los valores de clasificacion y los valores de los descriptores seleccionados
3. Archivo HTLM "Análisis Agrupamiento" que contiene el codigo utilizado y los resultados

**Proyecto**

Para la entrega del proyecto se hicieron cambios al exploratorio

1. Se agregaron histogramas y boxplots para cada descriptor y se observaron valores atipicos
2. no se muestra la obtención de los valores de cada descriptor, en esta oportunidad, se toma el archivo con los valores ya agregados, ya que este paso esta fuera del exploratorio por lo que no se encontro nesesario agregarlo

Como hipotesís del proyecto se analizará la capacidad de los datos de formar varios grupos disintos con un análisis de Permanova, de este se tomaran las hipotesís a verificar 
