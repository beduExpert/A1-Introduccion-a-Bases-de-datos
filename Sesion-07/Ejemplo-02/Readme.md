[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 07`](../Readme.md) > Ejemplo-02
## Configuración de MongoDB en la nube

### OBJETIVO
- Que el alumno configure MongoDB en la nube

### REQUISITOS
1. Repositorio actualizado
1. Usar la carpeta de trabajo `Sesion-07/Ejemplo-02`

### DESARROLLO
1. Para poder hacer uso de MongoDB en la nube se hará uso del servicio __Atlas__ proveeido por el propio equipo de MongoDB, abrir la siguiente url, llenar los campos del formulario y dar click en el botón de __Get srtarted free__

   URL: https://www.mongodb.com/cloud/atlas?jmp=docs

   ![Registro en MongoDB atlas](assets/registro-mongodb-atlas.png)

1. Elegir el tipo de __Cluster__, en donde se seleccionará __Starter Clusters__ que es el que es libre de costo, dar click en el botón __Create a Cluster__.

   ![Seleccionando cluster](assets/seleccionando-cluster.png)
   Observar que con MongoDB Atlas se crean __Clusters__ y no __Servidores__.

1. Después se tienen que seleccionar las opciones para el __Starter Cluster__ y las opciones por omisión son las correctas (AWM Amazon, N. Virginia, M0 Sandbox, MongoDB 4.0, Cluster 0)

   ![Configurando el Started Cluster](assets/configurando-cluster.png)
   Y presionar en el botón __Create Cluster__, lo que va a crear un __Cluster__ de trabajo, acción que puede demorar unos 5 mins.

   ![Cluster creándose](assets/creando-cluster-01.png)

   Cuando el __Cluster__ ya está creado se observa la página como la siguiente:

   ![Cluster creado](assets/creando-cluster-02.png)

1. Lo que sigue es iniciar una conexión al cluster de MongoDB en la nube, esto se realiza dando click en el botón __CONNECT__

  ![Conectando al servidor MongoDB](assets/conectando-a-mongodb.png)
  MongoDB Atlas hace una validación y solicita definir que dirección IP se va a conectar a el servidor y que usuario.

  Así que dá click en el botón __Add Your Current IP Address__

  ![Agregando ip](assets/agregando-ip.png)
  Se sugiere etiquetar la dirección IP, para llevar un registro de a quién corresponde cada IP y más adelante poder eliminar las direcciones que ya no sean necesarias.

  Después usar los siguientes datos para crear el usuario de acceso:

  - Usuario: introabd
  - Password: introabd1234

  ![Creando usuario](assets/creando-usuario.png)
  Y presionar en el botón __Create MongoDB User__

  Y posteriormente se dá click en el botón __Choose a connection method__ donde se seleccionará __Compass__ para continuar en el siguiente ejemplo.

  ![Seleccionando Compass como método de conexión](assets/seleccionando-compass.png)
