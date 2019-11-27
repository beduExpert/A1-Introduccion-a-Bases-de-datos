## Manejo Básico del Sistema de Archivos

### OBJETIVO
 - Conocer cómo interactuar con tu ambiente desde la consola

#### REQUISITOS
1. Consola

#### DESARROLLO
6. Crea dos archivos de text vacíos
```
$ touch text1.txt text2.txt
```
7. Muestra qué contiene el directorio en el que te encuentras
```
$ls
```
8. Copia text1.txt a la carpeta archivos1
```
$cp text1.txt archivos1
````
9. Mueve text2.txt a la carpeta archivos2
```
$mv text2.txt archivos2
```
10. Muestra qué contiene el directorio en el que te encuentras
```
$ls
```

Tomando como punto de partida del Ejemplo-01
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
