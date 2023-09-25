
Trabajo Práctico de Entorno de Programación CI-2023

Este proyecto en primer ligar genera archivos aleatorios de texto, imágenes y sonido. Para esto se creó una imagen la 
cual debe ser generada desde la siguiente ruta de directorios:

edp-2023-ci/estudiantes/vitale-florencia/tp/mod-generador

Y realizando el siguiente comando:

docker build -t modulo-generador .

y así correrla con:

docker run -it -v ./output/:/tmp/output/ modulo-generador
 
Luego se corre una imagen del servidor FTP para así listar y descargar los archivos antes generados.
Para esto desde el siguinte directorio:

edp-2023-ci/estudiantes/vitale-florencia/tp

Corremos la siguinte imagen:

docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v ./mod-generador/output/:/ftp/tuiaedpuser delfer/alpine-ftp-server 

Y por último se creó una imágen que accede a los archivos mediante FTP que  se encarga de descargarlos, clasificarlos 
y de  monitorear la información de sistema, mediante un menú donde el usuario selecciona lo que desea realizar.

Para esto desde el siguiente la siguiente ruta de directorios:

edp-2023-ci/estudiantes/vitale-florencia/tp/mod-usuario

Se genera la imagen con el siguiente comando:

docker build -t modulo-usuario .

y correrla con:

docker run -it -v ./output/:/tmp/outputs/ --network=host modulo-usuario
