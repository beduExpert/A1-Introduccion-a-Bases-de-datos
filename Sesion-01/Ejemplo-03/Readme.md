## Creando un Script con Vim

### OBJETIVO 
 - Crear y editar archivos básicos con Vim.

#### REQUISITOS 
1. Vim
2. Consola 

#### DESARROLLO

Después de completar el ´Ejemplo-02´ y el ´Reto 02´ sigue las instrucciones para realizar este ejemplo dentro de tu terminal.

> **Recuerda**: Todas la instrucciones que aparecen con el signo ´$´ al principio del reglón, son un comando que deberás ejecutar dentro de tu terminal.  

1. Abre vim inicializando un archivo con nombre mi_script.sh
```
$vi mi_script.sh
```
2. Entra en modo inserción presionando la tecla i e ingresa la siguiente línea al archivo
````
echo Iniciando mi_script.sh
````
3. Presionando esc entras en modo comando. Guarda y salte de vim.
````
:wq [Enter]
````
4. Muestra los contenidos de tu script para confirmar tu escritura.
```
$cat mi_script.sh
```
5. Vuelve a abrir mi_script.sh con Vim
```
$vi mi_script.sh
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
7. Dale permiso de ejecución al script y corre el script
```
$chmod +x mi_script.sh
$./mi_script.sh
```
