[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Ejemplo-01
## Filtrando datos con la instrucción `SELECT`

### OBJETIVO
- Conocer algunas opciones de filtrado con las instrucción `SELECT`
- Hacer uso de filtros como NOT, IN y LIKE
- Hacer uso de operadores AND y OR
- Obtener resultados a por medio de la ejecución de consultas SQL

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Datos de acceso al Servidor MariaDB

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows).

1. Conectarse al Servidor MariaDB con los datos de acceso para tu grupo
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
   Recuerda ejecutar el comando `USE` para seleccionar tu base de datos.

1. Para seleccionar todos los usuarios con genero femenino se hace uso de la instrucción `SELECT lista-de-campos WHERE condición`.
   ```sql
   MiNombre> SELECT * FROM users WHERE genero="F" LIMIT 10;
   +----+--------+------+------+-------+
   | id | genero | edad | ocup | cp    |
   +----+--------+------+------+-------+
   | 1  | F      | 1    | 10   | 48067 |
   | 6  | F      | 50   | 9    | 55117 |
   | 10 | F      | 35   | 1    | 95370 |
   | 11 | F      | 25   | 1    | 04093 |
   | 16 | F      | 35   | 0    | 20670 |
   | 18 | F      | 18   | 3    | 95825 |
   | 24 | F      | 25   | 7    | 10023 |
   | 28 | F      | 25   | 1    | 14607 |
   | 30 | F      | 35   | 7    | 19143 |
   | 32 | F      | 25   | 0    | 19355 |
   +----+--------+------+------+-------+

   10 rows in set
   Time: 0.172s
   MiNombre>  
   ```
   Recuerda que el `*` indica listar todos los campos

   Se hace uso de la instrucción `LIMIT 10` para sólo obtener como resultado los 10 primeros registros y validar que todos tienen el género femenino, pero entonces surge la pregunta ¿cuántos son?

   Ahora se usa la función `COUNT()` (ya usada anteriormente) para contarlos
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE genero="F" LIMIT 10;
   +----------+
   | COUNT(*) |
   +----------+
   | 1709     |
   +----------+
   1 row in set
   Time: 0.204s
   MiNombre>  
   ```
   Observar que la opción `LIMIT 10` no tiene efecto en la función `COUNT()`

   Por lo tanto se tiene un total de 1709 registros con genero femenino.

1. Imprimir la lista de todos los usuarios que son menor de edad e indicar cuantos son.

   Para resolver esta consulta se tiene que entender lo que significan los valores de la columna edad y para eso se hace referencia a la documentación del archivo `README`
   ```
   - Age is chosen from the following ranges:

           *  1:  "Under 18"
           * 18:  "18-24"
           * 25:  "25-34"
           * 35:  "35-44"
           * 45:  "45-49"
           * 50:  "50-55"
           * 56:  "56+"   
   ```
   __Nota:__ Para esta sesión el archivo `README` se puede encontrar en la carpeta `Sesion-04/Datos/ml-1m/`. Si aún no cuentas con la carpeta `Datos` es buen monento para copiarla.

   Así que todos los registros con valor 1 en edad significa que son menores de edad y no que tienen 1 año de nacidos (que alivio, los datos son de calidad!), así que la consulta es la siguiente:
   ```sql
   MiNombre> SELECT * FROM users WHERE edad=1 LIMIT 10;
   +-----+--------+------+------+-------+
   | id  | genero | edad | ocup | cp    |
   +-----+--------+------+------+-------+
   | 1   | F      | 1    | 10   | 48067 |
   | 19  | M      | 1    | 10   | 48073 |
   | 51  | F      | 1    | 10   | 10562 |
   | 75  | F      | 1    | 10   | 01748 |
   | 86  | F      | 1    | 10   | 54467 |
   | 99  | F      | 1    | 10   | 19390 |
   | 119 | F      | 1    | 10   | 77515 |
   | 153 | M      | 1    | 10   | 51537 |
   | 194 | F      | 1    | 10   | 29146 |
   | 210 | F      | 1    | 10   | 25801 |
   +-----+--------+------+------+-------+

   10 rows in set
   Time: 0.179s
   MiNombre>  
   ```
   Se observa que todos tienen el valor de edad 1 y ahora se cuentan con `COUNT()`:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE edad=1 LIMIT 10;
   +----------+
   | COUNT(*) |
   +----------+
   | 222      |
   +----------+
   1 row in set
   Time: 0.125s
   MiNombre>  
   ```
   Por lo tanto se tiene un total de 222 registros donde los usuarios son menores de edad realizando valoraciones a películas.

1. Para imprimir la lista de todos los usuarios que tienen género femenino y que además son menor de edad.

   Ahora se hará uso del operador `AND` junto con las instrucción `SELECT`:
   ```sql
   MiNombre> SELECT * FROM users WHERE genero="F" AND edad=1 LIMIT 10;
   +-----+--------+------+------+-------+
   | id  | genero | edad | ocup | cp    |
   +-----+--------+------+------+-------+
   | 1   | F      | 1    | 10   | 48067 |
   | 51  | F      | 1    | 10   | 10562 |
   | 75  | F      | 1    | 10   | 01748 |
   | 86  | F      | 1    | 10   | 54467 |
   | 99  | F      | 1    | 10   | 19390 |
   | 119 | F      | 1    | 10   | 77515 |
   | 194 | F      | 1    | 10   | 29146 |
   | 210 | F      | 1    | 10   | 25801 |
   | 468 | F      | 1    | 10   | 55082 |
   | 470 | F      | 1    | 10   | 55068 |
   +-----+--------+------+------+-------+

   10 rows in set
   Time: 0.126s
   MiNombre>  
   ```
   Se puede comprobar que todos los registros cumplen con la condición, ahora se cuentan con:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE genero="F" AND edad=1 LIMIT 10;
   +----------+
   | COUNT(*) |
   +----------+
   | 78       |
   +----------+
   1 row in set
   Time: 0.189s
   MiNombre>  
   ```
   Por lo tanto se tienen 78 usuarios con genero femenino que son menores de edad haciendo valoraciones a películas.

1. Imprimir la lista de todos los usuarios cuya ocupación es _Estudiante_ o _Desempleado_ e indicar cuantos son.

   Para poder responder a esta pregunta nuevamente se hace uso de la documentación buscando en el archivo `README` lo siguiente:
   ```
   - Occupation is chosen from the following choices:

           *  0:  "other" or not specified
           *  1:  "academic/educator"
           *  2:  "artist"
           *  3:  "clerical/admin"
           *  4:  "college/grad student"
           *  5:  "customer service"
           *  6:  "doctor/health care"
           *  7:  "executive/managerial"
           *  8:  "farmer"
           *  9:  "homemaker"
           * 10:  "K-12 student"
           * 11:  "lawyer"
           * 12:  "programmer"
           * 13:  "retired"
           * 14:  "sales/marketing"
           * 15:  "scientist"
           * 16:  "self-employed"
           * 17:  "technician/engineer"
           * 18:  "tradesman/craftsman"
           * 19:  "unemployed"
           * 20:  "writer"
   ```
   __Recuerda:__ El archivo `README` se puede encontrar en la carpeta `Sesion-04/Datos/ml-1m/`.

   Así que se usaran los valores de 10 y 19 para buscarlos en la columna de ocupación.

   Ahora se hará uso del operador `IN` junto con las instrucción `SELECT`:
   ```sql
   MiNombre> SELECT * FROM users WHERE ocup IN (10, 19) LIMIT 10;
   +-----+--------+------+------+-------+
   | id  | genero | edad | ocup | cp    |
   +-----+--------+------+------+-------+
   | 1   | F      | 1    | 10   | 48067 |
   | 19  | M      | 1    | 10   | 48073 |
   | 46  | M      | 18   | 19   | 75602 |
   | 51  | F      | 1    | 10   | 10562 |
   | 57  | M      | 18   | 19   | 30350 |
   | 75  | F      | 1    | 10   | 01748 |
   | 86  | F      | 1    | 10   | 54467 |
   | 99  | F      | 1    | 10   | 19390 |
   | 102 | M      | 35   | 19   | 20871 |
   | 119 | F      | 1    | 10   | 77515 |
   +-----+--------+------+------+-------+

   10 rows in set
   Time: 0.217s
   MiNombre>  
   ```
   Se puede comprobar que todos los registros cumplen con la condición, ahora se cuentan con:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE ocup IN (10, 19) LIMIT 10;
   +----------+
   | COUNT(*) |
   +----------+
   | 267      |
   +----------+
   1 row in set
   Time: 0.233s
   MiNombre>  
   ```
   Por lo tanto se tienen 267 usuarios que son estudiantes o desempleados que realizaron la valoración de películas.

1. Imprimir la lista de todos los usuarios cuya ocupación __no__ es _Estudiante_ o _Desempleado_ y que además son menores de edad e indicar cuantos son.

   Ahora se hará uso combinado de los operadores `NOT IN` y `AND` junto con las instrucción `SELECT`:
   ```sql
   MiNombre> SELECT * FROM users WHERE ocup NOT IN (10, 19) AND edad=1 LIMIT 10;
   +------+--------+------+------+-------+
   | id   | genero | edad | ocup | cp    |
   +------+--------+------+------+-------+
   | 719  | M      | 1    | 0    | 75070 |
   | 743  | F      | 1    | 2    | 60660 |
   | 775  | M      | 1    | 17   | 56258 |
   | 1056 | M      | 1    | 0    | 48133 |
   | 1187 | F      | 1    | 0    | 90210 |
   | 1200 | M      | 1    | 0    | 97222 |
   | 1296 | M      | 1    | 0    | 75244 |
   | 1458 | M      | 1    | 0    | 08055 |
   | 1468 | M      | 1    | 14   | 19147 |
   | 1509 | M      | 1    | 0    | 11803 |
   +------+--------+------+------+-------+

   10 rows in set
   Time: 0.124s
   MiNombre>  
   ```
   Se puede comprobar que todos los registros cumplen con la condición, ahora se cuentan con:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE ocup NOT IN (10, 19) AND edad=1;
   +----------+
   | COUNT(*) |
   +----------+
   | 47       |
   +----------+
   1 row in set
   Time: 0.568s
   MiNombre>  
   ```
   Por lo tanto se tienen 47 usuarios que son menores de edad que no son estudiantes o desempleados y que realizaron la valoración de películas.

   En los resultado se observa mucho el valor de `0` en la ocupación, que al revisar el archivo `README` indica `other or not specified`, lo que no da mucha información, así que podría ser bueno no incluirlos en el resultado.

1. Finalmente imprimir la lista de todos los usuarios donde su código postal inicie con `06` y terminen en `0`.

   Para resolver esta consulta se hará uso del la instrucción `LIKE` que permite hacer búsquedas mediante coincidencias de cadenas de texto o subcadenas de texto, así que primero se imprimirá la lista de todos los usuarios cuyo código postal incluya `06`
   ```sql
   MiNombre> SELECT * FROM users WHERE cp LIKE '06' LIMIT 10;                      
   +----+--------+------+------+----+
   | id | genero | edad | ocup | cp |
   +----+--------+------+------+----+

   0 rows in set
   Time: 0.162s
   MiNombre>
   ```
   El resultado obtenido ha sido de cero registros, lo que es correcto, ya que la instrucción `LIKE` buscó todos los registros donde el campo `cp` tenga exactamente el texto `06`, ni más, ni menos, así que ahora vamos a indicar que queremos que inicie con la cadena de texto `06` y que luego exista cualquier otra _cosa_.
   ```sql
   MiNombre> SELECT * FROM users WHERE cp LIKE '06%' LIMIT 10;
   +------+--------+------+------+-------+
   | id   | genero | edad | ocup | cp    |
   +------+--------+------+------+-------+
   | 7    | M      | 35   | 1    | 06810 |
   | 31   | M      | 56   | 7    | 06840 |
   | 131  | M      | 18   | 4    | 06520 |
   | 601  | F      | 18   | 20   | 06320 |
   | 931  | F      | 56   | 1    | 06032 |
   | 1101 | M      | 35   | 1    | 06417 |
   | 1203 | F      | 25   | 1    | 06417 |
   | 1277 | F      | 18   | 0    | 06360 |
   | 1333 | M      | 25   | 17   | 06460 |
   | 1393 | M      | 18   | 4    | 06430 |
   +------+--------+------+------+-------+

   10 rows in set
   Time: 0.095s
   MiNombre>  
   ```
   El uso del símbolo `%` indica que en esa posición puede ir cualquier cadena de texto y ahora todos los valores en el campo `cp` inician con `06`, pero algunos terminan con valores distintos a `0`, así que se realiza otro ajuste para obtener el resultado a la consulta inicial:
   ```sql
   MiNombre> SELECT * FROM users WHERE cp LIKE '06%0' LIMIT 10;                    
   +------+--------+------+------+-------+
   | id   | genero | edad | ocup | cp    |
   +------+--------+------+------+-------+
   | 7    | M      | 35   | 1    | 06810 |
   | 31   | M      | 56   | 7    | 06840 |
   | 131  | M      | 18   | 4    | 06520 |
   | 601  | F      | 18   | 20   | 06320 |
   | 1277 | F      | 18   | 0    | 06360 |
   | 1333 | M      | 25   | 17   | 06460 |
   | 1393 | M      | 18   | 4    | 06430 |
   | 1609 | F      | 35   | 9    | 06830 |
   | 1624 | M      | 25   | 0    | 06810 |
   | 1980 | M      | 35   | 7    | 06460 |
   +------+--------+------+------+-------+

   10 rows in set
   Time: 0.171s
   MiNombre>  
   ```
   Ahora si, todos los registros en el campo `cp` inician con `06` y terminan con `0`, entonces los contamos:
   ```sql
   MiNombre> SELECT COUNT(*) FROM users WHERE cp LIKE '06%0' LIMIT 10;             
   +----------+
   | COUNT(*) |
   +----------+
   | 27       |
   +----------+
   1 row in set
   Time: 0.111s
   MiNombre>  
   ```
   Se obtiene que sólo 27 usuarios están en la región comprendida por los usuarios cuyo código postal inicia con `06` y termina con `0`.

__Misión cumplida__
