[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Reto-02
## Comandos para manipular archivos

### OBJETIVO
- Ejecutar comandos para manipular archivos
- Ejecutar comandos para descargar archivos
- Adquirir la habilidad en el uso de la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Comandos `curl` y `unzip` instalado en Linux, MacOS y Windows
1. Carpeta de repositorio actualizada

#### DESARROLLO
1. Abrir la terminal (Linux y Mac) o Git Bash (Windows) si no está abierta

1. Para continuar es necesario descargar un conjunto de datos (dataset), colocarlo en la carpeta de trabajo `Datos`, descomprimir el archivo zip obtenido y crear un respaldo de la carpeta obtenida con la terminación `.1` que será nuestra primer respaldo por si acaso dañamos nuestros archivos.

   La URL del archivo a descargar es:
     - http://files.grouplens.org/datasets/movielens/ml-1m.zip

   Todos los archivos y/o carpetas deben quedar dentro del la carpeta `Sesion-01/Reto-02` debiendo obtener una lista de carpetas y archivos similar a la siguiente:

   ```console
   Datos
   ├── ml-1m
   │   ├── movies.dat
   │   ├── ratings.dat
   │   ├── README
   │   └── users.dat
   ├── ml-1m.1
   │   ├── movies.dat
   │   ├── ratings.dat
   │   ├── README
   │   └── users.dat
   └── ml-1m.zip
   ```

   __Solución:__
   ```console
   $ cd Introduccion-a-Bases-de-Datos
   Introduccion-a-Bases-de-Datos $ cd Sesion-01
   Sesion-01 $ cd Reto-02
   Reto-02 $ mkdir ???
   Reto-02 $ cd ???
   Datos $ curl -O ???
   [...]
   Datos $ ???
   [...]
   [...]
   [...]
   Datos $ ls
   ml-1m  ml-1m.1  ml-1m.zip
   Datos $
   ```
