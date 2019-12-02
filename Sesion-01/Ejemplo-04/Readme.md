[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-04
## Comandos para consultar conjuntos de datos y automatización

### OBJETIVOS
- Analizar contenido de archivos
- Realizar consulta y filtrado de resultados
- Automatizar tareas con la creación de scripts

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Reto-03 terminado

#### DESARROLLO
En el Reto-03 se terminó de preparar todos los archivos en formato CSV con y sin encabezados que serán usados en este ejemplo, así que también es necesario copiar la carpeta `Datos`.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-04/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-04
   Ejemplo-04 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-03` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-04 $ cp -a ../Reto-03/Datos .
   Ejemplo-04 $ cd Datos/ml-1m
   Ejemplo-04/Datos/ml-1m $
   ```

1. Para poder contar registros en base a un criterio se hace uso del comando `grep CRITERIO nombre-de-archivo`
   ```console
   ml-1m $ grep M users.csv
   [...]
   6027,M,18,4,20742
   6028,M,18,4,94133
   6030,M,25,17,32618
   6032,M,45,7,55108
   6033,M,50,13,78232
   6034,M,25,14,94117
   6040,M,25,6,11106
   ml-1m $
   ```
   El comando `grep` comprueba si `M` está en una línea, si sí, entonces imprime esa línea, de lo contrario omite esa línea y eso lo realiza para cada línea del archivos. El resultado se imprime en pantalla y no se almacena en ningún otro lado.

   Entonces, obtenemos la lista de todos los registros, en este caso usuarios con genero masculino (M), pero ¿cuántos son?

1. Para contar los registros generados por un comando se hace uso del mecanismo de tuberías (_pipes_ en inglés) para conectar el resultado de un comando a la entrada de otro, en este caso se conecta la salida del comando `grep` a la entrada del comando `wc`
   ```console
   ml-1m $ grep M users.csv | wc
      4331    4331   79294
   ml-1m $
   ```
   Recordar que el comando `wc` cuenta líneas, palabras y bytes en ese orden, por lo tanto el número de usuarios con género masculino (M) es 4331.

1. Ahora, se desea agregar dos criterios, se desea conocer la lista de todos los usuarios con género masculino con ocupación científico e indicar cuanto son.

   Se pueden conectar dos comandos `grep` mediante tuberías y eso implica que los criterios se conectan mediante un operador __Y__ (__AND__).

   Para seleccionar los usuarios que son científicos se hace uso del archivo `README` y se encuentra que el código es el `15`, así que el comando sería:
   ```console
   ml-1m $ grep M users.csv | grep 15
   [...]
   5915,M,18,4,58102 <- aparece 15 en la primer columna
   5921,M,25,6,15146 <- aparece 15 en la última columna
   5935,M,18,0,35115 <- aparece 15 en la última columna
   5963,M,25,15,02140 <- aparece 15 en la 4a columna
   5988,M,25,15,94022 <- aparece 15 en la 4a columna
   6011,M,35,15,80538 <- aparece 15 en la 4a columna
   6012,M,35,15,02871 <- aparece 15 en la 4a columna
   ```
   Al observar los resultados se nota que el `15` aparece en varias columnas y para el resultado que interesa, se necesita que sólo aparezca en la cuarta columna, así que se acompaña al `15` con algunos de los caracteres que lo rodean y en este caso pueden ser las comas.
   ```console
   ml-1m $ grep M users.csv | grep ,15,
   [...]
   5737,M,45,15,93555
   5746,M,18,15,94061
   5821,M,25,15,02139
   5963,M,25,15,02140
   5988,M,25,15,94022
   6011,M,35,15,80538
   6012,M,35,15,02871
   ml-1m $
   ```
   En este todas las líneas sólo contienen `15` en la cuarta columna y además el género es masculino. __Media misión cumplida__

   Lo que falta ahora es contar cuantos son y eso se hace encadenando los resultados al comando `wc`
   ```console
   ml-1m $ grep M users.csv | grep ,15, | wc
       116     116    2195
   ml-1m $
   ```
   Por lo tanto tenemos `116` usuarios que cumplen con ambos criterios. __Misión cumplida__


1. Abre vim inicializando un archivo con nombre mi_script.sh
```
$vi mi_script.sh
```
4. Muestra los contenidos de nuestro script para confirmar nuestra escritura.
```
$cat mi_script.sh
```
6. Entra en modo inserción e inserta el resto del sript
```
echo Iniciando mi_script.sh
echo Creando Carpeta Raíz
mkdir mi_proyecto
cd mi_proyecto
echo Creando Carpetas...
mkdir carpeta1 carpeta2 carpeta3
echo Creando archivos
touch carpeta1/archivo1.txt carpeta2/archivo2.txt carpeta3/archivo3.txt
echo Descargando información
wget -O datos.csv https://raw.githubusercontent.com/ChitturiPadma/datasets/master/uber.csv
echo Finalizando ejecución
```
7. Darle permiso de ejecución al script y corre el script
```
$chmod +x mi_script.sh
$./mi_script.sh
```
