[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-03
## Comandos para preparar y consultar conjuntos de datos

### OBJETIVOS
- Analizar contenido de archivos
- Preparar y formatear archivos a formatos conocidos (CSV, JSON)
- Realizar consultas para filtrar y obtener conteo de resultados

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Reto-02 terminado

#### DESARROLLO
En el Reto-02 se descargó el conjunto de datos (dataset) __MovieLens 1M__ que corresponde a un millón de valoraciones realizadas por usuarios a películas. Los datos son generados por el sitio http://movielens.org y preparados por GroupLens https://grouplens.org/datasets/movielens

A continuación se revisará, preparará y analizarán los archivos contenidos en el archivo descargado y que están contenido en la carpeta `Datos`.

1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03
   Ejemplo-03 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03
   Ejemplo-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-02` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-03 $ cp -a ../Reto-02/Datos .
   Ejemplo-03 $ ls
   Datos
   Ejemplo-03 $ cd Datos/ml-1m
   ml-1m $
   ```

1. Mostrar las primeras 10 líneas del archivo `users.dat` para conocer su estructura y el tipo de información que contiene
   ```console
   ml-1m $ head users.dat
   1::F::1::10::48067
   2::M::56::16::70072
   3::M::25::15::55117
   4::M::45::7::02460
   5::M::25::20::55455
   6::F::50::9::55117
   7::M::35::1::06810
   8::M::25::12::11413
   9::M::25::17::61614
   10::F::35::1::95370
   ml-1m $
   ```
   El comando `head` muestra sólo la primeras 10 líneas del archivo indicado, se puede agregar la opción `-n N` para mostrar sólo _N_ líneas.

   Al ver el contenido del archivo ¿se puede comprender el significado del contenido?

   Posiblemente sea necesaria un poco de ayuda y es donde la documentación entra en juego, por lo que se abre el archivo `README` usando el comando `less` para mostrar su contenido por páginas:
   ```console
   ml-1m $ less README
   USERS FILE DESCRIPTION
   ================================================================================

   User information is in the file "users.dat" and is in the following
   format:

   UserID::Gender::Age::Occupation::Zip-code

   All demographic information is provided voluntarily by the users and is
   not checked for accuracy.  Only users who have provided some demographic
   information are included in this data set.

   - Gender is denoted by a "M" for male and "F" for female
   - Age is chosen from the following ranges:

           *  1:  "Under 18"
           * 18:  "18-24"
           * 25:  "25-34"
           * 35:  "35-44"
           * 45:  "45-49"
           * 50:  "50-55"
           * 56:  "56+"
   :
   ```
   El comando `less` abre el archivo mostrando tantas líneas como es posible y al final se muestra una línea con dos puntos que indica que el comando `less` está esperando a que el usuario presione alguna tecla, donde cada tecla hará que se ejecute una acción, una lista de las teclas y las acciones más usadas son:

   - __ENTER__: Avanza una línea en el contenido
   - __Espacio__: Avanza una página completa en el contenido
   - __B__: Regresa media página en el contenido
   - __Q__: Salir del comando `less`

   Así que has uso de las teclas mencionadas para ubicar la información correspondiente al archivo `users.dat` con lo que ya se puede comprender la información de cada registro y cada columna.

   Presiona la tecla `Q` para salir de `less`

1. Convirtiendo de `users.dat` a `users.csv`, recordando que el formato CSV los campos son separados por comas, se procede a remplazar los `::` por `,` haciendo uso del comando `sed`
   ```console
   ml-1m $ sed "s/::/,/g" users.dat
   [...]
   6030,M,25,17,32618
   6031,F,18,0,45123
   6032,M,45,7,55108
   6033,M,50,13,78232
   6034,M,25,14,94117
   6035,F,25,1,78734
   6036,F,25,15,32603
   6037,F,45,1,76006
   6038,F,56,1,14706
   6039,F,45,0,01060
   6040,M,25,6,11106
   ml-1m $
   ```
   Si el comando ha sido bien escrito, se deberá de imprimir todos los registros del archivo con los dos puntos remplazados por coma, si no es así, significa que es necesario ajustar el comando hasta obtener el resultado deseado.

   El comando `sed` es un editor desde la línea de comando y la operación realizada es buscar y remplazar, lo que se hace con la cadena de texto `"s/origen/replazo/g"`, la `s` significa _search_ y la `g` significa reemplazar todas las apariciones de _origen_ en una línea, es importante considerar que la operación de búsqueda y remplazo se ejecuta línea a línea.
