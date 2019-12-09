[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Proyecto
## Consultas relacionando dos o más archivos

### OBJETIVOS
- Analizar contenido de archivos
- Realizar relacionado de dos o más archivos
- Contabilizar resultados

### REQUISITOS
1. Carpeta de repositorio actualizada
1. Ejemplo-04 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Proyecto/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Proyecto
   Proyecto $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-04` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Proyecto $ ???
   Proyecto $ cd Datos/ml-1m
   ml-1m $
   ```

1. Imprime la lista de todos los usuarios con género femenino que dieron una valoración de 5 a la película con título "Deep Blue Sea" e indica cuantos son.

   Antes de pasar a ejecutar comandos, toma unos momentos para analizar, entender y planear una solución.

   Seguramente hay más de una forma de obtener la solución, una manera es primero obtener el id de la película con el título indicado
   ```console
   ml-1m $ ???
   ???
   ml-1m $
   ```
   Con este resultado se obtiene que el id es ???, ahora se procede a buscar la lista de todos los registros con valoración 5 para esta película
   ```console
   ml-1m $ ???
   [...]
   4131,2722,5,965352872
   4278,2722,5,965289897
   4428,2722,5,965103924
   4504,2722,5,965011706
   4801,2722,5,962964470
   4893,2722,5,962732802
   5103,2722,5,962450837
   5229,2722,5,961465107
   5662,2722,5,958777316
   5767,2722,5,959057555
   5965,2722,5,956975467
   ml-1m $ ???  # Se cuentan cuantos registros son
     31      31     674
   ml-1m $ ???  # Se guarda el resultado en el archivo ratings-m2722-r5.csv
   ml-1m $
   ```
   Se obtiene la lista de todos los usuarios en la primera columna y se conoce que son 31, ahora hay que encontrar cuales de ellos tienen género femenino
   ```console
   ml-1m $ ???  # Se realiza la consulta ajustándola hasta obtener el resultado
   210,F,1,10,25801
   372,F,18,4,72227
   1125,F,18,4,53715
   2138,F,18,4,88119
   2907,F,35,5,12345
   3202,F,18,4,24060
   3483,F,45,7,30260
   4278,F,45,7,09094
   4504,F,25,0,65775
   5103,F,35,16,78222
   ml-1m $ ???  # Se guardan los resultados en el archivo users-F-m2722-r5.csv
   ml-1m $ ???  # Se cuentan los registros
    ???
   ml-1m $
   ```
   Recuerda usar el operador __or__ de las expresiones regulares, así como la opción `-E` para usar expresiones regulares extendidas.

   Para obtener el resultado es necesario escribir un comando muy largo, esto es así para comprender que el uso de herramientas tienen un límite y que ahora se necesita hacer uso de sistemas de bases de datos SQL para resolver problemas donde existan relaciones entre dos o más archivos.

   El resultado final debe ser de un total de 10 usuarios.

__Misión cumplida__
