## Configurando MySQL y nuestro cliente

### OBJETIVO 
 - Levantar un servidor básico de MySQL
 - Conectarnos a nuestra BD a través de un cliente gráfico 
- Cargar una tabla a nuestra BD
#### REQUISITOS 
1. Docker
2. Terminal
3. MySQL Workbench

#### DESARROLLO

1. Crear un directorio nombrado mi_bd y entrar en el.
```
$mkdir mi_bd
$cd mi_bd
```
2. Crear un archivo con el siguiente contenido, guardarlo como docker-compose.yml
```
version: '3'
services:
  mi_entorno_mysql:
    image: mysql:8.0.17
    environment:
      MYSQL_ROOT_PASSWORD: holamundo
      MYSQL_DATABASE: app_prueba
    ports:
      - "3308:3306"
```
3. Correr nuestro contenedor con el siguiente comando
```
docker-compose up -d
```
4. Revisar nuestros contenedores
```
docker-compose ps
```
5. Conectarse a la BD con el cliente. El usuario por defecto es root, la contraseña es holamundo, el puerto es 3308, el host es localhost y el schema es app_prueba
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