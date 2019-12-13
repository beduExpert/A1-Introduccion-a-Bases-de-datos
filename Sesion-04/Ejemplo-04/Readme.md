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
   | 1270      | Back to the Future (1985)                                         :
   ```
   El comando `LEFT JOIN` realiza la relación de las dos tablas por medio de las instrucción `ON movieid=id` y a partir de este momento todos los campos de la tabla `movies` están disponibles para se usados en la instrucción `SELECT`
