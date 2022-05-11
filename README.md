# Título

**Caracterizacion de proteinas crioprotectantes/anticongelantes**

# Autor
Javier Espinoza

## Descripción del problema a resolver.
El proyecto busca caracterizar un set de proteinas, buscando distintos valores pertinentes a su composicion, validar sus características como una proteina anticongelante ademas de poder encontrar características antiparasitarias para despues ordenarlas de manera que sea facil entender estas caracteristicas y su magnitud respecto a un set de datos de referencia.    

## Descripción de las variables de estudio, los factores que se desean analizar y el número total de observaciones.

**Datos**

1. Archivo de texto con listas de secuencias con distintas actividades, dependiendo de la lista (estas tendrian que ser reordenadas en formato de lista).

2. Archivo excel con secuencias de epitopes con distintas actividades.

**Variables de estudio**

1. Distintos valores de caracterización para cada proteina (numeros).
2. Secuencias de péptidos (caracteres).
3. Capacidad anticongelante (factor en tabla).

**paquetes especiales**
Peptides (https://github.com/dosorio/Peptides/)

**AVANCE PROYECTO**

1. La tabla con la que se trabajó tenia valores repetidos, los cuales no aportaban mucho al analisís, por lo que fueron removidas de la tabla con la que se trabajo en R.
2. Los datos son, hasta la fecha poco conclusos, la sobre abundancia de peptidos con capacidad anticongelante (AFP) en comparación con los pocos no anticongelantes (NO AFP) hacen que estos se vean abrumados y poco representados, pienso agregar peptidos que se que no son anticongelantes para la medicion, sin embargo, se puede ver algun patrón dentro de los peptidos anticongelantes en algunos analisís
3. Tengo problemas implementando una forma de poner varios graficos en un solo archivo, la funcion par() no responde como esperaba, a pesar de tratar ya varias formas
