## Procesamiento de Archivos con sed

### OBJETIVO 
 - Utilizar el poder de las expresiones regulares para reemplazar texto, insertar o borrar sobre un archivo.

#### REQUISITOS 
1. Consola

#### DESARROLLO

Después de completar el ´Ejemplo-02´ y el ´Reto-02´sigue las instrucciones para realizar el ejemplo dentro de tu terminal y así entender las expresiones regulares y cómo te ayudarán para reemplazar texto, insertar o borrar sobre un archivo.

> **Recuerda**: Todas la instrucciones que aparecen con el signo ´$´ al principio del reglón, son un comando que deberás ejecutar dentro de tu terminal.  

1. Descarga el siguiente archivo https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv
```
$wget -O iris.csv https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv
```
2. Sustituye cadenas
````
$sed 's/Setosa/Martosa/' iris.csv
$sed 's/5/500/' iris.csv
$sed 's/5/500/' iris.csv | head
````
3. Susituye la ocurrencia n-esima de un patrón en una línea
````
$sed 's/5/500/2' iris.csv | head
````
4. Sustituye todas las ocurrencias del patrón en un línea
```
$sed 's/5/500/g' iris.csv | head
```
5. Reemplazando cadenas sobre cierta línea
```
$sed '3 s/4/AAA/2' iris.csv | head
```
6. Duplica la línea que fue reemplazada
```
$sed 's/Setosa/Martosa/p' iris.csv
```
7. Muestra sólo las líneas que fueron afectadas
```
$sed -n 's/Setosa/Martosa/p' iris.csv
```
8. Reemplazando las cadenas sobre cierto rango de líneas
```
$sed '3,5 s/Setosa/Martosa/' iris.csv | head
$sed '3,$ s/Setosa/Martosa/' iris.csv | head
````
9. Borrando líneas de un archivo
```
$sed '1d' iris.csv | head
$sed '$d' iris.csv | wc
$sed '$d' iris.csv | tail
$sed '20,100d' iris.csv
$sed '20,$d' iris.csv
$sed '/Setosa/d' iris.csv
```
