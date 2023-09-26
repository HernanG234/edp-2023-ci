# TRABAJO PRACTICO ENTORNO DE PROGRAMACION (condicion intermedia)

En este repositorio se encuentra un proyecto realizado en lenguaje shell (Bash), el cual consiste de tres modulos que trabajan de forma conjunta para conseguir como resultado la descarga de un comprimido que contiene una serie de archivos de distinto tipo.

## MODULO 1: Generador de archivos

Se ejecutaran una serie de scripts dentro de un contenedor de docker encargado de descargar una vez por minuto un archivo aleatorio de texto, audio o imagen y lo guardara con el nombre de su suma de verificacion.

**Pasos a ejecutar:**

En la jerarquia que se encuentra el primer Dockerfile ejecutar el siguiente comando para crear la imagen de Docker:

	docker build -t img-contenedor .

Para correr la imagen previamente creada:

	docker run -it -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/output:/tmp/output img-generador

 Una vez que corramos este contenedor, en nuestra carpeta output se estara generando un archivo aleatorio de algunos de los tres tipos mencionados, para detener la generacion simplemente detener el contenedor con el comando:

 	docker stop $id-o-nombre-del-contenedor

## MODULO 2: Servidor FTP

Este modulo consiste en un servidor ftp que se estara ejecutando para mostrarnos los archivos descargados previamente en el anterior modulo, con la finalidad de poder ser accedidos nuevamente por el siguiente.

Para pone en marcha el servidor ftp debemos correr el siguiente comando, prestando atencion a los volumenes a compartir, en este caso se comparte la carpeta output con la salida predeterminada del servidor:

	docker run -p 21:21 -p 21000-21010:21000-21010 -e USERS="tuiaedpuser|tuiaedpuser" -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/output:/ftp/tuiaedpuser delfer/alpine-ftp-server

Para corroborar que este funcionando el servidor podemos ejecutar el comando curl y ver si los archivos se muestran correctamente:

    curl -l ftp://tuiaedpuser:tuiaedpuser@0.0.0.0
	
## MODULO 3: Interfaz de usuario

Este ultimo contenedor lo que hara es en base a los archivos que estan subidos en el servidor, darle la opcion al usuario de elegir cuantos quiere descargar de forma aleatoria, tambien incluye la capacidad de obtener un breve monitoreo del sistema y recolectar toda esa informacion en un nuevo archivo comprimido que podra ser accedido desde fuera del contenedor.

Para iniciar debemos situarnos en el Dockerfile que se encuentra dentro de la carpeta usuario y ejecutar el comando para crear la imagen:

	docker build -t img-usuario .

Una vez creada la imagen ejecutemos el contenedor, tener en cuenta que se le tiene que pasar primero la ruta local (host) de la ubicacion de donde queremos que se guarde el archivo comprimido y seguido a ella, la ruta del contenedor donde se ubica este archivo de salida:

	docker run -it -v /home/tobias/edp-2023-ci/estudiantes/prieto-tobias/tp/usuario/opt/src/salida_compresion/:/opt/src/salida_compresion --network="host" usr /bin/bash

Una vez al haber terminado de ejecutar por completo las opciones del contenedor y salir al sistema local, si nos dirijimos a la carpeta de salida se encontrara el archivo comprimido generado por el contenedor, si queremos acceder a la informacion que contiene podemos ejecutar el siguiente comando:

	tar -xzvf outputs.tar.gz
