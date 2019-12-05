[`Fundamentos de Base de Datos`](../../Readme.md) > [`Sesión 02`](../Readme.md) > Reto-03
## Consultas de datos con expresiones regulares

### OBJETIVOS
- Analizar contenido de archivos
- Realizar filtrado de resultados usando expresiones regulares
- Contabilizar resultados

### REQUISITOS
1. Carpeta de repositorio actualizada
1. Ejemplo-03 terminado

### DESARROLLO
1. Haz que tu carpeta de trabajo sea `Introduccion-a-Bases-de-Datos/Sesion-02/Reto-03/`
   ```console
   $ cd Introduccion-a-Bases-de-Datos/Sesion-02/Reto-03
   Reto-03 $
   ```

1. Copiar la carpeta `Datos` creada en el `Ejemplo-03` y moverse a la carpeta `Datos/ml-1m/`
   ```console
   Reto-03 $ cp -a ../Ejemplo-03/Datos .
   Reto-03 $ cd Datos/ml-1m
   ml-1m $
   ```

1. La primera consulta consiste en imprimir toda la lista de películas que sean de género _Comedia_ (Comedy) e indicar cuantas son.
   ```console
   ml-1m $ grep -a Comedy movies.csv
   [...]
   3921,Beach Party (1963),Comedy
   3922,Bikini Beach (1964),Comedy
   3924,Pajama Party (1964),Comedy
   3925,Stranger Than Paradise (1984),Comedy
   3928,Abbott and Costello Meet Frankenstein (1948),Comedy|Horror
   3929,Bank Dick, The (1940),Comedy
   3943,Bamboozled (2000),Comedy
   3944,Bootmen (2000),Comedy|Drama
   3948,Meet the Parents (2000),Comedy
   ```
   ```console
   ml-1m $ grep -a Comedy movies.csv > movies-comedy.csv
   ml-1m $ wc movies-comedy.csv
    1200  4830 50959 movies-comedy.csv
   ml-1m $
   ```
   Así que tenemos 1200 películas que pertenecen al género Comedia.

1. Imprime la lista de películas que hayan sido estrenadas en el año 2000 e indica cuantas son.

   ```console
   ml-1m $ grep -a "(2000)" movies.csv
   [...]
   3945,Digimon: The Movie (2000),Adventure|Animation|Children's
   3946,Get Carter (2000),Action|Drama|Thriller
   3948,Meet the Parents (2000),Comedy
   3949,Requiem for a Dream (2000),Drama
   3950,Tigerland (2000),Drama
   3951,Two Family House (2000),Drama
   3952,Contender, The (2000),Drama|Thriller
   ml-1m $
   ```
   Para obtener el resultado es importante generar resultados parciales hasta obtener el resultado.

   Ahora para guardar el resultado y luego contamos los resultados:
   ```console
   ml-1m $ grep -a "(2000)" movies.csv > movies-2000.csv
   ml-1m $ wc movies-2000.csv
    156  579 6191 movies-2000.csv
   ml-1m $
   ```

1. Imprimir la lista de todas las películas con __id__  entre 100 y 200.

   ```console
   ml-1m $ grep -a ^1 movies.csv | head
   ml-1m $ grep -a ^1.., movies.csv | head
   190,Safe (1995),Thriller
   191,Scarlet Letter, The (1995),Drama
   192,Show, The (1995),Documentary
   193,Showgirls (1995),Drama
   194,Smoke (1995),Drama
   195,Something to Talk About (1995),Comedy|Drama|Romance
   196,Species (1995),Horror|Sci-Fi
   197,Stars Fell on Henrietta, The (1995),Drama
   198,Strange Days (1995),Action|Crime|Sci-Fi
   199,Umbrellas of Cherbourg, The (Parapluies de Cherbourg, Les) (1964),Drama|Musical
   ml-1m $
   ```
   Con esto obtenemos justo lo que necesitamos, así que ahora procedemos a guardar el resultado y a contar el número de registros.
   ```console
   ml-1m $ grep -a ^1.., movies.csv > movies-100.csv
   ml-1m $ wc movies-100.csv
    100  370 4028 movies-100.csv
   ml-1m $
   ```
   Así que tenemos 100 películas en el rango con id de 100 a 200

__Misión cumplida__
