[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 01`](../Readme.md) > Ejemplo-03
## Comandos para preparar y consultar conjuntos de datos

### OBJETIVO
- Crear y visualizar archivos desde la terminal
- Conocer los comandos para manipular archivos
- Descargar archivos desde la terminal

#### REQUISITOS
1. Git Bash instalado para equipos con Windows
1. Carpeta de repositorio actualizada
1. Reto-02 terminado

#### DESARROLLO
1. Abrir la terminal en Linux o MacOS y Git Bash en Windows

1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03
   Ejemplo-03 $ pwd
   .../Introduccion-a-Bases-de-Datos/Sesion-01/Ejemplo-03
   Ejemplo-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Reto-02` y moverse a esa carpeta
   ```console
   Ejemplo-03 $ cp -a ../Reto-02/Datos .
   Ejemplo-03 $ ls
   Datos
   Ejemplo-03 $ cd Datos
   Ejemplo-03/Datos $
   ```

1. Abre vim inicializando un archivo con nombre mi_script.sh
```
$vi mi_script.sh
```
4. Muestra los contenidos de nuestro script para confirmar nuestra escritura.
```
$cat mi_script.sh
```
6. Entra en modo inserción e inserta el resto del sript
```
echo Iniciando mi_script.sh
echo Creando Carpeta Raíz
mkdir mi_proyecto
cd mi_proyecto
echo Creando Carpetas...
mkdir carpeta1 carpeta2 carpeta3
echo Creando archivos
touch carpeta1/archivo1.txt carpeta2/archivo2.txt carpeta3/archivo3.txt
echo Descargando información
wget -O datos.csv https://raw.githubusercontent.com/ChitturiPadma/datasets/master/uber.csv
echo Finalizando ejecución
```
7. Darle permiso de ejecución al script y corre el script
```
$chmod +x mi_script.sh
$./mi_script.sh
```
