## Consultas dentro de consultas

### OBJETIVO 
 - Combinar diferentes resultados de consultas

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. ¿Qué porcentaje de ciclistas fueron mujeres el 3 de Enero?
2. ¿Qué porcentaje de ciclistas salen a las 5 de la mañana?
3. ¿En la segunda mitad de Enero, cuantos viajes se hicieron y cuál fue la edad promedio de los ciclistas?

#### SOLUCIÓN
1. ¿Qué porcentaje de ciclistas fueron mujeres el 3 de Enero?
```
SELECT DISTINCT(
    (select COUNT(*)
         from trips
         where Fecha_Retiro like '01%'
           and Genero_Usuario = 'F') / (select COUNT(*)
                                        from trips
                                        where Fecha_Retiro like '03%')
    ) AS 'porc_ciclistas_mujeres'
FROM trips
```
2. ¿Qué porcentaje de ciclistas salen a las 5 de la mañana?
```
SELECT DISTINCT(
    (select COUNT(*)
         from trips
         where Hora_Retiro like '5%') / (select COUNT(*)
                                        from trips)
    ) AS 'porc_ciclistas_madrugaderos'
FROM trips
```
3. ¿En la segunda mitad de Enero, cuantos viajes se hicieron y cuál fue la edad promedio de los ciclistas?
```
SELECT COUNT(*), AVG(Edad_Usuario)
FROM (SELECT Genero_Usuario, Edad_Usuario
      FROM trips
      where Fecha_Retiro >= '15/01/2018') MITAD_MES
```



