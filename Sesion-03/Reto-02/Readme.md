## Consultando nuestra BD

### OBJETIVO 
 - Hacer consultas básicas de nuestra BD
 - Aprender a usar los filtros más utilizados

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. Selecciona todos los viajes con usuarios con edad menor a 20 años

2. Selecciona todos los viajes empezados antes de las 2 de la tarde hechos por un hombre.

3. Regresame los identificadores de las estaciones retiradas después de las 8 de la mañana y antes de las 5 de la tarde.
#### SOLUCIÓN

1. Selecciona todos los viajes con usuarios con edad menor a 20 años
```
SELECT *
FROM trips
WHERE Edad_Usuario < 20
```
2. Selecciona todos los viajes empezados antes de las 2 de la tarde hechos por un hombre.
```
SELECT *
FROM trips
WHERE Hora_Retiro > '12:00:00'
and Genero_Usuario = 'M'
```
3. Regresame los identificadores de las estaciones retiradas después de las 8 de la mañana y antes de las 5 de la tarde
```
SELECT Ciclo_Estacion_Retiro
FROM trips
WHERE Hora_Retiro < '17:00:00'
AND Hora_Retiro > '8:00:00'
```