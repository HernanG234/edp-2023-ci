Pasos a ejecutar:

Crear una carpeta "output" preferentemente en el mismo nivel de jerarquia que el Dockerfile en caso de no existir

Crear imagen:
  docker build -t img-contenedor .

Correr imagen:
  docker run -it -v (ruta absoluta local de la carpeta output):/tmp/output img-generador

Correr servidor ftp:
  docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v 	(ruta absoluta de la carpeta output):/ftp/tuiaedpuser delfer/alpine-ftp-server
