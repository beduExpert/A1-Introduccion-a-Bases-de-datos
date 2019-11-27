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
   ```bash
   Ejemplo-02 $ touch datos.txt
   Ejemplo-02 $ ls -l
   -rw-rw-r-- 1 rctorr rctorr 0 nov 27 12:44 datos.txt
   Ejemplo-02 $
   ```
   Notar que el archivos `datos.txt` tiene tamaño cero, así que el comando `touch` se usa para crear y definir el nombre de un archivo vacío.

1. Creando un archivo con contenido con el comando `echo línea de texto > archivo`
   ```bash
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


9. Elimina el directorio archivos2
```
$rm -R archivos2
````
10. Limpia la consola y enlista lo que contiene tu directorio
```
$clear
$ls
```
10. Descarga el siguiente archivo y muestra sus contenidos: https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt
```
$wget -O cs.txt https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt

$cat cs.txt
```
