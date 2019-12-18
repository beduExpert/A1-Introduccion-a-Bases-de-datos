[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 05`](../Readme.md) > Postwork
## Fundamentos de MongoDB e importación de datos

### OBJETIVO
- Crear una Base de Datos en MongoDB para tú proyecto personal
- Crear las Colecciones necesarias para los distintos archivos
- Importar datos y validar la correcta importación
- Realizar consultas en base a filtrado de datos

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-05/Postwork`
1. __MongoDB Compass__ iniciado y conectado al servidor de MongoDB
1. Carpeta de `Datos/` generado en el `Postwork` del la `Sesion-02`

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-05/Postwork/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-05/Postwork
   Postwork $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-02/Postwork/` y moverse a la carpeta `Datos/`
   ```console
   Postwork $ cp -a ../../Sesion-02/Postwork/Datos .
   Postwork $ cd Datos
   Datos $
   ```

1. En __MongoDB Compass__ crea una base de datos, preferentemente con el nombre de tu proyecto, como tienes que crear también una colección selecciona el nombre de algunos de los archivos CSV que desees importar.

1. En esta sesión se hará uso de los archivos en formato CSV que tengan una primera fila con el nombre de cada columna y por cada uno de ellos realizar el siguiente proceso:

   - Analizar contenido del archivo
   - Crear un Colección con el mismo nombre del archivo
   - Importar datos a la Colección usando la opción de `Import Data` de __MongoDB Compass__
   - Validar que los datos se hayan importado correctamente revisando que algunos de los documentos tengan la cantidad de campos correcta, nombre en cada uno de los campos y que el total de documentos sea el mismo que el total de filas en el archivos.
   - Revisar si hay documentos vacíos y en caso afirmativo eliminarlos

   __Meta 1:__ Toma en cuenta que uno de tus objetivos es que logres contar con todo tu conjunto de datos importado en un Servidor MongoDB.

1. Comienza a realizar consultas a tus datos por medio de realizar filtrado de datos, respondiendo a preguntas como:
   - ¿cuántos registros hay de cierto tipo o categoría?
   - ¿cuántos registros hay de dos o más categorías?
   - ¿cuántos registros hay donde un campo sea mayor, meno o igual a cierto valor?
   - ¿cuántos registros tienen un campo que puede o no pertenecer a una lista de valores?
   - O preguntas que utilicen alguna combinación de las anteriores

   __Meta 2:__ Lograr responder a preguntas con resultados útiles.

__Sugerencia:__ Si tienes problemas al realizar algunos de los pasos del procedimiento es buen momento para comentarlo con tu __Experta/o__ asignado para determinar la mejor solución.
