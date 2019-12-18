[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Proyecto
## Relacionando dos o más tablas con la instrucción `JOIN`

### OBJETIVOS
- Crear consultas SQL que relaciones a dos o más tablas
- Responder a preguntas que relacionen más de una fuente de información

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. Imprime la lista de todas las películas de acción que obtuvieron una valoración (rating) de 5 y ordena el resultado por `id` de película.

   La solución necesita hacer uso de la instrucción `JOIN`, así como relacionar las tablas `movies` y `ratings`, ya que para encontrar todas las películas de acción se hace uso de la tabla `movies` y para encontrar todas las que tuvieron valoración (rating) de 5 se necesita la tabla `ratings`:
   ```sql
   MiNombre> SELECT DISTINCT id, title FROM ratings LEFT JOIN movies ON movieid=movies.id WHERE genres LIKE "Action%" AND rating=5 ORDER BY movieid;
   +------+---------------------------------------------------------------------+
   | id   | title                                                               |
   +------+---------------------------------------------------------------------+
   | 6    | Heat (1995)                                                         |
   | 9    | Sudden Death (1995)                                                 |
   | 10   | GoldenEye (1995)                                                    |
   | 15   | Cutthroat Island (1995)                                             |
   | 21   | Get Shorty (1995)                                                   |
   | 42   | Dead Presidents (1995)                                              |
   | 44   | Mortal Kombat (1995)                                                |
   | 70   | From Dusk Till Dawn (1996)                                          |
   | 71   | Fair Game (1995)                                                    |
   | 89   | Nick of Time (1995)                                                 |
   | 95   | Broken Arrow (1996)                                                 |
   | 110  | Braveheart (1995)                                                   |
   | 112  | Rumble in the Bronx (1995)                                          |
   | 145  | Bad Boys (1995)                                                     |
   | 153  | Batman Forever (1995)                                               |
   | 160  | Congo (1995)                                                        |
   | 163  | Desperado (1995)                                                    |
   | 165  | Die Hard: With a Vengeance (1995)                                   |
   | 168  | First Knight (1995)                                                 |
   | 170  | Hackers (1995)                                                      |
   :
   ```
   Se recomienda construir la consulta paso a paso hasta obtener el resultado solicitado, además de hacer uso de la instrucción `DISTINCT` (es sólo una manera de obtener la solución)

   Para corroborar que tu resultado es correcto, `mycli` debe indicar que hay 342 registros en el resultado.

1. En el `Ejemplo-04` se obtuvo la lista de todas las películas con género horror, misterio o suspenso además del número de valoraciones (ratings) que cada una de ellas obtuvo, se desea conocer cual o cuales con las 10 películas con más cantidad de valoraciones realizadas por los usuarios.

   Se puede partir de la última consulta del punto `2`:
   ```sql
   MiNombre> SELECT id, title, COUNT(rating) AS total_rating FROM movies LEFT JOIN ratings ON movies.id=movieid WHERE genres LIKE "%Horror%" OR genres LIKE "%Mystery%" OR genres LIKE "%Thriller%" GROUP BY movies.id ORDER BY total_rating LIMIT 20;
   +------+----------------------------------------------+--------------+
   | id   | title                                        | total_rating |
   +------+----------------------------------------------+--------------+
   | 3455 | Buddy Boy (1999)                             | 0            |
   | 285  | Beyond Bedlam (1993)                         | 0            |
   | 1568 | MURDER and murder (1996)                     | 0            |
   | 3650 | Anguish (Angustia) (1986)                    | 0            |
   | 675  | Hostile Intentions (1994)                    | 0            |
   | 1847 | Ratchet (1996)                               | 0            |
   | 51   | Guardian Angel (1994)                        | 0            |
   | 890  | Baton Rouge (1988)                           | 0            |
   | 2438 | Outside Ozona (1998)                         | 1            |
   | 226  | Dream Man (1995)                             | 1            |
   | 1764 | Tainted (1998)                               | 1            |
   | 624  | Condition Red (1995)                         | 1            |
   | 1852 | Love Walked In (1998)                        | 1            |
   | 3842 | Make Them Die Slowly (Cannibal Ferox) (1980) | 1            |
   | 286  | Nemesis 2: Nebula (1995)                     | 1            |
   | 2214 | Number Seventeen (1932)                      | 1            |
   | 3291 | Trois (2000)                                 | 1            |
   | 1430 | Underworld (1997)                            | 1            |
   | 311  | Relative Fear (1994)                         | 1            |
   | 1908 | Resurrection Man (1998)                      | 1            |
   20 rows in set
   Time: 0.100s
   MiNombre>  
   ```
   __Nota:__ Recuerda que esta consulta puede llegar a tardar de 1 a 2 min.

   Entonces modifica la consulta para que ahora muestre las 10 películas con mayor número de valoraciones.
   ```sql
   MiNombre> SELECT id, title, COUNT(rating) AS total_rating FROM movies LEFT JOIN ratings ON movies.id=movieid WHERE genres LIKE "%Horror%" OR genres LIKE "%Mystery%" OR genres LIKE "%Thriller%" GROUP BY movies.id ORDER BY total_rating DESC LIMIT 10;
   +------+-----------------------------------+--------------+
   | id   | title                             | total_rating |
   +------+-----------------------------------+--------------+
   | 589  | Terminator 2: Judgment Day (1991) | 2649         |
   | 608  | Fargo (1996)                      | 2513         |
   | 1617 | L.A. Confidential (1997)          | 2288         |
   | 2716 | Ghostbusters (1984)               | 2181         |
   | 1214 | Alien (1979)                      | 2024         |
   | 2916 | Total Recall (1990)               | 1996         |
   | 1200 | Aliens (1986)                     | 1820         |
   | 924  | 2001: A Space Odyssey (1968)      | 1716         |
   | 1387 | Jaws (1975)                       | 1697         |
   | 1036 | Die Hard (1988)                   | 1666         |
   +------+-----------------------------------+--------------+

   10 rows in set
   Time: 0.095s
   MiNombre>  
   ```
   El resultado ya nos comienza a mostrar datos interesantes, posiblemente obtener este tipo de resultados, pero no mezclando categorías, si no, por cada una de las categorías, para así conocer por cada género cual es la película con más y menos valoraciones.

1. Del `Ejemplo-04` se obtuvo que la película `American Beauty` es la que más valoraciones obtuvo (3428), ahora se quiere conocer cual es la distribución de esas valoraciones, en otras palabras, cuantas son 1, cuantas son 2, etc.

   Se inicia con la tabla `movies` para poder obtener el `id` de la película:
   ```sql
   MiNombre> SELECT * FROM movies WHERE title LIKE "American Beauty%";
   +------+------------------------+--------------+
   | id   | title                  | genres       |
   +------+------------------------+--------------+
   | 2858 | American Beauty (1999) | Comedy|Drama |
   +------+------------------------+--------------+

   1 row in set
   Time: 0.389s
   MiNombre>     
   ```

   Ahora se relaciona con la tabla `ratings` para obtener todas las valoraciones de este película:
   ```sql
   MiNombre> SELECT id, title, rating FROM movies JOIN ratings ON id=movieid WHERE title LIKE "American Beauty%";
   +------+------------------------+--------+
   | id   | title                  | rating |
   +------+------------------------+--------+
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 1      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 3      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 3      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 4      |
   | 2858 | American Beauty (1999) | 5      |
   | 2858 | American Beauty (1999) | 4      |
   3428 rows in set
   Time: 1.312s
   MiNombre>  
   ```
   Es buena idea sólo mostrar los campos `id`, `title` y `rating` de esta forma ya se tienen las 3428 valoraciones, ahora hay que agruparlas por valor contarlas:
   ```sql
   MiNombre> SELECT id, title, rating, COUNT(rating) FROM movies JOIN ratings ON id=movieid WHERE title LIKE "American Beauty%" GROUP BY rating;
   +------+------------------------+--------+---------------+
   | id   | title                  | rating | COUNT(rating) |
   +------+------------------------+--------+---------------+
   | 2858 | American Beauty (1999) | 1      | 83            |
   | 2858 | American Beauty (1999) | 2      | 134           |
   | 2858 | American Beauty (1999) | 3      | 358           |
   | 2858 | American Beauty (1999) | 4      | 890           |
   | 2858 | American Beauty (1999) | 5      | 1963          |
   +------+------------------------+--------+---------------+

   5 rows in set
   Time: 1.140s
   MiNombre>  
   ```
   Así que la conclusión es que esta película además de ser la que obtuvo más valoraciones, también resulta estar muy bien valorada.

   Entonces surge una pregunta más ¿cuál sería la película mejor valorada?, ya que un número alto de valoraciones no necesariamente indica que la película esté bien valorada. (opcional)

1. Indica del total de valoraciones, cuantas fueron realizadas por hombres y mujeres respectivamente.

   Se puede partir de la tabla de `ratings` para obtener el `userid` de cada valoración y luego relacionarla con la tabla `users` para obtener el género
   ```sql
   MiNombre> SELECT id, genero FROM ratings LEFT JOIN users ON userid=id LIMIT 10;
   +----+--------+
   | id | genero |
   +----+--------+
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   | 1  | F      |
   +----+--------+

   10 rows in set
   Time: 0.092s
   MiNombre>  
   ```
   Ahora hay que contar todas las `F` y todas las `M`:
   ```sql
   MiNombre> SELECT genero, COUNT(genero) FROM ratings LEFT JOIN users ON userid=id GROUP BY genero;
   +--------+---------------+
   | genero | COUNT(genero) |
   +--------+---------------+
   | F      | 246440        |
   | M      | 753769        |
   +--------+---------------+
   2 rows in set
   Time: 0.095s
   MiNombre>  
   ```
   El resultado nos indica que aproximadamente de todas las valoraciones realizadas, el 25% fue realizada por mujeres y el 75% por hombres.   

__Misión cumplida__
