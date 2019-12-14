[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Proyecto
## Relacionando dos o más tablas con la instrucción `JOIN`

### OBJETIVOS
- Crear consultas SQL que relaciones a dos o más tablas
- Responder a preguntas que relacionen más de una fuente de información

### REQUISITOS
1. Carpeta de repo actualizada

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se tiene el comando `mycli`.

1. Imprime la lista de todas las películas de acción que obtuvieron una valoración de 5.

   La solución necesita hacer uso de la instrucción `JOIN` y relacionar las tablas `movies` y `ratings`:
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
   Se recomienda construir la consulta paso a paso hasta obtener el resultado solicitado, además de hacer uso de la instrucción `DISTINCT`

   Para corroborar que tu resultado es correcto, `mycli` debe indicar que hay 342 registros en el resultado.

1. De la consulta en el punto anterior indica cuantos usuarios femenino y masculino realizaron valoraciones a películas del género acción y con una valoración de 5.

   Y el total se otiene con:
   ```sql
   MiNombre> ???
   ```

__Misión cumplida__
