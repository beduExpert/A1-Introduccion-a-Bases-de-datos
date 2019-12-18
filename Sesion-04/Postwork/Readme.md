[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Postwork
## Postwork

### OBJETIVOS
- Hacer consultas para filtrado de datos con SQL
- Ordenar y guardar resultados con SQL
- Hacer operaciones matemáticas con con SQL
- Relacionar dos o más tablas con SQL
- Obtener resultados útiles a partir de los datos por medio de consultas SQL.

### REQUISITOS
1. __Git Bash__ instalado para equipos con Windows
1. __Mycli__ instalado
1. Datos de conexión al Servidor MariaDB o MySQL
1. Carpeta de `Datos/` generado en el `Postwork` del la `Sesion-02`
1. Carpeta de repositorio actualizada

### DESARROLLO
En esta sesión se hará uso de las dos o más tablas que tengas cargadas en tu base de datos, si no es el caso, puedes regresar a revisar el Postwork de la `Sesion-03` y realízalo para poder continuar.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-04/Postwork/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-04/Postwork
   Postwork $
   ```

1. Copiar la carpeta `Datos` creada en el `Sesion-03/Postwork/` y moverse a la carpeta `Datos/`
   ```console
   Postwork $ cp -a ../../Sesion-03/Postwork/Datos .
   Postwork $ cd Datos
   Datos $
   ```

1. Realizar conexión al Servidor MariaDB/MySQL usando el comando `mycli` y los datos de conexión.

1. Para cada tabla en tu base de datos realiza el siguiente proceso:
   - Analizar contenido de la tabla
   - Determina si te es posible obtener resultados aplicando filtros y contando al contenido de la tabla, en caso afirmativo construye tus consultas SQL y obtén tus resultados.
   - Además de contar registros también puedes realizar operaciones como suma, promedio, máximo o mínimo, determina si aplicando estas operaciones o funciones puedes obtener mejores resultados o simplemente diferentes para tu tabla.
   - Si la tabla tiene un campo que haga referencia a otra tabla, entonces puedes pensar con obtener resultados con la información de ambas tablas, así que puedes usar la operación `JOIN` para relacionarlas.
   - Si has realizado dos o más consultas en SQL para esta tabla, posiblemente sea una buena idea copiar y guardar tus consultas en un archivo de texto con extensión `.sql` para que automatices la ejecución de tus scripts.

__Meta:__ Toma en cuenta que tu objetivo es obtener resultados útiles a partir de los datos por medio de consultas SQL.

__Sugerencia:__ Si tienes problemas al realizar algunos de los pasos del procedimiento es buen momento para comentarlo con tu __Experta/o__ asignado para determinar la mejor solución.
