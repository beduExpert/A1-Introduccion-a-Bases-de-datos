[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Reto-02
## Comandos para realizar consultas de datos

### OBJETIVOS
- Analizar contenido de archivos
- Realizar consulta y filtrado de resultados
- Obtener resultados

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Ejemplo-02 terminado

### DESARROLLO
En el Ejemplo-02 se continuó agregando archivos a la carpeta `Datos` en formato CSV que serán usados en este ejemplo, así que es necesario copiar la carpeta `Datos`.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Reto-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Reto-02
   Reto-02 $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-02` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-02 $ cp -a ../Ejemplo-02/Datos .
   Reto-02 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Imprimir todos los usuarios cuyo genero es femenino:
   ```console
   ml-1m $ grep F users.csv
   [...]
   6025,F,25,1,32607
   6029,F,25,1,23185
   6031,F,18,0,45123
   6035,F,25,1,78734
   6036,F,25,15,32603
   6037,F,45,1,76006
   6038,F,56,1,14706
   6039,F,45,0,01060
   ml-1m $
   ```

1. De la lista anterior, se desea obtener todos los usuarios que son menores de edad

   Para seleccionar los usuarios que son menores de edad se hace uso del archivo `README` y se encuentra que en el campo `edad` un valor de `1` representa a todos los usuarios menores de edad, así que el comando sería:
   ```console
   ml-1m $ grep F users.csv | grep 1
   [...]
   6017,F,35,7,21117
   6025,F,25,1,32607
   6029,F,25,1,23185
   6031,F,18,0,45123
   6035,F,25,1,78734
   6036,F,25,15,32603
   6037,F,45,1,76006
   6038,F,56,1,14706
   6039,F,45,0,01060
   ml-1m $
   ```
   Se observa que el símbolo 1 aparece en más lugares de una línea, además de la columna 3 que es donde se necesita, por lo que será bueno ajustar el criterio:
   ```console
   ml-1m $ grep F users.csv | grep ,.*,1,.*,
   [...]
   5459,F,1,10,99016
   5514,F,1,10,76501
   5524,F,1,10,26505
   5525,F,1,10,55311
   5687,F,1,0,55403
   5751,F,1,0,14167
   5756,F,1,10,98110
   5768,F,1,7,20852
   5840,F,1,0,44260
   5844,F,1,10,02131
   5989,F,1,10,74114
   6006,F,1,0,01036
   ml-1m $
   ```
   En este resultado todas las líneas sólo contienen `1` en la tercer columna y además el género es femenino.

1. De la lista anterior obtener la lista de todos los usuarios que son estudiantes del proyecto K12.

   Primero se hace una búsqueda en el archivo `README` para obtener el código correspondiente a la actividad Estudiante de K12 y es código es el 10, así que el comando queda como:

   ```console
   ml-1m $ grep F users.csv | grep ,.*,1,.*, | grep ,10,
   [...]
   5063,F,1,10,22801
   5114,F,1,10,22932
   5247,F,1,10,01915
   5302,F,1,10,02332
   5459,F,1,10,99016
   5514,F,1,10,76501
   5524,F,1,10,26505
   5525,F,1,10,55311
   5756,F,1,10,98110
   5844,F,1,10,02131
   5989,F,1,10,74114
   ml-1m $
   ```

1. Ahora se desea almacenar la lista de los usuarios obtenidos en el punto anterior en el archivo `users-gF-e1-o10.csv`
   ```console
   ml-1m $ grep F users.csv | grep ,.*,1,.*, | grep ,10, > users-gF-e1-o10.csv
   ml-1m $ head users-gF-e1-o10.csv
   1,F,1,10,48067
   51,F,1,10,10562
   75,F,1,10,01748
   86,F,1,10,54467
   99,F,1,10,19390
   119,F,1,10,77515
   194,F,1,10,29146
   210,F,1,10,25801
   468,F,1,10,55082
   470,F,1,10,55068
   ml-1m $
   ```

1. Y para obtener el total de registros se realiza con:
   ```console
   ml-1m $ wc users-gF-e1-o10.csv
     63   63 1114 users-gF-e1-o10.csv
   ml-1m $
   ```
   Por lo tanto se tienen un total de 63 usuarios femeninos menores de edad y que son estudiantes del proyecto K12.

__Reto cumplido__
