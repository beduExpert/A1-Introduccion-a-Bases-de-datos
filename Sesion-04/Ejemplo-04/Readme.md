[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Ejemplo-04
## Relacionando dos o más tablas con la instrucción `JOIN`

### OBJETIVOS
- Crear consultas SQL que relaciones a dos o más tablas
- Responder a preguntas que relacionen más de una fuente de información

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. En el `Reto-01` se realizó la petición de imprimir la lista de todas las películas cuyo género sea horror, misterio o suspenso, ahora se quiere conocer también el número de valoraciones que se han realizado para cada una de ellas.

   Se inicia con la consulta usada en el Reto:
   ```sql
   MiNombre> SELECT * FROM movies WHERE genres LIKE "%Horror%" OR genres LIKE "%Mystery%" OR genres LIKE "%Thriller%" LIMIT 10;
   +----+------------------------------------+---------------------------+
   | id | title                              | genres                    |
   +----+------------------------------------+---------------------------+
   | 6  | Heat (1995)                        | Action|Crime|Thriller     |
   | 10 | GoldenEye (1995)                   | Action|Adventure|Thriller |
   | 12 | Dracula: Dead and Loving It (1995) | Comedy|Horror             |
   | 16 | Casino (1995)                      | Drama|Thriller            |
   | 18 | Four Rooms (1995)                  | Thriller                  |
   | 22 | Copycat (1995)                     | Crime|Drama|Thriller      |
   | 23 | Assassins (1995)                   | Thriller                  |
   | 47 | Seven (Se7en) (1995)               | Crime|Thriller            |
   | 51 | Guardian Angel (1994)              | Action|Drama|Thriller     |
   | 61 | Eye for an Eye (1996)              | Drama|Thriller            |
   +----+------------------------------------+---------------------------+

   10 rows in set
   Time: 0.093s
   MiNombre>  
   ```
   Ahora se relaciona con la tabla `ratings` haciendo uso de la instrucción `LEFT JOIN`, que permite emparejar cada registro en la tabla `ratings` con cada registro de la tabla `movies` donde los campos `movie.id=ratings.movieid` coincidan, así que la consulta resultante es la siguiente:
   ```sql
   MiNombre> SELECT movies.*, rating FROM movies LEFT JOIN ratings ON movies.id=movieid WHERE genres LIKE "%Horror%" OR genres LIKE "%Mystery%" OR genres LIKE "%Thriller%" LIMIT 10;
   +------+----------------------------+----------------------------------+--------+
   | id   | title                      | genres                           | rating |
   +------+----------------------------+----------------------------------+--------+
   | 608  | Fargo (1996)               | Crime|Drama|Thriller             | 4      |
   | 648  | Mission: Impossible (1996) | Action|Adventure|Mystery         | 4      |
   | 2916 | Total Recall (1990)        | Action|Adventure|Sci-Fi|Thriller | 3      |
   | 1792 | U.S. Marshalls (1998)      | Action|Thriller                  | 3      |
   | 2881 | Double Jeopardy (1999)     | Action|Thriller                  | 3      |
   | 2126 | Snake Eyes (1998)          | Action|Crime|Mystery|Thriller    | 3      |
   | 292  | Outbreak (1995)            | Action|Drama|Thriller            | 3      |
   | 3256 | Patriot Games (1992)       | Action|Thriller                  | 2      |
   | 2278 | Ronin (1998)               | Action|Crime|Thriller            | 3      
   :
   ```
   __Nota:__ El resultado puede demorar un poco, ya que se están procesando más de 20 millones de registros.

   En la comsulta además se agregó la columna de `rating` que se puede incluir gracias al `JOIN` con la tabla `ratings` y también ahora se puede realizar un `GROUP BY` por el campo `movies.id` y contar cuantas valoraciones ha tenido cada película en base al campo `rating`
   ```sql
   MiNombre> SELECT id, title, COUNT(rating) FROM movies LEFT JOIN ratings ON movies.id=movieid WHERE genres LIKE "%Horror%" OR genres LIKE "%Mystery%" OR genres LIKE "%Thriller%" GROUP BY movies.id LIMIT 20;
   +-----+-------------------------------------------+---------------+
   | id  | title                                     | COUNT(rating) |
   +-----+-------------------------------------------+---------------+
   | 6   | Heat (1995)                               | 940           |
   | 10  | GoldenEye (1995)                          | 888           |
   | 12  | Dracula: Dead and Loving It (1995)        | 160           |
   | 16  | Casino (1995)                             | 682           |
   | 18  | Four Rooms (1995)                         | 157           |
   | 22  | Copycat (1995)                            | 378           |
   | 23  | Assassins (1995)                          | 126           |
   | 47  | Seven (Se7en) (1995)                      | 1137          |
   | 51  | Guardian Angel (1994)                     | 0             |
   | 61  | Eye for an Eye (1996)                     | 67            |
   | 66  | Lawnmower Man 2: Beyond Cyberspace (1996) | 97            |
   | 70  | From Dusk Till Dawn (1996)                | 914           |
   | 76  | Screamers (1995)                          | 178           |
   | 89  | Nick of Time (1995)                       | 229           |
   | 92  | Mary Reilly (1996)                        | 88            |
   | 95  | Broken Arrow (1996)                       | 638           |
   | 98  | Shopping (1994)                           | 6             |
   | 100 | City Hall (1996)                          | 128           |
   | 103 | Unforgettable (1996)                      | 33            |
   | 111 | Taxi Driver (1976)                        | 1240          |
   :
   ```
   __Nota:__ Se recomienda paciencia , ya que el resultado puede demorar un minuto o un poco más.

   El límite se ha aumentado a 20 y se puede observar como hay películas que han no han obtenido ninguna valoración, entonces si se ordenan los resultados en base al campo calculado `total_rating` podremos saber cuales películas no han obtenido ninguna valoración.
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
   Time: 60.117s
   MiNombre>  
   ```
   Se observa que 8 películas no obtuvieron valoración alguna, pero y ¿cuál fue la que obtuvo mayor cantidad de valoraciones? (ver. Proyecto)

1. En el `Reto-03` se realizaba la pregunta de como incluir el nombre de las películas en el resultado obtenido, así que ahora se desea conocer la cantidad de valoraciones que se realizó a cada película en la tabla `ratings` e imprimir el id, nombre de la película y el número de valoraciones.

   Para obtener el resultado se realiza por medio de la instrucción SQL `LEFT JOIN` para relacionar todos los nombre de películas en la tabla `movies` que están en la tabla `ratings`.
   ```sql
   MiNombre> SELECT movieid, title, COUNT(rating) AS total_rating FROM ratings LEFT JOIN movies ON movieid=id GROUP BY movieid ORDER BY total_rating DESC;
   +-----------+----------------------------------------------------------------------------------+----------------+
   | movieid   | title                                                                            | total_rating   |
   |-----------+----------------------------------------------------------------------------------+----------------|
   | 2858      | American Beauty (1999)                                                           | 3428           |
   | 260       | Star Wars: Episode IV - A New Hope (1977)                                        | 2991           |
   | 1196      | Star Wars: Episode V - The Empire Strikes Back (1980)                            | 2990           |
   | 1210      | Star Wars: Episode VI - Return of the Jedi (1983)                                | 2883           |
   | 480       | Jurassic Park (1993)                                                             | 2672           |
   | 2028      | Saving Private Ryan (1998)                                                       | 2653           |
   | 589       | Terminator 2: Judgment Day (1991)                                                | 2649           |
   | 2571      | Matrix                                                                           | 2590           |
   | 1270      | Back to the Future (1985)                                         
   :
   ```
   El resultado es muy largo, así que se puede presionar la tecla `q` para continuar.

   El comando `LEFT JOIN` realiza la relación de las dos tablas por medio de las instrucción `ON movieid=id`, muy importante considerar que esta relación incluye todos los registros de la tabla `ratings` y sólo los registros de la tabla `movies` dónde el campo `movies.id` coincide con el campo `ratings.movieid`, a partir de este momento todos los campos de la tabla `movies` están disponibles para se usados en la instrucción `SELECT`.

   El resultado indica que la película `American Beauty` es la que obtuvo más valoraciones (3428), pero ¿cómo fue valorada esta película, bien, mal? (ver. Proyecto)

1. Entonces ahora se pueden hacer consultas para conocer la cantidad de valoraciones realizadas por usuarios femenino y masculino con una una valoración de `4`.

   La solución nuevamente se realiza con el uso de la instrucción SQL `JOIN`, pero en este caso es entre las tablas `ratings` y `users`
   ```sql
   MiNombre> SELECT genero, COUNT(genero) FROM ratings JOIN users ON userid=id WHERE rating=4 GROUP BY genero;
   +----------+-----------------+
   | genero   | COUNT(genero)   |
   |----------+-----------------|
   | F        | 87033           |
   | M        | 261938          |
   +----------+-----------------+
   2 rows in set
   Time: 0.643s
   MiNombre>  
   ```
   En este resultado se observa que el género femenino tuvo poca participación en el caso de las valoraciones de valor 4. Y si ¿quisiéramos obtener estos mismos valores para todo el conjunto de valoraciones? (ver. Proyecto)

1. Imprime la lista de todos los usuarios con género femenino que dieron una valoración de 5 a la película con título "Deep Blue Sea" e indica cuantos son.

   La solución se obtiene creando una relación entre las tres tablas de la siguiente forma:
   ```sql
   MiNombre> SELECT * FROM ratings LEFT JOIN movies ON movieid=movies.id LEFT JOIN users ON userid=users.id WHERE title LIKE "Deep Blue Sea%" AND rating=5 AND genero="F";
   +----------+-----------+----------+--------------+------+----------------------+------------------------+------+----------+--------+--------+-------+
   | userid   | movieid   | rating   | time_stamp   | id   | title                | genres                 | id   | genero   | edad   | ocup   | cp    |
   |----------+-----------+----------+--------------+------+----------------------+------------------------+------+----------+--------+--------+-------|
   | 210      | 2722      | 5        | 977100602    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 210  | F        | 1      | 10     | 25801 |
   | 372      | 2722      | 5        | 980449576    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 372  | F        | 18     | 4      | 72227 |
   | 1125     | 2722      | 5        | 974924805    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 1125 | F        | 18     | 4      | 53715 |
   | 2138     | 2722      | 5        | 974638653    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 2138 | F        | 18     | 4      | 88119 |
   | 2907     | 2722      | 5        | 971821556    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 2907 | F        | 35     | 5      | 12345 |
   | 3202     | 2722      | 5        | 968573704    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 3202 | F        | 18     | 4      | 24060 |
   | 3483     | 2722      | 5        | 967494828    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 3483 | F        | 45     | 7      | 30260 |
   | 4278     | 2722      | 5        | 965289897    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 4278 | F        | 45     | 7      | 09094 |
   | 4504     | 2722      | 5        | 965011706    | 2722 | Deep Blue Sea (1999) |
   :
   ```
   __Nota:__ Se recomienda ir construyendo la consulta paso a paso e ir observando los resultados generados.

   Observar como el resultado incluye la lista de todas las columnas de todas las tablas, así que si sólo se desea la lista de usuario, entonces sólo se incluirá los campos de la tabla `users`:
   ```sql
   MiNombre> SELECT users.* FROM ratings LEFT JOIN movies ON movieid=movies.id LEFT JOIN users ON userid=users.id WHERE title LIKE "Deep Blue Sea%" AND rating=5 AND genero="F";
   +------+----------+--------+--------+-------+
   | id   | genero   | edad   | ocup   | cp    |
   |------+----------+--------+--------+-------|
   | 210  | F        | 1      | 10     | 25801 |
   | 372  | F        | 18     | 4      | 72227 |
   | 1125 | F        | 18     | 4      | 53715 |
   | 2138 | F        | 18     | 4      | 88119 |
   | 2907 | F        | 35     | 5      | 12345 |
   | 3202 | F        | 18     | 4      | 24060 |
   | 3483 | F        | 45     | 7      | 30260 |
   | 4278 | F        | 45     | 7      | 09094 |
   | 4504 | F        | 25     | 0      | 65775 |
   | 5103 | F        | 35     | 16     | 78222 |
   +------+----------+--------+--------+-------+

   10 rows in set
   Time: 0.763s
   MiNombre>  
   ```
   Con el uso de `users.*` se está indicando que se incluyan sólo todos los campos de la tabla `users`.

   Con lo que se obtiene la lista de los usuarios solicitada con un total de 10 registros, haciendo uso de una sola consulta y no en varios pasos como se realizó usando archivos csv.

__Misión cumplida__
