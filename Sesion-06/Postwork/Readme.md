[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 06`](../Readme.md) > Postwork
## Consultas con MongoDB a datos estructurados

### OBJETIVOS
- Realizar consultas haciendo uso de expresiones regulares, agrupaciones o funciones de MongoDB.
- Obtener resultados de dos o más colecciones en conjunto
- Exportar resultados

### REQUISITOS
1. Repositorio actualizado
1. Abrir __MongoDB Compass__ y usar los datos de conexión proporcionados para tu grupo
1. Abrir la base de datos creada en el `Postwork` de la `Sesion-05`

### DESARROLLO
1. Como ahora ya puedes hacer uso de expresiones regulares, ordenamientos, agrupaciones, limitar el número de documentos o usar funciones como suma, mínimo, máximo, promedio ya puedes responder a preguntas como:
   - ¿Cuál es la lista de todos los documentos que incluyan el "texto" en algún campo?
   - ¿Cuáles son los documentos que tienen mayor o menor cantidad en algún campo?
   - ¿Cuál es el promedio de todos los valores de algún campo como edad, precio, cantidad?
   - ¿Cuál es la cantidad de documentos por tipo de producto o por cierta fecha?
   - ¿Cuál es el producto con más o menos ventas?
   - ¿Cuál es el promedio de ventas en el periodo de cierto año?

   Crea algunas preguntas para tu conjunto de datos y construye las consultas en MongoDB que den la respuesta, además toma en cuenta sólo usar una colección a la vez para estas preguntas.

1. Si alguna de las preguntas implica el uso de más de una colección, entonces recuerda que posiblemente tendrás que realizar algunos preparativos:
   - Agregar algunos índices a tus colecciones para optimizar el tiempo de las consultas
   - Modificar la configuración de __MongoDB Compass__ en las agregaciones para que se puedan usar más de 100 mil documentos
   - Modificar la configuración de __MongoDB Compass__ en las agregaciones para que el tiempo límite sea de 60 mil milisegundos.

   Para cada pregunta:
   - Aplica primero la operaciones de selección a una de las colecciones para reducir la cantidad de documentos
   - Si es posible limitar u ordenar los resultados
   - Dejar para el final las operaciones de agrupamiento o de conteo.

   __Nota:__ La solución a algunas preguntas necesitarán de varios pasos para hallar la solución, así que realiza tantas etapas como consideres necesario, donde en cada una se responde a preguntas del tipo:
   - ¿Cuántos ...?
   - ¿Cuáles son ...?
   - ¿Cuáles son ... que tienen ... y también son ...?
   - Encontrar todos los ... que son ... y pertenecen a ... categoría

__Sugerencia:__ Si tienes problemas al realizar algunos de los pasos del procedimiento es buen momento para comentarlo con tu __Experta/o__ asignado para determinar la mejor solución.
