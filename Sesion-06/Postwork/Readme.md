[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 06`](../Readme.md) > Postwork
## Calculando datos con MongoDB

### OBJETIVO
- Que el alumno reafirme los conceptos vistos en la sesión
- Que el alumno aplique los conceptos a un conjunto de datos para su proyecto de curso.
- Que el alumno fortalezca su capacidad de análisis

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-06/Postwork`
1. Contar con la base de datos en MongoDB con el conjunto de datos a analizar

### DESARROLLO
1. En base a tu conjunto de datos, realiza una consulta en base a un campo que tenga una cantidad limitada de opciones, de esta forma puede segmentar tu conjunto de datos por categorías

   Realiza la consulta usando __find__, un campo y el valor con el que se desea filtrar los datos.

1. Ahora puedes realizar un consultar que involucre dos campos y además puedes elegir que campos necesitas en el resultados, en lugar de obtener los documentos completos.

   Para esta consulta, tendrás que hacer uso combinado de __find__, __project__ y operaciones como and y or.

1. Los datos posiblemente no estén en el formato deseado o necesites realizar cálculos para consultas posteriores, así que puedes realizar consultas para crear nuevos campos

   Haciendo uso de __addFields__, __project__ o __group__ con operaciones como __toInt__, __dateFromString__, __sum__, __avg__ entre otras, realiza la consulta para transformar u obtener nuevos campos.

1. Para realizar consultas más elaboradas, donde necesitas filtrar datos, elegir campos o realizar cálculos, has uso de las etapas (o stage) para encadenar los resultados de una consulta en otra.

   En este caso por medio de agregaciones, se tiene que agregar tantas etapas como sea necesario, haciendo uso de cualquier operación de agregación disponible según sea necesario. Lo más importante a considerar es que el resultado de una etapa, será la entrada de la etapa siguiente.

Realiza tantas consultas como consideres necesario, donde cada consulta responde a preguntas del tipo:

- ¿Cuántos ...?
- ¿Cuáles son ...?
- ¿Cuáles son ... que tienen ___ y también son?
- Encontrar todos los ____ que son ____ y pertenecen a esta categoría
- Etc.
