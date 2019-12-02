[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Reto-03
## Comandos para preparar y consultar conjuntos de datos

### OBJETIVO
- Analizar contenido de archivos
- Preparar y formatear archivos a formatos conocidos (CSV, JSON)
- Realizar conteo de resultados

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Ejemplo-03 terminado

### DESARROLLO
1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Reto-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Reto-03
   Reto-03 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Reto-03
   Reto-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-03` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-03 $ cp -a ??? ???
   Reto-03 $ ls
   Datos
   Reto-03 $ cd ???
   ml-1m $
   ```

1. Convertir el archivo `movies.dat` al archivo `movies.csv` y `movies-h.csv` sin y con encabezado respectivamente.
   ```console
   ml-1m $ sed ???
   ml-1m $ head -n 3 movies.csv
   1,Toy Story (1995),Animation|Children's|Comedy
   2,Jumanji (1995),Adventure|Children's|Fantasy
   3,Grumpier Old Men (1995),Comedy|Romance
   ml-1m $ echo ??? | cat - movies.csv > movies-h.csv
   ml-1m $ head -n 3 ???
   id,titulo,genres
   1,Toy Story (1995),Animation|Children's|Comedy
   2,Jumanji (1995),Adventure|Children's|Fantasy
   ml-1m $
   ```

1. Convertir el archivo `ratings.dat` al archivo `ratings.csv` y `ratings-h.csv` sin y con encabezado respectivamente.
   ```console
   ml-1m $ ???
   ml-1m $ ???
   1,1193,5,978300760
   1,661,3,978302109
   1,914,3,978301968   
   ml-1m $ ???
   ml-1m $ head -n 3 ratings-h.csv
   userid,movieid,ratings,time_stamp
   1,1193,5,978300760
   1,661,3,978302109
   ml-1m $
   ```

__Reto superado__
