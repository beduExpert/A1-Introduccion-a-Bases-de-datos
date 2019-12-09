[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Reto-01
## Comandos para preparar y contar conjuntos de datos

### OBJETIVO
- Analizar contenido de archivos
- Preparar y formatear archivos a formatos conocidos (CSV, JSON)
- Realizar conteo de resultados

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Ejemplo-01 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Reto-01/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Reto-01
   Reto-01 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-02/Reto-01
   Reto-01 $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-01` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-01 $ cp -a ..Ejemplo-01/Datos .
   Reto-01 $ ls
   Datos
   Reto-01 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Convertir el archivo `movies.dat` al archivo `movies.csv` y `movies-h.csv` sin y con encabezado respectivamente.
   ```console
   ml-1m $ sed s/::/,/g movies.dat > movies.csv
   ml-1m $ head -n 3 movies.csv
   1,Toy Story (1995),Animation|Children's|Comedy
   2,Jumanji (1995),Adventure|Children's|Fantasy
   3,Grumpier Old Men (1995),Comedy|Romance
   ml-1m $ echo id,titulo,genres | cat - movies.csv > movies-h.csv
   ml-1m $ head -n 3 movies-h.csv
   id,titulo,genres
   1,Toy Story (1995),Animation|Children's|Comedy
   2,Jumanji (1995),Adventure|Children's|Fantasy
   ml-1m $
   ```

1. Convertir el archivo `ratings.dat` al archivo `ratings.csv` y `ratings-h.csv` sin y con encabezado respectivamente.
   ```console
   ml-1m $ sed s/::/,/g ratings.dat > ratings.csv
   ml-1m $ head -n 3 ratings.csv
   1,1193,5,978300760
   1,661,3,978302109
   1,914,3,978301968   
   ml-1m $ echo userid,movieid,ratings,time_stamp | cat - ratings.csv > ratings-h.csv
   ml-1m $ head -n 3 ratings-h.csv
   userid,movieid,ratings,time_stamp
   1,1193,5,978300760
   1,661,3,978302109
   ml-1m $
   ```

__Reto cumplido__
