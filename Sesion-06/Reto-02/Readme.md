[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 06`](../Readme.md) > Reto-02
## Filtrado avanzado en MongoDB

### OBJETIVO
- Que el alumno haga uso de operadores en las consultas

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-06/Reto-02`
1. Contar con la base de datos __Ecobici__ y las colecciones __Clima__ y __Viajes__

### DESARROLLO
1. Obtener la lista de todos los viajes donde el usuario tenga edades de 60, 30 y 20.

   El filtro a aplicar sería el siguiente:
   ```json
   {Edad_Usuario: {$in: ["60", "30", "20"] } }
   ```
   El resultado será:
   ![Resultados de consulta](assets/documentos-en-viajes-01.png)

1. Mostrar todos los viajes donde los usuarios tengan edades de 50, 30 y 20, pero además que hayan tomado bici de las ciclo estaciones 80, 100 y 190.

   El filtro a aplicar en __Compass__ sería:
   ```json
   {Edad_Usuario: {$in: ['50',  '30', '20'] }, Ciclo_Estacion_Retiro: {$in: ["80", "100", "190"]} }
   ```
   El resultado debe ser similar al siguiente:
   ![Resultado de la consulta](assets/documentos-en-viajes-02.png)

1. Obtener la lista de el genero y edad de todos los usuarios cuyos viajes iniciaron a las 7 hrs con cualquier fracción de minutos y que además son menores de edad.

   El filtro usado es el siguiente:
   ```json
   {Hora_Retiro: /^7/, Edad_Usuario: {$lt: "18" } }
   ```

   y la proyección es:
   ```json
   {Genero_Usuario: 1, Edad_Usuario: 1, _id: 0}
   ```

   El resultado debe ser similar al siguiente:
   ![Resultados de la consulta](assets/documentos-en-viajes-03.png)
