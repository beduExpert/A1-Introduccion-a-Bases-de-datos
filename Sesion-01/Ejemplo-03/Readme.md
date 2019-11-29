[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-03
## Comandos para preparar y consultar conjuntos de datos

### OBJETIVOS
- Analizar contenido de archivos
- Preparar y formatear archivos a formatos conocidos
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
