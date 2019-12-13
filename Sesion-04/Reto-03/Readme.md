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
   MiNombre> ???
   +--------+--------------+
   | edad   | total_edad   |
   |--------+--------------|
   ???
   ???
   ???
   ...
   +--------+--------------+
   7 rows in set
   Time: 0.110s
   MiNombre>  
   ```
   Al ver los resultados se podría decir que ¿es un resultado esperado?

1. Se desea conocer la distribución de la cantidad de películas por cada valoración (de 1 a 5) en la tabla `ratings`

   La solución implica nuevamente el uso de la instrucción `GROUP BY` con la siguiente consulta:
   ```sql
   MiNombre> ???
   +----------+----------------+
   | rating   | total_rating   |
   |----------+----------------|
   ???
   ???
   ???
   ...
   +----------+----------------+
   5 rows in set
   Time: 0.554s
   MiNombre>  
   ```
   Con el resultado obtenido se puede decir que en general los usuarios gustan de las películas seleccionadas, ya que las mayores valoraciones fueron de `3, 4 y 5`

1. Se desea conocer la cantidad de valoraciones que se realizó a cada película en la tabla `ratings`
   ```sql
   MiNombre> ???
   +-----------+----------------+
   | movieid   | total_rating   |
   |-----------+----------------|
   ???
   ???
   ???
   ...
   :
   ```
   Como el resultado es muy largo hay que presionar la tecla `q` para continuar.

   De los resultado se obtiene que la película con `movieid=2858` es la que más valoraciones ha tenido, pero ¿cuál es esa película? ¿podríamos agregar los nombres de las películas además de sólo el `movieid`?

   Responderemos esas preguntas en el siguiente `Ejemplo`.

__Misión cumplida__
