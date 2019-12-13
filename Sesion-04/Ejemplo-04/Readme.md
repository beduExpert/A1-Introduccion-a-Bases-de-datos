[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Ejemplo-04
## Relacionando dos o más tablas con la instrucción `JOIN`

### OBJETIVOS
- Crear consultas SQL que relaciones a dos o más tablas
- Responder a preguntas que relacionen más de una fuente de información

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. Ya en el `Reto-03` se realizaba la pregunta de como incluir el nombre de las películas en el resultado obtenido, así que ahora se desea conocer la cantidad de valoraciones que se realizó a cada película en la tabla `ratings` e imprimir el id, nombre de la película y el número de valoraciones.

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
   El resultado es muy largo, así que se puyede presionar la tecla `q` para continuar.

   El comando `LEFT JOIN` realiza la relación de las dos tablas por medio de las instrucción `ON movieid=id` y a partir de este momento todos los campos de la tabla `movies` están disponibles para se usados en la instrucción `SELECT`

1. Entonces ahora se pueden hacer consultas para conocer la cantidad de valoraciones realizadas por usuarios femenino y masculino con valor `4`.

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
   En este resultado se observa que el género femenino tuvo poca participación en el caso de las valoraciones de valor 4.

1. Imprime la lista de todos los usuarios con género femenino que dieron una valoración de 5 a la película con título "Deep Blue Sea" e indica cuantos son.

   La solución generada relacionando las tres tablas es la siguiente:
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
   | 4504     | 2722      | 5        | 965011706    | 2722 | Deep Blue Sea (1999) |:
   ```
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
   Con lo que se obtiene el resultado esperado haciendo uso de una sola consulta y no en varios pasos como se realizó usando archivos csv.

__Misión cumplida__
