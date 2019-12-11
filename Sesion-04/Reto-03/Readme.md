## Calculando datos con SQL

### OBJETIVO 
 - Hacer uso de funciones de SQL para hacer cálculos aritméticos

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

1. ¿Cuántos ciclistas hombres usaron ecobici el 20 de Enero?
2. ¿Cuál fue la temperatura promedio de todo el mes de Agosto?
3. ¿Cuántos años tenía el viajero más viejo el 27 de Enero?

#### SOLUCION
1. ¿Cuántos ciclistas hombres usaron ecobici el 20 de Enero?
```
select COUNT(*) AS "cant_ciclistas_hombres"
from trips
where Fecha_Retiro like '20%'
and Genero_Usuario = 'M'
```
2. ¿Cuál fue la temperatura promedio de todo el mes de Agosto?
```
select AVG(temp_media)
from clima
```
3. ¿Cuántos años tenía el viajero más viejo el 27 de Enero?
```
select MAX(Edad_Usuario)
from trips
where Fecha_Retiro like '27%'
```



