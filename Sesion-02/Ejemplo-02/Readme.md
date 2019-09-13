## Exploración de Archivos con grep

### OBJETIVO 
 - Aprovechar el poder de las expresiones regulares para hacer búsquedas sobre un archivo.

#### REQUISITOS 
1. Consola

#### DESARROLLO
1. Descarga el siguiente archivo https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt
```
$wget -O computer.csv https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt
```
2. Busca que líneas contienen la palabra 'Computer' en computer.csv
````
$grep 'Computer' computer.csv
$grep -i 'Computer' computer.csv

````
3. Cuenta cuantas líneas coninciden con tu búsqueda
````
$grep -c 'Computer' computer.csv
````
4. Hacer búsquedas por palabras completas
```
$grep -w 'Computer' computer.csv
```
5. Sólo muestra el patrón encontrado
```
$grep -i -o 'Computer' computer.csv
```
6. Muestra además de la línea que coincide, también el número de línea
```
$grep -n 'Computer' computer.csv
```
7. Muestra sólo el número de las líneas en donde coincide el patrón.
```
$grep -n 'Computer' computer.csv | cut -d ":" -f 1
```
8. Muestra las líneas que no coinciden con el patrón
```
$grep -v 'Computer' computer.csv
````