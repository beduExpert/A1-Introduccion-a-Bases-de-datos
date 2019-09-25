## Filtrado Avanzado

### OBJETIVO 
 - Hacer uso de filtros como NOT, IN y LIKE

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. Selecciona todos los viajes que tengan usuarios con edades de 10, 20 y 30

2. Selecciona todos los viajes usuarios con edades diferentes a 50, 30 y 20 y que han usado las bicicletas 10643, 9648 y 9929

3. Consulta el genero de los usuarios que viajaron a las 7 horas con x minutos y que son menores de edad. 
#### SOlUCIÓN

1. Selecciona todos los viajes que tengan usuarios con edades de 10, 20 y 30
```
SELECT *
FROM trips
WHERE Edad_Usuario in (10, 20, 30)
```
2. Selecciona todos los viajes usuarios con edades diferentes a 50, 30 y 20 y que han usado las bicicletas 10643, 9648 y 9929
```
SELECT *
FROM trips
WHERE Edad_Usuario NOT IN (50, 30, 20)
AND Bici IN (10643, 9648, 9929)
```
3. Consulta el genero de los usuarios que viajaron a las 7 horas con x minutos y que son menores de edad. 
```
SELECT Genero_Usuario
FROM trips
WHERE Hora_Retiro like '19%'
AND Edad_Usuario < 18
```