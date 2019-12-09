[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Ejemplo-02
## Comandos para realizar consultas a los conjuntos de datos

### OBJETIVOS
- Analizar contenido de archivos
- Realizar consulta y filtrado de resultados
- Obtener resultados

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Reto-01 terminado

### DESARROLLO
En el Reto-01 se terminó de preparar todos los archivos en formato CSV con y sin encabezados que serán usados en este ejemplo, así que también es necesario copiar la carpeta `Datos`.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo-02
   Ejemplo-02 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-01` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-02 $ cp -a ../Reto-01/Datos .
   Ejemplo-02 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Para seleccionar registros en base a un criterio se hace uso del comando `grep CRITERIO nombre-de-archivo`, donde `CRITERIO` es una expresión regular.

   Para imprimir todos los usuarios cuyo genero es masculino (M) se usa el siguiente comando:
   ```console
   ml-1m $ grep M users.csv
   [...]
   6027,M,18,4,20742
   6028,M,18,4,94133
   6030,M,25,17,32618
   6032,M,45,7,55108
   6033,M,50,13,78232
   6034,M,25,14,94117
   6040,M,25,6,11106
   ml-1m $
   ```
   El comando `grep` comprueba si `M` está en una línea, o mejor dicho, comprueba si está en cualquier parte de la línea, no exactamente en la segunda columna, si sí, entonces imprime esa línea, de lo contrario omite esa línea y eso lo realiza para cada línea del archivo. El resultado se imprime en pantalla y no se almacena en ningún otro lado.

   Afortunadamente si hay una `M` en una línea será en la segunda columna y nada más, así que no importa que en posición aparezca, pero ahora que ya sabemos cuales son, ahora se desea saber ¿cuántos son?

1. Para contar los registros generados por un comando se hace uso del mecanismo de tuberías (_pipes_ en inglés) para conectar el resultado de un comando a la entrada de otro, en este caso se conecta la salida del comando `grep` a la entrada del comando `wc`.

   Para contar el número de usuario con genero masculino se usa el siguiente comando:
   ```console
   ml-1m $ grep M users.csv | wc
      4331    4331   79294
   ml-1m $
   ```
   Recordar que el comando `wc` cuenta líneas, palabras y bytes en ese orden, por lo tanto el número de usuarios con género masculino (M) es 4331.

1. Ahora, se desea agregar dos criterios, se desea conocer la lista de todos los usuarios con género masculino con ocupación científico e indicar cuanto son.

   Se pueden conectar dos comandos `grep` mediante tuberías y eso implica que los criterios se conectan mediante un operador __Y__ (__AND__).

   Para seleccionar los usuarios que son científicos se hace uso del archivo `README` y se encuentra que el código es el `15`, así que el comando sería:
   ```console
   ml-1m $ grep M users.csv | grep 15
   [...]
   5915,M,18,4,58102 <- aparece 15 en la primer columna
   5921,M,25,6,15146 <- aparece 15 en la última columna
   5935,M,18,0,35115 <- aparece 15 en la última columna
   5963,M,25,15,02140 <- aparece 15 en la 4a columna
   5988,M,25,15,94022 <- aparece 15 en la 4a columna
   6011,M,35,15,80538 <- aparece 15 en la 4a columna
   6012,M,35,15,02871 <- aparece 15 en la 4a columna
   ```
   Al observar los resultados se nota que el `15` aparece en varias columnas y para el resultado que interesa, se necesita que sólo aparezca en la cuarta columna, así que se acompaña al `15` con algunos de los caracteres que lo rodean y en este caso pueden ser las comas.
   ```console
   ml-1m $ grep M users.csv | grep ,15,
   [...]
   5737,M,45,15,93555
   5746,M,18,15,94061
   5821,M,25,15,02139
   5963,M,25,15,02140
   5988,M,25,15,94022
   6011,M,35,15,80538
   6012,M,35,15,02871
   ml-1m $
   ```
   En este todas las líneas sólo contienen `15` en la cuarta columna y además el género es masculino.

   Lo que falta ahora es contar cuantos son y eso se hace encadenando los resultados al comando `wc`
   ```console
   ml-1m $ grep M users.csv | grep ,15, | wc
       116     116    2195
   ml-1m $
   ```
   Por lo tanto tenemos `116` usuarios que cumplen con ambos criterios.

1. Ahora se desea almacenar la lista de los usuarios obtenidos en el punto anterior en el archivo `users-gM-o15.csv`
   ```console
   ml-1m $ grep M users.csv | grep ,15, > users-gM-o15.csv
   ml-1m $ head users-gM-o15.csv
   3,M,25,15,55117
   22,M,18,15,53706
   109,M,45,15,92028
   111,M,35,15,55416
   228,M,25,15,55455
   366,M,50,15,55126
   412,M,35,15,55117
   534,M,25,15,55902
   560,M,45,15,81335
   760,M,56,15,94114
   ml-1m $
   ```
   Recordar que para almacenar el resultado de un comando en general se tiene que hacer uso del operador `>` para redireccionar la salida a el nombre de archivo indicado.

__Misión cumplida__
