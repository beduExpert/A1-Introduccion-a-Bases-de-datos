## Creando un Script con Vim

### OBJETIVO 
 - Crear y editar archivos básicos con Vim.

#### REQUISITOS 
1. Vim
2. Consola 

### DESARROLLO
Crea un script que automáticamente crea la siguiente estructura de proyecto
```
mi_analisis
    └── README.md
    └── datos
    └── codigo
        └── analisis.py
        └── tests.py
        └── experimentacion
            └── borrar.py
```

#### Solución
1. Abre vim inicializando un archivo con nombre crear_proyecto.sh
```
$vi crear_proyecto.sh
```
2. Entra en modo inserción presionando la tecla 'i' e ingresa las siguientes líneas
````
echo Iniciando crear_proyecto.sh
mkdir mi_analisis
touch README.md
mkdir datos codigo
touch codigo/analisis.py codigo/tests.py
mkdir codigo/experimentacion
touch codigo/experimentacion/borrar.py
````
3. Presionando esc entramos en modo comando. Guardar y salirte de vim.
````
:wq [Enter]
````
4. Muestra los contenidos de nuestro script para confirmar nuestra escritura.
```
$cat crear_proyecto.sh
```
5. Darle permiso de ejecución al script y corre el script
```
$chmod +x mi_script.sh
$./mi_script.sh
```

