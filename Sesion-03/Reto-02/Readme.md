[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Reto-02
## Realizando operaciones con tablas

### OBJETIVOS
- Realizar operaciones SQL para administrar tablas
- Crear tablas acorde a los datos

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada
1. Ejemplo-02 realizado

### DESARROLLO
1. Activa la _Terminal_ (en Linux o Mac) o _Git bash_ (en Windows) donde se consultó la información en el `Ejemplo-01`

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Reto-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Reto-02
   Reto-02 $
   ```

1. Copiar la carpeta `Datos` en `Sesion-03/Ejemplo-02/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-02 $ cp -a ../Ejemplo-02/Datos .
   Reto-02 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Definir los campos y tipos de datos para la tabla `movies` haciendo uso de los archivos `movies.csv` y `README`

   Primero se revisan los primeros 10 registros con el comando `head`
   ```console
   ml-1m $ head movies.csv
   1,Toy Story (1995),Animation|Children's|Comedy
   2,Jumanji (1995),Adventure|Children's|Fantasy
   3,Grumpier Old Men (1995),Comedy|Romance
   4,Waiting to Exhale (1995),Comedy|Drama
   5,Father of the Bride Part II (1995),Comedy
   6,Heat (1995),Action|Crime|Thriller
   7,Sabrina (1995),Comedy|Romance
   8,Tom and Huck (1995),Adventure|Children's
   9,Sudden Death (1995),Action
   10,GoldenEye (1995),Action|Adventure|Thriller
   ml-1m $
   ```
   Y luego se revisa la documentación con el comando `less`
   ```console
   ml-1m $ less README
   MOVIES FILE DESCRIPTION
   ================================================================================

   Movie information is in the file "movies.dat" and is in the following
   format:

   MovieID::Title::Genres

   - Titles are identical to titles provided by the IMDB (including
   year of release)
   - Genres are pipe-separated and are selected from the following genres:

           * Action
           * Adventure
           * Animation
           * Children's
           * Comedy
           * Crime
           * Documentary
           * Drama
           * Fantasy
           * Film-Noir
           * Horror
   :
   ```
   Así que se definen los siguientes campos y tipo para crear la tabla `movies` en SQL:
   - __id__ INT PRIMARY KEY
   - __title__ VARCHAR(80)
   - __generos__ VARCHAR(80)

1. Activa la ventana de la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se está ejecutando el comando `mycli` donde al final se vea el prompt con el nombre de tú base de datos `MiNombre>`

1. Crear la tabla `movies` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

   ```sql
   MiNombre> CREATE TABLE IF NOT EXISTS movies (id INT PRIMARY KEY, title VARCHAR(80), generos VARCHAR(80));
   Query OK, 0 rows affected
   Time: 0.256s
   MiNombre>  
   ```
   Para validar que la tabla `movies` fué creada se imprime la lista de tablas disponibles en la base de datos:
   ```sql
   MiNombre> SHOW TABLES;
   +--------------------+
   | Tables_in_MiNombre |
   +--------------------+
   | movies             |
   | users              |
   +--------------------+
   2 rows in set
   Time: 0.097s
   MiNombre>  
   ```
   __SUGERENCIA:__  Si te has equivocado con el nombre de la tabla, usa el comando `DROP TABLE` para eliminar la tabla y creala nuevamente.

1. Activa la _Terminal_ (en Linux o Mac) o _Git bash_ (en Windows) donde se consultó la información para la tabla `movies`

1. Definir los campos y tipos de datos para la tabla `ratings` haciendo uso de los archivos `ratings.csv` y `README`

   Primero se revisan los primeros 10 registros con el comando `head`
   ```console
   ml-1m $ head raitings.csv
   1,1193,5,978300760
   1,661,3,978302109
   1,914,3,978301968
   1,3408,4,978300275
   1,2355,5,978824291
   1,1197,3,978302268
   1,1287,5,978302039
   1,2804,5,978300719
   1,594,4,978302268
   1,919,4,978301368
   ml-1m $
   ```
   Y luego se revisa la documentación con el comando `less`
   ```console
   ml-1m $ less README
   RATINGS FILE DESCRIPTION
   ================================================================================

   All ratings are contained in the file "ratings.dat" and are in the
   following format:

   UserID::MovieID::Rating::Timestamp

   - UserIDs range between 1 and 6040
   - MovieIDs range between 1 and 3952
   - Ratings are made on a 5-star scale (whole-star ratings only)
   - Timestamp is represented in seconds since the epoch as returned by time(2)
   - Each user has at least 20 ratings

   USERS FILE DESCRIPTION
   ================================================================================

   User information is in the file "users.dat" and is in the following
   format:

   UserID::Gender::Age::Occupation::Zip-code

   All demographic information is provided voluntarily by the users and is
   :
   ```
   Así que se definen los siguientes campos y tipo para crear la tabla `ratings` en SQL:
   - __userid__ INT
   - __movieid__ INT
   - __rating__ INT
   - __time_stamp__ BIGINT

1. Crear la tabla `ratings` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

   ```sql
   MiNombre> CREATE TABLE IF NOT EXISTS ratings (userid INT, movieid INT, rating INT, time_stamp BIGINT);
   Query OK, 0 rows affected
   Time: 0.256s
   MiNombre>  
   ```
   Para validar que la tabla `ratings` fué creada se imprime la lista de tablas disponibles en la base de datos:
   ```sql
   MiNombre> SHOW TABLES;
   +--------------------+
   | Tables_in_MiNombre |
   +--------------------+
   | movies             |
   | ratings            |
   | users              |
   +--------------------+
   3 rows in set
   Time: 0.090s
   MiNombre>  
   ```
   __SUGERENCIA:__  Si te has equivocado con el nombre de la tabla, usa el comando `DROP TABLE` para eliminar la tabla y creala nuevamente.

__Misión cumplida__
