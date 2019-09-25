## Configurando MySQL y nuestro cliente

### OBJETIVO 
 - Levantar un servidor básico de MySQL
 - Conectarnos a nuestra BD a través de un cliente gráfico 

#### REQUISITOS 
1. Docker
2. Terminal
3. MySQL Workbench

#### DESARROLLO
1. En una nueva carpeta, corre un contenedor con el nombre entorno_bd conteniendo una base de datos con el nombre nueva_bd y con contraseña bedu corriendo sobre el puerto 3309
2. Conectarse a la nueva BD
3. Cargar el csv de temperaturas

#### SOLUCIÓN

1. Crear un directorio nombrado nueva_carpeta y entrar en el.
```
$mkdir nueva_carpeta
$cd nueva_carpeta
```
2. Crear un archivo con el siguiente contenido, guardarlo como docker-compose.yml
```
version: '3'
services:
  entorno_bd:
    image: mysql:8.0.17
    environment:
      MYSQL_ROOT_PASSWORD: bedu
      MYSQL_DATABASE: nueva_bd
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
5. Conectarse a la BD
6. Crear la tabla con el siguiente script
```
CREATE TABLE IF NOT EXISTS clima (
    clima_id INT AUTO_INCREMENT,
    dia VARCHAR(255) NOT NULL,
    temp_media DECIMAL,
    temp_maxima DECIMAL,
    temp_minima DECIMAL,
    presion DECIMAL,
    humedad INT
    PRIMARY KEY (clima_id)
)  ENGINE=INNODB;
```
7. Ingresar a la opción cargar datos desde un archivo CSV
