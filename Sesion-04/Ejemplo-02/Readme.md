## Consultas dentro de consultas

### OBJETIVO 
 - Combinar diferentes resultados de consultas

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

Ya una vez completado nuestro `Ejemplo-01` y `Reto-01` sigue las instrucciones para realizar el ejemplo dentro de `MySQL Workbench` y analizar cómo puedes combinar diferentes tipos de resultados en SQL.

> **Recuerda**: Inicializar el contenedor de docker donde estaremos trabajando.  

1. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta.¿Qué porcentaje de ciclistas fueron hombres el primero de Enero?
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

Trata de entender cómo la combinación de las funciones nos pueden traer diferentes resultados.

2. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Qué viajes tienen fecha de retiro que coincide con nuestros datos de clima?
```
SELECT *
FROM trips
where Fecha_Retiro in (select dia from clima)
```
3. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿En la primera mitad de Enero, cuantos viajes se hicieron y cuál fue la edad promedio de los ciclistas?

```
SELECT COUNT(*), AVG(Edad_Usuario)
FROM (SELECT Genero_Usuario, Edad_Usuario
      FROM trips
      where Fecha_Retiro <= '15/01/2018') MITAD_MES
```
> **Recuerda** : La funcion de `AVG` nos ayudara a devolver el valor medio de una columna de tipo numérico. 
 