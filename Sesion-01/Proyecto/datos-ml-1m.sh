mkdir Datos  # Se crea la carpeta Datos
cd Datos  # Se cambia a la carpeta Datos
# Se descarga el archivo desde la URL indicada
curl -O  http://files.grouplens.org/datasets/movielens/ml-1m.zip
unzip ml-1m.zip  # Se descomprime el archivo descargado
cp -a ml-1m ml-1m.1  # Se crea un respaldo de la carpeta creada
rm ml-1m.zip  # Se elimina el archivo zip
ls  # Se muestra la lista de archivos
