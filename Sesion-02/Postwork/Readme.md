[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Postwork
## Postwork

### OBJETIVOS
- Aplicar los conceptos de la sesión a tu proyecto personal
- Automatizar las tareas que sean factibles
- Realizar consultas usando expresiones regulares
- Realizar consultas haciendo uso de más de un archivo

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada

### DESARROLLO
En esta sesión ya debes de contar con un conjunto de datos definido y listo en una carpeta para trabajar.

Lo siguiente es que puedas formular consultas a tus datos, desde las consultas simples a las más complejas, a continuación se sugieren algunos casos.

1. Lo primero consiste en analizar el contenido de los archivos para determinar el formato en que se encuentran, si ya se encuentran en formato CVS, entonces no hay nada por hacer en este punto y puedes pasar a realizar consultas.

   Hacer uso de lo comando `head`, `tail`, `cat` y `sed` para analizar, filtrar y remplazar para transformar tus archivos a formato CSV (El formato JSON se verá más adelante).

   Analizando el contenido de de un archivo:
   ```console
   Datos $ head nombre-archivo.ext
   [... primeras 10 líneas de tu archivo ...]
   Datos $
   ```
   Algo importante es que no importa el tamaño de tus archivos, las herramientas de la terminal siempre serán tus amigas.

   Remplazando secciones de un archivo:
   ```console
   Datos $ sed "s/buscar/remplzar/g" nombre-archivo.dat | head
   [... primeras 10 líneas del resultado ...]
   Datos $
   ```

   Guardando resultados en un archivo:
   ```console
   Datos $ sed "s/buscar/remplzar/g" nombre-archivo.dat > resultados.csv
   Datos $
   ```

1. Ya que los archivos están en formato CSV, entonces se puede iniciar a realizar consultas usando los comandos `grep` y `wc`
   ```console
   Datos $ grep -a CRITERIO archivo.csv | head
   [... 10 primeras líneas del resultado ...]
   Datos $
   ```

   Si los resultados son satisfactorios entonces los contamos o guardamos, según sea el caso
   ```console
   Datos $ grep -a CRITERIO archivo.csv | wc
      n-lineas n-palabras n-bytes archivo.csv
   Datos $
   ```
   Se cuenta en número de líneas o registros

   ```console
   Datos $ grep -a CRITERIO archivo.csv > archivo-CRITERIO.csv
   Datos $
   ```
   Se guarda el resultado en un archivo.

1. Finalmente, si tus datos lo permiten, realiza consultas que involucren a más de un archivo o realiza consultas más complejas haciendo uso de expresiones regulares.

   Recuerda que haciendo uso de herramientas desde terminal puedes hacer consultas con un mínimo de recursos y procesar grandes cantidades de información, por ejemplo, si quieres encontrar todos los registros que iniciente con cierta palabra puedes usar:
   ```console
   Datos $ grep -aE ^Palabra archivo.csv | head
   [... 10 primeras líneas de los resultados ...]
   ```
   Recuerda conectar al final el comando `head` que es una manera de aplicar un LIMIT 10 para evitar procesar todo los registros, si necesitas más datos siempre puedes usar `head -n N`, donde `N` es el número de línea que deseas obtener.

__Sugerencia:__ Si tienes consultas que no puedas realizar es buen momento para comentarlo con tu __Experta/o__ asignado para determinar si es factible realizar o hay que esperar a hacer uso de SQL.
