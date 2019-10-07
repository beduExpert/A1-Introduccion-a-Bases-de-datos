## Relacionando datos con SQL

### OBJETIVO 
 - Combinar diferentes tablas para aumentar nuestros datos

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

Ya una vez completado nuestro `Ejemplo-02` y `Reto-02` sigue las instrucciones para realizar el ejemplo dentro de `MySQL Workbench` y analizar cómo puedes combinar diferentes tipos de resultados en SQL.

> **Recuerda**: Inicializar el contenedor de docker donde estaremos trabajando.  

1.  Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuántos viajes se hicieron en Enero con una temperatura máxima mayor a 20 centígrados?
```
select count(*)
from trips
join clima on clima.dia = trips.Fecha_Retiro
where temp_maxima > 20
```

Cómo podemos ver nuestra pregunta conjunta la información de otra tabla, en esta caso `clima`, por lo que tendremos que usar el comando `join` para poder extraer la data que tenemos en esta otra tabla `clima`.

> **Recuerda** : La funcion de `join` nos sirve para combinar filas de dos o más tablas basándose en un campo común entre ellas, devolviendo por tanto datos de diferentes tablas. .


2. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuál es la edad promedio de los usuarios que usan el servicio en la temperatura más baja?
```
SELECT AVG(Edad_Usuario)
FROM trips
         JOIN clima ON clima.dia = trips.Fecha_Retiro
where clima.temp_minima = (select MAX(temp_minima)
                           from trips
                                    join clima on clima.dia = trips.Fecha_Retiro
)
```

3. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuál es la relación entre viajes cuando hace más frío que cuando hace más calor?
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

> **Recuerda** : La funcion de `MAX` nos sirve para obtener el mayor valor para una columna determinada.
 

