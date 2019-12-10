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
   Reto-02 $ ???
   Reto-02 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Definir los campos y tipos de datos para la tabla `movies` haciendo uso de los archivos `movies.csv` y `README`

   Primero se revisan los primeros 10 registros con el comando `head`
   ```console
   ml-1m $ ???
   ???
   ???
   ...
   ml-1m $
   ```
   Y luego se revisa la documentación con el comando `less`
   ```console
   ml-1m $ ???
   ???
   ???
   ???
   :
   ```
   Así que se definen los siguientes campos y tipo para crear la tabla `movies` en SQL:
   - __???__ ???
   - __???__ ???
   - __???__ ???

1. Activa la ventana de la _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows) donde se está ejecutando el comando `mycli` donde al final se vea el prompt con el nombre de tú base de datos `MiNombre>`

1. Crear la tabla `movies` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

   ```sql
   MiNombre> ???
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
   ml-1m $ ???
   ???
   ???
   ???
   ...
   ml-1m $
   ```
   Y luego se revisa la documentación con el comando `less`
   ```console
   ml-1m $ ???
   ???
   ???
   ???
   ...
   :
   ```
   Así que se definen los siguientes campos y tipo para crear la tabla `ratings` en SQL:
   - __???__ ???
   - __???__ ???
   - __???__ ???
   - __???__ ???

1. Crear la tabla `ratings` (recuerda usar el mismo nombre del archivo sin la extensión para vincular nombres de tablas con archivos)

   ```sql
   MiNombre> ???
   Query OK, 0 rows affected
   Time: 0.256s
   MiNombre>  
   ```
   Para validar que la tabla `ratings` fué creada se imprime la lista de tablas disponibles en la base de datos:
   ```sql
   MiNombre> ???
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
