## Calculando datos con SQL

### OBJETIVO
 - Hacer uso de funciones de SQL para hacer cálculos aritméticos

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
1. ¿Cuántos ciclistas mujeres usaron ecobici el 1ero de Enero?
```
select COUNT(*) AS "cant_ciclistas_mujeres"
from trips
where Fecha_Retiro like '01%'
and Genero_Usuario = 'F'
```
2. ¿Cuál es el promedio de la edad de los ciclistas?
```
select AVG(Edad_Usuario)
from trips
```
3. ¿Cuántos años tenía el viajero más joven el 15 de Enero?
```
select MIN(Edad_Usuario)
from trips
where Fecha_Retiro like '15%'
```
