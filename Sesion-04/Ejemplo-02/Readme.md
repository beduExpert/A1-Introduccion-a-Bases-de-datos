[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 04`](../Readme.md) > Ejemplo-02
## Ordenando datos con la instrucción `ORDER BY` y guardando resultados

### OBJETIVO
- Obtener resultados ordenados en base a un campo
- Guardar los resultados de las consultas

### REQUISITOS
1. MyCli instalado
1. Carpeta de repo actualizada

### DESARROLLO
1. Abre una _Terminal_ (en Linux o Mac) o _Anaconda Prompt_ (en Windows), si tienes alguna otra ventana abierta con el comando `mycli` es buen momento para cerrarla antes de abrir la nueva ventana.

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-04/Ejemplo-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-04/Ejemplo-02
   Ejemplo-02 $
   ```

1. Conectarse al Servidor MariaDB
   ```console
   ml-1m $ mycli -h ec2-54-213-193-78.us-west-2.compute.amazonaws.com -u root -p root -P 3306
   mariadb 10.4.10-MariaDB-1:10.4.10+maria~bionic
   mycli 1.20.1
   Chat: https://gitter.im/dbcli/mycli
   Mail: https://groups.google.com/forum/#!forum/mycli-users
   Home: http://mycli.net
   Thanks to the contributor - Abirami P
   (none)> USE Minombre;
   You are now connected to database "MiNombre" as user "root"
   Time: 0.096s
   MiNombre>
   ```
   Recuerda hacer uso de los datos de conexión proporcionados por tú Experta/o y ejecutar el comando `USE` para seleccionar tu base de datos.

1. Cuando se creó la tabla `users` se asignó una longitud de 20 al campo `cp` debido a que se desconoce cuál es la longitud máxima para este campo en todos los registros.

   El resultado se puede obtener combinando la instrucción `ORDER BY` y la función `LENGTH()`:
   ```sql
   MiNombre> SELECT *, LENGTH(cp) AS len_cp FROM users ORDER BY LENGTH(cp) DESC LIMIT 10;
   +-----+--------+------+------+------------+--------+
   | id  | genero | edad | ocup | cp         | len_cp |
   +-----+--------+------+------+------------+--------+
   | 161 | M      | 45   | 16   | 98107-2117 | 10     |
   | 567 | M      | 35   | 20   | 52570-9634 | 10     |
   | 506 | M      | 25   | 16   | 55103-1006 | 10     |
   | 458 | M      | 50   | 16   | 55405-2546 | 10     |
   | 946 | M      | 35   | 7    | 48103-8929 | 10     |
   | 939 | F      | 25   | 20   | 20110-5616 | 10     |
   | 293 | M      | 56   | 1    | 55337-4056 | 10     |
   | 913 | M      | 25   | 0    | 20744-6223 | 10     |
   | 233 | F      | 45   | 20   | 37919-4204 | 10     |
   | 868 | M      | 50   | 17   | 01702-7224 | 10     |
   +-----+--------+------+------+------------+--------+

   10 rows in set
   Time: 0.094s
   MiNombre>  
   ```
   Primero, observar que se ha agregado un campo más, este campo es un campo calculado `LENGTH(cp) AS len_cp`, la función `LENGTH` calcula la longitud de la cadena de texto en la columna `cp`, además de que se le asigna el nombre al campo `len_cp`.

   Después se hace uso de `ORDER BY LENGTH(cp) DESC`, con lo que el ordenamiento no se realiza sobre el valor del campo `cp`, si no, sobre la longitud, además se indica que el orden tiene que ser descendente o de mayor a menor, así que el primer registro del resultado será el que tenga mayor longitud, en este caso `10`.

   Por lo tanto, se podría eliminar la tabla `users` y al crearla nuevamente ajustar la longitus del campo `cp` a 10.

   __Nota:__ Este resultado también sería un poco complejo obtenerlo usando sólo archivos csv.

1. En el punto anterior se ha generado un resultado, pero ese resultado sólo se imprime en pantalla, así que ahora se guardará el resultado en formato CSV en el archivo `users-lencp-desc.csv`.

   El formato de salida se indica con la instrucción `\T csv`, el archivo de salida se indica con `\o users-lencp-desc.csv` y luego el formato de salida se regresa al modo inicial con `\T psql`, entonces el procedimiento se muestra a continuación:
   ```sql
   MiNombre> \T csv
   Changed table format to csv
   Time: 0.000s
   MiNombre> \o users-lencp-desc.csv
   Time: 0.000s
   MiNombre> SELECT *, LENGTH(cp) as len_cp FROM users ORDER BY LENGTH(cp) DESC LIMIT 10;
   "id","genero","edad","ocup","cp","len_cp"
   "161","M","45","16","98107-2117","10"
   "567","M","35","20","52570-9634","10"
   "506","M","25","16","55103-1006","10"
   "458","M","50","16","55405-2546","10"
   "946","M","35","7","48103-8929","10"
   "939","F","25","20","20110-5616","10"
   "293","M","56","1","55337-4056","10"
   "913","M","25","0","20744-6223","10"
   "233","F","45","20","37919-4204","10"
   "868","M","50","17","01702-7224","10"
   10 rows in set
   Time: 0.083s
   MiNombre> \T psql
   Changed table format to psql
   Time: 0.000s
   MiNombre>  
   ```
   Aunque el resultado se muestra en pantalla también se ha creado el archivo `users-lencp-desc.csv` y para comprobarlo, abre otra Terminal (Linux o MacOSX) o Git Bash (para Windows) y has que tu carpeta de trabajo sea la del `Sesion-04/Ejemplo-02/`:
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-04/Ejemplo-02
   Ejemplo-02 $
   ```
   Y ejecutar el comando `head` para examinar las primeras 10 líneas del archivo:
   ```console
   Ejemplo-02 $ head users-lencp-desc.csv
   "id","genero","edad","ocup","cp","len_cp"
   "161","M","45","16","98107-2117","10"
   "567","M","35","20","52570-9634","10"
   "506","M","25","16","55103-1006","10"
   "458","M","50","16","55405-2546","10"
   "946","M","35","7","48103-8929","10"
   "939","F","25","20","20110-5616","10"
   "293","M","56","1","55337-4056","10"
   "913","M","25","0","20744-6223","10"
   "233","F","45","20","37919-4204","10"
   Ejemplo-02 $
   ```
   Con lo que se comprueba el contenido y creación del archivo con los resultados de la consulta.

__Misión cumplida__
