[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-02
## Comandos para manipular archivos

### OBJETIVO
- Crear y visualizar archivos desde la terminal
- Conocer los comandos para manipular archivos
- Descargar archivos desde la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Comando `curl` instalado en Linux, MacOS y Windows
1. Carpeta de repositorio actualizada
1. Reto-01 terminado

#### DESARROLLO
1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02
   Ejemplo-02 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02
   Ejemplo-02 $ ls
   Ejemplo-02 $
   ```
   Se actualiza la carpeta de trabajo, se obtiene la carpeta o ruta de trabajo actual y se lista su contenido, que en este caso es vacío.

1. Crea tu primer archivo desde terminal con el comando `touch nombre_de_archivo`
   ```console
   Ejemplo-02 $ touch datos.txt
   Ejemplo-02 $ ls -l
   -rw-rw-r-- 1 rctorr rctorr 0 nov 27 12:44 datos.txt
   Ejemplo-02 $
   ```
   Notar que el archivos `datos.txt` tiene tamaño cero, así que el comando `touch` se usa para crear y definir el nombre de un archivo vacío.

1. Creando un archivo con contenido con el comando `echo línea de texto > archivo`
   ```console
   Ejemplo-02 $ echo Primer línea de texto
   Primer línea de texto
   Ejemplo-02 $
   ```
   El comando `echo` imprime todo lo se escribe después del comando, pero si queremos que el resultado de un comando se guarde en un archivo se hace uso del símbolo `>`
   ```bash
   Ejemplo-02 $ echo Primer línea de texto > datos.txt
   Ejemplo-02 $ ls -l
   -rw-rw-r-- 1 rctorr rctorr 23 nov 27 12:54 datos.txt
   ```
   En la lista se observa que ahora el archivo `datos.txt` ya cuenta con 27 bytes.

1. Para obtener el contenido de un archivo de texto se hace uso del comando `cat nombre_de_archivo`
   ```console
   Ejemplo-02 $ cat datos.txt
   Primer línea de texto
   Ejemplo-02 $
   ```
   Se obtiene el contenido del archivo `datos.txt` que hasta el momento sólo tiene la única línea que le hemos agregado, así que le vamos a agregar más líneas, para eso vamos a usar el símbolo `>>` que agrega nuevas líneas al final del archivo, en lugar de `>` que sobre escribe el archivo.
   ```console
   Ejemplo-02 $ echo Segunda línea de texto >> datos.txt
   Ejemplo-02 $ echo Tercer línea de texto >> datos.txt
   Ejemplo-02 $ cat datos.txt
   Primer línea de texto
   Segunda línea de texto
   Tercer línea de texto
   Ejemplo-02 $
   ```
   Sobre escribiendo el archivo `datos.txt`:
   ```console
   Ejemplo-02 $ echo Última línea de texto > datos.txt
   Ejemplo-02 $ cat datos.txt
   Última línea de texto
   Ejemplo-02 $
   ```

1. Para evitar perder información es importante realizar copias de nuestros archivos, para ello se hace uso del comando `cp nombre_original nuevo_nombre`
   ```console
   Ejemplo-02 $ cp datos.txt datos.1.txt
   Ejemplo-02 $ ls
   datos.1.txt  datos.txt
   Ejemplo-02 $
   ```
   Con el comando anterior hemos creado una copia del nuestro archivo `datos.txt` con el nuevo nombre `datos.1.txt`.

1. Para renombrar un archivo se hace uso del comando `mv nombre_original nuevo_nombre`
   ```console
   Ejemplo-02 $ cp datos.txt datos.1  # Una copia erronea
   Ejemplo-02 $ ls
   datos.1  datos.1.txt  datos.txt
   Ejemplo-02 $ mv datos.1 datos.2.txt
   Ejemplo-02 $ ls
   datos.1.txt  datos.2.txt  datos.txt
   Ejemplo-02 $

   ```
   Se ha realizado primero una copia erronea del archivo `datos.txt` al crear un segundo respaldo, por lo que es necesario usar el comando `mv` para asignar el nombre correcto al archivo. Notar que se hace uso del comando `ls` para imprimir la lista de archivos.

   __Nota:__ ¡Sabías que el comando `mv` también lo puedes usar para renombrar carpetas!

1. La operación final de archivos es para poder borrar archivos y se realiza con el comando `rm nombre_de_archivo`
   ```console
   Ejemplo-02 $ rm datos.2.txt
   Ejemplo-02 $ ls
   datos.1.txt  datos.txt
   Ejemplo-02 $
   ```
   El comando `rm` borra el archivo `datos.2.txt`, recuerda que los comandos enla terminal son `introvertidos` y si todo va bien no dicen nada, así que se hace uso del comando `ls` para imprimir la lista de archivos y comprobar que el archivo `datos.2.txt` ya no existe.

1. Para descargar archivos se hace uso del comando `curl -O URL`
   ```console
   Ejemplo-02 $ curl -o Readme.txt http://files.grouplens.org/datasets/movielens/ml-1m-README.txt
   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
   100  5576  100  5576    0     0   453k      0 --:--:-- --:--:-- --:--:--  453k
   Ejemplo-02 $ ls
   datos.1.txt  datos.txt  ml-1m-README.txt
   Ejemplo-02 $
   ```
   El comando `curl` descarga el contenido del archivo `ml-1m-README.txt` indicado por la URL y guarda en el archivo con el mismo nombre. Se hace uso del comando `ls` para validar la descarga y para ver el contenido del archivo se hace uso del comando `cat`
   ```console
   Ejemplo-02 $ cat ml-1m-README.txt
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
   Ejemplo-02 $
   ```
   El comando `cat` imprime el contenido de todo el archivo y sólo se observa la última líneas, dependerá del tamaño de la ventana de la terminal.

1. El comando `curl` se puede utilizar para descargar archivo gigantes usando las opciones `-C - --retry 999`
   ```console
   Ejemplo-02 $ curl -O -C - --retry 999 http://files.grouplens.org/datasets/movielens/ml-20mx16x32.tar
   ```
   En este caso se está descargando un archivo de aproximadamente 3.1GB, con la opción `-C -` (hay espacio antes del último guión) la descarga continua donde se quedó en caso de que sea interrumpida y con la opión `--retry 999` en caso de que la descarga sea interrumpida, curl intentará nuevamente la descarga y lo reintentará hasta 999 veces.

   __Nota:__ Para cancelar la ejecución de cualquier comando en la terminal presiona las teclas __Control+C__.

__Felicidades, has aprendido la habilidad de manipular archivos desde la terminal__
