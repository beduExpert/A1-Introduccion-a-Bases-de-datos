[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Proyecto
## Realizando consultas para validar la importación de datos en una tabla

### OBJETIVOS
- Validar que la correcta importación de los datos
- Realizar consultas y validación con los ratos originales
- Re importar datos en caso de errores

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Carpeta `Sesion-03/Ejemplo-04/Datos/` disponible

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows), si tienes alguna otra ventana abierta con el comando `mycli` es buen momento para cerrarla antes de abrir la nueva ventana.

1. Conectarse al Servidor MariaDB con los datos que has usado en el _Ejemplo-01_
   ```console
   ml-1m $ mycli -h ec2-54-213-193-78.us-west-2.compute.amazonaws.com -u root -p root -P 3306
   mariadb 10.4.10-MariaDB-1:10.4.10+maria~bionic
   mycli 1.20.1
   Chat: https://gitter.im/dbcli/mycli
   Mail: https://groups.google.com/forum/#!forum/mycli-users
   Home: http://mycli.net
   Thanks to the contributor - Abirami P
   (none)> USE Minombre;
   You are now connected to database "MiNombre" as user "root"
   Time: 0.096s
   MiNombre>
   ```
   Recuerda hacer uso de los datos de conexión proporcionados por tú Experta/o y ejecutar el comando `Use` para seleccionar tu base de datos.

   También puedes hacer uso de la tecla de flecha arriba para regresar al comando anteriormente escrito y modificarlo para trabajar un poco más rápido.

1. En el Ejemplo-03 se importó el archivo `movies.csv` a la tabla `movies` y se validó que los campos tuvieran datos, ahora se va a validar que la cantidad de registros sea la correcta haciendo uso del comando SQL `SELECT COUNT(*) FROM tabla`

   Usar SQL para contar el número de registros de la tabla `movies`:
   ```sql
   MiNombre> SELECT COUNT(*) FROM movies;
   +----------+
   | COUNT(*) |
   +----------+
   | 3883     |
   +----------+
   1 row in set
   Time: 0.120s
   MiNombre>  
   ```
   Se obtiene un total de 3883 registros, así que ahora se va a comparar con el número de líneas que hay en el archivo `movies.csv`

1. Abre otra _Terminal_ (en Linux o Mac) o _Git bash_ (en Windows), si tienes alguna otra ventana abierta con __Git bash__ es buen momento para cerrarla antes de abrir la nueva ventana.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Proyecto/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Proyecto
   Proyecto $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-03/Ejemplo-04/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Proyecto $ cp -a ../Ejemplo-04/Datos .
   Proyecto $ cd Datos/ml-1m
   ml-1m $
   ```

1. Ejecutar el comando `wc` para contar el número de líneas en el archivo `movies.csv`
   ```console
   ml-1m $ wc movies.csv
     3883  15672 163542 movies.csv
   ml-1m $
   ```
   Con lo que se obtiene que la primer columna el valor de 3883 líneas que es el mismo valor de registros importados en la tabla `movies`.

1. En el Ejemplo-03 se importó el archivo `ratings.csv` a la tabla `ratings` y se validó que los campos tuvieran datos, ahora se va a validar que la cantidad de registros sea la correcta. Cambiarse a la ventana donde está el comando `mycli` antes de continuar.

   Usar SQL para contar el número de registros de la tabla `ratings`:
   ```sql
   MiNombre> SELECT COUNT(*) FROM ratings;
   +----------+
   | COUNT(*) |
   +----------+
   | 1000209  |
   +----------+
   1 row in set
   Time: 0.494s
   MiNombre>  
   ```
   Se obtiene un total de 1000209 registros, así que ahora se va a comparar con el número de líneas que hay en el archivo `ratings.csv`

1. Cambiarse a la _Terminal_ (en Linux o Mac) o _Git bash_ (en Windows), donde se ejecutó el anterior comando `wc`.

1. Ejecutar el comando `wc` para contar el número de líneas en el archivo `ratings.csv`
   ```console
   ml-1m $ wc ratings.csv
     1000209  1000209 21593504 ratings.csv
   ml-1m $
   ```
   Con lo que se obtiene que la primer columna el valor de 1000209 líneas que es el mismo valor de registros importados en la tabla `ratings`.

__Misión cumplida, conocimiento de validación de datos importados adquirido y habilidad en el uso de la terminal__
