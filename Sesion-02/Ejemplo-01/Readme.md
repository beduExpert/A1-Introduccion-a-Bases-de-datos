## Manipulando Dimensiones de Archivos 

### OBJETIVO 
 - Visualizar cómo seleccionar columnas y renglones de archivos desde la consola, además de usar múltiples comandos.

#### REQUISITOS 
1. Consola 

#### DESARROLLO

Sigue las instrucciones para realizar el ejemplo dentro de tu terminal y así comprender de mejor manera cómo seleccionar columnas y renglones de archivos desde la consola, además de usar múltiples comandos.


> **Recuerda**: Todas la instrucciones que aparecen con el signo ´$´ al principio del reglón, son un comando que deberás ejecutar dentro de tu terminal.  

1. Descarga el siguiente archivo https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv
```
$wget -O iris.csv https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv
```
2. Muestra la cabecera de iris.csv
````
$head iris.csv
$head -n 15 iris.csv

````
3. Muestra la cola de iris.csv
````
$tail iris.csv
$tail -n 15 iris.csv

````
4. Regresa sólo la lista de Especies
````
$cut -d ',' -f 5 iris.csv
$cut -d ',' -f 5 iris.csv | head
$cut -d ',' -f 5 iris.csv | head > primeras_especies.txt
````
5. Agrega una línea a primeras_especies.txt
```
$echo '"rosa"' >> primeras_especies.txt
```
6. Cuenta cuántas líneas contiene tu archivo
```
$wc iris.csv
```
