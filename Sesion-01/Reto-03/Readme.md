[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Reto-03
## Comandos para obtener y descomprimir archivos

### OBJETIVO
- Ejecutar comandos para descargar archivos
- Ejecutar comandos para descomprimir archivos
- Adquirir la habilidad en el uso de la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Comandos `curl` y `unzip` instalado en Linux, MacOS y Windows
1. Carpeta de repositorio actualizada

#### DESARROLLO
1. Abrir la terminal (Linux y Mac) o Git Bash (Windows) si no está abierta

1. Para continuar es necesario descargar un conjunto de datos (dataset), colocarlo en la carpeta de trabajo `Datos`, descomprimir el archivo zip obtenido y crear un respaldo de la carpeta obtenida con la terminación `.1` que será nuestra primer respaldo por si acaso dañamos nuestros archivos. Finalmente borrar el archivo con extensión zip.

   La URL del archivo a descargar es:
     - http://files.grouplens.org/datasets/movielens/ml-1m.zip

   Todos los archivos y/o carpetas deben quedar dentro del la carpeta `Sesion-01/Reto-03` debiendo obtener una lista de carpetas y archivos similar a la siguiente:

   ```console
   Datos
   ├── ml-1m
   │   ├── movies.dat
   │   ├── ratings.dat
   │   ├── README
   │   └── users.dat
   ├── ml-1m.1
       ├── movies.dat
       ├── ratings.dat
       ├── README
       └── users.dat

   ```

   __Solución:__
   ```console
   $ cd Introduccion-a-Bases-de-Datos
   Introduccion-a-Bases-de-Datos $ cd Sesion-01
   Sesion-01 $ cd Reto-03
   Reto-03 $ ???  # Crear la carpeta Datos
   Reto-03 $ ???  # Cambiarse a la carpeta Datos
   Datos $ ???  # Descargar el archivo dado por la URL
   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                  Dload  Upload   Total   Spent    Left  Speed
   100 5778k  100 5778k    0     0   904k      0  0:00:06  0:00:06 --:--:-- 1094k
   Datos $ ???  # Descomprimir el archivo descargado. ¿cómo? ¿no se puede?
   Archive:  ml-1m.zip
      creating: ml-1m/
     inflating: ml-1m/movies.dat        
     inflating: ml-1m/ratings.dat       
     inflating: ml-1m/README            
     inflating: ml-1m/users.dat         
   Datos $ ls
   ml-1m  ml-1m.zip
   Datos $ ???  # Crear el respaldo de la carpeta obtenida
   Datos $ ls
   ml-1m  ml-1m.1  ml-1m.zip
   Datos $ ???  # Eliminando el archivo zip
   Datos $ ls
   ml-1m  ml-1m.1
   ```
