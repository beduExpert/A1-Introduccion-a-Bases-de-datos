## Manejo Básico del Sistema de Archivos

### OBJETIVO 
 - Conocer cómo interactuar con tu ambiente desde la consola

#### REQUISITOS 
1. Consola

### DESARROLLO
Cuando comenzamos un nuevo proyecto hay una estructura básica que seguimos. Dependiendo del tipo de proyecto cambiará la estructura pero para este ejemplo debes replicar la siguiente estructura utilizando sólo la consola.
```
mi_proyecto
    └── README.md
    └── datos
    └── codigo
        └── analisis.py
        └── tests.py
        └── experimentacion
            └── borrar.py
```
**Recuerda**: Los archivos son aquellos que tienen terminación.  
**Notas**: 
* Este Reto tiene una duración de 20 min.
* La fuente de los datos es la siguiente
    * pokemon.csv https://raw.githubusercontent.com/veekun/pokedex/master/pokedex/data/csv/pokemon.csv


#### SOlUCIÓN
1. Crear carpeta mi_proyecto
```
$mkdir mi_proyecto
```
2. Posicionarte dentro de mi_proyecto
````
$cd mi_proyecto
````
3. Crear archivo README.md
````
$touch README.md
````
4. Crear ambos directorios
```
$mkdir datos codigo
```
6. Entrar a directorio codigo
```
$cd codigo
```
5. Crear archivos analisis.py y tests.py
```
$touch analisis.py tests.py
```
6. Crear directorio experimentacion
```
$mkdir experimentacion
````
7. Entrar a directorio experimentación y crear archivo borrar.py
```
$cd experimentacion
$touch borrar.py
```