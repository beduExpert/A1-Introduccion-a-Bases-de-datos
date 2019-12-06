[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Ejemplo-04
## Consultas relacionando dos o más archivos

### OBJETIVOS
- Analizar contenido de archivos
- Realizar relacionado de dos o más archivos
- Contabilizar resultados

### REQUISITOS
1. Carpeta de repositorio actualizada
1. Reto-03 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo\-04/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo\-04
   Ejemplo\-04 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-03` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo\-04 $ cp -a ../Reto-02/Datos .
   Ejemplo\-04 $ cd Datos/ml-1m
   ml-1m $
   ```

1. La primera consulta consiste en imprimir toda la lista de registros con valoración de 5 del archivo `ratings.csv`.
   ```console
   ml-1m $ grep -a ,5, ratings.csv
   [...]
   6040,2010,5,957716795
   6040,2019,5,956703977
   6040,1077,5,964828799
   6040,2022,5,956716207
   6040,2028,5,956704519
   6040,1094,5,956704887
   6040,562,5,956704746
   ml-1m $
   ```
   Así tenemos la lista de todos los registros que tienen valoración 5

1. Imprime la lista de todas las películas que en su título traten sobre juguetes (Toy en ingles) desde el archivo `movies.csv`
   ```console
   ml-1m $ grep -a Toy movies.csv
   1,Toy Story (1995),Animation|Children's|Comedy
   2017,Babes in Toyland (1961),Children's|Fantasy|Musical
   2253,Toys (1992),Action|Comedy|Fantasy
   3086,March of the Wooden Soldiers (a.k.a. Laurel & Hardy in Toyland) (1934),Comedy
   3114,Toy Story 2 (1999),Animation|Children's|Comedy
   ml-1m $
   ```

1. Imprime la lista de todos los registros con valoración de 5 y que las películas traten de juguetes.
   ```console
   ml-1m $ grep -a ,5, ratings.csv | grep -aE ",(1|2017|2253|3086|3114),.*,"
   [...]
   5996,3086,5,1020108866
   5996,3114,5,959798556
   6010,1,5,957463288
   6011,1,5,956786106
   6013,1,5,959116383
   6015,1,5,956778765
   6015,3114,5,956778704
   6016,3114,5,956778750
   6022,1,5,956755763
   6022,3114,5,956755741
   6025,1,5,956812867
   6036,3086,5,956713310
   ml-1m $
   ```
   Recuerda hacer uso del operador `-E` para poder usar expresiones regulares extendidas y hacer uso del operador __or__.

   Ahora guardamos y contamos el resultado
   ```console
   ml-1m $ grep -a ,5, ratings.csv | grep -aE ",(1|2017|2253|3086|3114),.*," > ratings-mToy-r5.csv
   [...]
   5996,3086,5,1020108866
   5996,3114,5,959798556
   6010,1,5,957463288
   6011,1,5,956786106
   6013,1,5,959116383
   6015,1,5,956778765
   6015,3114,5,956778704
   6016,3114,5,956778750
   6022,1,5,956755763
   6022,3114,5,956755741
   6025,1,5,956812867
   6036,3086,5,956713310
   ml-1m $ wc ratings-mToy-r5.csv
    1600  1600 32460 ratings-mToy-r5.csv
   ml-1m $    
   ```
   Entonces en total tenemos 1600 registros con valoración 5 sobre temas de juguetes, tomando en cuenta que se ha tenido que hacer uso de dos archivos para lograr el resultado, esto más adelante con el uso de bases de datos se hará uso del concepto de relaciones.

__Misión cumplida__
