[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-02
## Comandos para manipular archivos

### OBJETIVOS
- Crear y visualizar archivos desde la terminal
- Conocer los comandos para manipular archivos

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Reto-01 terminado

### DESARROLLO
1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02
   Ejemplo-02 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-02
   Ejemplo-02 $ ls
   Ejemplo-02 $
   ```
   Se actualiza la carpeta de trabajo, después se obtiene la carpeta o ruta de trabajo actual para validar la carpeta de trabajo actual y al final se lista el contenido, que en este caso es vacío porque aparece inmediatamente después el símbolo de sistema o prompt `Ejemplo-02 $`.

   __Nota:__ El símbolo de sistema (prompt) puede variar de sistema a sistema.

1. Crea tu primer archivo desde terminal con el comando `touch nombre_de_archivo`
   ```console
   Ejemplo-02 $ touch datos.txt
   Ejemplo-02 $ ls -l
   -rw-rw-r-- 1 rctorr rctorr 0 nov 27 12:44 datos.txt
   Ejemplo-02 $
   ```
   Notar que el archivo `datos.txt` tiene tamaño cero, así que el comando `touch` se usa para crear y definir el nombre de un archivo vacío.

1. Creando un archivo con contenido usando el comando `echo línea de texto > archivo`
   ```console
   Ejemplo-02 $ echo Primer línea de texto
   Primer línea de texto
   Ejemplo-02 $
   ```
   El comando `echo` imprime todo lo se escribe después del comando, pero si queremos que el resultado de un comando se guarde en un archivo se hace uso del símbolo `>` (redirección)
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

__Felicidades__ Has aprendido la habilidad de manipular archivos desde la terminal
