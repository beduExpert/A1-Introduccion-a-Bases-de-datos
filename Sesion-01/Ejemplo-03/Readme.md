[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-03
## Comandos para obtener y descomprimir archivos

### OBJETIVOS
- Descargar archivos desde la terminal
- Descomprimir archivos desde la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Comandos `curl` y `unzip` instalados en Linux, MacOS y Windows
1. Carpeta de repositorio actualizada

#### DESARROLLO
1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03
   Ejemplo-03 $
   ```

1. Para descargar archivos se hace uso del comando `curl -O URL` o `curl -o nombre.txt URL` si se desea asignar un nombre al archivo de descarga distinto.

   A continuación se descargará el archivo indicado por la siguiente URL:
   - http://files.grouplens.org/datasets/movielens/ml-1m-README.txt

   ```console
   Ejemplo-03 $ curl -O http://files.grouplens.org/datasets/movielens/ml-1m-README.txt
   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
   100  5576  100  5576    0     0   453k      0 --:--:-- --:--:-- --:--:--  453k
   Ejemplo-03 $ ls
   ml-1m-README.txt
   Ejemplo-02 $
   ```
   El comando `curl` descarga el contenido del archivo `ml-1m-README.txt` indicado por la URL y guarda en el archivo con el mismo nombre. Se hace uso del comando `ls` para validar la descarga.

   Para ver el contenido del archivo se hace uso del comando `cat`
   ```console
   Ejemplo-03 $ cat ml-1m-README.txt
   [...]
   * Film-Noir
   * Horror
 	 * Musical
   * Mystery
   * Romance
   * Sci-Fi
   * Thriller
   * War
   * Western

   - Some MovieIDs do not correspond to a movie due to accidental duplicate
     entries and/or test entries
   - Movies are mostly entered by hand, so errors and inconsistencies may exist
   Ejemplo-03 $
   ```
   El comando `cat` imprime el contenido de todo el archivo y sólo se observan las últimas líneas, dependerá del tamaño de la ventana de la terminal cuantas líneas se observan al final.

1. Para poder revisar el contenido de archivos muy grandes se puede hacer uso del comando `less nombre-de-archivos`
   ```console
   Ejemplo-03 $ less ml-1m-README.txt
   SUMMARY
   ================================================================================

   These files contain 1,000,209 anonymous ratings of approximately 3,900 movies
   made by 6,040 MovieLens users who joined MovieLens in 2000.

   USAGE LICENSE
   ================================================================================

   Neither the University of Minnesota nor any of the researchers
   involved can guarantee the correctness of the data, its suitability
   for any particular purpose, or the validity of results based on the
   use of the data set.  The data set may be used for any research
   purposes under the following conditions:

        * The user may not state or imply any endorsement from the
          University of Minnesota or the GroupLens Research Group.

        * The user must acknowledge the use of the data set in
          publications resulting from the use of the data set
          (see below for citation information).

        * The user may not redistribute the data without separate
   :
   ```
   El comando `less` abre el archivo mostrando tantas líneas como es posible y al final se muestra una línea con dos puntos que indica que el comando `less` está esperando a que el usuario presione alguna tecla, donde cada tecla hará que se ejecute una acción, una lista de las teclas y las acciones más usadas son:

   - __ENTER__: Avanza una línea en el contenido
   - __Espacio__: Avanza una página completa en el contenido
   - __B__: Regresa media página en el contenido
   - __Q__: Salir del comando `less`

   Así que has uso de las teclas mencionadas para ubicar la información correspondiente al archivo `users.dat`, esta informaciónla usaremos más adelante.

   Presiona la tecla `Q` para salir de `less`   

1. El comando `curl` también se puede utilizar para descargar archivo gigantes usando las opciones `-C - --retry 999`.

   Descargar el archivo de 3.1GB desde la siguiente URL:
   - http://files.grouplens.org/datasets/movielens/ml-20mx16x32.tar

   ```console
   Ejemplo-03 $ curl -O -C - --retry 999 http://files.grouplens.org/datasets/movielens/ml-20mx16x32.tar
   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
   0 3173M    0  967k    0     0  94041      0  9:49:42  0:00:10  9:49:32 26626
   Ejemplo-03 $
   ```
   En este caso se está descargando un archivo de aproximadamente 3.1GB, con la opción `-C -` (hay espacio antes del último guión) la descarga continua donde se quedó en caso de que sea interrumpida y con la opión `--retry 999` en caso de que la descarga sea interrumpida `curl` reintentará hasta 999 veces la descarga.

   __Nota:__ Para cancelar la ejecución de cualquier comando en la terminal presiona las teclas __Control+C__.

   Se cancela la descarga y se borra el archivo `ml-20mx16x32.tar` ya que es un archivo incompleto.
   ```console
   Ejemplo-03 $ rm ml-20mx16x32.tar
   Ejemplo-03 $ ls
   ml-1m-README.txt
   Ejemplo-03 $
   ```

__Felicidades__ Has aprendido la habilidad de descargar archivos desde la terminal
