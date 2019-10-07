## Calculando datos con SQL

### OBJETIVO 
 - Hacer uso de funciones de SQL para hacer cálculos aritméticos

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

Sigue las instrucciones para realizar el ejemplo dentro de `MySQL Workbench` y así entender cómo realizar cálculos aritmeticos en SQL.

> **Recuerda**: Inicializar el contenedor de docker donde estaremos trabajando y ocupar el csv `2018-01.csv`.  


1. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuántos ciclistas mujeres usaron ecobici el 1ero de Enero?
```
select COUNT(*) AS "cant_ciclistas_mujeres"
from trips
where Fecha_Retiro like '01%'
and Genero_Usuario = 'F'
```
Observa que dentro de esta consulta se esta utilizando la funcion de `COUNT` que nos devuelve el número de filas de la consulta, es decir, el número de registros que cumplen una determinada condición. 

2. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuál es el promedio de la edad de los ciclistas?

```
select AVG(Edad_Usuario)
from trips
```
Visualiza que dentro de esta consulta se esta utilizando la funcion de `AVG`, que nos ayudara a devolver el valor medio de una columna de tipo numérico. 

3. Ejecuta el siguiente código dentro en `MySQL Workbench` para responder la siguiente pregunta. ¿Cuántos años tenía el viajero más joven el 15 de Enero?
```
select MIN(Edad_Usuario)
from trips
where Fecha_Retiro like '15%'
```
Analiza cómo es que la función `MIN` obtiene el valor más pequeño para una columna determinada. 