[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 05`](../Readme.md) > Proyecto
## Filtrando Documentos en una Colección

### OBJETIVO
- Que el alumno conozca la forma de filtrar Documentos en una Colección
- Que el alumno obtenga resultados a preguntas generadas
- Que el alumno se familiarice con la notación MongoDB

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-05/Proyecto`
1. __MongoDB Compass__ iniciado y conectado al servidor de MongoDB
1. Base de datos __MiNombre__ y Colecciones `users`, `movies` y `ratings` creadas

### DESARROLLO
Se continúan creando consultas similares a las creadas en SQL pero aplicando las herramientas de MongoDB.

1. Obtener la lista de todos los usuarios con género masculino de la colección `users`.

   En la barra de `FILTER` se coloca la siguiente expresión:
   ```json
   {gen: "M"}
   ```
   Se obtiene que la cantidad de usuarios es 4331

1. Obtener la lista de los usuarios que son mayor de edad, que su ocupación sea artista o escritor e indicar cuantos son.

   Del archivo `README` se obtiene que para artista y escritor los códigos de ocupación son 2 y 20 respectivamente, así que el filtro estaría usando los operadores `$in` y `$ne` como sigue:
   ```json
   {edad: {$ne: "1"}, ocup: {$in: ["2", "20"]} }
   ```
   Se obtiene un total de 545 usuarios.

1. Ahora vamos a mezclar las dos consultas anteriores, así que se desea obtener la lista de todos los usuarios menores de edad y con género femenino.

   Para realizar una operación `AND` en la barrá de `FILTER` se pueden colocar más de dos condiciones separadas por coma, así que la consulta queda como sigue:
   ```json
   {gen:"F", edad:"1"}
   ```
   Por lo que se cuentan con 78 usuarios que cumplen ambas condiciones.

1. Se desea obtener la lista de todos los usuarios cuya ocupación __no__ es _Estudiante_ o _Desempleado_ o _Otro_ y que además son menores de edad e indicar cuantos son.

   Primeramente del archivo `README` se obtiene que para _Estudiante_ y _Desempleado_ los códigos de ocupación son 0, 10 y 19 entonces se puede hacer uso del operador `$nin` (NOT IN) y el operador `AND` haciendo uso de la coma, quedando el filtro siguiente:
   ```json
   {ocup {$nin: ["0", "10", "19"]}, edad: "1"}
   ```
   Por lo que se tienen sólo 20 usuarios que cumplen estas condiciones.   

1. Como reto final, obtén la lista de todas las películas que se estrenaron en el año 2000 e indica cuantas son.

   Para resolver este reto se debe hacer uso de dos conceptos, el uso de expresiones regulares en MongoDB y conocer que los paréntesis en las expresiones regulares necesitan se precedidos por una diagonal invertida para que sean considerados como tal, así que el filtro para esta consulta es:
   ```json
   {titulo: /\(2000\)/}
   ```
   Así que se obtiene que sólo 120 películas se estrenaron en el año 2000.

   __Nota:__ El uso de expresiones regulares se verá ampliamente en la sesión siguiente, así que puedes solicitar alguna pequeña ayuda a tu Experta/o.

__Misión cumplida__
