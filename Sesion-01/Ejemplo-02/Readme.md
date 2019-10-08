## Manejo Básico del Sistema de Archivos

### OBJETIVO 
 - Conocer cómo interactuar con tu ambiente desde la consola
 - Remover, descargar y visualizar un archivo dentro de la consola.

#### REQUISITOS 
1. Consola

#### DESARROLLO

Después de completar el ´Ejemplo-01´ y el ´Reto-01´ sigue las instrucciones para realizar este ejemplo dentro de tu terminal y así entender cómo remover, descargar y visualizar un archivo dentro de tu terminal.

> **Recuerda**: Todas la instrucciones que aparecen con el signo ´$´ al principio del reglón, son un comando que deberás ejecutar dentro de tu terminal.  

1. Posiciónate dentro del directorio archivos1
```
$cd archivos1
```
2. Revisa tu ubicación
````
$pwd
````
3. Muestra qué contiene el directorio en el que te encuentras
```
$ls
```
4. Retrocede un nivel
```
$cd ..
```
5. Posiciónate dentro del directorio archivos2
```
$cd archivos2
```
6. Muestra qué contiene el directorio en el que te encuentras
```
$ls
```
7. Retrocede un nivel
```
$cd ..
```
8. Elimina el archivo text1.txt
```
$rm text1.txt
```
9. Elimina el directorio archivos2
```
$rm -R archivos2
````
10. Limpia la consola y enlista lo que contiene tu directorio
```
$clear
$ls
```
10. Descarga el siguiente archivo y muestra sus contenidos: https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt
```
$wget -O cs.txt https://raw.githubusercontent.com/jonas/dgrep/master/src/test/resources/wikipedia/prog/computer-science.txt

$cat cs.txt
```
