[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 03`](../Readme.md) > Postwork
## Postwork

### OBJETIVOS
- Crear u obtener una base de datos SQL para tú proyecto personal
- Crear las tablas necesarias para los distintos archivos
- Importar datos y validar la correcta importación
- Contar con tú conjunto de datos importado en un Servidor MariaDB/MySQL

### REQUISITOS
1. __Git Bash__ instalado para equipos con Windows
1. __Mycli__ instalado
1. Datos de conexión al Servidor MariaDB o MySQL y con permisos para ejecutar la instrucción `LOAD DATA LOCAL INFILE`.
1. Carpeta de `Datos/` generado en el `Postwork` del la `Sesion-02`
1. Carpeta de repositorio actualizada

### DESARROLLO
En esta sesión se hará uso de la carpeta de Datos que se generó en la `Sesion-02`, se espera que tengas uno o más archivos en formato CSV

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Postwork/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Postwork
   Postwork $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-02/Postwork/` y moverse a la carpeta `Datos/`
   ```console
   Postwork $ cp -a ../../Sesion-02/Postwork/Datos .
   Postwork $ cd Datos
   Datos $
   ```

1. Para cada archivo CSV realizar el proceso:
   - Analizar contenido del archivo
   - Definir lista de campos y tipos de datos para cada uno
   - Realizar conexión al Servidor MariaDB/MySQL usando el comando `mycli`
   - Hacer uso de tu base de datos con la instrucción SQL `USE`
   - Crear la tabla usando la instrucción `CREATE` en SQL
   - Importar datos a la tabla usando la instrucción `LOAD` y habilitando los permisos para `mycli` con la opción `--local-infile true`
   - Validar que los datos se hayan importado correctamente haciendo uso de la instrucción `SELECT` tanto a nivel de campos, como en el número de registros importados.

__Meta:__ Toma en cuenta que tu objetivo es que logres contar con todo tu conjunto de datos importado en el servidor para más adelante poder realizar consultas.

__Sugerencia:__ Si tienes problemas al realizar algunos de los pasos del procedimiento es buen momento para comentarlo con tu __Experta/o__ asignado para determinar la mejor solución.
