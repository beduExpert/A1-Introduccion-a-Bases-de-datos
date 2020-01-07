[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 06`](../Readme.md) > Proyecto
## Realizando consultas vinculando dos o más colecciones en MongoDB

### OBJETIVO
- Crear consultas que relaciones a dos o más tablas en MongoDB
- Responder a preguntas que relacionen más de una fuente de información
- Aplicar los conceptos de filtrado, orden, agrupación y funciones de MongoDB

### REQUISITOS
1. Repositorio actualizado
1. Contar con la base de datos __MiNombre__ y las colecciones __users__, __movies__ y __ratings__
1. MongoDB Compass conectado al Servidor con los datos proporcionados para tu grupo

### DESARROLLO
1. Imprime la lista de la 10 películas con mayor cantidad de valoraciones.


1. Encontrar cuantos viajes se realizaron y cuál es la edad promedio de los ciclistas en la segunda mitad de enero 2018.

   La primera etapa es para agregar todas nuestras variables auxiliares como son __Edad__ (Edad_Usuario en tipo entero), __FechaRetiro__ (Fecha_Retiro en tipo fecha) y __Fecha__ (La constante "15/01/2018" en tipo fecha)
   ```json
   {
     Edad: {$toInt: "$Edad_Usuario"},
     FechaRetiro: {
       $dateFromString: {dateFromString:"$Fecha_Retiro", format:"%d/%m/%Y"}
     },
     Fecha: {$dateFromString: {dateFromString:"15/01/2018", format:"%d/%m/%Y"}}
   }
   ```
   Para ver una lista de las operaciones disponibles [ver aquí](https://docs.mongodb.com/manual/reference/operator/aggregation/)

   El resultado es como el siguiente:
   ![Resultado etapa 1](assets/resultados-etapa-1.png)

   La segunda etapa es para obtener todos los ciclistas de la segunda mitad de enero 2018 haciendo uso de __$match__, __$expr__ y __$gte__:
   ```json
   {
     $expr: {
       $gte: ["$FechaRetiro", "$Fecha"]
     }
   }
   ```

   La etapa final es para obtener la edad promedio de los ciclistas haciendo uso de __$group__ y __$avg__:
   ```json
   {
     _id: null,
     Edad_Promedio: {
       $avg: "$Edad"
     }
   }
   ```

   El resultado final será:
   ![Resultado etapa 3](assets/resultados-etapa-3.png)

1. Obtener el porcentaje de ciclistas mujeres que usaron el servicio el 3 de enero del 2018.

   La primera etapa es reducir los ciclistas al 3 de enero del 2018 usando __$match__:
   ```json
   {
     Fecha_Retiro: /^03/
   }
   ```
   ![Mujeres ciclistas etapa 1](assets/mujeres-ciclistas-e1.png)

   La segunda etapa se obtiene el total de ciclistas y se crean variables auxiliares para las siguientes etapas usando __$group__, __$sum__ y __$push__:
   ```json
   {
     _id: null,
     ciclistas: {
       $sum: 1
     },
     viajes: {
       $push: {
         genero: "$Genero_Usuario"
       }
     }
   }
   ```
   ![Mujeres ciclistas etapa 2](assets/mujeres-ciclistas-e2.png)

   En la tercera etapa se emparejan los campos __id__ y __ciclistas__ a lo largo de todo el arreglo __viajes__ usando __$unwind__:
   ```json
   {
     path: "$viajes"
   }
   ```
   ![Mujeres ciclistas etapa 3](assets/mujeres-ciclistas-e3.png)

   Con esto cada elemento de nuestra colección tendrá 3 campos, __id__, __ciclistas__ y __viajes.genero__.

   En la cuarta etapa con __$project__ se crea el campo __genero__ para usarlo en la quinta etapa con __$match__ para obtener todos los documentos con genero femenino:

   Para el __$project__:
   ```json
   {
     genero: "$viajes.genero",
     ciclistas: 1
   }
   ```
   ![Mujeres ciclistas etapa 4](assets/mujeres-ciclistas-e4.png)

   Para el __$match__:
   ```json
   {
     genero: "F"
   }
   ```
   ![Mujeres ciclistas etapa 5](assets/mujeres-ciclistas-e5.png)

   En la sexta etapa se cuentan cuantos documentos quedaron dando lugar a la creación del campo __cifem__ que es el número de ciclistas femeninos y además se agrega el campo __ciclistas__ haciendo uso de cualquier operación que regrese el valor del campo, por ejemplo usando __$min__.
   ```json
   {
     _id: null,
     ciclistas: {
       $min: "$ciclistas"
     },
     cifem: {
       $sum: 1
     }
   }
   ```
   ![Mujeres ciclistas etapa 6](assets/mujeres-ciclistas-e6.png)

   Con esto se obtiene un sólo documento con dos campos.

   En la última etapa, sólo resta calcular el porcentaje haciendo uso de __$project__ para crear un nuevo campo llamado __porcentaje__:
   ```json
   {
     porcentaje: {
       $multiply: [
          {
            $divide: [
              "$cifem",
              "$ciclistas"
            ]
          },
          100
       ]
     }
   }
   ```
   ![Mujeres ciclistas etapa 7](assets/mujeres-ciclistas-e7.png)

   Y con esto se obtiene el porcentaje de ciclistas femeninos el 3 de enero del 2018.

1. Imprime la lista de todos los usuarios con género femenino que dieron una valoración de 5 a la película con título "Deep Blue Sea" e indica cuantos son.

   La solución se obtiene creando una relación entre las tres tablas de la siguiente forma:
   ```sql
   MiNombre> SELECT * FROM ratings LEFT JOIN movies ON movieid=movies.id LEFT JOIN users ON userid=users.id WHERE title LIKE "Deep Blue Sea%" AND rating=5 AND genero="F";
   +----------+-----------+----------+--------------+------+----------------------+------------------------+------+----------+--------+--------+-------+
   | userid   | movieid   | rating   | time_stamp   | id   | title                | genres                 | id   | genero   | edad   | ocup   | cp    |
   |----------+-----------+----------+--------------+------+----------------------+------------------------+------+----------+--------+--------+-------|
   | 210      | 2722      | 5        | 977100602    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 210  | F        | 1      | 10     | 25801 |
   | 372      | 2722      | 5        | 980449576    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 372  | F        | 18     | 4      | 72227 |
   | 1125     | 2722      | 5        | 974924805    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 1125 | F        | 18     | 4      | 53715 |
   | 2138     | 2722      | 5        | 974638653    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 2138 | F        | 18     | 4      | 88119 |
   | 2907     | 2722      | 5        | 971821556    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 2907 | F        | 35     | 5      | 12345 |
   | 3202     | 2722      | 5        | 968573704    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 3202 | F        | 18     | 4      | 24060 |
   | 3483     | 2722      | 5        | 967494828    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 3483 | F        | 45     | 7      | 30260 |
   | 4278     | 2722      | 5        | 965289897    | 2722 | Deep Blue Sea (1999) | Action|Sci-Fi|Thriller | 4278 | F        | 45     | 7      | 09094 |
   | 4504     | 2722      | 5        | 965011706    | 2722 | Deep Blue Sea (1999) |
   :
   ```
   __Nota:__ Se recomienda ir construyendo la consulta paso a paso e ir observando los resultados generados.

   Observar como el resultado incluye la lista de todas las columnas de todas las tablas, así que si sólo se desea la lista de usuario, entonces sólo se incluirá los campos de la tabla `users`:
   ```sql
   MiNombre> SELECT users.* FROM ratings LEFT JOIN movies ON movieid=movies.id LEFT JOIN users ON userid=users.id WHERE title LIKE "Deep Blue Sea%" AND rating=5 AND genero="F";
   +------+----------+--------+--------+-------+
   | id   | genero   | edad   | ocup   | cp    |
   |------+----------+--------+--------+-------|
   | 210  | F        | 1      | 10     | 25801 |
   | 372  | F        | 18     | 4      | 72227 |
   | 1125 | F        | 18     | 4      | 53715 |
   | 2138 | F        | 18     | 4      | 88119 |
   | 2907 | F        | 35     | 5      | 12345 |
   | 3202 | F        | 18     | 4      | 24060 |
   | 3483 | F        | 45     | 7      | 30260 |
   | 4278 | F        | 45     | 7      | 09094 |
   | 4504 | F        | 25     | 0      | 65775 |
   | 5103 | F        | 35     | 16     | 78222 |
   +------+----------+--------+--------+-------+

   10 rows in set
   Time: 0.763s
   MiNombre>  
   ```
   Con el uso de `users.*` se está indicando que se incluyan sólo todos los campos de la tabla `users`.

   Con lo que se obtiene la lista de los usuarios solicitada con un total de 10 registros, haciendo uso de una sola consulta y no en varios pasos como se realizó usando archivos csv.
