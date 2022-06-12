# Título

**Caracterizacion de proteinas crioprotectantes/anticongelantes**

# Autor
Javier Espinoza

## Descripción del problema a resolver.
El proyecto busca caracterizar un set de peptidos obtenidos de bacterias antarticas, buscando distintos valores pertinentes a su composicion y comparandolos con peptidos que poseen actividad conocida para despues realizar analisis de agrupacion.    

## Descripción de las variables de estudio, los factores que se desean analizar y el número total de observaciones.

**Datos**

1. Archivo de texto formato fasta con las secuencias de los peptidos.

2. Archivo excel con secuencias de los peptidos y los descriptores obtenidos.

**Variables de estudio**

1. Distintos valores de caracterización para cada proteina (numeros).
2. Secuencias de péptidos (caracteres).

**paquetes especiales**
Peptides (https://github.com/dosorio/Peptides/)

**AVANCE PROYECTO**

Analisís de agrupación: se realizo en una primera instancia un analisis de heatmap con 3 a 11 clusters (analisís decia 6, pero se opto por mas para ver el comportamiento de los peptidos), despues de realizado el estudio, se vio que existian clusters donde no existian AFPs, entonses se realiza un sesgo donde se removieron los peptidos que no compartian cluster con los AFPs para cada heatmap, entonces se tiene ahora heatmap de 4 a 11 clusters con variaciones de peptidos entre cada uno, ahora se esta analisando la información 
