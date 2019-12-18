[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 05`](../Readme.md) > Reto-02
## Realizando operaciones con Colecciones e importando datos

### OBJETIVO
- Que el alumno cuente con una Colección para importar datos
- Que el alumno importe datos en formato CSV a una Colección.

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-05/Reto-02`

### DESARROLLO
Se deberá de crear colecciones e importar los datos de los archivos `movies-h.csv` y `ratings-h.csv`, asegúrate de usar los que tienen `-h` porque son los archivo que incluyen la primera línea con el nombre de las columnas.

1. Crear la colección `movies`
   ![Colección movies](assets/colecciones.png)

1. Importar datos a la colección `movies` desde el archivo `Datos/movies-h.csv`

   Para importar documentos, se usa la opción del menú ??? que abre un diálogo para seleccionar del tipo de archivo CSV y el archivo mismo.
   ![Importando datos csv](assets/importando-datos.png)

   Validar que cada campo tenga nombre y que estén todos los campos, además valida la cantidad de documentos, que en este caso debería de ser 3883.

1. Determinar cual es el registro extra en la colección `movies`, para ello se da click en el botón `OPTION` y en la línea que dice `SORT` se escribe lo siguiente:
   ```json
   ???
   ```
   Esto indica que los resultados se ordenen en base al campo `id` de forma ascendente, dar click en el botón `FIND` o presionar la tecla `ENTER` para actualizar la lista de registros.
   ![Documentos de movies ordenados](assets/documentos-movies-ordenados.png)

   Donde el primer documento está vació, así que se procede a eliminar este documento en blanco presionando el icono de bote de basura para el primer documento.

   Después entonces el total de documento es 3883 como era de esperar.

1. Crear la colección `ratings`
   ![Colección movies](assets/colecciones-02.png)

   Seleccionar la colección y continuar

1. Importar datos a la colección `ratings` desde el archivo `Datos/ratings-h.csv`

   Para importar usar la opción del menú ??? que abre un diálogo para seleccionar del tipo de archivo CSV y el archivo mismo.

   Es posible que al importar se obtenga un mensaje de error de `timeout`, así que se procede a dar click en el botón `OPTIONS` y se modifica el valor de `MAXTIMEMS` a 120000, se elimina la colección, se crea nuevamente y se realiza la importación de datos de nuevo.

   __Nota:__ Si no fuera posible realizar la importación de todos los registros, realizar la importación donde más registros se hayan importado y proceder a eliminar registros vacíos.

   Validar que cada campo tenga nombre y que estén todos los campos, además valida la cantidad de documentos, que en este caso debería de ser 1000209 documentos.

1. Determinar cual es el registro extra en la colección `ratings`, para ello se da click en el botón `OPTION` y en la línea que dice `SORT` se escribe lo siguiente:
   ```json
   ???
   ```
   Esto indica que los resultados se ordenen en base al campo `userid` de forma ascendente, dar click en el botón `FIND` o presionar la tecla `ENTER` para actualizar la lista de registros.

   Se observa que los primeros documentos están vacíos, así que se procede a eliminarlos.

   ![Documentos en ratings final](assets/documentos-ratings.png)
   Después entonces el total de documentos es 1000209 como era de esperar.

__Misión cumplida__
