## Procesamiento de Archivos con sed

### OBJETIVO 
 - Aprovechar el poder de las expresiones regulares para hacer búsquedas, reemplazar texto, insertar o borrar sobre un archivo.

#### REQUISITOS 
1. Consola

#### SOLUCION
1. Descarga el siguiente archivo https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv
```
$wget -O titanic.csv https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv
```
2. Substituye Harris por Ramirez
````
$sed 's/Harris/Ramirez/' titanic.csv | head
````
3. Subsituye el segundo 0 por un 999
````
$sed 's/0/999/2' titanic.csv | head
````
4. Substituyendo todos los ceros por un 'none'
```
$sed 's/0/none/g' titanic.csv | head
```
```
5. Cambia todos los William por Brayan y muestra sólo las líneas afectadas
```
$sed -n 's/William/Brayan/p' titanic.csv
```