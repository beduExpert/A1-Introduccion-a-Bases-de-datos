[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Ejemplo-03
## Calculando datos haciendo uso de funciones en SQL

### OBJETIVO
- Hacer uso de funciones de SQL para hacer cálculos aritméticos
- Hacer uso de la instrucción `GROUP BY`
- Obtener resultados calculados y agrupados

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. En la `Sesion-03` se obtuvieron la cantidad de usuarios de diferente género por separado, ahora se obtendrá la cantidad de usuarios por cada género disponible.

   Para obtener el resultado se hará usando la instrucción SQL `GROUP BY nombre-de-campo` y la consulta es la siguiente:
   ```sql
   MiNombre> SELECT * FROM users GROUP BY genero;
   +------+----------+--------+--------+-------+
   | id   | genero   | edad   | ocup   | cp    |
   |------+----------+--------+--------+-------|
   | 1    | F        | 1      | 10     | 48067 |
   | 2    | M        | 56     | 16     | 70072 |
   +------+----------+--------+--------+-------+

   2 rows in set
   Time: 0.223s
   MiNombre>  
   ```
   El resultado sólo consiste de dos filas, cada una con un género diferente, el resto de las columnas son los datos que complementan a cada registro, pero en este caso la fila con `genero=F` representa a todos los registros que tienen género femenino y la fila con `genero=M` representa a todos los registros con género masculino y como nos interesa la cantidad de cada uno, entonces se puede aplicar la función `COUNT(genero)` y también sólo mostrar los campos que se necesitan, entonces la consulta resultante es:
   ```sql
   MiNombre> SELECT genero, COUNT(genero) FROM users GROUP BY genero;              
   +----------+-----------------+
   | genero   | COUNT(genero)   |
   |----------+-----------------|
   | F        | 1709            |
   | M        | 4331            |
   +----------+-----------------+
   2 rows in set
   Time: 0.106s
   MiNombre>  
   ```
   Este es el resultado esperado obteniendo la cuenta de ambos géneros con una sola consulta, aunque en este caso, no se obtiene la lista de los usuarios correspondiente.

1. Ahora también se quiere conocer la cantidad de usuarios que hay por cada una de las ocupaciones y ordenarlos de mayor a menor.

   Nuevamente para esta solución se hace uso del las instrucciones `GROUP BY` y `ORDER BY` combinadas:
   ```sql
   MiNombre> SELECT ocup, COUNT(ocup) AS total_ocup FROM users GROUP BY ocup ORDER BY total_ocup DESC;
   +--------+--------------+
   | ocup   | total_ocup   |
   |--------+--------------|
   | 4      | 759          |
   | 0      | 711          |
   | 7      | 679          |
   | 1      | 528          |
   | 17     | 502          |
   | 12     | 388          |
   | 14     | 302          |
   | 20     | 281          |
   | 2      | 267          |
   | 16     | 241          |
   | 6      | 236          |
   | 10     | 195          |
   | 3      | 173          |
   | 15     | 144          |
   | 13     | 142          |
   | 11     | 129          |
   | 5      | 112          |
   | 9      | 92           |
   | 19     | 72           |
   | 18     | 70           |
   :
   ```
   Es importante notar que hay más resultados de los que se pueden mostrar, así que se presiona la letra `q` para continuar.

   El campo calculado de la cuenta `COUNT(ocup) AS total_ocup` en este caso se hace uso de la instrucción `AS` para nombrar al campo con `total_ocup`.

   También es importante notar que la instrucción `GROUP BY` se aplica al campo `ocup`, mientras que la instrucción `ORDER BY` se aplica al campo calculado `total_ocup`.

   El resultado indica que la ocupación con valor `4`, que corresponde a `estudiantes universitarios` (según el archivo README) es la que más participantes ha tenido, aunque los que no indicaron su ocupación también son una cantidad considerable.

1. En el ejemplo anterior, la ocupación `4` fué la de mayor participación, ahora se desea obtener el rango de edades de los usuarios que participaron.

   Para la solución se hará uso de las funciones SQL `MIN()` y `MAX()` y su uso se muestra en la siguiente consulta:
   ```sql
   MiNombre> SELECT MIN(edad), MAX(edad) FROM users WHERE ocup=4;
   +-------------+-------------+
   | MIN(edad)   | MAX(edad)   |
   |-------------+-------------|
   | 1           | 50          |
   +-------------+-------------+
   1 row in set
   Time: 0.117s
   MiNombre>  
   ```
   Con lo que se obtiene que el rango de edades van desde menores de edad hasta los 55 años para usuarios cuya ocupación es `estudiantes universitarios`.

__Misión cumplida__
