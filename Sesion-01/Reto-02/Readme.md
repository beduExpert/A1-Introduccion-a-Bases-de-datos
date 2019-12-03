[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Reto-02
## Comandos para manipular archivos

### OBJETIVOS
- Ejecutar comandos para manipular archivos
- Adquirir la habilidad en el uso de la terminal

### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada

### DESARROLLO
1. Abrir la terminal (Linux y Mac) o Git Bash (Windows) si no está abierta

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Reto-02/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Reto-02
   Reto $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Reto-02
   Reto-02 $
   ```

1. Crea el archivo `terminal-chuleta.txt`
   ```console
   Reto-02 $ ???
   Reto-02 $ ls
   terminal-chuleta.txt
   Reto-02 $
   ```

1. Usar el comando `echo` y el símbolo `>>` para agrega nuevas líneas al final del archivo `terminal-chuleta.txt`, cada línea debe contener el nombre de un comando y luego una pequeña descripción, por ejemplo:
   ```
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   ```

   ```console
   Reto-02 $ ???
   Reto-02 $ ???
   Reto-02 $ ???
   Reto-02 $ ???
   Reto-02 $ ???
   ```
   Puedes agregar tantos comandos y su descripción como desees, esto es sólo un ejemplo de como crear archivos desde la terminal.

1. En el punto anterior has creado el archivo `terminal-chuleta.txt`, ahora imprime el contenido del archivo
   ```console
   Reto-02 $ ???
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   [...]
   Reto-02 $    
   ```
   La cadena `[...]` es sólo para indicar que puede haber más contenido, en caso de que se haya decidido agregar más líneas.

1. Crea una copia de respaldo del archivo `terminal-chuleta.txt` con el nombre `terminal-chuleta.1.txt`
   ```console
   Reto-02 $ cp ???
   Reto-02 $ ls
   terminal-chuleta.1.txt  terminal-chuleta.txt
   Reto-02 $
   ```

1. Imprime el contenido de los dos archivos creados usando el comando `cat`
   ```console
   Reto-02 $ ???
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   Reto-02 $
   ```
   Observa que el resultado de ambos archivos se muestra de forma consecutiva, así que esta es una manera de juntar o concatenar dos archivos.

   Ahora crea el archivo `todo.txt` con el contenido de ambos archivos.
   ```console
   Reto-02 $ ???
   Reto-02 $ cat todo.txt
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   pwd Muestra el nombre de la carpeta de trabajo actual
   mkdir Crear una nueva carpeta
   cd Cambia a una nueva carpeta
   cd .. Regresa a la carpeta anterior
   rmdir Elimina una carpeta vacía
   Reto-02 $
   ```

1. Finalmente borra el archivo `todo.txt`
   ```console
   Reto-02 $ ???
   Reto-02 $ ls
   terminal-chuleta.1.txt  terminal-chuleta.txt
   Reto-02 $
   ```
   Al final sólo deberás de tener dos archivos.

__Reto cumplido:__ Has aumentado tu habilidad en el uso de la terminal
