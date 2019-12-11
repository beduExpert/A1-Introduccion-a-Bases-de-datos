[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Reto-03
## Importando datos a una tabla en formato CSV

### OBJETIVOS
- Aplicar el procedimiento para importación de datos a una tabla
- Validar que la correcta importación de los datos

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Carpeta `Sesion-03/Ejemplo-03/Datos/` disponible

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows), en caso de consultar con una ventana abierta cerrarla antes de abrir la nueva.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Reto-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Reto-03
   Reto-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-03/Ejemplo-03/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-03 $ ???
   Reto-03 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Conectarse al Servidor MariaDB con los datos que has usado en el _Ejemplo-01_ y además agregando la opción `--local-infile`.
   ```console
   ml-1m $ mycli -h ec2-54-213-193-78.us-west-2.compute.amazonaws.com -u root -p root -P 3306 ???
   mariadb 10.4.10-MariaDB-1:10.4.10+maria~bionic
   mycli 1.20.1
   Chat: https://gitter.im/dbcli/mycli
   Mail: https://groups.google.com/forum/#!forum/mycli-users
   Home: http://mycli.net
   Thanks to the contributor - Abirami P
   (none)> ???
   You are now connected to database "MiNombre" as user "root"
   Time: 0.096s
   MiNombre>
   ```
   Recuerda hacer uso de los datos de conexión proporcionados por tú Experta/o y ejecutar el comando `Use` para seleccionar tu base de datos.

   También puedes hacer uso de la tecla de flecha arriba para regresar al comando anteriormente escrito y modificarlo para trabajar un poco más rápido.

1. Ahora se va a hacer uso del comando `LOAD DATA LOCAL INFILE` para cargar los datos del archivo `movies.csv` en la tabla `movies`.

   No olvidar agregar la opción `FIELDS TERMINATED BY`:
   ```sql
   MiNombre> ???
   Query OK, 3883 rows affected
   Time: 6.410s
   MiNombre> ???
   +----+------------------------------------+------------------------------+
   | id | title                              | generos                      |
   +----+------------------------------------+------------------------------+
   | 1  | Toy Story (1995)                   | Animation|Childrens|Comedy   |
   | 2  | Jumanji (1995)                     | Adventure|Childrens|Fantasy  |
   | 3  | Grumpier Old Men (1995)            | Comedy|Romance               |
   | 4  | Waiting to Exhale (1995)           | Comedy|Drama                 |
   | 5  | Father of the Bride Part II (1995) | Comedy                       |
   | 6  | Heat (1995)                        | Action|Crime|Thriller        |
   | 7  | Sabrina (1995)                     | Comedy|Romance               |
   | 8  | Tom and Huck (1995)                | Adventure|Childrens          |
   | 9  | Sudden Death (1995)                | Action                       |
   | 10 | GoldenEye (1995)                   | Action|Adventure|Thriller    |
   +----+------------------------------------+------------------------------+

   10 rows in set
   Time: 0.199s
   MiNombre>  
   ```
   Por lo que podemos corroborar que cuando menos los primeros 10 registros tienen información correcta.

   En caso de que la importación de datos haya sido incorrecta, recuerda que puedes usar el comando `TRUNCATE` para vaciar la tabla y luego realizar otra importación.

1. Ahora se va a hacer uso del comando `LOAD DATA LOCAL INFILE` para cargar los datos del archivo `ratings.csv` en la tabla `ratings`.

   No olvidar agregar la opción `FIELDS TERMINATED BY`:
   ```sql
   MiNombre> ???
   Query OK, 1000209 rows affected
   Time: 678.410s
   MiNombre> ???
   ???
   ???
   ???
   ...
   MiNombre>  
   ```
   Por lo que podemos corroborar que cuando menos los primeros 10 registros tienen información correcta.

   En caso de que la importación de datos haya sido incorrecta, recuerda que puedes usar el comando `TRUNCATE` para vaciar la tabla y luego realizar otra importación.

__Misión cumplida, conocimiento de importación de datos adquirido__
