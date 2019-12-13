[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Reto-03
## Calculando datos haciendo uso de funciones en SQL

### OBJETIVO
- Hacer uso de funciones de SQL para hacer cálculos aritméticos
- Hacer uso de la instrucción `GROUP BY`
- Obtener resultados calculados y agrupados

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. Se quiere conocer la cantidad de usuarios que hay por cada rango de edades y ordenarlos de mayor a menor y comentar resultados.

   Nuevamente para esta solución se hace uso del las instrucciones `GROUP BY` y `ORDER BY` combinadas:
   ```sql
   MiNombre> SELECT edad, COUNT(edad) AS total_edad FROM users GROUP BY edad ORDER BY total_edad DESC;
   +--------+--------------+
   | edad   | total_edad   |
   |--------+--------------|
   | 25     | 2096         |
   | 35     | 1193         |
   | 18     | 1103         |
   | 45     | 550          |
   | 50     | 496          |
   | 56     | 380          |
   | 1      | 222          |
   +--------+--------------+
   7 rows in set
   Time: 0.110s
   MiNombre>  
   ```
   Al ver los resultados se podría decir que ¿es un resultado esperado?

1. Se desea conocer la distribución de la cantidad de películas por cada valoración (de 1 a 5) en la tabla `ratings`

   La solución implica nuevamente el uso de la instrucción `GROUP BY` con la siguiente consulta:
   ```sql
   MiNombre> SELECT rating, COUNT(rating) AS total_rating FROM ratings GROUP BY rating ORDER BY total_rating DESC;
   +----------+----------------+
   | rating   | total_rating   |
   |----------+----------------|
   | 4        | 348971         |
   | 3        | 261197         |
   | 5        | 226310         |
   | 2        | 107557         |
   | 1        | 56174          |
   +----------+----------------+
   5 rows in set
   Time: 0.554s
   MiNombre>  
   ```
   Con el resultado obtenido se puede decir que en general los usuarios gustan de las películas seleccionadas, ya que las mayores valoraciones fueron de `3, 4 y 5`

1. Se desea conocer la cantidad de valoraciones que se realizó a cada película en la tabla `ratings`
   ```sql
   MiNombre> SELECT movieid, COUNT(rating) AS total_rating FROM ratings GROUP BY movieid ORDER BY total_rating DESC;
   +-----------+----------------+
   | movieid   | total_rating   |
   |-----------+----------------|
   | 2858      | 3428           |
   | 260       | 2991           |
   | 1196      | 2990           |
   | 1210      | 2883           |
   | 480       | 2672           |
   | 2028      | 2653           |
   | 589       | 2649           |
   | 2571      | 2590           |
   | 1270      | 2583           |
   | 593       | 2578           |
   | 1580      | 2538           |
   | 1198      | 2514           |
   | 608       | 2513           |
   | 2762      | 2459           |
   | 110       | 2443           |
   | 2396      | 2369           |
   | 1197      | 2318           |
   | 527       | 2304           |
   | 1617      | 2288           |
   | 1265      | 2278           |
   :
   ```
   Como el resultado es muy largo hay que presionar la tecla `q` para continuar.

   De los resultado se obtiene que la película con `movieid=2858` es la que más valoraciones ha tenido, pero ¿cuál es esa película? ¿podríamos agregar los nombres de las películas además de sólo el `movieid`?

   Responderemos esas preguntas en el siguiente `Ejemplo`.

__Misión cumplida__
