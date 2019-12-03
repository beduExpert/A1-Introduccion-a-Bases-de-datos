[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Proyecto
## Comandos para realizar consultas a los conjuntos de datos

### OBJETIVOS
- Adquirir la habilidad en el uso de la terminal
- Analizar contenido de archivos
- Preparar y formatear archivos a formatos conocidos (CSV, JSON)
- Realizar consulta y filtrado de resultados
- Obtener resultados

### REQUISITOS
1. Carpeta de repositorio actualizada
1. Ejemplo-04 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Proyecto/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Proyecto
   Proyecto $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-04` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Proyecto $ cp -a ..Ejemplo-04/Datos .
   Proyecto $ cd Datos/ml-1m
   ml-1m $
   ```

1. Obtener la lista de todas las películas que tratan sobre juguetes

   En este caso el resultado involucra al archivo `movies.csv`
   ```console
   ml-1m $ grep Toy movies.csv
   1,Toy Story (1995),Animation|Children's|Comedy
   2017,Babes in Toyland (1961),Children's|Fantasy|Musical
   2253,Toys (1992),Action|Comedy|Fantasy
   3086,March of the Wooden Soldiers (a.k.a. Laurel & Hardy in Toyland) (1934),Comedy
   3114,Toy Story 2 (1999),Animation|Children's|Comedy
   ml-1m $ grep Toy movies.csv | wc
         5      25     277
   ml-1m $
   ```
   Este resultado indica que hay 5 películas que cumplen el criterio.

1. Obtener todos los registros de la tabla `ratings.csv` que sean películas de juguetes e indicar cuantos son.

   En este caso el resultado involucra hacer uso de la lista de películas del punto anterior, así que primero se obtendrán los registros cuyo `movieid` sea 1
   ```console
   ml-1m $ grep ",1,.*," ratings.csv
   [...]
   6013,1,5,959116383
   6015,1,5,956778765
   6016,1,4,956778750
   6021,1,3,956757147
   6022,1,5,956755763
   6025,1,5,956812867
   6032,1,4,956718127
   6035,1,4,956712849
   6040,1,3,957717358
   ml-1m $
   ```
   Recuerda que el `movieid` está en la segunda columna

   Ahora es momento para buscar todos los registros cuyo `movieid` con 1 o 2017, para eso se hace uso de `grep` con la opción `-E` que permite hacer uso de _expresiones regulares extendidas_ así que el comando sería:
   ```console
   ml-1m $ grep -E ",(1|2017),.*," ratings.csv
   [...]
   5978,2017,2,964186655
   5980,1,3,956943357
   5982,1,4,956935890
   5985,1,4,961118020
   5989,1,5,956874124
   5991,1,4,1000092676
   5995,1,5,957388111
   5996,1,5,959798556
   6000,1,3,956879000
   6006,1,2,957032777
   6010,1,5,957463288
   6011,1,5,956786106
   6013,1,5,959116383
   6015,1,5,956778765
   6016,1,4,956778750
   [...]
   ml-1m $
   ```
   Entonces para obtener la lista completa, hay agregar cada uno de los id's de las películas que se desean incluir (de juguetes)
   ```console
   ml-1m $ grep -E ",(1|2017|2253|3086|3114),.*," ratings.csv
   [...]
   6015,1,5,956778765
   6015,3114,5,956778704
   6016,1,4,956778750
   6016,3114,5,956778750
   6016,2253,2,956778125
   6021,1,3,956757147
   6022,1,5,956755763
   6022,3114,5,956755741
   6024,3114,4,956749447
   6025,1,5,956812867
   6027,3114,4,956726766
   6030,2253,4,956719323
   6032,1,4,956718127
   6035,1,4,956712849
   6036,3086,5,956713310
   6036,3114,4,956710231
   6037,3114,4,956719174
   6040,1,3,957717358
   [...]
   ml-1m $
   ```
   Esto sólo nos da el resultado, pero no se guarda en ningún lado, así que ahora se guarda en el archivo `ratings-juguetes.csv`
   ```console
   ml-1m $ grep -E ",(1|2017|2253|3086|3114),.*," ratings.csv > ratings-juguetes.csv
   ml-1m $
   ```
   Finalmente se obtiene la cantidad de registros, lo que se puede obtener a partir del archivo `ratings-juguetes.csv` con:
   ```console
   ml-1m $ wc ratings-juguetes.csv
    4345  4345 88674 ratings-juguetes.csv
   ml-1m $
   ```
   Así que se tienen 4345 registros de rating que fueron hechos para películas de juguetes (Toys).

__Notas:__

- El uso de expresiones extendidas no será conocido por lo usuarios, ya que no se ha hecho ejercicio alguno, sin embargo se puede motivar a los alumnos a buscar usos adicionales del comando `grep` y las _expresiones regulares_.
- También se puede mencionar que aunque se están relacionando dos tablas, las consultas se están haciendo por separado y la relación se está haciendo a mano y que para relacionar dos archivos o tablas es hacer uso de bases de datos SQL.
