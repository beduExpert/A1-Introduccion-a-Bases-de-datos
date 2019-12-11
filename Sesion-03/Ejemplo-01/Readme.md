[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Ejemplo-01
## Conectando con un Servidor MariaDB/MySQL y realizando operaciones con bases de datos

### OBJETIVOS
- Conectarse a un Servidor MariaDB/MySQL
- Conocer las operaciones sobre bases de datos

### REQUISITOS
1. Miniconda3 instalado
1. MyCli instalado
1. Carpeta de repo actualizada

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-01/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-01
   Ejemplo-01 $
   ```

1. Para conectarse a un servidor de bases de datos se necesitan cuando menos los siguientes datos:
   - __Host:__ Nombre del servidor o dirección IP que identifica al servidor de base de datos, si el servidor se encuentra en tu propio equipo entonces se puede usar el nombre `localhost` o la dirección IP `172.0.0.1`.
   - __Usuario:__ El usuario con el que se conectará al servidor.
   - __Clave:__ La clave asignada al usuario.
   - __Puerto:__ El número de puerto en el que el servidor atiende peticiones, por lo regular es el 3306.

   Solicita los datos de acceso a tu __Experta/o__, pero para ejemplificar se van a usar los siguientes datos:
   - __Host:__ ec2-54-213-193-78.us-west-2.compute.amazonaws.com
   - __Usuario:__ root
   - __Clave:__ root
   - __Puerto:__ 3306

1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows)

1. Para realizar la conexión al Servidor MariaDB/MySQL se hará uso del comando `mycli -h nombre_servidor -u usuario -p clave -P puerto` (que ya debería estar instalado en tu sistema)
   ```console
   Ejemplo-01 $ mycli -h ec2-54-213-193-78.us-west-2.compute.amazonaws.com -u root -p root -P 3306
   mariadb 10.4.10-MariaDB-1:10.4.10+maria~bionic
   mycli 1.20.1
   Chat: https://gitter.im/dbcli/mycli
   Mail: https://groups.google.com/forum/#!forum/mycli-users
   Home: http://mycli.net
   Thanks to the contributor - Abirami P
   (none)>  
   ```
   El texto `(none)>` es la señal o prompt del cliente conectado ya al servidor, la palabra `none` indica que no se está usando una base de datos en este momento.

1. Para crear una base de datos se realiza con la instrucción `CREATE DATABASE Nombre`, donde `Nombre` suele ser el nombre del proyecto, pero para el curso usa tú nombre y un apellido o tu seudónimo en redes sociales, del tal manera que no existan dos bases de datos con el mismo nombre.
   ```sql
   (none)> CREATE DATABASE MiNombre;
   Query OK, 1 row affected
   Time: 0.095s
   (none)>
   ```
   El resultado indica que el comando se ejecutó de forma correcta, la cantidad de línea o renglones afectados y el tiempo de ejecución.

   __SUGERENCIA:__  Cuando este comando sea usado con scripts para automatizar tareas, se sugiere usar la siguiente variante:
   ```
   CREATE DATABASE IF NOT EXISTS Nombre;
   ```
   para evitar que se marque un error en caso de que la base de dato ya exista y se intente crear de nuevo.

1. Para mostrar la lista de bases de datos disponibles se hace uso del comando `SHOW DATABASES`
   ```sql
   (none)> SHOW DATABASES;
   +--------------------+
   | Database           |
   +--------------------+
   | MiNombre           |
   | information_schema |
   | mysql              |
   | performance_schema |
   +--------------------+
   4 rows in set
   Time: 0.111s
   (none)>
   ```
   Se observa una tabla con la lista de todas las bases de datos, la primera es la que se ha creado con anterioridad y las 3 últimas son bases de datos para uso interno de MariaDB/MySQL, así que no uses y mucho menos alteres esas bases de datos.

1. Para borrar una base de datos se realiza con el comando  `DROP DATABASE Nombre`
   ```sql
   (none)> DROP DATABASE MiNombre;
   Youre about to run a destructive command.
   Do you want to proceed? (y/n): y
   Your call!
   Query OK, 0 rows affected
   Time: 0.098s
   (none)> SHOW DATABASES;
   +--------------------+
   | Database           |
   +--------------------+
   | information_schema |
   | mysql              |
   | performance_schema |
   +--------------------+
   3 rows in set
   Time: 0.118s
   (none)>
   ```
   Después de eliminar la base de datos `MiNombre` se imprime la lista de bases de datos disponibles para validar que ya no existe.

   __SUGERENCIA:__  Cuando este comando sea usado con scripts para automatizar tareas, se sugiere usar la siguiente variante:
   ```
   DROP DATABASE IF EXISTS Nombre;
   ```
   para evitar que se marque un error en caso de que la base de dato ya exista y se intente crear de nuevo.

1. Como paso final entonces, se creará nuevamente la base de datos y se hará uso de ella como la base de datos actual, para ello se usará el comando `USE Nombre`
   ```sql
   (none)> CREATE DATABASE IF NOT EXISTS MiNombre;
   Query OK, 1 row affected
   Time: 0.096s
   (none)> USE MiNombre;
   You are now connected to database "MiNombre" as user "root"
   Time: 0.096s
   MiNombre>
   ```
   Notar como el nombre de la base de datos en uso aparece en el prompt (`Minombre>`)

__Conexión a servidor y creación de base de datos adquiridos__
