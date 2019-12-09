[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Ejemplo-03
## Consultas de datos con expresiones regulares

### OBJETIVOS
- Analizar contenido de archivos
- Realizar filtrado de resultados usando expresiones regulares
- Contabilizar resultados

### REQUISITOS
1. Carpeta de repositorio actualizada
1. Reto-02 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Ejemplo-03
   Ejemplo-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-02` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-03 $ cp -a ../Reto-02/Datos .
   Ejemplo-03 $ cd Datos/ml-1m
   ml-1m $
   ```

1. La primera consulta consiste en imprimir toda la lista de películas que sean de género _Acción_ (Action).
   ```console
   ml-1m $ grep -a Action movies.csv
   [...]
   3710,Action Jackson (1988),Action|Comedy <- Action aparece en dos columnas
   3716,Fatal Beauty (1987),Action|Crime
   3717,Gone in 60 Seconds (2000),Action|Crime
   3726,Assault on Precinct 13 (1976),Action|Thriller
   3729,Shaft (1971),Action|Crime
   3740,Big Trouble in Little China (1986),Action|Comedy
   3744,Shaft (2000),Action|Crime
   3753,Patriot, The (2000),Action|Drama|War
   3755,Perfect Storm, The (2000),Action|Adventure|Thriller
   3763,F/X (1986),Action|Crime|Thriller
   3764,F/X 2 (1992),Action|Crime|Thriller
   [...]
   ```
   Aunque el resultado obtenido es muy bueno, recuerda que el comando `grep` hace la búsqueda de la palabra `Action` en toda la línea y no sólo en la tercer columna, dando resultados como el caso de la película con id 3710, donde el título también incluye la palabra _Action_, así que vamos a ajustar la consulta para que sólo se incluya la tercer columna.

   __Nota:__ La opción `-a` es para indicar que se está usando un archivo de texto.
   ```console
   ml-1m $ grep -a ,Action movies.csv
   [...]
   3827,Space Cowboys (2000),Action|Sci-Fi
   3836,Kelly's Heroes (1970),Action|Comedy|War
   3841,Air America (1990),Action|Comedy
   3864,Godzilla 2000 (Gojira ni-sen mireniamu) (1999),Action|Adventure|Sci-Fi
   3877,Supergirl (1984),Action|Adventure|Fantasy
   3879,Art of War, The (2000),Action
   3889,Highlander: Endgame (2000),Action|Adventure|Fantasy
   3898,Bait (2000),Action|Comedy
   3946,Get Carter (2000),Action|Drama|Thriller
   ml-1m $
   ```
   Afortunadamente la palabra `Action` si aparece, siempre aparece después de una coma, así que el criterio es muy simple en este caso, así que para guardar la lista de películas pertenecientes al género acción y saber cuantas son se realiza de la siguiente manera:
   ```console
   ml-1m $ grep -a ,Action movies.csv > movies-action.csv
   ml-1m $ wc movies-actions.csv
     503  1946 23834 movies-action.csv
   ml-1m $
   ```
   Así que tenemos 503 películas que pertenecen al género acción.

1. Imprime la lista de películas que incluyan la palabra _Romance_ en su título.

   Primero se usará el comando `grep` para imprimir todos los registros que incluyan la palabra _Romance_
   ```console
   ml-1m $ grep -a Romance movies.csv
   [...]
   3855,Affair of Love, An (Une Liaison Pornographique) (1999),Drama|Romance
   3874,Couch in New York, A (1996),Comedy|Romance
   3885,Love & Sex (2000),Comedy|Romance
   3888,Skipped Parts (2000),Drama|Romance
   3909,Woman on Top (2000),Comedy|Romance
   ml-1m $
   ```
   Lo que registros donde la palabra _Romance_ aparece en la tercer columna, pero queremos que sólo aparezca la palabra en la segunda columna, así que siempre debería de aparecer una coma después, entonces el comando queda así:
   ```console
   ml-1m $ grep -a Romance, movies.csv
   ml-1m $
   ```
   El resultado es vacío, porque ningún título termina con la palabra _Romance_, así que en estos casos se puede hacer uso de algunos operadores de las expresiones regulares, algunos de los más comunes se muestran a continuación:

   Operadores básicos en expresiones regulares
   - __.__ Indica que debe existir cualquier símbolo en la posición donde se coloca.
   - __^palabra__ Indica cualquier línea que inicie con __palabra__
   - __palabra$__ Indica cualquier línea que termine con __palabra__
   - __símbolo*__ Indica que el __símbolo__ debe existir cero o más veces
   - __símbolo+__ Indica que el __símbolo__ debe existir una o más veces

   Así que para nuestro caso se usará el la combinación __.*__ para indicar que después de la palabra _Romance_ pueden existir cualquier conjuntos de símbolos hasta la coma, así que el comando final queda:
   ```console
   ml-1m $ grep -a Romance.*, movies.csv
   555,True Romance (1993),Action|Crime|Romance
   2894,Romance (1999),Drama|Romance
   3501,Murphy's Romance (1985),Comedy|Romance
   ml-1m $
   ```
   Con lo que se obtiene una lista de sólo 3 películas

1. Imprimir la lista de todas las películas con __id__  entre 3000 y 4000.

   A nivel terminal es laborioso hacer operaciones, además de que cada registro es una línea y aunque los campos están separados por comas, no es simple trabajar con la información campo por campo, así que nuevamente se hará uso de expresiones regulares pensando en el __id__ como una cadena de texto y no como un número.

   Se imprimen todos los registros que inician con con 3, ya que el rango va de los 3000 a los 3999.
   ```console
   ml-1m $ grep -a ^3 movies.csv | head
   3,Grumpier Old Men (1995),Comedy|Romance
   30,Shanghai Triad (Yao a yao yao dao waipo qiao) (1995),Drama
   31,Dangerous Minds (1995),Drama
   32,Twelve Monkeys (1995),Drama|Sci-Fi
   33,Wings of Courage (1995),Adventure|Romance
   34,Babe (1995),Children's|Comedy|Drama
   35,Carrington (1995),Drama|Romance
   36,Dead Man Walking (1995),Drama
   37,Across the Sea of Time (1995),Documentary
   38,It Takes Two (1995),Comedy
   ml-1m $
   ```
   Se agrega el comando `head` para ver sólo los primero 10 resultados, y se observa que todos inician con __3__, pero se han incluido los que tienen 1, 2 dígitos cuando menos, así que se tiene que indicar que se requieren cuatro dígitos en total.
   ```console
   ml-1m $ grep -a ^3..., movies.csv | head
   3000,Princess Mononoke, The (Mononoke Hime) (1997),Action|Adventure|Animation
   3001,Suburbans, The (1999),Drama
   3002,My Best Fiend (Mein liebster Feind) (1999),Documentary
   3003,Train of Life (Train De Vie) (1998),Comedy|Drama
   3004,Bachelor, The (1999),Comedy|Romance
   3005,Bone Collector, The (1999),Thriller
   3006,Insider, The (1999),Drama
   3007,American Movie (1999),Documentary
   3008,Last Night (1998),Thriller
   3009,Portraits Chinois (1996),Drama
   ml-1m $
   ```
   Con esto obtenemos justo lo que necesitamos, así que ahora procedemos a guardar el resultado y a contar el número de registros.
   ```console
   ml-1m $ grep -a ^3..., movies.csv > movies-3000.csv
   ml-1m $ wc movies-3000.csv
     952  3915 39798 movies-3000.csv
   ml-1m $
   ```
   Así que tenemos 952 películas en el rango con id de 3000 a 4000

__Misión cumplida__
