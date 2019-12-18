[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Reto-02
## Ordenando datos con la instrucción `ORDER BY` y guardando resultados

### OBJETIVO
- Obtener resultados ordenados en base a un campo
- Guardar los resultados de las consultas

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows), si tienes alguna otra ventana abierta con el comando `mycli` es buen momento para cerrarla antes de abrir la nueva ventana.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-04/Reto-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-04/Reto-02
   Reto-02 $
   ```

1. Conectarse al Servidor MariaDB
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
   Recuerda hacer uso de los datos de conexión proporcionados por tú Experta/o y ejecutar el comando `USE` para seleccionar tu base de datos.

1. Imprime y guarda sólo el nombre de todas las películas en la tabla `movies` en orden alfabético en formato CSV en el archivo `movies-title.csv`.

   En el resultado sólo se necesita el título de la película por lo que la consulta queda de la siguiente forma:
   ```sql
   MiNombre> SELECT title FROM movies ORDER BY title LIMIT 10;                     
   +-----------------------------------+
   | title                             |
   +-----------------------------------+
   | $1                                |
   | 'burbs                            |
   | 'Night Mother (1986)              |
   | 'Til There Was You (1997)         |
   | ...And Justice for All (1979)     |
   | 1-900 (1994)                      |
   | 10 Things I Hate About You (1999) |
   | 101 Dalmatians (1961)             |
   | 101 Dalmatians (1996)             |
   | 12 Angry Men (1957)               |
   +-----------------------------------+

   10 rows in set
   Time: 0.087s
   MiNombre>  
   ```
   Se observa que posiblemente los dos primeros registros tienen nombre inválido, posiblemente habría que descartarlos, así que la consulta se crea nuevamente quedando de la siguiente forma:
   ```sql
   MiNombre> SELECT title FROM movies WHERE title NOT IN ("$1", "'burbs") ORDER BY title LIMIT 10;
   +-----------------------------------+
   | title                             |
   +-----------------------------------+
   | 'Night Mother (1986)              |
   | 'Til There Was You (1997)         |
   | ...And Justice for All (1979)     |
   | 1-900 (1994)                      |
   | 10 Things I Hate About You (1999) |
   | 101 Dalmatians (1961)             |
   | 101 Dalmatians (1996)             |
   | 12 Angry Men (1957)               |
   | 13th Warrior                      |
   | 187 (1997)                        |
   +-----------------------------------+

   10 rows in set
   Time: 0.092s
   MiNombre>  
   ```
   La consulta ya da el resultado esperado.

   Ahora se guardará el resultado en formato CSV en el archivo `movies-title.csv`.

   El procedimiento es el siguiente:
   ```sql
   MiNombre> \T csv
   Changed table format to csv
   Time: 0.000s
   MiNombre> \o movies-title.csv
   Time: 0.000s
   MiNombre> SELECT title FROM movies WHERE title NOT IN ("$1", "'burbs") ORDER BY title;
   "title"
   "'Night Mother (1986)"
   "'Til There Was You (1997)"
   "...And Justice for All (1979)"
   "1-900 (1994)"
   "10 Things I Hate About You (1999)"
   "101 Dalmatians (1961)"
   "101 Dalmatians (1996)"
   "12 Angry Men (1957)"
   "13th Warrior"
   "187 (1997)"
   "2 Days in the Valley (1996)"
   "20"
   "20 Dates (1998)"
   "200 Cigarettes (1999)"
   "2001: A Space Odyssey (1968)"
   "2010 (1984)"
   "24 7: Twenty Four Seven (1997)"
   "24-hour Woman (1998)"
   "28 Days (2000)"
   "3 Ninjas: High Noon On Mega Mountain (1998)"
   "3 Strikes (2000)"
   "301"
   3881 rows in set
   Time: 0.348s
   MiNombre> \T psql
   Changed table format to psql
   Time: 0.000s
   MiNombre>  
   ```
   Para comprobarlo, abre otra Terminal (Linux o MacOSX) o Git Bash (para Windows) y has que tu carpeta de trabajo sea la del `Sesion-04/Reto-02/`:
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-04/Reto-02
   Reto-02 $
   ```
   Y ejecutar el comando `head` para examinar las primeras 10 líneas del archivo:
   ```console
   Reto-02 $ head movies-title.csv
   "title"
   "'Night Mother (1986)"
   "'Til There Was You (1997)"
   "...And Justice for All (1979)"
   "1-900 (1994)"
   "10 Things I Hate About You (1999)"
   "101 Dalmatians (1961)"
   "101 Dalmatians (1996)"
   "12 Angry Men (1957)"
   "13th Warrior"
   Reto-02 $
   ```
   Con lo que se comprueba el contenido y creación del archivo con los resultados de la consulta.

__Misión cumplida__
