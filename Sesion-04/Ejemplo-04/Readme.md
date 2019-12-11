## Relacionando datos con SQL

### OBJETIVO 
 - Combinar diferentes tablas para aumentar nuestros datos

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. ¿Cuántos viajes se hicieron en Enero con una temperatura máxima mayor a 20 centígrados?
```
select count(*)
from trips
join clima on clima.dia = trips.Fecha_Retiro
where temp_maxima > 20
```
2. ¿Cuál es la edad promedio de los usuarios que usan el servicio en la temperatura más baja?
```
SELECT AVG(Edad_Usuario)
FROM trips
         JOIN clima ON clima.dia = trips.Fecha_Retiro
where clima.temp_minima = (select MAX(temp_minima)
                           from trips
                                    join clima on clima.dia = trips.Fecha_Retiro
)
```
3. ¿Cuál es la relación entre viajes cuando hace más frío que cuando hace más calor?
```
SELECT (SELECT count(*)
        FROM trips
                 JOIN clima ON clima.dia = trips.Fecha_Retiro
        where clima.temp_minima = (select MAX(temp_minima)
                                   from trips
                                            join clima on clima.dia = trips.Fecha_Retiro
        )) / (SELECT count(*)
              FROM trips
                       JOIN clima ON clima.dia = trips.Fecha_Retiro
              where clima.temp_maxima = (select MAX(temp_maxima)
                                         from trips
                                                  join clima on clima.dia = trips.Fecha_Retiro
              )) AS "relacion_frio_caliente"
```

