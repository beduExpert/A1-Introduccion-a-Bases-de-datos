[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-01
## Comandos para manipular carpetas

### OBJETIVO
- Conocer la terminal
- Conocer y ejecutar comandos para manipular carpetas
- Adquirir la habilidad en el uso de la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada

#### DESARROLLO
1. Abrir la terminal (Linux y Mac) o Git Bash (Windows)

   __Sugerencia:__ Adicional a resolver dudas de que es una terminal o porqué usar una terminal comentar porqué usar Git Bash y no CMD o Power Shell en Windows.
   
1. Obtener la ruta (o path) de la carpeta actual, escribe el comando `pwd` y presiona ENTER:
   ```console
   $ pwd
   /home/rctorr
   ```
   Todo lo que aparece desde el inicio de la línea hasta el signo de $ es lo que se conoce como la señal o prompt del sistema operativo, el símbolo de $ no lo tienes que teclear, sólo indica que lo que tu vayas a teclear será después de ese símbolo.
   El comando en este caso es `pwd` y para ejecutarlo has presionado la tecla __ENTER__.
   El resultado se muestra en la línea siguiente y es `/home/rctorr`.

   El comando `pwd` te permite siempre conocer la carpeta de trabajo en la que te encuentras.

1. Obtener la lista de elementos de la carpeta actual, escribe el comando `ls` y presiona ENTER:
   ```console
   $ ls
    bin                           Documentos      Música         Escritorio      Sesion08                      Notas.md        Vídeos
    DesarrolloPython              Imágenes        Plantillas     miniconda3      Público                       Descargas       mi_proyecto     repos
   $
   ```
   En Linux y MacOS el resultado es como el mostrado, en Windows la lista podrá aparecer en una sola columna.

1. El comando `ls` se le pueden agregar opciones para que proporcione más información de los elementos, así que una alternativa es usar la opción `-l` que mostrará permisos, usuario y grupo propietarios, tamaño, fecha y nombre.
   ```console
   $ ls -l
   drwxrwxr-x  2 rctorr rctorr     4096 oct 29 14:47  bin/
   drwxr-xr-x  8 rctorr rctorr     4096 nov 26 12:08  Descargas/
   drwxr-xr-x  5 rctorr rctorr     4096 nov 21 15:52  Documentos/
   drwxr-xr-x  2 rctorr rctorr     4096 nov 23 09:25  Escritorio/
   drwxr-xr-x  2 rctorr rctorr     4096 nov 25 19:54  Imágenes/
   drwxrwxr-x 15 rctorr rctorr     4096 nov 11 10:42  miniconda3/
   drwxr-xr-x  2 rctorr rctorr     4096 oct 20 04:43  Música/
   -rwxr-xr-x  1 rctorr rctorr      390 nov  9 13:39  my_script.sh*
   -rw-rw-r--  1 rctorr rctorr      160 nov 23 09:29  Notas.md
   drwxr-xr-x  2 rctorr rctorr     4096 oct 20 04:43  Plantillas/
   drwxrwxr-x  6 rctorr rctorr     4096 nov 19 05:18  repos/
   drwxr-xr-x  3 rctorr rctorr     4096 oct 27 03:15  Vídeos/
   $
   ```
   De aquí en adelante puedes elegir entre usar `ls` o `ls -l` según te convenga.

1. Crear una nueva carpeta llamada `CursoBD`:
   ```console
   $ mkdir CursoBD
   $
   ```
   El comando `mkdir` crea una carpeta con el nombre que indiques, recuerda dejar un espacio entre el comando y el nombre de la carpeta.

   Si al presionar la tecla __ENTER__ aparece otra línea que al final termina con `$` _no te preocupes_ la terminal es _introvertida_ y no comunica mucho a menos que haya errores.

1. Cambiar de carpeta se realiza con el comando `cd nombre_de_carpeta`
   ```console
   $ cd CursoBD
   CursoBD $
   ```
   Es posible que al cambiar de carpeta, en el prompt se muestre el nombre de la carpeta en la que te encuentras o posiblemente no (CursoBD en este caso), eso varía de sistema a sistema, así que no aparece no te preocupes, siempre puedes ocupar el comando `pwd`.

1. Examinar el contenido de la carpeta actual con el comando `ls`
   ```console
   CursoBD $ ls
   CursoBD $   
   ```
   Al estar la carpeta vacía se muestra una nueva línea con el prompt sin indicar mensaje alguno, tranquilx, todo está bien.

1. Crear las siguientes dos carpetas `Proyecto1` y `Proyecto2`
   ```console
   CursoBD $ mkdir Proyecto1 Proyecto2
   CursoBD $ ls
   Proyecto1  Proyecto2
   ```
   Nota que después de crear las carpetas se lista el contenido también para verificar que las carpetas han sido creadas.

1. También puedes crear carpetas y subcarpetas, agregando la opción `-p` al comando `mkdir`, por ejemplo crear la carpeta `Proyecto3` y dentro la carpeta `Doc`
   ```console
   CursoBD $ mkdir -p Proyecto3/Doc
   CursoBD $ ls
   Proyecto1  Proyecto2  Proyecto3
   CursoBD $ ls Proyecto3
   Doc
   CursoBD $
   ```
   Se muestra también el contenido de la carpeta actual donde se muestra la carpeta `Proyecto3` y también el contenido de la carpeta `Proyecto3` donde aparece la carpeta `Doc`.

1. Por último para eliminar una carpeta se realiza con el comando `rmdir nombre_de_carpeta`, así que procede a borrar las carpetas `Proyecto2` y `Proyecto3`
   ```console
   CursoBD $ rmdir Proyecto2
   CursoBD $ rmdir Proyecto3
   rmdir: fallo al borrar 'Proyecto3': El directorio no está vacío
   ```
   Al ejecutar los comando se observa que la carpeta `Proyecto2` se borró de forma exitosa ya que no apareció mensaje alguno (_la terminal es tímida_), pero al intentar borrar la carpeta `Proyecto3` apareció un mensaje de error y lo que indica es que el comando `rmdir` sólo puede borrar carpetas que estén totalmente vacías.

1. Para borrar carpetas no vacías se hace uso del comando `rm -r nombre_de_carpeta`
   ```console
   CursoBD $ rm -r Proyecto3
   CursoBD $ ls
   Proyecto1
   CursoBD $
   ```
   Al mostrar la lista con `ls` se observa que ya sólo queda la carpeta `Proyecto1` por lo que se comprueba que las carpetas `Proyecto2` y `Proyecto3` fueron eliminadas.

1. Para regresar a una carpeta anterior se hace uso del comando `cd ..`
   ```console
   CursoBD $ cd ..
   $ rm -r CursoBD
   $
   ```
   Al final también se ha borrado la carpeta `CursoBD`

__Misión cumplida__
