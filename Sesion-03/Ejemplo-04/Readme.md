[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Ejemplo-04
## Realizando consultas para validar la importación de datos en una tabla

### OBJETIVOS
- Validar que la correcta importación de los datos
- Realizar consultas y validación con los ratos originales

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Carpeta `Sesion-03/Ejemplo-03/Datos/` disponible

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

1. En el Ejemplo anterior se importó el archivo `users.csv` a la tabla `users` y se validó que los campos tuvieran datos, ahora se va a validar que la cantidad de registros sea la correcta haciendo uso del comando SQL `SELECT COUNT(*) FROM tabla`

   La función `COUNT(*)` cuenta todos los registros seleccionados por `SELECT` e imprime el total:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users;
   +----------+
   | COUNT(*) |
   +----------+
   | 6040     |
   +----------+
   1 row in set
   Time: 0.283s
   MiNombre>  
   ```
   Se obtiene un total de 6040 registros, así que ahora se va a comparar con el número de líneas que hay en el archivo `users.csv`

1. Abre otra _Terminal_ (en Linux o Mac) o _Git bash_ (en Windows), si tienes alguna otra ventana abierta con el comando `mycli` es buen momento para cerrarla antes de abrir la nueva ventana.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-04/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-04
   Ejemplo-04 $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-03/Ejemplo-03/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-04 $ cp -a ../Ejemplo-03/Datos .
   Ejemplo-04 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Ejecutar el comando `wc` para contar el número de líneas en el archivo `users.csv`
   ```console
   ml-1m $ wc users.csv
     6040   6040 110208 users.csv
   ml-1m $
   ```
   Con lo que se obtiene que la primer columna el valor de 6040 líneas que es el mismo valor de registros importados en la tabla `users.`

__Misión cumplida, conocimiento de validación de datos importados adquirido__
