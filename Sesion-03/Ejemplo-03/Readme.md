## Filtrado Avanzado

### OBJETIVO 
 - Hacer uso de filtros como NOT, IN y LIKE

#### REQUISITOS 
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO

Ya una vez completado nuestro `Ejemplo-02` y `Reto-02` sigue las siguientes instrucciones para realizar el ejemplo dentro de tu terminal y así comprender sobre los tipos de filtros dentro SQL.

1. Selecciona todos los viajes que no tengan usuarios con edades de 35, 20 y 18
```
SELECT *
FROM trips
WHERE Edad_Usuario not in (35, 20, 18)
```
2. Selecciona todos los viajes usuarios con edades de 35, 20 y 18 y que han usado las bicicletas 7486, 9299 y 7552
```
SELECT *
FROM trips
WHERE Edad_Usuario IN (35, 20, 18)
AND Bici IN (7486, 9299, 7552)
```
3. Consulta el genero y edad del usuario en los viajes que terminaron a las 12 horas con x minutos
```
SELECT Genero_Usuario, Edad_Usuario
WHERE Hora_Arribo like '12%'
FROM trips
```