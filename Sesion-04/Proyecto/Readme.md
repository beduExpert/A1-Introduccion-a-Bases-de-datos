[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Proyecto
## Relacionando dos o más tablas con la instrucción `JOIN`

### OBJETIVOS
- Crear consultas SQL que relaciones a dos o más tablas
- Responder a preguntas que relacionen más de una fuente de información

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. Imprime la lista de todas las películas de acción que obtuvieron una valoración de 5 e indica cuantas son.

   La solución necesita hacer uso de la instrucción `JOIN`:
   ```sql
   MiNombre> SELECT movies.* FROM ratings LEFT JOIN movies ON movieid=movies.id WHE
             RE genres LIKE "Action%" AND rating=5;                                
   +------+---------------------------------------------------------------------+------------------------------------------+
   | id   | title                                                               | genres                                   |
   |------+---------------------------------------------------------------------+------------------------------------------|
   | 1287 | Ben-Hur (1959)                                                      | Action|Adventure|Drama                   |
   | 2028 | Saving Private Ryan (1998)                                          | Action|Drama|War                         |
   | 3578 | Gladiator (2000)                                                    | Action|Drama                             |
   | 110  | Braveheart (1995)                                                   | Action|Drama|War                         |
   | 480  | Jurassic Park (1993)                                                | Action|Adventure|Sci-Fi                  |
   | 1370 | Die Hard 2 (1990)                                                   | Action|Thriller                          |
   | 1196 | Star Wars: Episode V - The Empire Strikes Back (1980)               | Action|Adventure|Drama|Sci-Fi|War        |
   | 1954 | Rocky (1976)                                                        | Action|Drama                             |
   | 380  | True Lies (1994)                                                    | A:
   ```
   Y el total se otiene con:
   ```sql
   MiNombre> SELECT COUNT(*) FROM ratings LEFT JOIN movies ON movieid=movies.id WHERE genres LIKE "Action%" AND rating=5;
   +------------+
   | COUNT(*)   |
   |------------|
   | 37112      |
   +------------+
   1 row in set
   Time: 0.855s
   MiNombre>  
   ```

1. Del resultado anterior indica cuantos usuarios femenino y masculino realizaron valoraciones.
   
   Y el total se otiene con:
   ```sql
   MiNombre> ???
   ```

__Misión cumplida__
