## Calculando datos con SQL

### OBJETIVO 
 - Hacer uso de funciones de SQL para hacer cálculos aritméticos

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

Sigue las instrucciones para realizar el ejemplo dentro de `MySQL Workbench` y así entender cómo realizar cálculos aritmeticos en SQL.

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
