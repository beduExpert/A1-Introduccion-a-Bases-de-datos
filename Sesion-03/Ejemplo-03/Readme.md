[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Ejemplo-03
## Importando datos a una tabla en formato CSV

### OBJETIVOS
 - Conocer el procedimiento para importación de datos a una tabla
 - Validar que la correcta importación de los datos

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Carpeta `Sesion-03/Ejemplo-02/Datos/` disponible

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows)

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-03
   Ejemplo-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-03/Ejemplo-02/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-03 $ cp -a ../Ejemplo-02/Datos .
   Ejemplo-03 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Para importar registros a una tabla se hará uso del comando SQL `LOAD DATA LOCAL INFILE`, sin embargo este comando como permite alterar el contenido de tablas desde equipos remotos por omisión está deshabilitado tanto en el servidor como en el cliente.

   Por el lado del Servidor MariaDB usado para este curso, ya ha sido configurado para permitir el uso de este comando para importar registros. En caso de que se desee contar con un servidor en su equipo propio o en una Intranet o en una instancia de servidor en la nube se pueden seguir las recomendaciones en de la siguiente publicación:
   - https://rctorr.wordpress.com/2019/12/07/instalando-mariadb-en-ubuntu-18-04

   Para el lado del cliente, que en este caso es el comando `mycli` se tiene que agregar una la opción `--local-infile true`, así que si tienes abierta una ventana con el comando `mycli` se recomienda cerrarla para no crear confusión.

1. Conectarse al Servidor MariaDB con los datos que has usado en el _Ejemplo-01_ y además agregando la opción `--local-infile`.
   ```console
   ml-1m $ mycli -h ec2-54-213-193-78.us-west-2.compute.amazonaws.com -u root -p root -P 3306 --local-infile true
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

1. Ahora se va a hacer uso del comando `LOAD DATA LOCAL INFILE` para cargar los datos del archivo `users.csv` en la tabla `users`.

   La información completa del comando se puede consultar en la documentación de MariaDB o MySQL:
   - https://mariadb.com/kb/en/library/load-data-infile

   ```sql
   MiNombre> LOAD DATA LOCAL INFILE "users.csv" INTO TABLE users;
   Query OK, 6040 rows affected
   Time: 1.269s
   MiNombre>  
   ```
   El resultado indica que se han afectado 6040 registros, así que al parecer la importación se ha realizado con éxito, así que ahora se va a realizar una consulta para imprimir los primeros 10 registros de la tabla `users`, esto se hará con el comando `SELECT lista de campos o * FROM tabla WHERE condición LIMIT N`, donde N es el número de registros a seleccionar.
   ```sql
   MiNombre> SELECT * FROM users LIMIT 10;
   +----+--------+--------+--------+--------+
   | id | genero | edad   | ocup   | cp     |
   +----+--------+--------+--------+--------+
   | 1  | <null> | <null> | <null> | <null> |
   | 2  | <null> | <null> | <null> | <null> |
   | 3  | <null> | <null> | <null> | <null> |
   | 4  | <null> | <null> | <null> | <null> |
   | 5  | <null> | <null> | <null> | <null> |
   | 6  | <null> | <null> | <null> | <null> |
   | 7  | <null> | <null> | <null> | <null> |
   | 8  | <null> | <null> | <null> | <null> |
   | 9  | <null> | <null> | <null> | <null> |
   | 10 | <null> | <null> | <null> | <null> |
   +----+--------+--------+--------+--------+

   10 rows in set
   Time: 0.092s
   MiNombre>  
   ```
   Al revisar los resultados, se observa que todos los campos en todos los registros aparece la palabra __null__, eso significa que los datos no se cargaron correctamente y la razón es debido a que el comando `LOAD` necesita más información acerca de nuestros datos, como conocer el símbolo o caracter usado para separar los campos, así que se primero se eliminan todos los registros de la tabla `users` con el comando `TRUNCATE nombre-tabla`
   ```sql
   MiNombre> TRUNCATE users;
   You re about to run a destructive command.
   Do you want to proceed? (y/n): y
   Your call!
   Query OK, 0 rows affected
   Time: 0.515s
   MiNombre> SELECT * FROM users LIMIT 10;                                         
   +----+--------+------+------+----+
   | id | genero | edad | ocup | cp |
   +----+--------+------+------+----+

   0 rows in set
   Time: 0.250s
   MiNombre>  
   ```
   Notar como se ejecuta una consulta con `SELECT` para validar que la tabla está vacía.

   Revisando la documentación es necesario agregar la opción `FIELDS TERMINATED BY`, así que el comando `LOAD` queda de la siguiente manera:
   ```sql
   MiNombre> LOAD DATA LOCAL INFILE "users.csv" INTO TABLE users FIELDS TERMINATED BY ",";
   Query OK, 6040 rows affected
   Time: 5.850s
   MiNombre> SELECT * FROM users LIMIT 10;
   +----+--------+------+------+-------+
   | id | genero | edad | ocup | cp    |
   +----+--------+------+------+-------+
   | 1  | F      | 1    | 10   | 48067 |
   | 2  | M      | 56   | 16   | 70072 |
   | 3  | M      | 25   | 15   | 55117 |
   | 4  | M      | 45   | 7    | 02460 |
   | 5  | M      | 25   | 20   | 55455 |
   | 6  | F      | 50   | 9    | 55117 |
   | 7  | M      | 35   | 1    | 06810 |
   | 8  | M      | 25   | 12   | 11413 |
   | 9  | M      | 25   | 17   | 61614 |
   | 10 | F      | 35   | 1    | 95370 |
   +----+--------+------+------+-------+

   10 rows in set
   Time: 0.185s
   MiNombre>  
   ```
   Por lo que podemos corroborar que ahora cuando menos los primeros 10 registros tienen información correcta.

   __Nota:__ Toman en cuenta que se está importando el archivo `users.csv` que es el archivo que no tiene una línea al inicio con el nombre de las columnas, sólo están los datos, ya que en este caso las columna se construyeron usando SQL con la instrucción `CREATE TABLE`.

__Misión cumplida, conocimiento de importación de datos adquirido__
