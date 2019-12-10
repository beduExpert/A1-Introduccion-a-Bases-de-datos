## Consultando nuestra BD

### OBJETIVO
 - Hacer consultas básicas de nuestra BD
 - Aprender a usar los filtros más utilizados

#### REQUISITOS
1. MySQL Workbench
2. BD MySQL

#### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-01/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-03/Ejemplo-01
   Ejemplo-01 $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-02/Proyecto/` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Ejemplo-01 $ cp -a ../../Ejemplo-02/Proyecto/Datos .
   Ejemplo-01 $ cd Datos/ml-1m
   ml-1m $
   ```

6. Crear la siguiente tabla corriendo el código en nuestro cliente.
```
CREATE TABLE IF NOT EXISTS trips (
    trip_id INT AUTO_INCREMENT,
    Genero_Usuario VARCHAR(255) NOT NULL,
    Edad_Usuario INT,
    Bici INT,
    Ciclo_Estacion_Retiro VARCHAR(255) NOT NULL,
    Fecha_Retiro VARCHAR(255) NOT NULL,
    Hora_Retiro VARCHAR(255),
    Ciclo_Estacion_Arribo VARCHAR(255),
    Fecha_Arribo VARCHAR(255),
    Hora_Arribo VARCHAR(255),
    PRIMARY KEY (trip_id)
)  ENGINE=INNODB;
```
7. Ingresar a la opción cargar datos desde archivo.


1. Selecciona todos los viajes con usuarios con edad arriba de 30
```
SELECT *
FROM trips
WHERE Edad_Usuario > 60
```
2. Selecciona todos los viajes empezados después de las 5 de la tarde hechos por una mujer
```
SELECT *
FROM trips
WHERE Hora_Retiro > '17:00:00'
and Genero_Usuario = 'F'
```
3. Regresame los identificadores de las estaciones retiradas antes de las 8 de la mañana y después de las 5 de la tarde
```
SELECT Ciclo_Estacion_Retiro
FROM trips
WHERE Hora_Retiro > '17:00:00'
OR Hora_Retiro < '8:00:00'
```
