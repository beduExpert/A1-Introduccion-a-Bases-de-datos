## Manejo Básico del Sistema de Archivos

### OBJETIVO 
 - Conocer cómo interactuar con tu ambiente desde la consola

#### REQUISITOS 
1. Consola

### DESARROLLO 
Apartir de la estructura generada en el reto pasado hacer los cambios necesarios para llegar a la siguiente estructura, claro utilizando sólo la consola.
```
mi_proyecto
    └── datos
    	└── pokemon.csv
    └── codigo
        └── analisis.py
        └── tests.py
        └── README.md

```
#### SOLUCIÓN
Tomando como punto de partida del Reto-01
1. Entrar a la carpeta datos
```
$cd datos
```
2. Descarga datos con nombre de archivo pokemon.csv
```
$wget -O pokemon.csv https://raw.githubusercontent.com/veekun/pokedex/master/pokedex/data/csv/pokemon.csv

```
3. Retrocede un nivel y mueve el README.md dentro del directorio codigo
```
$cd ..
$mv README.md codigo
```
4. Posiciónate dentro del directorio codigo
```
$cd codigo
```
5. Elimina la carpeta experimentacion y sus contenidos
````
$rm -R experimentacion
````