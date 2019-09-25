## Consultas dentro de consultas

### OBJETIVO 
 - Combinar diferentes resultados de consultas

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. ¿Qué porcentaje de ciclistas fueron hombres el primero de Enero?
```
SELECT DISTINCT(
    (select COUNT(*)
         from trips
         where Fecha_Retiro like '01%'
           and Genero_Usuario = 'M') / (select COUNT(*)
                                        from trips
                                        where Fecha_Retiro like '01%')
    ) AS 'porc_ciclistas_hombres'
FROM trips
```
2. ¿Qué viajes tienen fecha de retiro que coincide con nuestros datos de clima?
```
SELECT *
FROM trips
where Fecha_Retiro in (select dia from clima)
```
3. ¿En la primera mitad de Enero, cuantos viajes se hicieron y cuál fue la edad promedio de los ciclistas?
```
SELECT COUNT(*), AVG(Edad_Usuario)
FROM (SELECT Genero_Usuario, Edad_Usuario
      FROM trips
      where Fecha_Retiro <= '15/01/2018') MITAD_MES
```



