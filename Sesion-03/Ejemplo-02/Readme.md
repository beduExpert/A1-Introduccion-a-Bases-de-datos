## Consultando nuestra BD

### OBJETIVO 
 - Hacer consultas básicas de nuestra BD
 - Aprender a usar los filtros más utilizados

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

1. Selecciona todos los viajes con usuarios con edad arriba de 30
```
SELECT *
FROM trips
WHERE Edad_Usuario > 60
```
2. Selecciona todos los viajes empezados después de las 5 de la tarde hechos por una mujer
```
SELECT *
FROM trips
WHERE Hora_Retiro > '17:00:00'
and Genero_Usuario = 'F'
```
3. Regresame los identificadores de las estaciones retiradas antes de las 8 de la mañana y después de las 5 de la tarde
```
SELECT Ciclo_Estacion_Retiro
FROM trips
WHERE Hora_Retiro > '17:00:00'
OR Hora_Retiro < '8:00:00'
```