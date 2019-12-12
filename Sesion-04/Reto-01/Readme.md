[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Reto-01
## Filtrando datos con la instrucción `SELECT`

### OBJETIVO
- Hacer uso de filtros como NOT, IN y LIKE
- Hacer uso de operadores AND y OR
- Obtener resultados a por medio de la ejecución de consultas SQL

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Datos de acceso al Servidor MariaDB

### DESARROLLO
1. Usa la misma terminal abierta en el `Ejemplo-01` donde se tiene la conexión activa al Servidor MariaDB.

1. La primera consulta consiste en imprimir la lista de los usuarios con genero masculino e indicar cuantos son:
   ```sql
   MiNombre> ???
   +----+--------+------+------+-------+
   | id | genero | edad | ocup | cp    |
   +----+--------+------+------+-------+
   | 2  | M      | 56   | 16   | 70072 |
   | 3  | M      | 25   | 15   | 55117 |
   | 4  | M      | 45   | 7    | 02460 |
   | 5  | M      | 25   | 20   | 55455 |
   | 7  | M      | 35   | 1    | 06810 |
   | 8  | M      | 25   | 12   | 11413 |
   | 9  | M      | 25   | 17   | 61614 |
   | 12 | M      | 25   | 12   | 32793 |
   | 13 | M      | 45   | 1    | 93304 |
   | 14 | M      | 35   | 0    | 60126 |
   +----+--------+------+------+-------+

   10 rows in set
   Time: 0.093s
   MiNombre>  
   ```
   Se revisa que al menos los primeros diez resultados tengan el valor de `M` en el campo de `genero` y entonces se cuentan:
   ```sql
   MiNombre> ???
   +----------+
   | COUNT(*) |
   +----------+
   | 4331     |
   +----------+
   1 row in set
   Time: 0.092s
   MiNombre>  
   ```
   Por lo tanto se tiene un total de 4331 usuarios con genero masculino que realizaron valoraciones de películas.

1. Imprimir la lista de todos los usuarios que son mayor de edad y que su ocupación sea artista o escritor e indicar cuantos son.

   Para resolver esta consulta se tiene que buscar cuales son los códigos para artista y escritor en el archivo `README` obteniendo `???` y `???`, así ya se puede crear la consulta:
   ```sql
   MiNombre> ???
   ???
   ???
   ???
   ...

   10 rows in set
   Time: 0.091s
   MiNombre>  
   ```
   Se observa que la edad nunca tiene que ser `???` y la ocupación sólo es `???` y `???`. Ahora se realiza la cuenta con:
   ```sql
   MiNombre> ???
   +----------+
   | COUNT(*) |
   +----------+
   | 545      |
   +----------+
   1 row in set
   Time: 0.091s
   MiNombre>  
   ```
   Por lo tanto se tiene un total de 545 registros.

1. Imprimir la lista de películas que fueron estrenadas en el año 2000 e indicar cuantas son.

   Para resolver esta consulta se hará uso de la tabla `???` y de la instrucción `LIKE` usando la consulta siguiente:
   ```sql
   MiNombre> ???
   +------+-------------------------+-------------------------+
   | id   | title                   | genres                  |
   +------+-------------------------+-------------------------+
   | 3190 | Supernova (2000)        | Adventure|Sci-Fi        |
   | 3225 | Down to You (2000)      | Comedy|Romance          |
   | 3239 | Isn t She Great? (2000) | Comedy                  |
   | 3273 | Scream 3 (2000)         | Horror|Mystery|Thriller |
   | 3276 | Gun Shy (2000)          | Comedy                  |
   | 3286 | Snow Day (2000)         | Comedy                  |
   | 3291 | Trois (2000)            | Thriller                |
   | 3298 | Boiler Room (2000)      | Drama                   |
   | 3299 | Hanging Up (2000)       | Comedy|Drama            |
   | 3300 | Pitch Black (2000)      | Action|Sci-Fi           |
   +------+-------------------------+-------------------------+

   10 rows in set
   Time: 0.090s
   MiNombre>  
   ```
   Observar que el obtener el resultado usando SQL es relativamente más simple que usando directamente los archivos CSV ya que en SQL es posible indicar sobre que campo se realiza la comparación.

   La cantidad de registros se obtiene con:
   ```sql
   MiNombre> ???
   +----------+
   | COUNT(*) |
   +----------+
   | 120      |
   +----------+
   1 row in set
   Time: 0.096s
   MiNombre>  
   ```
   Se obtiene un total de 120 películas estrenadas en el año 2000.

1. Imprime la lista de todas las películas cuyo género sea horror, misterio o suspenso e indica cuantas son.

   La solución se obtiene al combinar la instrucción `LIKE` con el operador `OR` resultando la consulta siguiente:
   ```sql
   MiNombre> ???
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
   Se comprueba que los resultados incluyen los géneros solicitados, entonces se obtiene el número de registros:
   ```sql
   MiNombre> ???
   +----------+
   | COUNT(*) |
   +----------+
   | 611      |
   +----------+
   1 row in set
   Time: 0.108s
   MiNombre>  
   ```
   Se obtiene un total de 611 películas que pertenecen a los géneros solicitados y que se les realizó cuando menos una valoración (¿?).

__Misión cumplida__
